Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4E5AD789EE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 15:39:45 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id y70-v6so2797047vkc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 08:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RgYrJ6LqCeTWBh/AU/sakJjccUEvgA6KWF1WLhrwlbU=;
	b=UpfOZEUOXKFVuGNvXdv8d7eHP92PnHc8lYOgoCHm3e85PTy81UEl0OgKW+Xnb9JvUI
	cyHH9vkPSjOYdJLuunlbanlVSXWg+tbuwrEn9AOkhFFTqYjqqAkKcK8EM15x/qag+Zb2
	OTiU6E43QqqLGkXczs61QpqNRS/nRusa7ky85+FjApOx40WcBlez2hE8jCSqOQnhxgG7
	iOtBTzyZ/pNi5HGrX9hDlqcWDz5/I5CMJ2gVLgnPfmpImUAC5xbgrBMa1eMenCEfaL7T
	SnT1LAzNn3fjf3//ggaYw36vF/uUL/MOPYwcjbQGBUflWz/drcD7pT02whUrIRoNorW7
	RiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RgYrJ6LqCeTWBh/AU/sakJjccUEvgA6KWF1WLhrwlbU=;
	b=YhdXvxXBXyIpFK7vrVRQsqV7HcyL/dfJMGB0T/E3DUybpI3f2pj6ykUc1L25I6pRYn
	p+5yOP5d+R13SCk/lFP+Feg3OVOqBVvawBa4pwuX339LnkH2YGWGb9R6cr7HcxxIWlSe
	kK1v4CN7yuKsLzPZX30HK5fKGV5ZWLJ54J6xUKu3wyqvu4XPOYVTRAonR6tJqZpH0lmj
	6kCLxxIeHUXVbyixeAYMYtB3gcvMh9LaSIgLtqBWjYCYGtbsCd9XuGMFH3QkdxuNLxrH
	s3AxX7/GhYY75D9Qc8FmyC9Cs3p6y7qkQ54w9JVljaxa/gJNX5eQWe/4PlSnH5R+0puJ
	no/A==
X-Gm-Message-State: APt69E3fEWPUAO69gJ4U6JhEMD7ZgNw+EL+P9RWivXZI9Pzp8xExF/7s
	4qxQpB4Z4CJpPUjMwwuu6V0jpJaVOlgSYUKFTKI=
X-Google-Smtp-Source: AAOMgpdCtgmCbM3KmZcbKHNcHMXrfnrtRcR65LFTaxzGhaMTV7Ux3Fincp9RSACdXMWOsjVaFxJnsxTF6iLTkTdEaMs=
X-Received: by 2002:a1f:e605:: with SMTP id d5-v6mr3602231vkh.4.1530805185986; 
	Thu, 05 Jul 2018 08:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20180704065654.21039-1-zhe.he@windriver.com>
	<CAMKF1sr-+FgZYWSD-LEVxZ5uAf7TE8qTPJ7=NYs=ixOPc9cwHA@mail.gmail.com>
	<0cf4c4a2-c9ef-7f1b-ccfe-f1413dc1f312@windriver.com>
In-Reply-To: <0cf4c4a2-c9ef-7f1b-ccfe-f1413dc1f312@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jul 2018 08:39:19 -0700
Message-ID: <CAMKF1sqrosj8d1apbUOSV0NH_XMPKB+yEG_5EQhO1BmZi866Rg@mail.gmail.com>
To: zhe.he@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] scripts/runqemu: qemumips support up to 2GiB RAM
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
X-List-Received-Date: Thu, 05 Jul 2018 15:39:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

we need to define a new machine config for qemumipsel.conf something like b=
elow

#@TYPE: Machine
#@NAME: mti_malta32_le MIPS
#@DESCRIPTION: mti_malta32_le

require conf/machine/include/qemu.inc
require conf/machine/include/tune-mips32r2.inc
require conf/machine/include/qemuboot-mips.inc

DEFAULTTUNE =3D "mips32r2el"

KERNEL_IMAGETYPE =3D "vmlinux"
KERNEL_ALT_IMAGETYPE =3D "vmlinux.bin"

