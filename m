Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91D1C78302
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 06:17:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5E6H638009337
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 23:17:06 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 13 Jun 2017 23:17:05 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jun 2017 14:20:12 +0800
Message-ID: <49d84b935e47c54a0bee6dec5bcc0228a13723b0.1497420515.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1497420515.git.Qi.Chen@windriver.com>
References: <cover.1497420515.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] staging.bbclass: fix typo
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
X-List-Received-Date: Wed, 14 Jun 2017 06:17:05 -0000
Content-Type: text/plain

The function is "sysroot_strip" instead of "split_and_strip_files".

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 9c26794..1bb22aa 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -87,7 +87,7 @@ python sysroot_strip () {
         ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
 
         if ret:
-            bb.error("split_and_strip_files: 'file %s' failed" % path)
+            bb.error("sysroot_strip: 'file %s' failed" % path)
             return type
 
         # Not stripped
-- 
1.9.1


