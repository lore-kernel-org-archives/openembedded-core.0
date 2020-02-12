Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8E0E60BBA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 06:25:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01C6OrZg002250
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 22:25:04 -0800
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 11 Feb 2020 22:24:43 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Feb 2020 14:24:40 +0800
Message-ID: <20200212062440.621-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Subject: [PATCH] python3: install _tkinter.*.so to python3-tkinter package
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
X-List-Received-Date: Wed, 12 Feb 2020 06:25:14 -0000
Content-Type: text/plain

When enable PACKAGECONFIG[tk], we should install _tkinter.*.so to
python3-tkinter package rather than python3-misc package.

Fixes:
ERROR: python3-3.8.1-r0 do_package_qa: QA Issue:
/usr/lib/python3.8/lib-dynload/_tkinter.cpython-38-x86_64-linux-gnu.so
contained in package python3-misc requires libtk8.6.so()(64bit), but no
providers found in RDEPENDS_python3-misc? [file-rdeps]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index cbfa8d59d3..251271cb84 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1127,6 +1127,7 @@
             "core"
         ],
         "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/tkinter"
         ],
         "cached": []
-- 
2.17.1


