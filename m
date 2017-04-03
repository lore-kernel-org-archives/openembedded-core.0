Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8CE6FF9F;
	Mon,  3 Apr 2017 13:25:52 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id k6so164435151wre.2;
	Mon, 03 Apr 2017 06:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=yA2uvvVP7MReKwmAR+bXcyNRNDi5EYJPAtPb3WG4UIA=;
	b=FlEXHrpsDImT5bvomH601mJbpbLkiiGvaQjqX0xvca73hfLW9z3Fi/fBC0D5MJN7lV
	1TR9srQXx2Fdx6vVeSVLGVqXJkl/kZd0OKifqAfJGcazYQM6+ahXYg+C7dzfxZGe1Wo7
	MMJTzgi/DbtOT/+miwmOMc2wENf95pwwIoBmYhkK/7oPUqyY8NBg31FtLSiXG4g0LFpk
	qnzBLkZ40Qhf1MUQ13YD1wyERP2877mrv96zAcACievWXHs0ZZi3ymWVZDveApz6Fg58
	egk33cr0t6uNEB1zcJYO1xEVq1TJ9NiRWdMOYXFDR5RZXuGtv+Pvpdnfd3AECPniH8n7
	b7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=yA2uvvVP7MReKwmAR+bXcyNRNDi5EYJPAtPb3WG4UIA=;
	b=R2CEghnj7GUFD9FFiHk0PNJbHmI7mdpyF1Ov1J1pIn/yqxqSTjd48V6mJTQc+wYQqW
	5JYQYeq8BYZt7C2f3OuSBrd8qO6ZuHyD0JF855puSYa5YykCmIuWdVCY8Tt1UJxdSweJ
	08QYY3guL5ad1clF44Ql2GSOAAodHCmDMhVS6W5ngWQ2LCX8wB67ILRdXghJTFdi4N6h
	ATDL8NgwIUXsOZy52alluli6pUm+ubTOsK9/Mu1A9uYR8e3bpIVS20fXOklxafiSBsCa
	Lldz5y8hVy2/x8+wr5nx948ircnWH3zqBMWDUSILN24mbnrVfoFm4Da8bPcKxBQdhrg0
	vOIQ==
X-Gm-Message-State: AFeK/H084Ry+rmLxSzLCpWQZE3weemqtWz6ecIHZS/6kD8bdG/cHUrdx0j194gntsBG5qw==
X-Received: by 10.223.150.168 with SMTP id u37mr15965449wrb.184.1491225953198; 
	Mon, 03 Apr 2017 06:25:53 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g78sm18269211wrd.11.2017.04.03.06.25.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Apr 2017 06:25:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 3 Apr 2017 15:25:56 +0200
To: Andrea Adami <andrea.adami@gmail.com>
Message-ID: <20170403132556.GC3311@jama>
References: <20170403121749.GA3311@jama> <20170403123443.GB3311@jama>
	<CAAQYJAuF69iHdrkdwLqy1CwzDrDERQqNVuyY2=25w80SbLqXug@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAuF69iHdrkdwLqy1CwzDrDERQqNVuyY2=25w80SbLqXug@mail.gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 03 Apr 2017 13:25:53 -0000
X-Groupsio-MsgNum: 95696
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jousvV0MzM2p6OtC"
Content-Disposition: inline

