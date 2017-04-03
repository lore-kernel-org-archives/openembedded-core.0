Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4620471979;
	Mon,  3 Apr 2017 12:34:39 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id j90so72300849lfk.2;
	Mon, 03 Apr 2017 05:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=POPymC/HeHoVLMfuMm/pUH8YuIcohWitEpfz2a78IdA=;
	b=CaUSo3cnBuLa+9oc+8zrtf/abRwhzvEZ5QRSItyErioIAoRAEaj4lW5L+0kPgRUDZA
	QM8pQk4OrYNzajLRBhlwfqSNzuqVYQbLeHHv16DCpukjRDBPpSJeJQBTR+F58UfX51au
	lCn+gTA5pyGtD/RD5cB1mYiQVHE9JEZooQ8WiZcTAdbNXVPnGn41XGkZPi68GaK+oOSV
	+qKV6HIhiVFjPnkJJDFqI2tAn+fKStfaIYf1Gudiuc8x6IQNlfeGFU9ip1R+hwKXzwE5
	YTk8069VOU9jaQesB0A9rNG8K6KOebWQp+FSsNwrg0L9aeJ2CW5XTZbo5nV6EL4/Xlzo
	MabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=POPymC/HeHoVLMfuMm/pUH8YuIcohWitEpfz2a78IdA=;
	b=pjCu7RGFMmnDatYxbkbNxB5f87vgibNP0aQMXfx0+TQjbp9qW+mkJASosHoNPzLcJQ
	35IIapNb+eeBM6R/ealEqvvYMotZ489Yidl0mdM18QRWcN0cVRwR35dTSQhZNB4h0mLr
	Ry9xXzDcyil/pR4vw8MVG1JmDBO0EehBi7jH3sCpZ1Eb8vm3elQ+stETKvD5rdGM0Ov+
	3pMbjYJp9gzHtJaKhPU6OGkeXT6uwyaLWe+0O9nFAsDR9RF20If7Mhup0T158kTTM8RL
	oUKH5YBTA6rs0f5CNiTvBBc4qznBy6TGAdrRyLY5O+aTjmlR81FhpIOT2yXvLGQ1uefr
	8wkw==
X-Gm-Message-State: AFeK/H3zyuI0zq/bblpk9k2WN/3pPtCPnwnuX+E94DtnC7zMatJ808QCB/SyaJlGzqfZNg==
X-Received: by 10.28.157.150 with SMTP id g144mr9742661wme.89.1491222880303;
	Mon, 03 Apr 2017 05:34:40 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	36sm17995762wrk.15.2017.04.03.05.34.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Apr 2017 05:34:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 3 Apr 2017 14:34:43 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170403123443.GB3311@jama>
References: <20170403121749.GA3311@jama>
MIME-Version: 1.0
In-Reply-To: <20170403121749.GA3311@jama>
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: Re: State of bitbake world, Failed tasks 2017-04-01
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
X-List-Received-Date: Mon, 03 Apr 2017 12:34:41 -0000
X-Groupsio-MsgNum: 95689
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Content-Disposition: inline

--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2017 at 02:17:49PM +0200, Martin Jansa wrote:
> qemux86 shows more failures, I've dropped few master-next changes
> after this build.

I've noticed that the report doesn't cover all currently triggered QA
issues at least these 2 were missing in the report:

