Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 15BDB607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 14:52:00 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id j2so151430029qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 07:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=U+o0//LmCu2bSCBJ++1aTwf9jO7Zl26SPtilIQohby8=;
	b=Fhv2eapYKH1o+DRpRiN0/KhmX0VHAsznDyvVYiAyXhSsY3mN/xvpc76cdgIQ8JcI5k
	HPDtegue6wc2159lqSTxknUWRpzCvMrRQ5PTlU3DJU9dmwqzO1Vf97KKM4PWno8VZsPX
	evwX1qbc+HmTRqA3DHG3O1lSuQQ+xm93RTans0qIWPOBiGkbpt9h66QdSOf61g1BrhTq
	Oif1YtWz7gt3TZ3I7+Re1C9QKO5me8K5AuAAOPX9s3aC6Xa3h0aMZl/Qkx2cQSv7RD9/
	KPZiy9xeIitbb1jxF0UW3bMNj+Kv+9YA2OtbKdpwmigbWyFgL7QDS82Kdby49wcPz+ip
	PZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=U+o0//LmCu2bSCBJ++1aTwf9jO7Zl26SPtilIQohby8=;
	b=QqImPZw/y9448RzIdhlJWBWvJlQVCF6ZdwSIMpRdX7+PUoSdtAdoBphVkjszSVoe79
	+qoVl+VHyOYBKTDe7s8TKLZ4VRDHz0LUtvkgUQ0cpOLcyeBi6g9J6bPkc9uJ/GZugBfs
	U0Gdgwrzdt8UhqTTrFQl21OwFbjSAlhhVO0kcV/17mt6CO80disekKLOaxVXEL746IWN
	CWQuWxorI0ozMITRPwSxGtA9bQY6tsZlpzDSpeZLd/ta2P0XSeFxX+Al/ot4x00V+GcE
	l/ZbK/JWcY8K9fmaH1T7vkISvfr/L0CBFM4rN3gYr8z9vcvl9LwaEdYaolXuLrYdnRxW
	XDqQ==
X-Gm-Message-State: ALyK8tLtsFxPPSIR/EVNwdApPLuc1Z2MGxRQy2PEyxUawnn5To3gpE+gP0Y+jnjgwmR8VKGvgVBLhjEViwupKw==
X-Received: by 10.55.97.80 with SMTP id v77mr28807860qkb.41.1467384721021;
	Fri, 01 Jul 2016 07:52:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Fri, 1 Jul 2016 07:51:31 -0700 (PDT)
In-Reply-To: <EB6A5779-7761-4508-8FEC-FFF326614C72@die-kriestens.de>
References: <1586B03B-3244-4FB3-82F7-803CFD983532@die-kriestens.de>
	<CAJTo0LbuTrNE4kemiZK_yEqUFo4CN9TJJLZzqwTjzVK=xuK1MA@mail.gmail.com>
	<D94025A2-518C-4CC8-AE9C-93DB39CDD687@die-kriestens.de>
	<CAJTo0La_VCQ5P1ELePTyLQLU_Zy3rC6z+qh24ZtMcGJ7_FKg3Q@mail.gmail.com>
	<CBCA3234-905B-4408-B26F-B78D1B2A2719@die-kriestens.de>
	<EB6A5779-7761-4508-8FEC-FFF326614C72@die-kriestens.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Jul 2016 07:51:31 -0700
Message-ID: <CAMKF1sox8CsKy-3V87pgmr9uR5SvNx-87rEEO4AAjUGaYNKi_Q@mail.gmail.com>
To: Daniel Kriesten <embedded@die-kriestens.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Building Perl-5.22.1-r0 on Arch Linux fails with QA Issue
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
X-List-Received-Date: Fri, 01 Jul 2016 14:52:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

keep in mind that using gcc6 based build hosts may not work for OE
older than master

On Fri, Jul 1, 2016 at 1:16 AM, Daniel Kriesten
<embedded@die-kriestens.de> wrote:
> Hi Ross,
>
> I found the time to do the x86qemu build with jethro, which gives the QA =
Issue.
>
> ---------- >8 ----------
> jethro u=3D $ bitbake core-image-base
> WARNING: Host distribution "Arch-rolling" has not been validated with thi=
s version of the build system; you may possibly experience unexpected failu=
res. It is recommended that you use a tested distribution.
> Parsing recipes: 100% |##################################################=
###########################################################################=
##########################################################################|=
 Time: 00:01:22
