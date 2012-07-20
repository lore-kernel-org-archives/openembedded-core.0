Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ss5rd-000698-OJ
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 07:34:57 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so4958454pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 22:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=j9UGwodrqO5tnlXwhwCJS+KTc5l4NbfRuZG/Vi31g8I=;
	b=ql9KkN7BB9dRwuIXiO5Vx2jx7qqZQSTjHf7Ln4EjpP8W4Ybuda77XtdePkFUlulvO1
	CwZohTly2n0dWf559RRt5IOEi3yH8qsdYnlP/mAGdE9kJ/Cc/2EwRamEAVmEH8Rrwe8x
	cCJg4Eh2sZWkJipqaHcWS0tQC3tw8nN+ZYx9xXLsekeJxo1udTgSs7zCIOEqQ1dalqTE
	zDoU/w4Iau3ectONTOo4Vzb6IxNscJW8I2IQJ01Dt0kiD3cZcCivCVoo83l/Ik3BoxG6
	QG9zc+TQR3PhvRAGAGDGxzDQR+JQu50Dtq7gks7A0KVPmXS+nP2RNMR3Gd8NZpV5gkMm
	nCQQ==
Received: by 10.68.203.98 with SMTP id kp2mr10649815pbc.132.1342761816576;
	Thu, 19 Jul 2012 22:23:36 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ny4sm3215080pbb.57.2012.07.19.22.23.35
	(version=SSLv3 cipher=OTHER); Thu, 19 Jul 2012 22:23:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 22:23:00 -0700
Message-Id: <1342761780-20215-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1342761780-20215-1-git-send-email-raj.khem@gmail.com>
References: <1342761780-20215-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/3] puzzles, mkelfimage: Use svn protocol instead of http
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
X-List-Received-Date: Fri, 20 Jul 2012 05:34:58 -0000

These repos are not setup to serve through http protocol

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb |    2 +-
 meta/recipes-sato/puzzles/puzzles_r9561.bb         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
index eb6aa71..ca145ff 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
@@ -10,7 +10,7 @@ PR = "r1"
 
 DEPENDS += "zlib"
 
-SRC_URI = "svn://coreboot.org/coreboot/trunk/util;module=mkelfImage;protocol=http \
+SRC_URI = "svn://coreboot.org/coreboot/trunk/util;module=mkelfImage;protocol=svn \
            file://cross-compile.patch \
           "
 
diff --git a/meta/recipes-sato/puzzles/puzzles_r9561.bb b/meta/recipes-sato/puzzles/puzzles_r9561.bb
index 7c18421..310798d 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9561.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9561.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=453de74d749439762ef4814f7bee1fec"
 
 # Upstream updates puzzles.tar.gz for the new release, so checksums seem to be changing regularly right now
-SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV};protocol=http"
+SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV};protocol=svn"
 S = "${WORKDIR}/${BPN}"
 
 #SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar.gz"
-- 
1.7.9.5