count: 27	issue: ldflags
flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-=
gnueabi/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libfli=
te_cmu_us_kal16.so.1.3' [ldflags]
flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-=
gnueabi/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflit=
e_cmu_us_kal.so.1.3' [ldflags]
flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux=
/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libflite_cmu_=
us_kal16.so.1.3' [ldflags]
flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux=
/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflite_cmu_u=
s_kal.so.1.3' [ldflags]
flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/fli=
te-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libflite_cmu_us_k=
al16.so.1.3' [ldflags]
flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/fli=
te-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflite_cmu_us_ka=
l.so.1.3' [ldflags]
logfsprogs-git: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-=
gnueabi/logfsprogs/git-r0/packages-split/logfsprogs/usr/bin/mklogfs' [ldfla=
gs]
logfsprogs-git: No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux=
/logfsprogs/git-r0/packages-split/logfsprogs/usr/bin/mklogfs' [ldflags]
logfsprogs-git: No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/log=
fsprogs/git-r0/packages-split/logfsprogs/usr/bin/mklogfs' [ldflags]
No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/flite-al=
sa/1.3-r1/packages-split/libflite-alsa/usr/lib/libflite.so.1.3' [ldflags]
No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/pngcheck=
/2.3.0-r0/packages-split/pngcheck/usr/bin/pngcheck' [ldflags]
No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/uml-util=
ities/20040406-r1/packages-split/uml-utilities/usr/bin/uml_switch' [ldflags]
No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux/flite-alsa/1.3-=
r1/packages-split/libflite-alsa/usr/lib/libflite.so.1.3' [ldflags]
No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux/pngcheck/2.3.0-=
r0/packages-split/pngcheck/usr/bin/png-fix-IDAT-windowsize' [ldflags]
No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux/uml-utilities/2=
0040406-r1/packages-split/uml-utilities/usr/bin/uml_net' [ldflags]
No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/flite-alsa/1.3-r1/p=
ackages-split/libflite-alsa/usr/lib/libflite.so.1.3' [ldflags]
No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/pngcheck/2.3.0-r0/p=
ackages-split/pngcheck/usr/bin/pngsplit' [ldflags]
No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/uml-utilities/20040=
406-r1/packages-split/uml-utilities/usr/bin/uml_mkcow' [ldflags]
pycd-0.1+gitrAUTOINC+63b1dff1bc: No GNU_HASH in the elf binary: '/tmp/work/=
armv5te-oe-linux-gnueabi/pycd/1_0.1+gitrAUTOINC+63b1dff1bc-r0/packages-spli=
t/pycd/usr/bin/pyc' [ldflags]
pycd-0.1+gitrAUTOINC+63b1dff1bc: No GNU_HASH in the elf binary: '/tmp/work/=
core2-64-oe-linux/pycd/1_0.1+gitrAUTOINC+63b1dff1bc-r0/packages-split/pycd/=
usr/bin/pyc' [ldflags]
pycd-0.1+gitrAUTOINC+63b1dff1bc: No GNU_HASH in the elf binary: '/tmp/work/=
i586-oe-linux/pycd/1_0.1+gitrAUTOINC+63b1dff1bc-r0/packages-split/pycd/usr/=
bin/pyc' [ldflags]
qtchooser-39+git4717841185d34bbe450e3b24445f2d35e3325a6a: No GNU_HASH in th=
e elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/qtchooser/39+git471784118=
5d34bbe450e3b24445f2d35e3325a6a-r0/packages-split/qtchooser/usr/bin/qtchoos=
er' [ldflags]
qtchooser-39+git4717841185d34bbe450e3b24445f2d35e3325a6a: No GNU_HASH in th=
e elf binary: '/tmp/work/core2-64-oe-linux/qtchooser/39+git4717841185d34bbe=
450e3b24445f2d35e3325a6a-r0/packages-split/qtchooser/usr/bin/qtchooser' [ld=
flags]
qtchooser-39+git4717841185d34bbe450e3b24445f2d35e3325a6a: No GNU_HASH in th=
e elf binary: '/tmp/work/i586-oe-linux/qtchooser/39+git4717841185d34bbe450e=
3b24445f2d35e3325a6a-r0/packages-split/qtchooser/usr/bin/qtchooser' [ldflag=
s]
suspend-blocker-0.1.22+gitrAUTOINC+9aa645305f: No GNU_HASH in the elf binar=
y: '/tmp/work/armv5te-oe-linux-gnueabi/suspend-blocker/0.1.22+gitrAUTOINC+9=
aa645305f-r0/packages-split/suspend-blocker/usr/bin/suspend-blocker' [ldfla=
gs]
suspend-blocker-0.1.22+gitrAUTOINC+9aa645305f: No GNU_HASH in the elf binar=
y: '/tmp/work/core2-64-oe-linux/suspend-blocker/0.1.22+gitrAUTOINC+9aa64530=
5f-r0/packages-split/suspend-blocker/usr/bin/suspend-blocker' [ldflags]
suspend-blocker-0.1.22+gitrAUTOINC+9aa645305f: No GNU_HASH in the elf binar=
y: '/tmp/work/i586-oe-linux/suspend-blocker/0.1.22+gitrAUTOINC+9aa645305f-r=
0/packages-split/suspend-blocker/usr/bin/suspend-blocker' [ldflags]


count: 3	issue: compile-host-path
         Please check the log '/tmp/work/armv5te-oe-linux-gnueabi/xdotool/1=
=2E20100416.2809-r1/temp/log.do_compile' for more information. [compile-hos=
t-path]
         Please check the log '/tmp/work/core2-64-oe-linux/xdotool/1.201004=
16.2809-r1/temp/log.do_compile' for more information. [compile-host-path]
         Please check the log '/tmp/work/i586-oe-linux/xdotool/1.20100416.2=
809-r1/temp/log.do_compile' for more information. [compile-host-path]

I'll check them now.

> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'6'|Failed de=
pencencies			 !!|Signatures		  !!colspan=3D'12'|QA !!Comment
> |-
> ||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||=
min	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	=
||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	|=
|unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgnam=
e	||=09
> |-
> ||2017-04-01	||2	||7	||2	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0=
		||3		||0		||0		||6		||2		||1		||0		||0		||0		||0		||=09
