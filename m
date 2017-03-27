Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6BDC77A40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 10:39:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2RAdGxj008216
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 03:39:16 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 03:39:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Mar 2017 03:39:13 -0700
Message-ID: <e208daef44a1e5cca1569416d821819ab51947bc.1490611084.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1490611084.git.liezhi.yang@windriver.com>
References: <cover.1490611084.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] oe-run-native: OLDPATH -> OLD_PATH
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
X-List-Received-Date: Mon, 27 Mar 2017 10:39:16 -0000
Content-Type: text/plain

It's a typo.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/oe-run-native | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-run-native b/scripts/oe-run-native
index 7e26ea3fcc..f2453e705a 100755
--- a/scripts/oe-run-native
+++ b/scripts/oe-run-native
@@ -40,7 +40,7 @@ if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
 fi
 . $SYSROOT_SETUP_SCRIPT
 
-OLDPATH=$PATH
+OLD_PATH=$PATH
 
 # look for a tool only in native sysroot
 PATH=$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin
-- 
2.11.0.rc2.dirty


