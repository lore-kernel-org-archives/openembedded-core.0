Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3935777129
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 06:36:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9G6a6Ft003500
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 23:36:06 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 15 Oct 2015 23:36:05 -0700
Message-ID: <56209AD4.3090809@windriver.com>
Date: Fri, 16 Oct 2015 14:36:04 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1436941198-24451-1-git-send-email-wenzong.fan@windriver.com>
In-Reply-To: <1436941198-24451-1-git-send-email-wenzong.fan@windriver.com>
Subject: Re: [PATCH v3] rpcbind: handle rpcbind options
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
X-List-Received-Date: Fri, 16 Oct 2015 06:36:07 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping again ...

Thanks
Wenzong

On 07/15/2015 02:19 PM, wenzong.fan@windriver.com wrote:
> From: Li Wang <li.wang@windriver.com>
>
> While runing:
>
> $ systemctl restart rpcbind
> $ systemctl status rpcbind
>
> There are errors like below:
>    rpcbind[1722]: Cannot open '/tmp/rpcbind.xdr' file for reading, \
>      errno 2 (No such file or directory)
>    rpcbind[1722]: Cannot open '/tmp/portmap.xdr' file for reading, \
>      errno 2 (No such file or directory)
>
> Don't pass -w to rpcbind on boot up, since the files won't be there
> to be read, the patch refers to:
>    https://bugs.launchpad.net/ubuntu/+source/rpcbind/+bug/835833
>
> Signed-off-by: Li Wang <li.wang@windriver.com>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   meta/recipes-extended/rpcbind/rpcbind/rpcbind.service | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
> index b3ae254..9cdade4 100644
> --- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
> +++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
> @@ -5,7 +5,7 @@ Requires=rpcbind.socket
>   [Service]
>   Type=forking
>   EnvironmentFile=-@SYSCONFDIR@/rpcbind.conf
> -ExecStart=@SBINDIR@/rpcbind -w $RPCBIND_OPTS
> +ExecStart=@SBINDIR@/rpcbind $RPCBIND_OPTS
>   SuccessExitStatus=2
>
>   [Install]
>

