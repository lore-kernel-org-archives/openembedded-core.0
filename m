Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SnDEm-0003lP-34
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 20:26:40 +0200
Received: from mail170-va3-R.bigfish.com (10.7.14.235) by
	VA3EHSOBE001.bigfish.com (10.7.40.21) with Microsoft SMTP Server id
	14.1.225.23; Fri, 6 Jul 2012 18:13:19 +0000
Received: from mail170-va3 (localhost [127.0.0.1])	by
	mail170-va3-R.bigfish.com (Postfix) with ESMTP id 92ED93E03A6	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2012 18:13:19 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(z3e12hzc89bhzz1202h1082kzz8275bhz2dh2a8h668h839h93fhd24he5bhf0ah107ah)
Received: from mail170-va3 (localhost.localdomain [127.0.0.1]) by mail170-va3
	(MessageSwitch) id 1341598398443014_10172;
	Fri,  6 Jul 2012 18:13:18 +0000 (UTC)
Received: from VA3EHSMHS025.bigfish.com (unknown [10.7.14.238])	by
	mail170-va3.bigfish.com (Postfix) with ESMTP id 691A32A0125	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2012 18:13:18 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS025.bigfish.com
	(10.7.99.35) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 6 Jul 2012 18:13:18 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Fri, 6 Jul 2012 13:15:25 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q66IFOKQ003636
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Jul 2012 11:15:24
	-0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jul 2012 13:15:24 -0500
Message-ID: <1341598524-5354-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] qemu-0.15.1: add patch to fix compilatation problems on powerpc
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
X-List-Received-Date: Fri, 06 Jul 2012 18:26:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ERROR: Function failed: do_compile (see /opt/yocto/cache-build/p5020ds-64=
b/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/=
temp/log.do_compile.28447 for further information)
ERROR: Logfile of failure stored in: /opt/yocto/cache-build/p5020ds-64b/b=
uild_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/tem=
p/log.do_compile.28447
Log data follows:
| DEBUG: SITE files ['endian-big', 'bit-64', 'powerpc-common', 'common-li=
nux', 'common-glibc', 'powerpc-linux', 'powerpc64-linux', 'common']
| ERROR: Function failed: do_compile (see /opt/yocto/cache-build/p5020ds-=
64b/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r=
6/temp/log.do_compile.28447 for further information)
| NOTE: make -j 24
|   LINK  ppc-linux-user/qemu-ppc
| /opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/sysroo=
ts/x86_64-linux/usr/libexec/ppc64e5500-fsl-linux/gcc/powerpc64-fsl-linux/=
4.6.4/ld:/opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp=
/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/qemu-0.15.1/ppc64.ld:84: syntax=
 error
| collect2: ld returned 1 exit status
| make[1]: *** [qemu-ppc] Error 1
| make: *** [subdir-ppc-linux-user] Error 2
| make: *** Waiting for unfinished jobs....
| ERROR: oe_runmake failed

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../qemu-0.15.1/0001-ppc64-Fix-linker-script.patch |   46 ++++++++++++++=
++++++
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    3 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix=
-linker-script.patch

diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-linker=
-script.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-lin=
ker-script.patch
new file mode 100644
index 0000000..d64d76f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-linker-script=
.patch
@@ -0,0 +1,46 @@
+Upstream-Status: Backport
+
+From 7c0a3409627604c111d5c5e1ce4e0224c2b56315 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Andreas=3D20F=3DC3=3DA4rber?=3D <afaerber@suse.de>
+Date: Tue, 4 Oct 2011 05:14:52 +0000
+Subject: [PATCH] ppc64: Fix linker script
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Since commit 8733f609 (Fix linker scripts) linking on Linux/ppc64 fails:
+
+  LINK  ppc64-linux-user/qemu-ppc64
+/usr/lib64/gcc/powerpc64-suse-linux/4.3/../../../../powerpc64-suse-linux=
/bin/ld:/home/afaerber/qemu/ppc64.ld:84: syntax error
+collect2: ld gab 1 als Ende-Status zur=C3=BCck
+make[1]: *** [qemu-ppc64] Fehler 1
+make: *** [subdir-ppc64-linux-user] Fehler 2
+
+Fix by removing a leftover line in the ppc64 linker script.
+
+Cc: Gerd Hoffmann <kraxel@redhat.com>
+Cc: Blue Swirl <blauwirbel@gmail.com>
+Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
+Signed-off-by: Alexander Graf <agraf@suse.de>
+---
+ ppc64.ld |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ppc64.ld b/ppc64.ld
+index 0059ee5..0a7c0dd 100644
+--- a/ppc64.ld
++++ b/ppc64.ld
+@@ -81,8 +81,8 @@ SECTIONS
+   .sdata2         : { *(.sdata2 .sdata2.* .gnu.linkonce.s2.*) }
+   .sbss2          : { *(.sbss2 .sbss2.* .gnu.linkonce.sb2.*) }
+   .eh_frame_hdr : { *(.eh_frame_hdr) }
+-*(.gcc_except_table.*) } /* Adjust the address for the data segment.  W=
e want to
+-adjust up to +     the same address within the page on the next page up=
.  */
++  /* Adjust the address for the data segment.  We want to adjust up to
++     the same address within the page on the next page up.  */
+   . =3D ALIGN (0x10000) - ((0x10000 - .) & (0x10000 - 1)); . =3D DATA_S=
EGMENT_ALIGN
+ (0x10000, 0x1000);   /* Exception handling  */
+   .eh_frame       : { KEEP (*(.eh_frame)) }
+--=20
+1.7.10
+
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-dev=
tools/qemu/qemu_0.15.1.bb
index bcff9f8..2cc59f6 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a72f=
bac \
                     file://COPYING.LIB;endline=3D24;md5=3Dc04def7ae38850=
e7d3ef548588159913"
=20
-PR =3D "r8"
+PR =3D "r9"
=20
 FILESPATH =3D "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR =3D "${WORKDIR}"
@@ -20,6 +20,7 @@ SRC_URI =3D "\
     file://arm-bgr.patch \
     file://a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch \
     file://dummy-gl-config.patch \
+    file://0001-ppc64-Fix-linker-script.patch \
     "
=20
 # Only use the GL passthrough patches for native/nativesdk versions
--=20
1.7.10




