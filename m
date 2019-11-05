Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D17587F971
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 03:13:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xA53DmXh013955
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Nov 2019 19:13:48 -0800 (PST)
Received: from 41ce8e763d5a.wrs.com (128.224.153.74) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 4 Nov 2019 19:13:47 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Nov 2019 03:12:24 +0000
Message-ID: <20191105031224.179504-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105031056.179041-1-hongxu.jia@windriver.com>
References: <20191105031056.179041-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2] python3-git: add python3-nose to RDEPENDS
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
X-List-Received-Date: Tue, 05 Nov 2019 03:13:46 -0000
Content-Type: text/plain

$>>> import git.test.lib
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3/dist-packages/git/test/lib/__init__.py", line 9, in <module>
    from .asserts import *
  File "/usr/lib/python3/dist-packages/git/test/lib/asserts.py", line 10, in <module>
    from nose.tools import (
ModuleNotFoundError: No module named 'nose'

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/python/python3-git_3.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-git_3.0.2.bb b/meta/recipes-devtools/python/python3-git_3.0.2.bb
index 9dd753db4f..7c6cda8cd4 100644
--- a/meta/recipes-devtools/python/python3-git_3.0.2.bb
+++ b/meta/recipes-devtools/python/python3-git_3.0.2.bb
@@ -27,6 +27,7 @@ RDEPENDS_${PN} += " \
                    ${PYTHON_PN}-stringold \
                    ${PYTHON_PN}-unittest \
                    ${PYTHON_PN}-unixadmin \
+                   ${PYTHON_PN}-nose \
                    git \
 "
 
-- 
2.17.1


