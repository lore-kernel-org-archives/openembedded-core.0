Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59CE57969C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 05:32:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8A5WNnC002269
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 9 Sep 2018 22:32:33 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Sun, 9 Sep 2018 22:32:12 -0700
To: Anton Gerasimov <tossel@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180907154147.7995-1-tossel@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <e646174f-0fba-e63b-4990-bc405461728f@windriver.com>
Date: Mon, 10 Sep 2018 13:37:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180907154147.7995-1-tossel@gmail.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH] systemd: set split-bin to true by default
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
X-List-Received-Date: Mon, 10 Sep 2018 05:32:59 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for fixing this error.

I saw you were sending this patch to the yocto mailing list. That's not 
necessary.
This mailing list is the correct place to send patch.
Please wait for merge.

Best Regards,
Chen Qi

On 09/07/2018 11:41 PM, Anton Gerasimov wrote:
> Not doing so will make meson chose where to install init binary
> based on irrelevant features of the build machine.
>
> PACKAGECONFIG option is defined to override this behavior.
>
> Signed-off-by: Anton Gerasimov <tossel@gmail.com>
> ---
>   meta/recipes-core/systemd/systemd_239.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
> index 84906f97b7..55e3986935 100644
> --- a/meta/recipes-core/systemd/systemd_239.bb
> +++ b/meta/recipes-core/systemd/systemd_239.bb
> @@ -168,6 +168,7 @@ PACKAGECONFIG[time-epoch] = "-Dtime-epoch=0,,"
>   PACKAGECONFIG[timedated] = "-Dtimedated=true,-Dtimedated=false"
>   PACKAGECONFIG[timesyncd] = "-Dtimesyncd=true,-Dtimesyncd=false"
>   PACKAGECONFIG[usrmerge] = "-Dsplit-usr=false,-Dsplit-usr=true"
> +PACKAGECONFIG[sbinmerge] = "-Dsplit-bin=false,-Dsplit-bin=true"
>   PACKAGECONFIG[utmp] = "-Dutmp=true,-Dutmp=false"
>   PACKAGECONFIG[valgrind] = "-DVALGRIND=1,,valgrind"
>   PACKAGECONFIG[vconsole] = "-Dvconsole=true,-Dvconsole=false,,${PN}-vconsole-setup"



