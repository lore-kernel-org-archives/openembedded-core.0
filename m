Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVOTf-0005BT-Cj
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 15:16:07 +0100
Received: by faar15 with SMTP id r15so771878faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 06:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZSdolI0/ugnf7vJl4Tora2tVUMtqjtpA/hEkPJmTRGw=;
	b=sv47vp6wLU6ozLurJ8AXwhYlqevejbH9LMWz5JI+RE+mYvq9Phlm3gGiJm8xgnXC5q
	Wd4RMK70GqNodm1cdzJtr0+LJDyznsYHkmt1cHgkpb3yXbOFMtvQn63temJ0rmtLuHC/
	r6w86wmjN9e/DuBQEdcNX+S5cFMf51qvWqVDI=
Received: by 10.204.152.4 with SMTP id e4mr49699934bkw.56.1322575768002;
	Tue, 29 Nov 2011 06:09:28 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h7sm37255707bkw.12.2011.11.29.06.09.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 06:09:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 15:09:18 +0100
Message-Id: <5cfb6fb6399c6697f6bf587311db6b9171b20817.1322549636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1322549636.git.Martin.Jansa@gmail.com>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322549636.git.Martin.Jansa@gmail.com>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
Subject: [oe-core 07/10] libical: drop older version 0.46
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
X-List-Received-Date: Tue, 29 Nov 2011 14:16:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-sato/libical/libical_0.46.bb |   15 ---------------
 1 files changed, 0 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-sato/libical/libical_0.46.bb

diff --git a/meta/recipes-sato/libical/libical_0.46.bb b/meta/recipes-sato/libical/libical_0.46.bb
deleted file mode 100644
index e0e88ba..0000000
--- a/meta/recipes-sato/libical/libical_0.46.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "iCal and scheduling (RFC 2445, 2446, 2447) library"
-HOMEPAGE = "http://sourceforge.net/projects/freeassociation/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=16077&atid=116077"
-LICENSE = "LGPLv2.1 | MPL-1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=35da21efce2b9f0ca07524c9f844e6ed \
-			file://LICENSE;md5=35da21efce2b9f0ca07524c9f844e6ed"
-SECTION = "libs"
-PR = "r0"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/freeassociation/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "9c08f88945bfd5d0791d102e4aa4125c"
-SRC_URI[sha256sum] = "000762efb81501421d94ec56343648a62b3bd2884e7cdf6f638e2c207dd8f6a1"
-
-inherit autotools
-- 
1.7.8.rc3



