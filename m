Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVHnk-000367-Co
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 08:08:24 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so8947887bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 23:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5nPoxGEPckv4+o2vcerkMnqkGkYZqyL1U8mIXlMVWAY=;
	b=ZDhNZprBWhAUdhkBnx3xvORFFyGNzphCEj1PEUDVXn9ATb15EkhN/dBHk0V3waP0lX
	Bk3HJsQF7fp6IyHPpR08NMoWmCWJ00k4hp4r5192kxFj8ofNbly6DDAGvQ9NLlvQkHKr
	R2eJ1cjPPgM1w2Pxd4QUUh3b/fy2MWlRUU1Ko=
Received: by 10.204.149.216 with SMTP id u24mr47981839bkv.73.1322550107970;
	Mon, 28 Nov 2011 23:01:47 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id jf4sm29395347bkc.5.2011.11.28.23.01.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 23:01:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 08:00:56 +0100
Message-Id: <16cb9606f95b9fc44cd22404fe8d6cf9c309c2cc.1322549636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
In-Reply-To: <475348b418f9ebf0a395de9a0ec42ee91d541dc8.1322549636.git.Martin.Jansa@gmail.com>
References: <475348b418f9ebf0a395de9a0ec42ee91d541dc8.1322549636.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322549636.git.Martin.Jansa@gmail.com>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
Subject: [oe-core 06/10] libical: add version 0.47
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
X-List-Received-Date: Tue, 29 Nov 2011 07:08:24 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-sato/libical/libical_0.47.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-sato/libical/libical_0.47.bb

diff --git a/meta/recipes-sato/libical/libical_0.47.bb b/meta/recipes-sato/libical/libical_0.47.bb
new file mode 100644
index 0000000..d711d5f
--- /dev/null
+++ b/meta/recipes-sato/libical/libical_0.47.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "iCal and scheduling (RFC 2445, 2446, 2447) library"
+HOMEPAGE = "http://sourceforge.net/projects/freeassociation/"
+BUGTRACKER = "http://sourceforge.net/tracker/?group_id=16077&atid=116077"
+LICENSE = "LGPLv2.1 | MPL-1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
+                    file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
+SECTION = "libs"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/freeassociation/${BPN}/${P}/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "21f7f8a21e3d857c9476be732e52dc32"
+SRC_URI[sha256sum] = "af4cbb4bb13d9ed3f2262181da9199823feba70802b15cc3e89b263d95da2888"
+
+inherit autotools
-- 
1.7.8.rc3



