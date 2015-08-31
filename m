Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 267A174197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 19:08:18 +0000 (UTC)
Received: by wicmx12 with SMTP id mx12so8353809wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 12:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NONtAcosDJCxyUNWSO/JBgUG3bgKBSQ1m558XqpMuIs=;
	b=WkWAmofH8DX76HvG2EIzOKiz2P+JMCVxwJzPW3z3IokuEfK4GEAeUc7q1fE/gVkmKb
	WVudRzWX4z5jaKBXZua6TEwfzlU7URFjwOqVA/hyNDMophzLQHiDkj0Rujn73ThivpUW
	GTaHOTt74o+CtZfKPp3TFoDh+dqyFr3++hZGGbQSNpsScTV85CvQixaRKsOdoVnNsGQN
	gVFd02bt3dFLh480UbcoDjwseuDnai7KpcayyVx9izI+K632ICBGRdqQdIZj0C1+wsSn
	DwkE2EpSRcsIvnmhtlBFRom0LeRn1DP67Cp+eiy55mPZ1iGDKxQjHnXrpCUwGaVax6sx
	uM7g==
X-Received: by 10.194.86.72 with SMTP id n8mr31089504wjz.119.1441048098340;
	Mon, 31 Aug 2015 12:08:18 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id en5sm90655wib.18.2015.08.31.12.08.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Aug 2015 12:08:17 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Aug 2015 12:08:01 -0700
Message-Id: <1441048081-4894-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2] bitbake.conf: add MIRROR vars to SRC_URI vardeps
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
X-List-Received-Date: Mon, 31 Aug 2015 19:08:20 -0000

From: Christopher Larson <chris_larson@mentor.com>

Changes to what mirror we happen to fetch from shouldn't cause rebuilds.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/bitbake.conf | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

v2 changes: s/vardeps/vardepsexclude/

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index aab4391..d8a66f9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -581,6 +581,23 @@ SAVANNAH_GNU_MIRROR = "http://download.savannah.gnu.org/releases"
 SAVANNAH_NONGNU_MIRROR = "http://download.savannah.nongnu.org/releases"
 CPAN_MIRROR = "http://search.cpan.org/CPAN"
 
+SRC_URI[vardepsexclude] += "\
+    APACHE_MIRROR \
+    CPAN_MIRROR \
+    DEBIAN_MIRROR \
+    GENTOO_MIRROR \
+    GNOME_GIT \
+    GNOME_MIRROR \
+    GNU_MIRROR \
+    GPE_MIRROR \
+    KERNELORG_MIRROR \
+    SAVANNAH_GNU_MIRROR \
+    SAVANNAH_NONGNU_MIRROR \
+    SOURCEFORGE_MIRROR \
+    XLIBS_MIRROR \
+    XORG_MIRROR \
+"
+
 # You can use the mirror of your country to get faster downloads by putting
 #  export DEBIAN_MIRROR = "ftp://ftp.de.debian.org/debian/pool"
 #     into your local.conf
-- 
2.2.1


