Return-Path: <Qiang.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 511DE6D0FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 09:47:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9T9lX5x029762
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Oct 2013 02:47:33 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 29 Oct 2013 02:47:32 -0700
Message-ID: <526F8435.1020604@windriver.com>
Date: Tue, 29 Oct 2013 17:47:33 +0800
From: Qiang Chen <qiang.chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <richard.purdie@linuxfoundation.org>, Saul Wold <sgw@linux.intel.com>
References: <1382418861-2658-1-git-send-email-qiang.chen@windriver.com>
In-Reply-To: <1382418861-2658-1-git-send-email-qiang.chen@windriver.com>
X-Originating-IP: [128.224.162.198]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nfs-utils: modify nfsserver init script indent
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
X-List-Received-Date: Tue, 29 Oct 2013 09:47:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi richard and Saul,

Any comment for this patch ?
If it's OK, could you please help merge to oe-core at your earliest convenience ?


Thanks a lot !
Qiang

On 10/22/2013 01:14 PM, qiang.chen@windriver.com wrote:

> From: Qiang Chen <qiang.chen@windriver.com>
>
> Using sysvinit testing service status, nfsserver status
> allways display as [?] unknown.
>
> This is because sysvinit package check whether service's
> init script supporting status function or not by:
> grep -qs "\Wstatus)" "$SERVICE"
>
> So, this commit modified the indent for status etc, as
> most service's init script does.
>
> Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
> ---
>   .../nfs-utils/nfs-utils/nfsserver                  |   12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> index d7cf6e0..c263f14 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> @@ -144,26 +144,26 @@ stop_statd(){
>   #  restart: stops and starts mountd
>   #FIXME: need to create the /var/lib/nfs/... directories
>   case "$1" in
> -start)	create_directories
> +  start)	create_directories
>   	start_nfsd "$NFS_SERVERS"
>   	start_mountd
>   	start_statd
>   	test -r /etc/exports && exportfs -a;;
> -stop)	exportfs -ua
> +  stop)	exportfs -ua
>   	stop_statd
>   	stop_mountd
>   	stop_nfsd;;
> -status)
> +  status)
>   	status /usr/sbin/rpc.mountd
>   	RETVAL=$?
>   	status nfsd
>   	rval=$?
>   	[ $RETVAL -eq 0 ] && exit $rval
>   	exit $RETVAL;;
> -reload)	test -r /etc/exports && exportfs -r;;
> -restart)
> +  reload)	test -r /etc/exports && exportfs -r;;
> +  restart)
>   	$0 stop
>   	$0 start;;
> -*)	echo "Usage: $0 {start|stop|status|reload|restart}"
> +  *)	echo "Usage: $0 {start|stop|status|reload|restart}"
>   	exit 1;;
>   esac
>