--jousvV0MzM2p6OtC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2017 at 02:57:01PM +0200, Andrea Adami wrote:
> On Mon, Apr 3, 2017 at 2:34 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Mon, Apr 03, 2017 at 02:17:49PM +0200, Martin Jansa wrote:
> >> qemux86 shows more failures, I've dropped few master-next changes
> >> after this build.
> >
> > I've noticed that the report doesn't cover all currently triggered QA
> > issues at least these 2 were missing in the report:
> >
> > count: 27       issue: ldflags
> > flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-li=
nux-gnueabi/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/li=
bflite_cmu_us_kal16.so.1.3' [ldflags]
> > flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-li=
nux-gnueabi/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/lib=
flite_cmu_us_kal.so.1.3' [ldflags]
> > flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-l=
inux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libflite_=
cmu_us_kal16.so.1.3' [ldflags]
> > flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-l=
inux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflite_c=
mu_us_kal.so.1.3' [ldflags]
> > flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux=
/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libflite_cmu_=
us_kal16.so.1.3' [ldflags]
> > flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux=
/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflite_cmu_u=
s_kal.so.1.3' [ldflags]
> > logfsprogs-git: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-li=
nux-gnueabi/logfsprogs/git-r0/packages-split/logfsprogs/usr/bin/mklogfs' [l=
dflags]
> > logfsprogs-git: No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-l=
inux/logfsprogs/git-r0/packages-split/logfsprogs/usr/bin/mklogfs' [ldflags]
> > logfsprogs-git: No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux=
/logfsprogs/git-r0/packages-split/logfsprogs/usr/bin/mklogfs' [ldflags]
> > No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/flit=
e-alsa/1.3-r1/packages-split/libflite-alsa/usr/lib/libflite.so.1.3' [ldflag=
s]
> > No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/pngc=
heck/2.3.0-r0/packages-split/pngcheck/usr/bin/pngcheck' [ldflags]
> > No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/uml-=
utilities/20040406-r1/packages-split/uml-utilities/usr/bin/uml_switch' [ldf=
lags]
> > No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux/flite-alsa/=
1.3-r1/packages-split/libflite-alsa/usr/lib/libflite.so.1.3' [ldflags]
> > No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux/pngcheck/2.=
3.0-r0/packages-split/pngcheck/usr/bin/png-fix-IDAT-windowsize' [ldflags]
> > No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux/uml-utiliti=
es/20040406-r1/packages-split/uml-utilities/usr/bin/uml_net' [ldflags]
> > No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/flite-alsa/1.3-=
r1/packages-split/libflite-alsa/usr/lib/libflite.so.1.3' [ldflags]
> > No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/pngcheck/2.3.0-=
r0/packages-split/pngcheck/usr/bin/pngsplit' [ldflags]
> > No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/uml-utilities/2=
0040406-r1/packages-split/uml-utilities/usr/bin/uml_mkcow' [ldflags]
> > pycd-0.1+gitrAUTOINC+63b1dff1bc: No GNU_HASH in the elf binary: '/tmp/w=
ork/armv5te-oe-linux-gnueabi/pycd/1_0.1+gitrAUTOINC+63b1dff1bc-r0/packages-=
split/pycd/usr/bin/pyc' [ldflags]
> > pycd-0.1+gitrAUTOINC+63b1dff1bc: No GNU_HASH in the elf binary: '/tmp/w=
ork/core2-64-oe-linux/pycd/1_0.1+gitrAUTOINC+63b1dff1bc-r0/packages-split/p=
ycd/usr/bin/pyc' [ldflags]
> > pycd-0.1+gitrAUTOINC+63b1dff1bc: No GNU_HASH in the elf binary: '/tmp/w=
ork/i586-oe-linux/pycd/1_0.1+gitrAUTOINC+63b1dff1bc-r0/packages-split/pycd/=
usr/bin/pyc' [ldflags]
> > qtchooser-39+git4717841185d34bbe450e3b24445f2d35e3325a6a: No GNU_HASH i=
n the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/qtchooser/39+git47178=
41185d34bbe450e3b24445f2d35e3325a6a-r0/packages-split/qtchooser/usr/bin/qtc=
hooser' [ldflags]
> > qtchooser-39+git4717841185d34bbe450e3b24445f2d35e3325a6a: No GNU_HASH i=
n the elf binary: '/tmp/work/core2-64-oe-linux/qtchooser/39+git4717841185d3=
4bbe450e3b24445f2d35e3325a6a-r0/packages-split/qtchooser/usr/bin/qtchooser'=
 [ldflags]
