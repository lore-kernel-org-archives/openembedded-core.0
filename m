Return-Path: <B19537@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe005.messaging.microsoft.com [216.32.180.188])
	by mail.openembedded.org (Postfix) with ESMTP id C292C6041E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 11:40:36 +0000 (UTC)
Received: from mail157-co1-R.bigfish.com (10.243.78.238) by
	CO1EHSOBE010.bigfish.com (10.243.66.73) with Microsoft SMTP Server id
	14.1.225.23; Wed, 26 Jun 2013 11:40:37 +0000
Received: from mail157-co1 (localhost [127.0.0.1])	by
	mail157-co1-R.bigfish.com (Postfix) with ESMTP id D90163600AE	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 11:40:36 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail157-co1 (localhost.localdomain [127.0.0.1]) by mail157-co1
	(MessageSwitch) id 1372246834586917_32542;
	Wed, 26 Jun 2013 11:40:34 +0000 (UTC)
Received: from CO1EHSMHS024.bigfish.com (unknown [10.243.78.240])	by
	mail157-co1.bigfish.com (Postfix) with ESMTP id 82EDF540051	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 11:40:34 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS024.bigfish.com
	(10.243.66.34) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 26 Jun 2013 11:40:32 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 26 Jun 2013 11:40:31 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r5QBeSDN019012;
	Wed, 26 Jun 2013 04:40:29 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Jun 2013 19:48:19 +0800
Message-ID: <1372247299-5054-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>, b40527@freescale.com
Subject: [PATCH] groff: correct the install path of man.local
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
X-List-Received-Date: Wed, 26 Jun 2013 11:40:37 -0000
Content-Type: text/plain

openvswitch build failed due to wrong install path of man.local which is
provided by groff.

Error log:
  /yocto/build/tmp/sysroots/x86_64-linux/usr/share/groff/1.22.2/tmac/an-old.tmac:690:
  warning: can't find macro file `man.local'

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 ...off-1.22.2-correct-man.local-install-path.patch |   32 ++++++++++++++++++++
 meta/recipes-extended/groff/groff_1.22.2.bb        |    6 ++--
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch

diff --git a/meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch b/meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
new file mode 100644
index 0000000..f7e9a74
--- /dev/null
+++ b/meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
@@ -0,0 +1,32 @@
+Correct the install path of man.local to fix following error:
+    /yocto/build/tmp/sysroots/x86_64-linux/usr/share/groff/1.22.2/tmac/an-old.tmac:690: warning: can't find macro file `man.local'
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+Upstream-Status: Pending
+
+--- groff-1.22.2/tmac/Makefile.sub.orig	2013-02-07 20:06:08.000000000 +0800
++++ groff-1.22.2/tmac/Makefile.sub	2013-06-26 19:11:23.572259001 +0800
+@@ -114,9 +114,9 @@
+ 	  rm -f $(DESTDIR)$(mdocdir)/$$f; \
+ 	  $(INSTALL_DATA) $$f-s $(DESTDIR)$(mdocdir)/$$f; \
+ 	done
+-	-test -f $(DESTDIR)$(localtmacdir)/man.local || \
++	-test -f $(DESTDIR)$(tmacdir)/man.local || \
+ 	  $(INSTALL_DATA) $(srcdir)/man.local \
+-	    $(DESTDIR)$(localtmacdir)/man.local
++	    $(DESTDIR)$(tmacdir)/man.local
+ 	-test -f $(DESTDIR)$(localtmacdir)/mdoc.local || \
+ 	  $(INSTALL_DATA) mdoc.local-s $(DESTDIR)$(localtmacdir)/mdoc.local
+ 
+@@ -158,9 +158,9 @@
+ 	-rm -f $(DESTDIR)$(tmacdir)/$(tmac_s_prefix)s.tmac
+ 	-rm -f $(DESTDIR)$(tmacdir)/$(tmac_an_prefix)an.tmac
+ 	-rm -f $(DESTDIR)$(tmacdir)/www.tmac
+-	-if cmp -s $(DESTDIR)$(localtmacdir)/man.local \
++	-if cmp -s $(DESTDIR)$(tmacdir)/man.local \
+ 	           $(srcdir)/man.local; then \
+-	  rm -f $(DESTDIR)$(localtmacdir)/man.local; \
++	  rm -f $(DESTDIR)$(tmacdir)/man.local; \
+ 	fi
+ 	-if cmp -s $(DESTDIR)$(localtmacdir)/mdoc.local \
+ 	           $(srcdir)/mdoc.local; then \
diff --git a/meta/recipes-extended/groff/groff_1.22.2.bb b/meta/recipes-extended/groff/groff_1.22.2.bb
index d1361ab..dc964ae 100644
--- a/meta/recipes-extended/groff/groff_1.22.2.bb
+++ b/meta/recipes-extended/groff/groff_1.22.2.bb
@@ -4,11 +4,13 @@ formatting commands and produces formatted output."
 SECTION = "base"
 HOMEPAGE = "ftp://ftp.gnu.org/gnu/groff/"
 LICENSE = "GPLv2"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
+	file://groff-1.22.2-correct-man.local-install-path.patch \
+"
 
 SRC_URI[md5sum] = "9f4cd592a5efc7e36481d8d8d8af6d16"
 SRC_URI[sha256sum] = "380864dac4772e0c0d7b1282d25d0c5fd7f63baf45c87c4657afed22a13d2076"
-- 
1.7.9.5