> Parsing of 899 .bb files complete (0 cached, 899 parsed). 1330 targets, 3=
8 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION        =3D "1.28.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "Arch-rolling"
> TARGET_SYS        =3D "i586-poky-linux"
> MACHINE           =3D "qemux86"
> DISTRO            =3D "poky"
> DISTRO_VERSION    =3D "2.0.2"
> TUNE_FEATURES     =3D "m32 i586"
> TARGET_FPU        =3D ""
> meta
> meta-yocto
> meta-yocto-bsp    =3D "jethro:118380bc5d01e52b5edc574abb4176f6e70a54a6"
>
> NOTE: Preparing RunQueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: Failed to fetch URL http://downloads.sourceforge.net/linux-diag/=
sysfsutils-2.1.0.tar.gz, attempting MIRRORS if available
> WARNING: QA Issue: Symlink /usr/lib/perl/ptest/hostperl in perl-ptest poi=
nts to TMPDIR [symlink-to-sysroot]
> ERROR: QA Issue: Architecture did not match (3 to 62) on work/i586-poky-l=
inux/perl/5.22.0-r0/packages-split/perl-ptest/usr/lib/perl/ptest/.debug/gen=
erate_uudmap [arch]
> WARNING: QA Issue: /usr/lib/perl/ptest/generate@underscore@uudmap_perl-pt=
est contained in package perl-ptest requires libc.so.6()(64bit), but no pro=
viders found in its RDEPENDS [file-rdeps]
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in: /home/krid/Develop/Yocto/TUC-L4IVA-Y=
octo/meta-layers/poky/build-qemux86/tmp/work/i586-poky-linux/perl/5.22.0-r0=
/temp/log.do_package_qa.13360
> ERROR: Task 1146 (/home/krid/Develop/Yocto/TUC-L4IVA-Yocto/meta-layers/po=
ky/meta/recipes-devtools/perl/perl_5.22.0.bb, do_package_qa) failed with ex=
it code '1'
> NOTE: Tasks Summary: Attempted 3181 tasks of which 12 didn't need to be r=
erun and 1 failed.
> Waiting for 0 running tasks to finish:
>
> Summary: 1 task failed:
>   /home/krid/Develop/Yocto/TUC-L4IVA-Yocto/meta-layers/poky/meta/recipes-=
devtools/perl/perl_5.22.0.bb, do_package_qa
> Summary: There were 4 WARNING messages shown.
> Summary: There were 3 ERROR messages shown, returning a non-zero exit cod=
e.
> ---------- 8< ----------
>
> Here is what file says:
> jethro u=3D $ file tmp/work/i586-poky-linux/perl/5.22.0-r0/packages-split=
/perl-ptest/usr/lib/perl/ptest/.debug/generate_uudmap
> tmp/work/i586-poky-linux/perl/5.22.0-r0/packages-split/perl-ptest/usr/lib=
/perl/ptest/.debug/generate_uudmap: ELF 64-bit LSB executable, x86-64, vers=
ion 1 (SYSV), dynamically linked, interpreter *empty*, for GNU/Linux 2.6.32=
, BuildID[sha1]=3D48ab21d6bc4545ce1c9b695001a5179192c40d9a, not stripped
>
> As Arch Linux is currently based on gcc-6.1 (64bit only), I had to change=
 that to gcc-multilib (32 and 64 bit). Furthermore, for jethro and krogoth,=
 I had to downgrade gcc to 5.3. I could use latest master of poky and see, =
if that works. I don=E2=80=99t know, if it is worth a try.
>
> Regards
>         Daniel
>
>> Am 01.07.2016 um 07:49 schrieb Daniel Kriesten <embedded@die-kriestens.d=
e>:
>>
>>> Am 30.06.2016 um 18:56 schrieb Burton, Ross <ross.burton@intel.com>:
>>>
>>>
>>> On 30 June 2016 at 07:03, Daniel Kriesten <embedded@die-kriestens.de> w=
rote:
>>> ERROR: perl-5.22.1-r0 do_package: objcopy failed with exit code 256 (cm=
d was 'arm-poky-linux-gnueabi-objcopy' --only-keep-debug '/home/krid/Develo=
p/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/cortexa9hf-neon-poky-lin=
ux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/generate_uudmap' '/hom=
e/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/cortexa9hf-=
neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/.debug/ge=
nerate_uudmap'):
>>> arm-poky-linux-gnueabi-objcopy:/home/krid/Develop/Yocto/fsl-community-b=
sp/build-imx6q-elo/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/perl/5.22.1-=
r0/package/usr/lib/perl/ptest/generate_uudmap: File format not recognized
>>>
>>> Can you run file on the binary that objdump is complaining about?
>>> (/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/co=
rtexa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/=
generate_uudmap)
>>
>> $ file /home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/wo=
rk/cortexa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/p=
test/generate_uudmap
>> /home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/cort=
exa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/ge=
nerate_uudmap: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamic=
ally linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32,=
 BuildID[sha1]=3D48ab21d6bc4545ce1c9b695001a5179192c40d9a, not stripped
>>
>> So this one is build for the host, not the target =E2=80=A6
>>
>> With kind regards
>>       Daniel
>
>
> --
> Daniel Kriesten
> daniel@die-kriestens.de
> http://www.die-kriestens.de
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