> > qtchooser-39+git4717841185d34bbe450e3b24445f2d35e3325a6a: No GNU_HASH i=
n the elf binary: '/tmp/work/i586-oe-linux/qtchooser/39+git4717841185d34bbe=
450e3b24445f2d35e3325a6a-r0/packages-split/qtchooser/usr/bin/qtchooser' [ld=
flags]
> > suspend-blocker-0.1.22+gitrAUTOINC+9aa645305f: No GNU_HASH in the elf b=
inary: '/tmp/work/armv5te-oe-linux-gnueabi/suspend-blocker/0.1.22+gitrAUTOI=
NC+9aa645305f-r0/packages-split/suspend-blocker/usr/bin/suspend-blocker' [l=
dflags]
> > suspend-blocker-0.1.22+gitrAUTOINC+9aa645305f: No GNU_HASH in the elf b=
inary: '/tmp/work/core2-64-oe-linux/suspend-blocker/0.1.22+gitrAUTOINC+9aa6=
45305f-r0/packages-split/suspend-blocker/usr/bin/suspend-blocker' [ldflags]
> > suspend-blocker-0.1.22+gitrAUTOINC+9aa645305f: No GNU_HASH in the elf b=
inary: '/tmp/work/i586-oe-linux/suspend-blocker/0.1.22+gitrAUTOINC+9aa64530=
5f-r0/packages-split/suspend-blocker/usr/bin/suspend-blocker' [ldflags]
> >
> >
> > count: 3        issue: compile-host-path
> >          Please check the log '/tmp/work/armv5te-oe-linux-gnueabi/xdoto=
ol/1.20100416.2809-r1/temp/log.do_compile' for more information. [compile-h=
ost-path]
> >          Please check the log '/tmp/work/core2-64-oe-linux/xdotool/1.20=
100416.2809-r1/temp/log.do_compile' for more information. [compile-host-pat=
h]
> >          Please check the log '/tmp/work/i586-oe-linux/xdotool/1.201004=
16.2809-r1/temp/log.do_compile' for more information. [compile-host-path]
> >
> > I'll check them now.
> >
> >> =3D=3D Number of issues - stats =3D=3D
> >> {| class=3D'wikitable'
> >> !|Date                     !!colspan=3D'3'|Failed tasks               =
      !!colspan=3D'6'|Failed depencencies                    !!|Signatures =
           !!colspan=3D'12'|QA !!Comment
> >> |-
> >> ||            ||qemuarm       ||qemux86       ||qemux86_64    ||qemuar=
m||max||min     ||qemux86||max||min     ||all   ||already-stripped      ||l=
ibdir        ||textrel       ||build-deps    ||file-rdeps    ||version-goin=
g-backwards       ||host-user-contaminated        ||installed-vs-shipped  |=
|unknown-configure-option      ||symlink-to-sysroot    ||invalid-pkgconfig =
    ||pkgname       ||
> >> |-
> >> ||2017-04-01  ||2     ||7     ||2     ||N/A   ||N/A   ||N/A   ||N/A   =
||N/A   ||N/A   ||0     ||0             ||0             ||3             ||0=
             ||0             ||6             ||2             ||1           =
  ||0             ||0             ||0             ||0             ||
> >> |}
> >>
> >> http://www.openembedded.org/wiki/Bitbake_World_Status
> >>
> >> =3D=3D Failed tasks 2017-04-01 =3D=3D
> >>
> >> INFO: jenkins-job.sh-1.8.19 Complete log available at http://logs.nslu=
2-linux.org/buildlogs/oe/world/pyro/log.report.20170403_021525.log
> >>
> >> =3D=3D=3D common (2) =3D=3D=3D
> >>     * meta-openembedded/meta-oe/recipes-extended/corosync/corosync_2.4=
=2E0.bb:do_compile
> >>     * meta-openembedded/meta-oe/recipes-support/links/links_2.7.bb:do_=
configure
> >>
> >> =3D=3D=3D common-x86 (0) =3D=3D=3D
> >>
> >> =3D=3D=3D qemuarm (0) =3D=3D=3D
> >>
> >> =3D=3D=3D qemux86 (5) =3D=3D=3D
> >>     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.=
0.4.bb:do_compile
>=20
>=20
> This one is an old issue/race happening with many cores
> http://lists.openembedded.org/pipermail/openembedded-core/2016-September/=
126777.html
>=20
> as they say, "It''s not quite predictable"

IMHO: Worth setting empty PARALLEL_MAKE to make sure it won't appear every =
now
and then if nobody plans to fix it.

