Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49DFD7284C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 14:44:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t07Ei2NQ023276
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Jan 2015 06:44:02 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 7 Jan 2015 06:44:01 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Jan 2015 06:44:01 -0800
Message-ID: <dee5efa4fe5b3be8077f522a59878fd0269e8eac.1420641813.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1420641813.git.liezhi.yang@windriver.com>
References: <cover.1420641813.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] insane.bbclass: fix desktop
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
X-List-Received-Date: Wed, 07 Jan 2015 14:44:03 -0000
Content-Type: text/plain

The desktop-file-utils-native lacks a space.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 0b45374..143ec46 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1112,7 +1112,7 @@ do_configure[postfuncs] += "do_qa_configure "
 python () {
     tests = d.getVar('ALL_QA', True).split()
     if "desktop" in tests:
-        d.appendVar("PACKAGE_DEPENDS", "desktop-file-utils-native")
+        d.appendVar("PACKAGE_DEPENDS", " desktop-file-utils-native")
 
     ###########################################################################
     # Check various variables
-- 
1.7.9.5


