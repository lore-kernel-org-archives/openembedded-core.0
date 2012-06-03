Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sb72C-0008HB-Qd
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Jun 2012 11:23:40 +0200
Received: by werg55 with SMTP id g55so2255284wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Jun 2012 02:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer;
	bh=yytgJpsryjGEEHi7oYzCqG1x7DWSQI+fY5n52r9wzt0=;
	b=x0mvv+sOGFwwPi0FWlLt3keZNLBgKwGJoE3Osf1JN6l9wONrirQnls3Dr1rgK/66uR
	MOM7fMYvAP2DpBIJpEKQB46E8RxXQUoHt618JK7KmJi9LvCWaozlcFqSZvS0Pzwl0fRG
	SCbHPZXljMGKkCai1puq/rF42nJYkm39QtfS5VgMAXCOR2/bLMh3cHs8d95p+90j+i9V
	LHiV1S90/UkYgd+UxUpQ8zmsGpq+PQwZyOuKXpxeZDRto/HBfR19CxtE4l1zn+yq39aN
	wFoXB1lBzgj/hoBDEDBMtTKH72oJqE/bVuL3i0RoepNVoxFa+Hvrun4hVjiXmSrbqePy
	nVZw==
Received: by 10.216.145.149 with SMTP id p21mr7670815wej.1.1338714797514;
	Sun, 03 Jun 2012 02:13:17 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id gc6sm11253392wib.0.2012.06.03.02.13.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 03 Jun 2012 02:13:16 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Sun, 3 Jun 2012 11:13:14 +0200
Message-Id: <DF8CB93B-75E4-4656-B4EF-49061748B656@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: [meta-xilinx] WARNING: QA Issue: systemd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Jun 2012 09:23:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      I've managed to get core-image-minimal building for the Xilinx =
ML507 board. The build process completes with a bunch of QA warnings.

How can I suppress or fix these warnings?

NOTE: package libgpg-error-1.10-r1: task do_package: Started
WARNING: QA Issue: systemd: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/systemd-git-r27/packages=
-split/systemd/lib/systemd/systemd-logind links to something under =
exec_prefix
WARNING: QA Issue: ldd reports: 	libcap.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libcap.so.2 (0xdead1000)
	libsystemd-daemon.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libsystemd-daemon.so.0 =
(0xdead2000)
	libdbus-1.so.3 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/libdbus-1.so.3 =
(0xdead3000)
	libpthread.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libpthread.so.0 =
(0xdead4000)
	libudev.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libudev.so.0 =
(0xdead5000)
	libacl.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libacl.so.1 (0xdead6000)
	librt.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/librt.so.1 (0xdead7000)
	libc.so.6 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libc.so.6 (0xdead8000)
	/lib/ld.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/ld.so.1 (0xdead9000)
	libdl.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libdl.so.2 (0xdeada000)
	libattr.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libattr.so.1 =
(0xdeadb000)

WARNING: QA Issue: systemd: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/systemd-git-r27/packages=
-split/systemd/lib/systemd/systemd-timedated links to something under =
exec_prefix
WARNING: QA Issue: ldd reports: 	libcap.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libcap.so.2 (0xdead1000)
	libdbus-1.so.3 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/libdbus-1.so.3 =
(0xdead2000)
	libpthread.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libpthread.so.0 =
(0xdead3000)
	librt.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/librt.so.1 (0xdead4000)
	libc.so.6 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libc.so.6 (0xdead5000)
	/lib/ld.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/ld.so.1 (0xdead6000)

WARNING: QA Issue: systemd: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/systemd-git-r27/packages=
-split/systemd/lib/systemd/systemd-update-utmp links to something under =
exec_prefix
WARNING: QA Issue: ldd reports: 	libcap.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libcap.so.2 (0xdead1000)
	libdbus-1.so.3 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/libdbus-1.so.3 =
(0xdead2000)
	libpthread.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libpthread.so.0 =
(0xdead3000)
	librt.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/librt.so.1 (0xdead4000)
	libc.so.6 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libc.so.6 (0xdead5000)
	/lib/ld.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/ld.so.1 (0xdead6000)

WARNING: QA Issue: systemd: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/systemd-git-r27/packages=
-split/systemd/lib/systemd/systemd-journald links to something under =
exec_prefix
WARNING: QA Issue: ldd reports: 	libsystemd-daemon.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libsystemd-daemon.so.0 =
(0xdead1000)
	libsystemd-login.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libsystemd-login.so.0 =
(0xdead2000)
	libcap.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libcap.so.2 (0xdead3000)
	libacl.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libacl.so.1 (0xdead4000)
	liblzma.so.5 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/liblzma.so.5 =