>=20
> Cheers
> Andrea
>=20
>=20
>=20
>=20
> >>     * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:=
do_compile
> >>     * meta-openembedded/meta-oe/recipes-graphics/ttf-fonts/ttf-inconso=
lata_20100526.bb:do_compile
> >>     * meta-openembedded/meta-oe/recipes-support/loop-aes/loop-aes_v3.7=
j.bb:do_compile
> >>     * meta-openembedded/meta-xfce/recipes-apps/xarchiver/xarchiver_git=
=2Ebb:do_compile
> >>
> >> =3D=3D=3D qemux86_64 (0) =3D=3D=3D
> >>
> >> =3D=3D=3D Number of failed tasks (11) =3D=3D=3D
> >> {| class=3Dwikitable
> >> |-
> >> || qemuarm    || 2     || http://logs.nslu2-linux.org/buildlogs/oe/wor=
ld/pyro/log.world.qemuarm.20170401_212659.log/ || http://errors.yoctoprojec=
t.org/Errors/Build/35350/
> >> |-
> >> || qemux86    || 7     || http://logs.nslu2-linux.org/buildlogs/oe/wor=
ld/pyro/log.world.qemux86.20170331_214900.log/ || http://errors.yoctoprojec=
t.org/Errors/Build/35348/
> >> |-
> >> || qemux86_64         || 2     || http://logs.nslu2-linux.org/buildlog=
s/oe/world/pyro/log.world.qemux86-64.20170401_230709.log/ || http://errors.=
yoctoproject.org/Errors/Build/35352/
> >> |}
> >>
> >> =3D=3D=3D PNBLACKLISTs (441) =3D=3D=3D
> >>
> >> =3D=3D=3D QA issues (12) =3D=3D=3D
> >> {| class=3Dwikitable
> >> !| Count              ||Issue
> >> |-
> >> ||0   ||already-stripped
> >> |-
> >> ||0   ||build-deps
> >> |-
> >> ||0   ||file-rdeps
> >> |-
> >> ||0   ||invalid-pkgconfig
> >> |-
> >> ||0   ||libdir
> >> |-
> >> ||0   ||pkgname
> >> |-
> >> ||0   ||symlink-to-sysroot
> >> |-
> >> ||0   ||unknown-configure-option
> >> |-
> >> ||1   ||installed-vs-shipped
> >> |-
> >> ||2   ||host-user-contaminated
> >> |-
> >> ||3   ||textrel
> >> |-
> >> ||6   ||version-going-backwards
> >> |}
> >>
> >>
> >>
> >> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
> >>
> >> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
signatures.20170402_201737.log/
> >>
> >> No issues detected
> >>
> >> QA issues by type:
> >> count: 0      issue: already-stripped
> >>
> >>
> >> count: 0      issue: libdir
> >>
> >>
> >> count: 3      issue: textrel
> >> chromium-52.0.2743.76: ELF binary '/tmp/work/i586-oe-linux/chromium/52=
=2E0.2743.76-r0/packages-split/chromium/usr/bin/chromium/chrome' has reloca=
tions in .text [textrel]
> >> chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/ch=
romium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chr=
omium/chrome' has relocations in .text [textrel]
> >> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/=
x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.=
148' has relocations in .text [textrel]
> >>
> >>
> >> count: 0      issue: build-deps
> >>
> >>
> >> count: 0      issue: file-rdeps
> >>
> >>
> >> count: 6      issue: version-going-backwards
> >> minicoredumper-1.0.2: Package version for package minicoredumper-dbg w=
ent backwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+2=
48019446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
> >> minicoredumper-1.0.2: Package version for package minicoredumper-dev w=
ent backwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+2=
48019446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
> >> minicoredumper-1.0.2: Package version for package minicoredumper-doc w=
ent backwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+2=
48019446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
> >> minicoredumper-1.0.2: Package version for package minicoredumper-local=
e went backwards which would break package feeds from (0:2.0.0-r0+gitAUTOIN=
C+248019446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
> >> minicoredumper-1.0.2: Package version for package minicoredumper-stati=
cdev went backwards which would break package feeds from (0:2.0.0-r0+gitAUT=
OINC+248019446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
> >> minicoredumper-1.0.2: Package version for package minicoredumper went =
backwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+24801=
9446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
> >>
> >>
> >> count: 2      issue: host-user-contaminated
> >> glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-lij-it/usr/l=
ib/locale/lij_IT/LC_NUMERIC is owned by uid 3004, which is the same as the =
user running bitbake. This may be due to host contamination [host-user-cont=
aminated]
> >> glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-niu-nu/usr/l=
ib/locale/niu_NU/LC_PAPER is owned by uid 3004, which is the same as the us=
er running bitbake. This may be due to host contamination [host-user-contam=
inated]
> >>
> >>
> >> count: 1      issue: installed-vs-shipped
> >> minicoredumper: 1 installed and not shipped files. [installed-vs-shipp=
ed]
> >>
> >>
> >> count: 0      issue: unknown-configure-option
> >>
> >>
> >> count: 0      issue: symlink-to-sysroot
> >>
> >>
> >> count: 0      issue: invalid-pkgconfig
> >>
> >>
> >> count: 0      issue: pkgname
> >
> >
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jousvV0MzM2p6OtC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWOJNZAAKCRA3VSO3ZXaA
HAFDAJ9PKK68N375ZG5ipaKqxaDgS1OhDgCbB0T+Sz70g2zLXVICKq1CSq9e29M=
=2686
-----END PGP SIGNATURE-----

--jousvV0MzM2p6OtC--
