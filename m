Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDFEC71978
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 06:19:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAH6JgSk021959
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 22:19:42 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 16 Nov 2016 22:19:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2016 22:19:34 -0800
Message-ID: <5cea51d1030f17c4c8fecfb4da3b04bd63a2b6c2.1479363545.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1479363545.git.liezhi.yang@windriver.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] oeqa/sdkext/devtool.py: don't reset when the test is failed
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
X-List-Received-Date: Thu, 17 Nov 2016 06:19:40 -0000
Content-Type: text/plain

The contents are helpful to debug when the error happens.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/sdkext/devtool.py | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/lib/oeqa/sdkext/devtool.py b/meta/lib/oeqa/sdkext/devtool.py
index f101eb6..c91090e 100644
--- a/meta/lib/oeqa/sdkext/devtool.py
+++ b/meta/lib/oeqa/sdkext/devtool.py
@@ -24,7 +24,6 @@ class DevtoolTest(oeSDKExtTest):
             self._run('devtool build myapp')
         except Exception as e:
             print(e.output)
-            self._run('devtool reset myapp')
             raise e
         self._run('devtool reset myapp')
 
@@ -34,7 +33,6 @@ class DevtoolTest(oeSDKExtTest):
             self._run('devtool package myapp')
         except Exception as e:
             print(e.output)
-            self._run('devtool reset myapp')
             raise e
         self._run('devtool reset myapp')
 
@@ -73,7 +71,6 @@ class DevtoolTest(oeSDKExtTest):
             self._run('devtool build %s' % recipe)
         except Exception as e:
             print(e.output)
-            self._run('devtool reset %s' % recipe)
             raise e
         self._run('devtool reset %s' % recipe)
 
@@ -87,7 +84,6 @@ class DevtoolTest(oeSDKExtTest):
             self._run('devtool build %s' % recipe)
         except Exception as e:
             print(e.output)
-            self._run('devtool reset %s' % recipe)
             raise e
         self._run('devtool reset %s' % recipe)
 
@@ -100,7 +96,6 @@ class DevtoolTest(oeSDKExtTest):
             self._run('devtool build %s ' % package_nodejs)
         except Exception as e:
             print(e.output)
-            self._run('devtool reset %s' % package_nodejs)
             raise e
         self._run('devtool reset %s '% package_nodejs)
 
-- 
2.10.2


