Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35C14782AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 01:23:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7M1NLvv024217
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 18:23:21 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 18:23:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 18:23:11 -0700
Message-ID: <1681bb8001d8550fc5d2c3828ba503bb32ef2cad.1503364879.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1503364879.git.liezhi.yang@windriver.com>
References: <cover.1503364879.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 7/9] buildhistory.bbclass: print message when no commit
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
X-List-Received-Date: Tue, 22 Aug 2017 01:23:20 -0000
Content-Type: text/plain

This makes the user easier to know how to make commit in buildhistory.

[YOCTO #11547]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/buildhistory.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 81784ee..a3e4c7a 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -824,6 +824,8 @@ python buildhistory_eventhandler() {
                 interrupted = getattr(e, '_interrupted', 0)
                 localdata.setVar('BUILDHISTORY_BUILD_INTERRUPTED', str(interrupted))
                 bb.build.exec_func("buildhistory_commit", localdata)
+            else:
+                bb.note("No commit since BUILDHISTORY_COMMIT != '1'")
 }
 
 addhandler buildhistory_eventhandler
-- 
2.10.2


