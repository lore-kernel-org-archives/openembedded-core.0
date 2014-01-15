Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id BDD6F6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 09:31:58 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id p61so1481514wes.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 01:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=gxh4XrccKGuT4RPoQTgGTvO0HqnILHOtnp0RckSyWiU=;
	b=H5WQg5u0IQI8CCLnWa1/Q1sMhqywDw56160tFJwunwYWn6UktafuxxWRSpZZFtvRj8
	u6CHwR5MNJRDUJ7A962rq0b6N8cvzq4WX+qjt5XfswXQXiPh6b8KlD+MubUqLHtdRZP4
	Cpxf82rBBClzwOtpfOhDdwQds9cZev+05fnmJRIAG7t1TfLth3FTIbzaTpd58BBT75zV
	qgEu27th4Qex5Xx00y5bYTduCTtiqkBnw/GPtKLOeq4SLgWM28k30Za9OKqQ957RNrbf
	lHnHaceTDeAnTJM66ErI/UHbmu//lEq0/3JX2NuMve8BHo5FPHHQEhZHeq3ylvQ2oIVN
	vVaA==
X-Gm-Message-State: ALoCoQlUpA8RljNvqN4oyGsVJU/l3++RNgkW9GW1F7EHpqU8H3GWxO+m+FEjvg8H2TXX2yQ1B9Xx
X-Received: by 10.194.171.34 with SMTP id ar2mr777973wjc.81.1389778319215;
	Wed, 15 Jan 2014 01:31:59 -0800 (PST)
Received: from ?IPv6:2001:610:612:0:5e51:4fff:fec8:7c15?
	([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id hy8sm2724911wjb.2.2014.01.15.01.31.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 15 Jan 2014 01:31:58 -0800 (PST)
Message-ID: <52D6558D.3080709@linaro.org>
Date: Wed, 15 Jan 2014 10:31:57 +0100
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1389777920-28884-1-git-send-email-koen.kooi@linaro.org>
In-Reply-To: <1389777920-28884-1-git-send-email-koen.kooi@linaro.org>
Subject: Re: [RFC][PATCHv2] grub-efi: add git version
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
X-List-Received-Date: Wed, 15 Jan 2014 09:31:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ignore this one as well, it fails on non-x86 :( Grub is really great for 
triggering different errors on different arches.

On 01/15/2014 10:25 AM, Koen Kooi wrote:
> This allows building both non-EFI (via grub_git.bb) and EFI versions of grub for platforms like i586 and armv7a which are usually non-EFI.
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>   meta/recipes-bsp/grub/grub-efi_git.bb | 72 +++++++++++++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
>   create mode 100644 meta/recipes-bsp/grub/grub-efi_git.bb
>
> diff --git a/meta/recipes-bsp/grub/grub-efi_git.bb b/meta/recipes-bsp/grub/grub-efi_git.bb
> new file mode 100644
> index 0000000..e8f859e
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/grub-efi_git.bb
> @@ -0,0 +1,72 @@
> +SUMMARY = "GRUB2 is the next-generation GRand Unified Bootloader"
> +
> +DESCRIPTION = "GRUB2 is the next generaion of a GPLed bootloader \
> +intended to unify bootloading across x86 operating systems. In \
> +addition to loading the Linux kernel, it implements the Multiboot \
> +standard, which allows for flexible loading of multiple boot images."
> +
> +HOMEPAGE = "http://www.gnu.org/software/grub/"
> +SECTION = "bootloaders"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +DEPENDS = "autogen-native flex-native bison-native xz freetype"
> +
> +DEFAULT_PREFERENCE = "-1"
> +DEFAULT_PREFERENCE_arm = "1"
> +
> +PV = "2.00+${SRCPV}"
> +SRCREV = "0776112c5311196889a15058a3b1be4c81ba5e05"
> +SRC_URI = "git://git.savannah.gnu.org/grub.git \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
> +
> +inherit autotools
> +inherit gettext
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
> +PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,lvm2"
> +
> +# configure.ac has code to set this automagically from the target tuple
> +# but the OE freeform one (core2-foo-bar-linux) don't work with that.
> +
> +GRUBPLATFORM = "efi"
> +
> +EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} --disable-grub-mkfont --program-prefix="" \
> +                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
> +
> +do_configure_prepend() {
> +    ( cd ${S}
> +      ${S}/autogen.sh )
> +}
> +
> +do_install_class-native() {
> +        install -d ${D}${bindir}
> +        install -m 755 grub-mkimage ${D}${bindir}
> +}
> +
> +do_deploy() {
> +	# Search for the grub.cfg on the local boot media by using the
> +	# built in cfg file provided via this recipe
> +	grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
> +	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
> +	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search
> +	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
> +}
> +
> +do_deploy_class-native() {
> +	:
> +}
> +
> +addtask deploy after do_install before do_build
> +
> +RDEPENDS_${PN} = "diffutils freetype"
> +FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
> +
> +INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP_${PN}-dbg = "arch"
>



-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

