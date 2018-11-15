Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 30CBD605BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 04:58:03 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d19so29976666qkg.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 20:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QgnQnPVC1Nywv4K/as3/oEO2hJYkVAxTuGkqxAm4KJw=;
	b=l3Mu3QgN3phAqMcUusee2I74LdKl/cqlUJuFD2rY+74HxDWwUQKtDQg4Tz0RzNJgWR
	G0QuoDoPq9Z25YV0TqO91Z7XPhTPKx4kxyM8ynEaGCt+PPQYhm5HZZk3JkgyrNVdfhNO
	OU9K34g8pqkNavG0xB/OvFMdyBT9po5JUk4tzCdoNMoFmJrG816c6e4YXqdVOB/WsdRN
	Kml1UnqgFWU8fkcQy4LnAuBBs+wQj52RVpDLKs46ts/3N1IpYxKO62oKwKFb8jRJXDV9
	X6c51sMRDiNBSd4xxkyAPMIGFDnK9xXh18T+ki8tXnlocEmhslvTflVjAOKEomK3HnEg
	nxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QgnQnPVC1Nywv4K/as3/oEO2hJYkVAxTuGkqxAm4KJw=;
	b=rqRW/DQkgpkispjfdvS1PoYBp0GQcmo7kNkVdPBX1OgBUgEjfqrYCShNchJObXZiph
	IOiPjpiPwGRqpVRWwOx2Sz7gpap5sbVef3fzsvDYEoaIX7z8Mq81Iys4tDLfvWbTpcwp
	+f+qN0d4ue1bacojrtax+RqjdrQQydrIk0XNLaO+hr0EQr6tscl959kgo3IUI7E85CsW
	OdhZrQUna1p/8zqoo7+nED2tVebjJYyIzh/2uRasFw0JUP0q7nV/7MW3rcNV7bQEEp5v
	0T9Q+jNKO7Rsx9N+H6dwrfZOGIpcQqtSZjRBfBMti23MDydCYnQwU6ZMWH2kJrgJkUYV
	hEMA==
X-Gm-Message-State: AGRZ1gIqG4B3CgbMfo5AShhF5k96xv7MM6HfqaA+nQDSHHPNsgKx07Ap
	ANxPqZ+eDCMAyje17B4Y/p6DBJe9xDiuC2pmuXs=
X-Google-Smtp-Source: AJdET5cVCn+dRpTdht2AMOrtYuxf9MN+LfbIdzwSFzyjzlozupv65w72NEVbP/vmfDB4rXLyYYoq3Iwh3YUqWrvIItk=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr4620460qka.206.1542257883828; 
	Wed, 14 Nov 2018 20:58:03 -0800 (PST)
MIME-Version: 1.0
References: <20181115040043.9326-1-abrodkin@synopsys.com>
In-Reply-To: <20181115040043.9326-1-abrodkin@synopsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Nov 2018 20:57:37 -0800
Message-ID: <CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	linux-snps-arc@lists.infradead.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 15 Nov 2018 04:58:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 14, 2018 at 8:00 PM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> This utility is used for creation of images containing
> usable in run-time U-Boot environment.
>
> As of today this utility is added per-board like here [1]
> for Intel Edison board, here [2] for Altera's SoCFPGA and
> I may guess there're others so instead of adding another one for
> ARC why don't we package it for each and everyone.
>
> [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
> [2] https://github.com/kraj/meta-altera/blob/master/recipes-bsp/u-boot/u-boot-mkenvimage_v2016.11.bb

If this is applicable/works for all u-boot based machines then I think it makes
sense to have it on OE-core.

>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Marek Vasut <marex@denx.de>
> ---
>  .../u-boot/u-boot-mkenvimage_2018.07.bb            | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkenvimage_2018.07.bb
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkenvimage_2018.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkenvimage_2018.07.bb
> new file mode 100644
> index 0000000000..4770f3db08
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkenvimage_2018.07.bb
> @@ -0,0 +1,27 @@
> +require u-boot-common_${PV}.inc
> +
> +SUMMARY = "U-Boot bootloader environment image creation tool"
> +DEPENDS += "openssl"
> +
> +EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> +EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> +EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> +
> +do_compile () {
> +       oe_runmake sandbox_defconfig
> +
> +       # Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
> +       # generating it requires bin2header tool, which for target build
> +       # is built with target tools and thus cannot be executed on host.
> +       sed -i "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" .config
> +
> +       oe_runmake cross_tools NO_SDL=1
> +}
> +
> +do_install () {
> +       install -d ${D}${bindir}
> +       install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
> +       ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.16.2
>

