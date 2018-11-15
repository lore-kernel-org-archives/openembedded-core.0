Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B4E596C18F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 19:43:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wAFJhk2X002781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 15 Nov 2018 19:43:48 GMT
Message-ID: <2cdd2bd1c5aa882806944166c12d506ef142073c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2018 19:43:46 +0000
In-Reply-To: <6947107f1c2b7d20d72f237f8630aa469c2b08e3.1542247292.git.Qi.Chen@windriver.com>
References: <cover.1542247292.git.Qi.Chen@windriver.com>
	<6947107f1c2b7d20d72f237f8630aa469c2b08e3.1542247292.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/8] busybox: enable bzip2 by default
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
X-List-Received-Date: Thu, 15 Nov 2018 19:43:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-15 at 10:02 +0800, Chen Qi wrote:
> bunzip2 is enabled by default, but bzip2 is not. This is kind of
> strange, and it also causes busybox's ptest failure regarding
> bunzip2, as bunzip2's test case needs bzip2 command.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/busybox/busybox/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/busybox/busybox/defconfig
> b/meta/recipes-core/busybox/busybox/defconfig
> index 32213c0..0c40990 100644
> --- a/meta/recipes-core/busybox/busybox/defconfig
> +++ b/meta/recipes-core/busybox/busybox/defconfig
> @@ -150,7 +150,7 @@ CONFIG_LZCAT=y
>  # CONFIG_UNXZ is not set
>  CONFIG_XZCAT=y
>  # CONFIG_XZ is not set
> -# CONFIG_BZIP2 is not set
> +CONFIG_BZIP2=y
>  CONFIG_FEATURE_BZIP2_DECOMPRESS=y
>  CONFIG_CPIO=y
>  # CONFIG_FEATURE_CPIO_O is not set

Fails on the autobuilder:


https://autobuilder.yoctoproject.org/typhoon/#/builders/21/builds/219/steps/7/logs/step1b

Cheers,

Richard


