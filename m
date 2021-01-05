Received: from wforward2-smtp.messagingengine.com (wforward2-smtp.messagingengine.com [64.147.123.31])
 by mx.groups.io with SMTP id smtpd.web08.1646.1609873483213940874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 11:04:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=gPTbTaes;
 spf=neutral (domain: iki.fi, ip: 64.147.123.31, mailfrom: tanuk@iki.fi)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailforward.west.internal (Postfix) with ESMTP id 165D61097;
	Tue,  5 Jan 2021 14:04:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 05 Jan 2021 14:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=lBgGQ+/6kFpICQgWs2N+ijXTOFNznYFdnXnKMH07k
	lw=; b=gPTbTaes4C5x68J0vVZMRzl4aaJoRYs6P/OkpTZE1mDCJoLJhbcuhxImh
	FvE3uA7bb3Temfji5KSWO+zPb0/yyxTG1mQA4URUfqe2tQwymRYsC2xmx11tb8Nn
	bV+K3axlz/uZI2fXpFDuxlkzqPN9ab14ayVjg6hDAxXMm/DR1Bk5tBvZIcw36V9u
	YZcv5h4gzt84e5sKb3Un1iRvnEEl8JiT+hQj76KkYMak4l3DIYWJidPlHnqr62Fy
	e4UMd+iypB8be4lSgs6ziYbTCFy8INo0zHFPFMkHVKCEuelFrcRHuPRQvvgGaIjr
	rAi7Q5zqXOZep2sjjVdINVcEzb3ww==
X-ME-Sender: <xms:SLj0Xy3vcY9TmM8LjY4ED7hI96OVaaigkC2FsppThtEtegb6gH1vFg>
    <xme:SLj0X1Fg1zviJZa8gN9-0-sO17w6FTEiuRoreMXUgdQZxjbECJ9QLiqG9cNL_nBzd
    IN00EjSuyvfWk7S>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefjedgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
    ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuggftrfgrthhtvghrnh
    epveeiledtudekhefflefhhfejudfhleefgfekieejffeuveeiuedugeeuhfeviedvnecu
    ffhomhgrihhnpehgihhthhhusgdrtghomhdpfhhrvggvuggvshhkthhophdrohhrghenuc
    fkphepudekkedruddviedrkeelrdeivdenucfuphgrmhfkphfpvghtfihorhhkpedukeek
    rdduvdeirdekledriedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:SLj0X64gSfuQIax5arqgcjq-thva9AQtTxhulc5McXj9ZGvkY5r6Jw>
    <xmx:SLj0Xz2qyvpz7ojxJLFA7hR0Smg4G9wnmnAO9DcVDu4fSDQ8TcVpfA>
    <xmx:SLj0X1EOve-2Hr7IkNwag2CmrxbdgkJrV2yCejnxF1qFuFw-bS-Arg>
    <xmx:Sbj0XzPgA8010_m5dzoijT9VkWX_9Kcx8RbqkhVdTWi0ewsikNiQOK05xTE>
Received: from laptop (unknown [188.126.89.62])
	by mail.messagingengine.com (Postfix) with ESMTPA id D1504240057;
	Tue,  5 Jan 2021 14:04:39 -0500 (EST)
Message-ID: <25433ae4028ee7784430c585a71bf503a4a1d37d.camel@iki.fi>
Subject: Re: [OE-core] [PATCH v2] pulseaudio: define -mfloat-abi=softfp for CC on armv5
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Yu, Mingli"
	 <mingli.yu@windriver.com>, openembedded-core@lists.openembedded.org, 
	armccurdy@gmail.com
Date: Tue, 05 Jan 2021 21:04:35 +0200
In-Reply-To: <89cb1de79cc242d0545829a3138685ebc4ffe8cd.camel@linuxfoundation.org>
References: 
	<CAJ86T=VZtAHf2cP==VnVK1mM4XEY+DaJqyokmzPfCzGT0UvwAQ@mail.gmail.com>
	 <20210105033719.809-1-mingli.yu@windriver.com>
	 <89cb1de79cc242d0545829a3138685ebc4ffe8cd.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-01-05 at 12:37 +0000, Richard Purdie wrote:
> On Tue, 2021-01-05 at 11:37 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> After pulseaudio upgrades from 13.0 to 14.0, it also switches from
> autotools
> to meson. In autotools, there is --disable-neon-opt option for
> disabling NEON
> optimizations, but there is no counterpart in meson.
> 
> And the meson build system adds -mfpu=neon at the end of the compiler
> command
> line which overrids any earlier -mfpu options and result below build
> failure
> on armv5:
> 
> > /prj/tmp-glibc/work/armv5e-wrs-linux-gnueabi/pulseaudio/14.0-
> > r0/recipe-sysroot-native/usr/lib/arm-wrs-linux-gnueabi/gcc/arm-wrs-
> > linux-gnueabi/10.2.0/include/arm_neon.h:31:2: error: #error "NEON
> > intrinsics not available with the soft-float ABI.  Please use -
> > mfloat-abi=softfp or -mfloat-abi=hard"
> >  31 | #error "NEON intrinsics not available with the soft-float ABI. 
> > Please use -mfloat-abi=softfp or -mfloat-abi=hard"
>       |  ^~~~~
> > ../pulseaudio-14.0/src/pulsecore/mix_neon.c: In function
> > 'pa_mix_ch2_s16ne_neon':
> > ../pulseaudio-14.0/src/pulsecore/mix_neon.c:38:9: error: unknown type
> > name 'int32x4_t'; did you mean 'int32_t'?
> >   38 |         int32x4_t sum0, sum1;
> 
> Define -mfloat-abi=softfp for CC on armv5 to fix the above issue.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index e40b8c1c40..761e4f74dc 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -123,6 +123,11 @@ PACKAGECONFIG[ipv6] = "-Dipv6=true,-Dipv6=false,"
>  PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,"
>  
>  export TARGET_PFPU = "${TARGET_FPU}"
> +# workaround build failure on qemuarmv5 as the neon optimizations is
> +# enabled by default and no option to disable neon with meson build
> +# system
> +CC_append_armv5 = " -mfloat-abi=softfp"
> +export CC
>  
>  set_cfg_value () {
>         sed -i -e "s/\(; *\)\?$2 =.*/$2 = $3/" "$1"
> 
> I really don't want to add things like this to the recipe, I think it
> will interfere with other parts of the compilation. In many ways I'd
> prefer an option added to meson. Do we know what upstream are thinking
> in relation to this?

I think Meson should be fixed, but it may be necessary to add a build
option to PulseAudio to disable the neon code while waiting for Meson
to get fixed.

I now filed a bug for Meson: 
https://github.com/mesonbuild/meson/issues/8156

and another for PulseAudio: 
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1088

so at least the relevant projects know about the issue now. I may work
on fixing these myself if nobody else does, but I don't expect that to
happen quickly.

-- 
Tanu

