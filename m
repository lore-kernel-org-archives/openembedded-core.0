Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 836C7728A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 05:44:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ5iMRv014607
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 21:44:22 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Dec 2014 21:44:22 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 13:42:00 +0800
Message-ID: <e596b8e8be3cc4a0f0f93b2de05b2dc013e7940d.1418953574.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418953574.git.Chong.Lu@windriver.com>
References: <cover.1418953574.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] cups: Upgrade to 2.0.1
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
X-List-Received-Date: Fri, 19 Dec 2014 05:44:23 -0000
Content-Type: text/plain

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-extended/cups/{cups_2.0.0.bb => cups_2.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.0.0.bb => cups_2.0.1.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups_2.0.0.bb b/meta/recipes-extended/cups/cups_2.0.1.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.0.0.bb
rename to meta/recipes-extended/cups/cups_2.0.1.bb
index 384cd0b..c78b44d 100644
--- a/meta/recipes-extended/cups/cups_2.0.0.bb
+++ b/meta/recipes-extended/cups/cups_2.0.1.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6c5a350596fba02754bd96eb6df3afd0"
 
-SRC_URI[md5sum] = "2cdd81fea23e9e29555c24bdfd0d7c89"
-SRC_URI[sha256sum] = "83fdbbcb4ac4d82949bbde6d5dce7a4b6a62557da8f3d46c5e34b951110f5be2"
+SRC_URI[md5sum] = "7f7c33071035fb20d0879929a42da711"
+SRC_URI[sha256sum] = "60f7f2cca69f3b761a029fb314ee4299e3ea0fc02350f06d192cf31d58215525"
-- 
1.9.1


