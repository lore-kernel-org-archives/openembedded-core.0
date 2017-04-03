Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id B30EE60125;
	Mon,  3 Apr 2017 12:17:45 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id w43so166498861wrb.0;
	Mon, 03 Apr 2017 05:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=BF5I9CYCtFgUf+1WWbiD+KZsyXFi/eC7jreV7iKTPIY=;
	b=uUn235paQCFWKVwtmfLnXlYNrE5dm3WwcPBt6AJz/BmSc8N4FCY/Ac6eao7OaTaqiW
	zQgIETiaa5x+6zAp78ZfYLcXWxTPfYSpTAl5UOZyoqwHz2Vdh04oxektzvYDmuwsUqqh
	9jrMkkfa1ogBjrK+k5drOtGgL3eMBwiAImTxD6T4xyD1sabjsNIiwO2fcOGNSyrctoe9
	xjv3+BKyBSWmH6NomuFNQyi6HEVopoa404G2n1B8WpyQX62rq2HVZ6HK9DSBdIDh4mUc
	8lx4WvTjrbuip21DGR1Jy4S58832E7PB9+EBw9WqM/fOeMqGz3TY7tXXUg6eYH9RnEeh
	MNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=BF5I9CYCtFgUf+1WWbiD+KZsyXFi/eC7jreV7iKTPIY=;
	b=PPa+zz1/TUM7qqp585yc60EJ06AIZ9x1TgTKpEMBbHr+LrM+hsZICdcEEDRuzVhTfV
	a9lyH99/iNHJPHF/A0zuniTxiLpdvO0i5PsfY4vnsb94YkhFVQbzuRaq4SkgHm4OIBne
	XLdSbHUBjFF6wVxgTu1kx/6w90m2oVRWoHfF6ojQwqAFdF1hBYLG0/jegEL6qOVmzXzb
	lj7XihKkV0/n+VNsLMvZ+La+1SRAPo16nkbLuOiwCus+sxIFTba+ueutJL7vndfcKnBU
	1ArPnJrxyNBEeNGEDOGkp9TaOKqy0u1jF0WUHzmS6UglQS5+FcxizegQ/cE7LWASchr3
	MhOA==
X-Gm-Message-State: AFeK/H0MswAiAGAm7e5DcrXsIvNNytCxUW063OEQQFSErKPeSIuRqTOk
	kc6p3j1kHMXY0GAE
X-Received: by 10.28.199.129 with SMTP id x123mr9547770wmf.7.1491221865883;
	Mon, 03 Apr 2017 05:17:45 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r11sm16780576wrb.16.2017.04.03.05.17.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Apr 2017 05:17:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 3 Apr 2017 14:17:49 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170403121749.GA3311@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: State of bitbake world, Failed tasks 2017-04-01
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
X-List-Received-Date: Mon, 03 Apr 2017 12:17:46 -0000
X-Groupsio-MsgNum: 95688
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline

--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

qemux86 shows more failures, I've dropped few master-next changes
after this build.

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'6'|Failed depe=
ncencies			 !!|Signatures		  !!colspan=3D'12'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||mi=
n	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||=
version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||u=
nknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	=
||=09
|-
||2017-04-01	||2	||7	||2	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||3		||0		||0		||6		||2		||1		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-04-01 =3D=3D

INFO: jenkins-job.sh-1.8.19 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170403_021525.log

=3D=3D=3D common (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-extended/corosync/corosync_2.4.0.bb=
:do_compile
    * meta-openembedded/meta-oe/recipes-support/links/links_2.7.bb:do_confi=
gure

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (5) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.b=
b:do_compile
    * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_=
20100526.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.bb:=
do_compile
    * meta-openembedded/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb:d=
o_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (11) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170401_212659.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/35350/
|-
|| qemux86 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170331_214900.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/35348/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170401_230709.log/ || http://errors.yoctoproject.or=
g/Errors/Build/35352/
|}

=3D=3D=3D PNBLACKLISTs (441) =3D=3D=3D

=3D=3D=3D QA issues (12) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||file-rdeps
|-
||0	||invalid-pkgconfig
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||1	||installed-vs-shipped
|-
||2	||host-user-contaminated
|-
||3	||textrel
|-
||6	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170402_201737.log/

No issues detected

QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 3	issue: textrel
chromium-52.0.2743.76: ELF binary '/tmp/work/i586-oe-linux/chromium/52.0.27=
43.76-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations i=
n .text [textrel]
chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chromiu=
m-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium=
/chrome' has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 6	issue: version-going-backwards
minicoredumper-1.0.2: Package version for package minicoredumper-dbg went b=
ackwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+248019=
446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
minicoredumper-1.0.2: Package version for package minicoredumper-dev went b=
ackwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+248019=
446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
minicoredumper-1.0.2: Package version for package minicoredumper-doc went b=
ackwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+248019=
446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
minicoredumper-1.0.2: Package version for package minicoredumper-locale wen=
t backwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+248=
019446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
minicoredumper-1.0.2: Package version for package minicoredumper-staticdev =
went backwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+=
248019446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
minicoredumper-1.0.2: Package version for package minicoredumper went backw=
ards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+248019446c=
=2E0 to 0:1.0.2-r0.20) [version-going-backwards]


count: 2	issue: host-user-contaminated
glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-lij-it/usr/lib/lo=
cale/lij_IT/LC_NUMERIC is owned by uid 3004, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contamina=
ted]
glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-niu-nu/usr/lib/lo=
cale/niu_NU/LC_PAPER is owned by uid 3004, which is the same as the user ru=
nning bitbake. This may be due to host contamination [host-user-contaminate=
d]


count: 1	issue: installed-vs-shipped
minicoredumper: 1 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWOI9bAAKCRA3VSO3ZXaA
HGqFAJ0TIvWfFa9UWappP1U2bU8Udx0O0gCfWgXhejDyzTWrN3rkSwPTB6IsYqk=
=WwvV
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
