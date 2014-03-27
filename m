Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D7506F8C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 18:06:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2RI6aRg012984
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Mar 2014 11:06:36 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 27 Mar 2014 11:06:35 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <Martin.Jansa@gmail.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Mar 2014 14:05:55 -0400
Message-ID: <1395943555-11113-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.56.18]
Subject: [PATCH] python-pip: setting proper LICENSE values
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
X-List-Received-Date: Thu, 27 Mar 2014 18:06:40 -0000
Content-Type: text/plain

The package's LICENSE.txt is pretty clear that this is licened under MIT and
LGPLv2.1, not MIT and GPL.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-oe/recipes-devtools/python/python-pip_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
index d1a7c8b..82b9671 100644
--- a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
+++ b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "PIP is a tool for installing and managing Python packages"
-LICENSE = "MIT & GPL"
+LICENSE = "MIT & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd00425a3465a0e4c81929b94241d3de"
 
 SRC_URI = "https://pypi.python.org/packages/source/p/pip/pip-${PV}.tar.gz"
-- 
1.8.3.2