(0xdead5000)
	librt.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/librt.so.1 (0xdead6000)
	libpthread.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libpthread.so.0 =
(0xdead7000)
	libc.so.6 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libc.so.6 (0xdead8000)
	/lib/ld.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/ld.so.1 (0xdead9000)
	libdl.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libdl.so.2 (0xdeada000)
	libattr.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libattr.so.1 =
(0xdeadb000)

WARNING: QA Issue: systemd: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/systemd-git-r27/packages=
-split/systemd/lib/systemd/systemd links to something under exec_prefix
WARNING: QA Issue: ldd reports: 	libdbus-1.so.3 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/libdbus-1.so.3 =
(0xdead1000)
	libpthread.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libpthread.so.0 =
(0xdead2000)
	libudev.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libudev.so.0 =
(0xdead3000)
	libwrap.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libwrap.so.0 =
(0xdead4000)
	libcap.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libcap.so.2 (0xdead5000)
	libkmod.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/libkmod.so.2 =
(0xdead6000)
	librt.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/librt.so.1 (0xdead7000)
	libc.so.6 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libc.so.6 (0xdead8000)
	/lib/ld.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/ld.so.1 (0xdead9000)

WARNING: QA Issue: systemd: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/systemd-git-r27/packages=
-split/systemd/lib/systemd/systemd-modules-load links to something under =
exec_prefix
WARNING: QA Issue: ldd reports: 	libcap.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libcap.so.2 (0xdead1000)
	libkmod.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/libkmod.so.2 =
(0xdead2000)
	librt.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/librt.so.1 (0xdead3000)
	libc.so.6 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libc.so.6 (0xdead4000)
	/lib/ld.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/ld.so.1 (0xdead5000)
	libpthread.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libpthread.so.0 =
(0xdead6000)

WARNING: QA Issue: systemd: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/systemd-git-r27/packages=
-split/systemd/lib/systemd/systemd-initctl links to something under =
exec_prefix
WARNING: QA Issue: ldd reports: 	libcap.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libcap.so.2 (0xdead1000)
	libsystemd-daemon.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libsystemd-daemon.so.0 =
(0xdead2000)
	libdbus-1.so.3 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/libdbus-1.so.3 =
(0xdead3000)
	libpthread.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libpthread.so.0 =
(0xdead4000)
	librt.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/librt.so.1 (0xdead5000)
	libc.so.6 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libc.so.6 (0xdead6000)
	/lib/ld.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/ld.so.1 (0xdead7000)
	libdl.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libdl.so.2 (0xdead8000)

WARNING: QA Issue: systemd: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/systemd-git-r27/packages=
-split/systemd/lib/systemd/systemd-cgroups-agent links to something =
under exec_prefix
WARNING: QA Issue: ldd reports: 	libcap.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libcap.so.2 (0xdead1000)
	libdbus-1.so.3 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/libdbus-1.so.3 =
(0xdead2000)
	libpthread.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libpthread.so.0 =
(0xdead3000)
	librt.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/librt.so.1 (0xdead4000)
	libc.so.6 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libc.so.6 (0xdead5000)
	/lib/ld.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/ld.so.1 (0xdead6000)

WARNING: QA Issue: systemd: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/systemd-git-r27/packages=
-split/systemd/lib/systemd/systemd-localed links to something under =
exec_prefix
WARNING: QA Issue: ldd reports: 	libcap.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libcap.so.2 (0xdead1000)
	libdbus-1.so.3 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/libdbus-1.so.3 =
(0xdead2000)
	libpthread.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libpthread.so.0 =
(0xdead3000)
	librt.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/librt.so.1 (0xdead4000)
	libc.so.6 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libc.so.6 (0xdead5000)
	/lib/ld.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/ld.so.1 (0xdead6000)

WARNING: QA Issue: systemd: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/systemd-git-r27/packages=
-split/systemd/lib/systemd/systemd-hostnamed links to something under =
exec_prefix
WARNING: QA Issue: ldd reports: 	libcap.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libcap.so.2 (0xdead1000)
	libdbus-1.so.3 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/libdbus-1.so.3 =
(0xdead2000)
	libpthread.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libpthread.so.0 =
(0xdead3000)
	libdl.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libdl.so.2 (0xdead4000)
	librt.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/librt.so.1 (0xdead5000)
	libc.so.6 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libc.so.6 (0xdead6000)
	/lib/ld.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/ld.so.1 (0xdead7000)

WARNING: QA Issue: systemd: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/systemd-git-r27/packages=
-split/systemd/lib/systemd/systemd-fsck links to something under =
exec_prefix
WARNING: QA Issue: ldd reports: 	libcap.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libcap.so.2 (0xdead1000)
	libudev.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libudev.so.0 =
