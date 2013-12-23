Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2919860D7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 08:36:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBN8aOjF015189
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 00:36:24 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.146) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 23 Dec 2013 00:36:23 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Dec 2013 16:36:20 +0800
Message-ID: <2e053dfde8c5b774d5f20be0f1afd3b41200fb9e.1387787578.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1387787578.git.Qi.Chen@windriver.com>
References: <cover.1387787578.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] busybox: enable SEAMLESS_XZ by default
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
X-List-Received-Date: Mon, 23 Dec 2013 08:36:23 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

We have enabled SEAMLESS_GZ and SEAMLESS_BZ2 in defconfig, it's
reasonable for us to enable SEAMLESS_XZ as well. Otherwise, we
couldn't extract tar.xz file while we could extract tar.gz file.
Such situation would be somewhat confusing.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox/defconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index f0e63c2..20cd147 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -125,7 +125,7 @@ CONFIG_FEATURE_HWIB=y
 #
 # Archival Utilities
 #
-# CONFIG_FEATURE_SEAMLESS_XZ is not set
+CONFIG_FEATURE_SEAMLESS_XZ=y
 CONFIG_FEATURE_SEAMLESS_LZMA=y
 CONFIG_FEATURE_SEAMLESS_BZ2=y
 CONFIG_FEATURE_SEAMLESS_GZ=y
-- 
1.7.9.5


