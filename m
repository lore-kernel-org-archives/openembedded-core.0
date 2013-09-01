Return-Path: <kirgene@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8074F6BD75
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2013 01:13:19 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so1644962eek.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2013 18:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fEu+OdCf/81TaRiy0MdiSmtwmRXSpIEmMtyLuTq86Y0=;
	b=f6M4Jd5RtXhAbBGx8S4jkJtBW+9jwDL/amd7zP7iAv1dOz/wpeTHQTZRvOdLPUyv6S
	+vgR8ILwaRG98YqaAtZR5HuI8XVrXg/9K1io0CxkNuQHg6GWdzr2MBkmkpjKvrWqEVup
	IDP/jIbR+ScHhag7Z8L4HZW9emMIaq80HNmyracaCMBKUtOJRsfCdQed3gyFuH859ZUE
	NtC4yO0RRQN0kWVPDEPB6GxZMJzlta6Mw5Rld4fC7c3QiOVtXwYQDfq6Mqmwqmpk7UuJ
	3u0UFOTinAHBqEIFCVa+i/EHLpV1QG+au4RyA7nZKps09/FHIBEmBwyaXec7KN2z2YBv
	o34A==
X-Received: by 10.14.181.132 with SMTP id l4mr100837eem.77.1377997999780;
	Sat, 31 Aug 2013 18:13:19 -0700 (PDT)
Received: from ubuntu.datv.net ([194.44.193.15])
	by mx.google.com with ESMTPSA id p5sm9315273eeg.5.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 31 Aug 2013 18:13:19 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2013 04:12:06 +0300
Message-Id: <1377997926-55540-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [meta-oe][PATCH] cryptsetup: Updated to upstream version.
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
X-List-Received-Date: Sun, 01 Sep 2013 01:13:21 -0000

Also build static libraries.

Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
---
 .../cryptsetup/{cryptsetup_1.6.1.bb => cryptsetup_1.6.2.bb}         | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cryptsetup/{cryptsetup_1.6.1.bb => cryptsetup_1.6.2.bb} (87%)

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.2.bb
similarity index 87%
rename from meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
rename to meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.2.bb
index 95f7e8d..6c3418a 100644
--- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.2.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
 DEPENDS = "util-linux lvm2 popt libgcrypt"
 
 SRC_URI = "http://cryptsetup.googlecode.com/files/cryptsetup-${PV}.tar.bz2"
-SRC_URI[md5sum] = "f374d11e3b0e7ca0f805756fd02e34ff"
-SRC_URI[sha256sum] = "baf36e663c03eb6440482d91c486d61ed47ce5c9268ad04c18ca09082755149c"
+SRC_URI[md5sum] = "cd834da49fbe92dd66df02cc5c61280f"
+SRC_URI[sha256sum] = "15723f0198303d4bcb99d480b7a773918e2d319f0348457988c063bdd03e109a"
 
 inherit autotools gettext
 
@@ -29,3 +29,5 @@ RRECOMMENDS_${PN} = "kernel-module-aes-generic \
                      kernel-module-cbc \
                      kernel-module-sha256-generic \
 "
+
+EXTRA_OECONF = "--enable-static"
-- 
1.8.1.2