> |}
>=20
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> =3D=3D Failed tasks 2017-04-01 =3D=3D
>=20
> INFO: jenkins-job.sh-1.8.19 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/pyro/log.report.20170403_021525.log
>=20
> =3D=3D=3D common (2) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-extended/corosync/corosync_2.4.0.=
bb:do_compile
>     * meta-openembedded/meta-oe/recipes-support/links/links_2.7.bb:do_con=
figure
>=20
> =3D=3D=3D common-x86 (0) =3D=3D=3D
>=20
> =3D=3D=3D qemuarm (0) =3D=3D=3D
>=20
> =3D=3D=3D qemux86 (5) =3D=3D=3D
>     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4=
=2Ebb:do_compile
>     * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:do_=
compile
>     * meta-openembedded/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolat=
a_20100526.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.b=
b:do_compile
>     * meta-openembedded/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb=
:do_compile
>=20
> =3D=3D=3D qemux86_64 (0) =3D=3D=3D
>=20
> =3D=3D=3D Number of failed tasks (11) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.world.qemuarm.20170401_212659.log/ || http://errors.yoctoproject.org/Er=
rors/Build/35350/
> |-
> || qemux86 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.world.qemux86.20170331_214900.log/ || http://errors.yoctoproject.org/Er=
rors/Build/35348/
> |-
> || qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.world.qemux86-64.20170401_230709.log/ || http://errors.yoctoproject.=
org/Errors/Build/35352/
> |}
>=20
> =3D=3D=3D PNBLACKLISTs (441) =3D=3D=3D
>=20
> =3D=3D=3D QA issues (12) =3D=3D=3D
> {| class=3Dwikitable
> !| Count		||Issue
> |-
> ||0	||already-stripped
> |-
> ||0	||build-deps
> |-
> ||0	||file-rdeps
> |-
> ||0	||invalid-pkgconfig
> |-
> ||0	||libdir
> |-
> ||0	||pkgname
> |-
> ||0	||symlink-to-sysroot
> |-
> ||0	||unknown-configure-option
> |-
> ||1	||installed-vs-shipped
> |-
> ||2	||host-user-contaminated
> |-
> ||3	||textrel
> |-
> ||6	||version-going-backwards
> |}
>=20
>=20
>=20
> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
>=20
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.sig=
natures.20170402_201737.log/
>=20
> No issues detected
>=20
> QA issues by type:
> count: 0	issue: already-stripped
>=20
>=20
> count: 0	issue: libdir
>=20
>=20
> count: 3	issue: textrel
> chromium-52.0.2743.76: ELF binary '/tmp/work/i586-oe-linux/chromium/52.0.=
2743.76-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations=
 in .text [textrel]
> chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chrom=
ium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromi=
um/chrome' has relocations in .text [textrel]
> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x26=
4/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148=
' has relocations in .text [textrel]
>=20
>=20
> count: 0	issue: build-deps
>=20
>=20
> count: 0	issue: file-rdeps
>=20
>=20
> count: 6	issue: version-going-backwards
> minicoredumper-1.0.2: Package version for package minicoredumper-dbg went=
 backwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+2480=
19446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
> minicoredumper-1.0.2: Package version for package minicoredumper-dev went=
 backwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+2480=
19446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
> minicoredumper-1.0.2: Package version for package minicoredumper-doc went=
 backwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+2480=
19446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
> minicoredumper-1.0.2: Package version for package minicoredumper-locale w=
ent backwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+2=
48019446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
> minicoredumper-1.0.2: Package version for package minicoredumper-staticde=
v went backwards which would break package feeds from (0:2.0.0-r0+gitAUTOIN=
C+248019446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
> minicoredumper-1.0.2: Package version for package minicoredumper went bac=
kwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+24801944=
6c.0 to 0:1.0.2-r0.20) [version-going-backwards]
>=20
>=20
> count: 2	issue: host-user-contaminated
> glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-lij-it/usr/lib/=
locale/lij_IT/LC_NUMERIC is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-contami=
nated]
> glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-niu-nu/usr/lib/=
locale/niu_NU/LC_PAPER is owned by uid 3004, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contamina=
ted]
>=20
>=20
> count: 1	issue: installed-vs-shipped
> minicoredumper: 1 installed and not shipped files. [installed-vs-shipped]
>=20
>=20
> count: 0	issue: unknown-configure-option
>=20
>=20
> count: 0	issue: symlink-to-sysroot
>=20
>=20
> count: 0	issue: invalid-pkgconfig
>=20
>=20
> count: 0	issue: pkgname



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWOJBYwAKCRA3VSO3ZXaA
HESUAKCeAgai/NVcegyJvKHZzwRitDO9zACeP/ePzECQ9BP4IQ3+Fk7pqern8So=
=9Jw8
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--
