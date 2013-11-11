Return-Path: <layliu@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4E76D37F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 09:28:00 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id p10so402388pdj.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 01:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=T5iuxJFTLxK2jJx7Ik0cvnoCqIzqU4C3BUj+Ywi0p7o=;
	b=HKaBQplV0wR/qx9xgRiVNsUxBrbJrCcOPryupwQcCu7CXMcMjs85FpbVGqMMDXp4kO
	Kc1MjmAROVisy9p+L2FQkDvSteU5cYoaNk4ceBK3U/3mRMraPNJ55C2Z1fymQzcxbequ
	5SykhYPiioyrv6w/1dQvFzVsz9xASx4hLhJfXV9egEkJ9SbsoFN7cD4FlIWDLjE6qW0p
	f9e0AgqTiia5G7YhmHiXiZHFkjSFpy2Rgir+bdHU1arVp7jrD8kS02FTxV4EP+bv6PxK
	30UYINaqtbVL45mfI+wtTDC96lYwLiTaK3v72848X29BPw1wE+iFKCQIxI+LHSCdOsVV
	P3uw==
X-Received: by 10.66.251.40 with SMTP id zh8mr289322pac.185.1384162081790;
	Mon, 11 Nov 2013 01:28:01 -0800 (PST)
Received: from localhost.localdomain ([1.202.252.122])
	by mx.google.com with ESMTPSA id rv9sm29563307pbc.4.2013.11.11.01.27.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Nov 2013 01:28:01 -0800 (PST)
From: Lei Liu <layliu@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2013 17:27:41 +0800
Message-Id: <1384162062-30319-1-git-send-email-layliu@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <no>
References: <no>
Subject: [PATCH 1/2] mklibs: add dependency on dpkg-native
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
X-List-Received-Date: Mon, 11 Nov 2013 09:28:00 -0000

From: Lei Liu <lei.liu2@windriver.com>

mklibs requires the "dpkg-architecture" utility to work.
Add dependency on dpkg-native.

Signed-off-by: Lei Liu <lei.liu2@windriver.com>
---
 .../mklibs/mklibs-native_0.1.38.bb                 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb
index e424052..6367e8f 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://code.launchpad.net/mklibs"
 SECTION = "devel"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
-DEPENDS = "python-native"
+DEPENDS = "python-native dpkg-native"
 
 SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.gz \
 	file://ac_init_fix.patch\
-- 
1.7.0.4


