Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5654F65CF3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 05:43:36 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id n12so13369926qkh.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2018 21:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=J9AKv9XJX0+qfXSTEudY3s95H3M2eg1Gvb5KgbOowcQ=;
	b=Ts+HO6qm731N/jEDQQ1NWmsKRv7v09aKAlDZF9fkgJ5iKwAr47faFblVYRCrCh1RRj
	LF9HyYV+drFIKqiXpsK1rFUDXubbfuR6VwwHz7LbkATGeHuAkxAyYNyzn6JMeO7xct4c
	8Bdxe5+ehteB4/y7dnSDqyfIPRM7l+OwLkfnzpk5/HUO6gNg+6YwN7LVZwsz7e0EZ7uy
	4iX31aa5DZlBkI4UR/gQyyQ8sjWldkJmiQPOALjKhchjIA8js1iY7g5njEz2OPdjte4w
	DnvwgSnDWhNd8Tc8AQzYXBthan2am2gW/JS22aFUkIwx37i89gzdBdFob9yh8etq7ADF
	cjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=J9AKv9XJX0+qfXSTEudY3s95H3M2eg1Gvb5KgbOowcQ=;
	b=hQPaFT4f4iYwzABXeX/dOa7ZmdgDApO25+FjuF/iFmvaf/w/D2M8DDJxJATeD2xC5b
	fgnLCjdm1q1QOeafN1hDRJ1kfyMMtcuBNJTEr3gl2vS+oordotAyLfsYUXrAo5TBYP6f
	KmhXgsynkYspN/0SBeTVuLUP5K6kWlTy2W8Ggi9p/yWFuHVuYvSZxKu77GwglU3JDmMZ
	rWwDWiNeZ6DnUFox8AJK3xa/cXEyjRpnm9wf9ApnLXTYpTSzVi1CBThvfJB4YZsRMw3p
	xnfaljM9vcsrWjzh0U5r7URpRNBey8UGeb7B37jguZzOZ8EkqyL4SBcS9vA7GPWq01dl
	n2+A==
X-Gm-Message-State: AA+aEWYsoTLhOy7HFuubgArOh9UdWI0nfXGZ8sZCxIUOvIk3hGGgN6Oz
	f6wQfPhILftJU2hH1AGNyBAFuJ0IlMvx7fkGGnA=
X-Google-Smtp-Source: AFSGD/XqiJwR8ldQRHfEVRR+p2SuDqxXgLgB9ceW+wX1DYj+7umOuq5eK82Ls3KFcGFp+LrpAsKN4j0cctM48rSUv8k=
X-Received: by 2002:a37:ac05:: with SMTP id e5mr25567294qkm.102.1544075016829; 
	Wed, 05 Dec 2018 21:43:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543542953.git.kai.kang@windriver.com>
	<3fa72e2dcc40d2f20f8f4350d0a5817f90aca805.1543542953.git.kai.kang@windriver.com>
In-Reply-To: <3fa72e2dcc40d2f20f8f4350d0a5817f90aca805.1543542953.git.kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Dec 2018 21:43:11 -0800
Message-ID: <CAMKF1spY13oEFVMnw1mJTDq6gRr7nF9bcEyouX32OYWN98nP4Q@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] u-boot-tools: fix compile error
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
X-List-Received-Date: Thu, 06 Dec 2018 05:43:36 -0000
Content-Type: text/plain; charset="UTF-8"

Richard,

Please pick this patch up. This fixes the build issue for this recipe
on every architecture besides arm/x86
e.g. see http://errors.yoctoproject.org/Errors/Details/203569/
On Thu, Nov 29, 2018 at 5:59 PM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> It uses sandbox_defconfig to produce u-boot tools. But EFI is only
> supported by arm and x86, then it fails to run task do_compile on other
> arches:
>
> | include/config_distro_bootcmd.h:267:3: error: #error "sandbox EFI
> | support is only supported on ARM and x86"
>
> Only enable EFI support for u-boot-tools on x86 and arm to fix the issue.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb
> index 127c4c15d1..7893d2aebc 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb
> @@ -17,13 +17,20 @@ EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS
>  EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
>  EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
>
> +SED_CONFIG_EFI = '-e "s/CONFIG_EFI_LOADER=.*/# CONFIG_EFI_LOADER is not set/"'
> +SED_CONFIG_EFI_x86 = ''
> +SED_CONFIG_EFI_x86-64 = ''
> +SED_CONFIG_EFI_arm = ''
> +SED_CONFIG_EFI_armeb = ''
> +SED_CONFIG_EFI_aarch64 = ''
> +
>  do_compile () {
>         oe_runmake sandbox_defconfig
>
>         # Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
>         # generating it requires bin2header tool, which for target build
>         # is built with target tools and thus cannot be executed on host.
> -       sed -i "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" .config
> +       sed -i -e "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" ${SED_CONFIG_EFI} .config
>
>         oe_runmake cross_tools NO_SDL=1
>  }
> --
> 2.19.0.rc2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

