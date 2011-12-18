Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RcMqF-0000fc-B5
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Dec 2011 20:56:15 +0100
Received: by mail-iy0-f175.google.com with SMTP id h37so3846499iak.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 11:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=MF4P5bn5b0EbBmY5D/JLws2U2GJaLBN/aUnQ8F9PYFg=;
	b=amAMPAZuA+EfaoCtHarSOiHWOBFMApMMYdBe8Ylep6wQIjLmDJssLOfaHsEdMAmCC+
	aiUTGo1Z+hOmCNN9oX6HEB1HynUIG6NmzeCftL+YG7v4DZ8lP4D4FL93zQYU1s1731Jh
	ymO0tznqg3Ylf1Ky5CIDxXiahA0m0j4YWM7zs=
Received: by 10.50.87.234 with SMTP id bb10mr23404845igb.81.1324237754908;
	Sun, 18 Dec 2011 11:49:14 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id
	cv10sm10929303igc.0.2011.12.18.11.49.13 (version=SSLv3 cipher=OTHER);
	Sun, 18 Dec 2011 11:49:14 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2011 23:47:31 +0400
Message-Id: <1324237652-15618-4-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
References: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 4/5] libatomics-ops: move docs to correct directory
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
X-List-Received-Date: Sun, 18 Dec 2011 19:56:15 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../pulseaudio/libatomics-ops_1.2.bb               |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
index 184c167..d0162e6 100644
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2 & MIT"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://doc/LICENSING.txt;md5=607073e04548eac7d1f763e480477bab \
 		   "
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "http://www.hpl.hp.com/research/linux/atomic_ops/download/libatomic_ops-${PV}.tar.gz \
            file://fedora/libatomic_ops-1.2-ppclwzfix.patch \
@@ -26,5 +26,7 @@ ARM_INSTRUCTION_SET = "arm"
 inherit autotools pkgconfig
 
 do_install_append() {
-	mv ${D}${datadir}/libatomic_ops ${D}${datadir}/libatomic-ops || true
+	# those contain only docs, not necessary for now.
+	install -m 0755 -d ${D}${docdir}
+	mv ${D}${datadir}/libatomic_ops ${D}${docdir}/${PN}
 }
-- 
1.7.7.3



