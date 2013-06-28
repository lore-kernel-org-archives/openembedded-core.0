Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id F3A946A4E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:47 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rr13so2720887pbb.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=JeproPiEPneTkjXnS5BzQcHuKXCkRxcI1YvlzqN9/Fw=;
	b=yL8yIJwHMvHfpG4X1JlLTFdjqU2Swk9fnGm6KH1ONYBlgVCkE4IJRqZxWHBn6VEyXw
	2Jqci9LFAhs/1HIrCKj8fP6jIa7DTPEh01DJ3e+0wSaP5qOR9XuVB8/+S+QlDhyYzO2a
	mVwIIrLbIHEn6Oqtm9904zvNvpLSlTr8a/k27Z7RGJJI2Vb7uqEftgdk9uBTjXgFM9gr
	5OzwDVTC0YAFw/i9JHFfCjGr1CDEpJXwCRh9So9MjzPsPP9F62JNkcberVbOg45r2RF2
	JmAMhMqm8Djz9DzHAgaf+fUzmtSGsVBATzb4x8V1N+hzBLSTbtt7i17fSf8zmrFlJaes
	EnWg==
X-Received: by 10.68.216.161 with SMTP id or1mr13389930pbc.147.1372457089408; 
	Fri, 28 Jun 2013 15:04:49 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.48 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:04:07 -0700
Message-Id: <8d930de0c86eb648c66e8816c5bbbcd1bcb01254.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 22/24] python3-nose: Testing tools for python
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3-nose_1.2.1.bb |   34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-nose_1.2.1.bb

diff --git a/meta/recipes-devtools/python/python3-nose_1.2.1.bb b/meta/recipes-devtools/python/python3-nose_1.2.1.bb
new file mode 100644
index 0000000..46db351
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-nose_1.2.1.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Testing Tools for Python."
+HOMEPAGE = "http://readthedocs.org/docs/nose/"
+SECTION = "devel/python"
+LICENSE = "LGPL"
+LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+DEPENDS = "python3"
+RDEPENDS_${PN} = " \
+                   python3-codecs \
+                   python3-core \
+                   python3-debugger \
+                   python3-difflib \
+                   python3-doctest \
+                   python3-io \
+                   python3-logging \
+                   python3-pickle \
+                   python3-re \
+                   python3-textutils \
+                   python3-threading \
+                   python3-unittest \
+                 "
+SRCNAME = "nose"
+PR = "r1"
+
+SRC_URI = "\
+  http://pypi.python.org/packages/source/n/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "735e3f1ce8b07e70ee1b742a8a53585a"
+SRC_URI[sha256sum] = "2171e9202d118d302d5db1decb52dd862b79e2a626ca19653a6914574a6ca7d9"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools3
-- 
1.7.9.5


