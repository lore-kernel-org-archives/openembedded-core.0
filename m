Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADD9E7F1BA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2019 01:46:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xA91kfbg028480
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2019 17:46:41 -0800 (PST)
Received: from yow-tgamblin-fedora1.wrs.com (128.224.56.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Fri, 8 Nov 2019 17:46:40 -0800
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Nov 2019 20:46:40 -0500
Message-ID: <20191109014640.101169-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] python3-misc: add python3-audio to RDEPENDS
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
X-List-Received-Date: Sat, 09 Nov 2019 01:46:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Import issues are encountered for the python3 aifc module,
on images with python3-misc installed:

|>>> import aifc
|Traceback (most recent call last):
|File "<stdin>", line 1, in <module>
|File "/usr/lib64/python3.7/aifc.py", line 254, in <module>
|from chunk import Chunk
|ModuleNotFoundError: No module named 'chunk'
|>>>

The chunk module is part of python3-audio. Add python3-audio
to RDEPENDS for python3-misc to fix the error.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-devtools/python/python3_3.7.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.7.5.bb
index 0338fa4ba8..90914f9053 100644
--- a/meta/recipes-devtools/python/python3_3.7.5.bb
+++ b/meta/recipes-devtools/python/python3_3.7.5.bb
@@ -324,7 +324,7 @@ INSANE_SKIP_${PN}-dev += "dev-elf"
 
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
-RDEPENDS_${PN}-misc += "python3-core python3-email python3-codecs python3-pydoc python3-pickle"
+RDEPENDS_${PN}-misc += "python3-core python3-email python3-codecs python3-pydoc python3-pickle python3-audio"
 RDEPENDS_${PN}-modules_append_class-target = " python3-misc"
 RDEPENDS_${PN}-modules_append_class-nativesdk = " python3-misc"
 FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
-- 
2.23.0