SERIAL_CONSOLES ?=3D "115200;ttyS0 115200;ttyS1"

MACHINE_EXTRA_RRECOMMENDS =3D " kernel-modules"
On Thu, Jul 5, 2018 at 2:37 AM He Zhe <zhe.he@windriver.com> wrote:
>
>
>
> On 2018=E5=B9=B407=E6=9C=8804=E6=97=A5 21:29, Khem Raj wrote:
> > i think you can squash both patches into one. Additionally we should
> > be able to cover mipsel case as well
>
> I started a build with latest poky and only set DEFAULTTUE=3Dmipsel. Is t=
his the right way to use little endian?
>
> Then I got the following error and found kernel and kernel modules output=
 are all big endian.
>
> ERROR: linux-yocto-4.14.48+gitAUTOINC+94457657b8_6c2433d7c5-r0 do_package=
_qa: QA Issue: Endiannes did not match (1 to 0) on /work/qemumips-poky-linu=
x/linux-yocto/4.14.48+gitAUTOINC+94457657b8_6c2433d7c5-r0/packages-split/ke=
rnel-module-i2c-dev-4.14.48-yocto-standard/lib/modules/4.14.48-yocto-standa=
rd/kernel/drivers/i2c/i2c-dev.ko [arch]
>
> Then I tried to build a empty file.
> tmp/work/x86_64-linux/gcc-cross-mipsel/8.1.0-r0/recipe-sysroot-native/usr=
/bin/mipsel-poky-linux/mipsel-poky-linux-gcc -c a.c
> as: unrecognized option '-EL'
>
> Does it mean there something wrong with little endian toolchain?
>
> Zhe
>
> > On Tue, Jul 3, 2018 at 11:57 PM He Zhe <zhe.he@windriver.com> wrote:
> >> OE uses qemumips to simulate a Malta board by default.
> >>
> >> As upstream qemu introduced:
> >> https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D94c2b6aff43cdfcfdfb5=
52773a6b6b973a72ef0b
> >>
> >> The Malta board can support up to 2GiB of RAM which should
> >> be able to boot a Linux kernel built with CONFIG_HIGHMEM
> >> enabled and passing "-m 2048" to QEMU and appending the
> >> following kernel parameters:
> >> ...
> >> mem=3D256M@0x0 mem=3D256M@0x90000000 mem=3D1536M@0x20000000
> >> ...
> >>
> >> But the following commit in kernel broke above mem=3DX@Y setting
> >> which added the memory as reserved memory area.
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3D73fbc1eba7ffa3bf0ad12486232a8a1edb4e4411
> >> ...
> >> commit 73fbc1eba7ffa3bf0ad12486232a8a1edb4e4411
> >> Author: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> >> Date:   Wed Nov 23 14:43:49 2016 +0100
> >>
> >>     MIPS: fix mem=3DX@Y commandline processing
> >> ...
> >>
> >> So remove `mem=3D*' to disable user-defined physical RAM map
> >> which let kernel itself caculates memory ranges.
> >>
> >> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> Signed-off-by: He Zhe <zhe.he@windriver.com>
> >> ---
> >>  scripts/runqemu | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/scripts/runqemu b/scripts/runqemu
> >> index de42d0f323..597e7e9a79 100755
> >> --- a/scripts/runqemu
> >> +++ b/scripts/runqemu
> >> @@ -668,7 +668,10 @@ class BaseConfig(object):
> >>              logger.info('QB_MEM is not set, use 512M by default')
> >>              self.set('QB_MEM', '-m 512')
> >>
> >> -        self.kernel_cmdline_script +=3D ' mem=3D%s' % self.get('QB_ME=
M').replace('-m','').strip() + 'M'
> >> +        mach =3D self.get('MACHINE')
> >> +        if mach !=3D 'qemumips':
> >> +            self.kernel_cmdline_script +=3D ' mem=3D%s' % self.get('Q=
B_MEM').replace('-m','').strip() + 'M'
> >> +
> >>          self.qemu_opt_script +=3D ' %s' % self.get('QB_MEM')
> >>
> >>      def check_tcpserial(self):
> >> --
> >> 2.11.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

