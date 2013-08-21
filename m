Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 568FF6B368
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 17:34:31 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Aug 2013 10:34:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,929,1367996400"; d="scan'208";a="349724641"
Received: from unknown (HELO [10.255.14.105]) ([10.255.14.105])
	by azsmga001.ch.intel.com with ESMTP; 21 Aug 2013 10:34:16 -0700
Message-ID: <5214FA18.7050002@linux.intel.com>
Date: Wed, 21 Aug 2013 10:34:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: jackie.huang@windriver.com
References: <cover.1377064624.git.jackie.huang@windriver.com>
	<00b70d017db692cbb7d5965de26726ae0a695f88.1377064624.git.jackie.huang@windriver.com>
In-Reply-To: <00b70d017db692cbb7d5965de26726ae0a695f88.1377064624.git.jackie.huang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] nfs-utils: add init.d/nfsserver status command for LSB compliance
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Aug 2013 17:34:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2013 11:15 PM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Signed-off-by: Li Wang <li.wang@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>   .../nfs-utils/nfs-utils/nfsserver                  |    9 +++++++++
>   1 files changed, 9 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> index e460e26..5b4f199 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> @@ -14,6 +14,8 @@
>   #
>   # Startup script for nfs-utils
>   #
> +# Source function library.
> +. /etc/init.d/functions
>   #
>   # The environment variable NFS_SERVERS may be set in /etc/default/nfsd
>   # Other control variables may be overridden here too
> @@ -141,6 +143,13 @@ stop)	exportfs -ua
>   	stop_statd
>   	stop_mountd
>   	stop_nfsd;;
> +status)
> +	status /usr/sbin/rpc.mountd
> +	RETVAL=$?
> +	status nfsd
> +	rval=$?
> +	[ $RETVAL -eq 0 ] && exit $rval
> +	exit $RETVAL;;
>   reload)	test -r /etc/exports && exportfs -r;;
>   restart)exportfs -ua
>   	stop_mountd
>
Should there also be a usage update or addition?

Sau!


