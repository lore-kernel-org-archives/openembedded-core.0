Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0766160290
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 03:42:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7O3gJRu018050
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 20:42:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 20:42:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Aug 2018 11:46:40 +0800
Message-ID: <620b38a380c4e52a34592784f48bb5b0212f5ba0.1535080661.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1535080661.git.Qi.Chen@windriver.com>
References: <cover.1535080661.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] utils.bbclass: fix KeyError exception
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
X-List-Received-Date: Fri, 24 Aug 2018 03:42:18 -0000
Content-Type: text/plain

The following statement was accidently removed. Add it back.

  values['ml'] = ['']

This patch fixes the following error.

  Exception: KeyError: 'ml'

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/utils.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index e12e93a..0016e5c 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -360,6 +360,7 @@ def all_multilib_tune_list(vars, d):
     values = {}
     for v in vars:
         values[v] = []
+    values['ml'] = ['']
 
     variants = (d.getVar("MULTILIB_VARIANTS") or "").split() + ['']
     for item in variants:
-- 
1.9.1


