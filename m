Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E756674C04
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 03:08:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5438f9F012606
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Jun 2018 20:08:41 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Sun, 3 Jun 2018 20:08:40 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jun 2018 11:10:05 +0800
Message-ID: <42cf42dd3a819b72034c3abbf11c0d57de4ec704.1528081495.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1528081495.git.Qi.Chen@windriver.com>
References: <cover.1528081495.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/14] oeqa/core/decorator/__init__.py: use 'cls' instead of 'obj'
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
X-List-Received-Date: Mon, 04 Jun 2018 03:08:40 -0000
Content-Type: text/plain

Use 'cls' instead of 'obj' to better reflect that registerDecorator
actually serves as a class decorator.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/core/decorator/__init__.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/core/decorator/__init__.py b/meta/lib/oeqa/core/decorator/__init__.py
index 6ca0acf..14d7bfc 100644
--- a/meta/lib/oeqa/core/decorator/__init__.py
+++ b/meta/lib/oeqa/core/decorator/__init__.py
@@ -6,9 +6,9 @@ from abc import abstractmethod, ABCMeta
 
 decoratorClasses = set()
 
-def registerDecorator(obj):
-    decoratorClasses.add(obj)
-    return obj
+def registerDecorator(cls):
+    decoratorClasses.add(cls)
+    return cls
 
 class OETestDecorator(object, metaclass=ABCMeta):
     case = None # Reference of OETestCase decorated
-- 
1.9.1


