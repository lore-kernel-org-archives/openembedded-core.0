Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 282AC729A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 05:28:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBM5SWFm021185
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 21:28:32 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 21 Dec 2014 21:28:32 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Dec 2014 21:28:29 -0800
Message-ID: <e09d950b54082943091fe906ceeae23bb8f701f8.1419226071.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1419226071.git.liezhi.yang@windriver.com>
References: <cover.1419226071.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] make: upgrade to 4.1
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
X-List-Received-Date: Mon, 22 Dec 2014 05:28:32 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../make/{make_4.0.bb => make_4.1.bb}              |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/make/{make_4.0.bb => make_4.1.bb} (71%)

diff --git a/meta/recipes-devtools/make/make_4.0.bb b/meta/recipes-devtools/make/make_4.1.bb
similarity index 71%
rename from meta/recipes-devtools/make/make_4.0.bb
rename to meta/recipes-devtools/make/make_4.1.bb
index 38d328c..a1b0d7c 100644
--- a/meta/recipes-devtools/make/make_4.0.bb
+++ b/meta/recipes-devtools/make/make_4.1.bb
@@ -6,7 +6,7 @@ require make.inc
 
 EXTRA_OECONF += "--without-guile"
 
-SRC_URI[md5sum] = "571d470a7647b455e3af3f92d79f1c18"
-SRC_URI[sha256sum] = "e60686c7afede62cc8c86ad3012cf081ea4887daf9d223ce7115703b2bb2dbdb"
+SRC_URI[md5sum] = "57a7a224a822f94789a587ccbcedff69"
+SRC_URI[sha256sum] = "0bc7613389650ee6a24554b52572a272f7356164fd2c4132b0bcf13123e4fca5"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.9.5