(0xdead2000)
	libdbus-1.so.3 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/libdbus-1.so.3 =
(0xdead3000)
	libpthread.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libpthread.so.0 =
(0xdead4000)
	librt.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/librt.so.1 (0xdead5000)
	libc.so.6 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libc.so.6 (0xdead6000)
	/lib/ld.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/ld.so.1 (0xdead7000)

NOTE: package openssl-1.0.0i-r15.2: task do_package: Succeeded
NOTE: Running task 1420 of 2269 (ID: 1696, =
/tool/yocto/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb, =
do_populate_lic)
NOTE: package libxft-1_2.3.0-r0: task do_package: Succeeded
NOTE: Running task 1421 of 2269 (ID: 1610, =
virtual:native:/tool/yocto/poky/meta/recipes-gnome/gnome/gnome-common_2.28=
.0.bb, do_configure)
WARNING: QA Issue: systemd: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/systemd-git-r27/packages=
-split/systemd/bin/loginctl links to something under exec_prefix
WARNING: QA Issue: ldd reports: 	libcap.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libcap.so.2 (0xdead1000)
	libdbus-1.so.3 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/libdbus-1.so.3 =
(0xdead2000)
	libpthread.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libpthread.so.0 =
(0xdead3000)
	libudev.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libudev.so.0 =
(0xdead4000)
	librt.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/librt.so.1 (0xdead5000)
	libc.so.6 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libc.so.6 (0xdead6000)
	/lib/ld.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/ld.so.1 (0xdead7000)

NOTE: package gdk-pixbuf-2.24.1-r3: task do_populate_lic: Started
WARNING: QA Issue: systemd: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/systemd-git-r27/packages=
-split/systemd/bin/systemctl links to something under exec_prefix
WARNING: QA Issue: ldd reports: 	libsystemd-daemon.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libsystemd-daemon.so.0 =
(0xdead1000)
	libsystemd-journal.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libsystemd-journal.so.0 =
(0xdead2000)
	libsystemd-id128.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libsystemd-id128.so.0 =
(0xdead3000)
	libcap.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libcap.so.2 (0xdead4000)
	libdbus-1.so.3 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/libdbus-1.so.3 =
(0xdead5000)
	libpthread.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libpthread.so.0 =
(0xdead6000)
	librt.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/librt.so.1 (0xdead7000)
	libc.so.6 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libc.so.6 (0xdead8000)
	/lib/ld.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/ld.so.1 (0xdead9000)
	libdl.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libdl.so.2 (0xdeada000)
	liblzma.so.5 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/liblzma.so.5 =
(0xdeadb000)

NOTE: package gnome-common-native-2.28.0-r1: task do_configure: Started
WARNING: QA Issue: systemd: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/systemd-git-r27/packages=
-split/systemd/bin/journalctl links to something under exec_prefix
WARNING: QA Issue: ldd reports: 	libsystemd-journal.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libsystemd-journal.so.0 =
(0xdead1000)
	libsystemd-id128.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libsystemd-id128.so.0 =
(0xdead2000)
	libcap.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libcap.so.2 (0xdead3000)
	liblzma.so.5 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/liblzma.so.5 =
(0xdead4000)
	librt.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/librt.so.1 (0xdead5000)
	libpthread.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libpthread.so.0 =
(0xdead6000)
	libc.so.6 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libc.so.6 (0xdead7000)
	/lib/ld.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/ld.so.1 (0xdead8000)
	libdl.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libdl.so.2 (0xdead9000)

NOTE: package gdk-pixbuf-2.24.1-r3: task do_populate_lic: Succeeded
NOTE: Running task 1422 of 2269 (ID: 1695, =
/tool/yocto/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb, =
do_package)
WARNING: QA Issue: systemd: =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/systemd-git-r27/packages=
-split/libsystemd-journal/lib/libsystemd-journal.so.0.0.3 links to =
something under exec_prefix
WARNING: QA Issue: ldd reports: 	libsystemd-id128.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libsystemd-id128.so.0 =
(0xdead1000)
	libcap.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libcap.so.2 (0xdead2000)
	liblzma.so.5 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/usr/lib/liblzma.so.5 =
(0xdead3000)
	libdl.so.2 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libdl.so.2 (0xdead4000)
	librt.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/librt.so.1 (0xdead5000)
	libpthread.so.0 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libpthread.so.0 =
(0xdead6000)
	libc.so.6 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/libc.so.6 (0xdead7000)
	/lib/ld.so.1 =3D> =
/tool/yocto/poky/build/tmp/sysroots/virtex5/lib/ld.so.1 (0xdead8000)


Best regards,

Elvis Dowson=


