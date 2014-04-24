Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2C5A165D68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 12:29:33 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id q8so1917069lbi.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 05:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=M/hSpEJjK1DV4V93rnTsFphF7KHU9W71XdWbaO2MTL0=;
	b=jCbjgalAxpCS65ZD9ClGBUIf8/A87biApkX8Fb5RHrsPfAFxTO/WHaJ+q32NA1ET0C
	FJDc0AM9jT+mbXL3CHUaR1TnxVeUT3wVUCxjMj85C1RObLpiNBrGlA6TYof2iAQ/goJT
	/uKlLJEEQj2Gqv4EjQbOcwF+J7csbaLsukdGTHJ435NTLJt3U1QJ9kQ4F+ZJ72DUAgNU
	HN9SVjBfHBi0IyPpnZeKmAEJCsUPFKkuFEMnHGB90V7k2JYZp0/lHtVMiHU/cH3vXaQ/
	DLFP/NM/CezuoxWLmBLT343yE7un6RpZkBoj3gT9myGXwrrgHWwneF5KRfAJ5oBWnDkc
	0KNQ==
MIME-Version: 1.0
X-Received: by 10.152.10.72 with SMTP id g8mr1110004lab.50.1398342573800; Thu,
	24 Apr 2014 05:29:33 -0700 (PDT)
Received: by 10.112.58.132 with HTTP; Thu, 24 Apr 2014 05:29:33 -0700 (PDT)
In-Reply-To: <6e38b70bb3d84cb08af610496d2723ed@courrier2014.nvp.local>
References: <6e38b70bb3d84cb08af610496d2723ed@courrier2014.nvp.local>
Date: Thu, 24 Apr 2014 08:29:33 -0400
Message-ID: <CADkTA4NGe-eJC7aVAa+Q=fg-Ba_-gFDioB8hWUnH=UsAgmOJzQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mylene Josserand <Mylene.Josserand@navocap.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: kernel-yocto.bbclass : commas missing to use custom defconfig
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
X-List-Received-Date: Thu, 24 Apr 2014 12:29:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2014 at 5:55 AM, Mylene Josserand
<Mylene.Josserand@navocap.com> wrote:
> Hi everyone,
>
>
> I am new to Open Embedded / Yocto and I am currently configure it to gene=
rate custom kernel Linux and rootfs.
> For configuration information, I am using the Angstrom distribution and I=
 am on Dora branch.
>
> Here my OE configs :
>
>
> Build Configuration:
> BB_VERSION        =3D "1.20.0"
> BUILD_SYS         =3D "i686-linux"
> NATIVELSBSTRING   =3D "Debian-7.4"
> TARGET_SYS        =3D "arm-angstrom-linux-gnueabi"
> MACHINE           =3D "navocap-thelma7"
> DISTRO            =3D "angstrom"
> DISTRO_VERSION    =3D "v2013.12"
> TUNE_FEATURES     =3D "armv5 thumb dsp"
> TARGET_FPU        =3D "soft"
> meta-angstrom     =3D "angstrom-v2013.12-yocto1.5:dab3707b49b38112a9768a4=
c11b6d19266d9dadb"
> meta-oe
> toolchain-layer
> meta-networking   =3D "angstrom-staging-yocto1.5:4cc4b35f8ce68b38ebb5b847=
648e2176a92cf6fc"
> meta-java         =3D "dora:07f90e1615457edcadd2d9412048695823290f80"
> meta-qt5          =3D "dora:d7ebb534535a22981dac2af34f4cd9c9b37f0296"
> meta-systemd      =3D "angstrom-staging-yocto1.5:4cc4b35f8ce68b38ebb5b847=
648e2176a92cf6fc"
> meta-linaro
> meta-linaro-toolchain =3D "dora:ec262e6952804a417ab7112c807a6af1dc6a2f8b"
> meta-navocap      =3D "master:2335db58cc49df0ff5e66c4e0fc152b7c7e3f832"
> meta              =3D "angstrom-staging-yocto1.5:a4a399613625908ace8698d7=
eeba4224cd122cb8"
>
>
> I had some problems with the kernel recipe that - I think - I have resolv=
ed.
> I use a "custom" kernel source so I created a new kernel recipe (inherite=
d kernel and required recipes-kernel/linux/linux-yocto.inc) and configured =
it to use my patches and my defconfig.
> The patches were applied but not the defconfig file. I know that the best=
 way (according to Yocto Kernel Manual) is to use fragments but as I alread=
y have a defconfig for my kernel, I did not want to spend time to split my =
defconfig into fragments.
>
> I have found this post : https://lists.yoctoproject.org/pipermail/yocto/2=
013-October/016584.html but it did not solve my problem. I have always anot=
her .config in my build kernel directory even if in the ${WORKDIR} it was m=
y own defconfig.
>
> With some investigations, I found where is my problem.
> In fact, the problem was during the "configme" task where the "merge-conf=
ig.sh" failed. The merge-log.txt says :
>
> make[2]: *** No rule to make target `alldefconfig'.  Stop.
> make[1]: *** [alldefconfig] Error 2
> make: *** [sub-make] Error 2
>
>
> So, I searched and the configuration of "configme" and so "merge-config.s=
h" was passed via the "kernel-yocto.bbclass". The commit git.openembedded.o=
rg/openembedded-core/commit/?h=3Ddora&id=3D644f2e525b910b9ff8d9aaa33f11eba3=
fefa7c85 permits to use the "allnoconfig" in case of defconfig files but, f=
or me, it was never used because it used the "KCONFIG_MODE". I looked to KC=
ONFIG_MODE and it was empty so it should go to the "else" statement and use=
 the "allnoconfig".
> And that how I found that some commas is missing in the line :
>
>
> if [ -n ${KCONFIG_MODE} ]; then
>
>
> I added it :
>
>
> if [ -n "${KCONFIG_MODE}" ]; then
>
>
> And now, I have the "allnoconfig" option and I have my own .config in the=
 build kernel directory.
>
> I looked to other branch (master), and I still see the commas missing so =
I though that, maybe, nobody noticed this. So here I am !
> I don't know if it must be patched or something else (I am new so I don't=
 know how it works), but I wanted to share it.
>

Hmmm. I had a patch for this last year, but it looks like it fell
through the cracks
when I was submitting changes to the various release branches.

Thanks for the report, I'll take care of digging up that old patch and
sending it
out shortly.

Cheers,

Bruce

>
> If you need more information, do not hesitate.
> Thank you in advance.
>
>
> Best regards,
>
>
> Mylene JOSSERAND
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

