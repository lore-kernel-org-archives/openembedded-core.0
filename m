Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B2B6E6D681
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 10:17:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAQAHCqo002519
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 02:17:13 -0800 (PST)
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 26 Nov 2013 02:17:12 -0800
Message-ID: <52947527.1070101@windriver.com>
Date: Tue, 26 Nov 2013 18:17:11 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1385456243-2642-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1385456243-2642-1-git-send-email-jackie.huang@windriver.com>
Subject: Re: [PATCH] xinetd: add status of init.d command
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
X-List-Received-Date: Tue, 26 Nov 2013 10:17:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/26/2013 4:57 PM, jackie.huang@windriver.com wrote:
> From: Li Wang <li.wang@windriver.com>
>
> CQID: WIND00439690

Sorry forgot to remove this, I will re-send.

Thanks,
Jackie

>
> Signed-off-by: Li Wang <li.wang@windriver.com>
> ---
>   meta/recipes-extended/xinetd/xinetd/xinetd.init | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd.init b/meta/recipes-extended/xinetd/xinetd/xinetd.init
> index 26dbea7..777c2c8 100644
> --- a/meta/recipes-extended/xinetd/xinetd/xinetd.init
> +++ b/meta/recipes-extended/xinetd/xinetd/xinetd.init
> @@ -2,6 +2,9 @@
>   #
>   # /etc/init.d/xinetd  --  script to start and stop xinetd.
>
> +# Source function library.
> +. /etc/init.d/functions
> +
>   if test -f /etc/default/xinetd; then
>   	. /etc/default/xinetd
>   fi
> @@ -33,6 +36,10 @@ case "$1" in
>   	start-stop-daemon --stop --signal 3 --quiet --exec /usr/sbin/xinetd
>   	echo "."
>   	;;
> +    status)
> +	status /usr/sbin/xinetd;
> +	exit $?
> +	;;
>       reload)
>   	echo -n "Reloading internet superserver configuration: xinetd"
>   	start-stop-daemon --stop --signal 1 --quiet --exec /usr/sbin/xinetd
> @@ -49,7 +56,7 @@ case "$1" in
>   	$0 start
>   	;;
>       *)
> -	echo "Usage: /etc/init.d/xinetd {start|stop|reload|force-reload|restart}"
> +	echo "Usage: /etc/init.d/xinetd {start|stop|status|reload|force-reload|restart}"
>   	exit 1
>   	;;
>   esac
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

