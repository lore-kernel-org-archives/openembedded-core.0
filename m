Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 13E5B6AF4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:49 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so2742782pbb.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=uWImaLPQUC2g/CYnXRohkNeDmWveBxM0ULKyXYCit6I=;
	b=MamUvxNCt34fQQ1yqcyNLzZKEHoXYyuuziAo5KiyEQiXzsF/g2Aea9NVmJqdKjrf3E
	qpgIOqueySKyn/pQi8HgDMXdXRurwKRza6EzLMSUkZzm4xm9EvMS/2kimlX3PiWQjnyu
	iLZKKZM7HnSEKS+p4VftD8X5EoroLmebPblFdpMsNVnnqEXSWtqCMYd6Oa6bu85xNrL/
	srTBGg/RWRKPg0XRccobi7B2dFHJrQfWi6f79BRbCYklfpOSJiuhu1D2XX4y5beZtwwy
	sqY6SM+I0uYV5c9hRVglaQWKaMyRL75LJ6d4jy/5S96qg6AQtTx7LjZNpNR2AXBtez4m
	cKCg==
X-Received: by 10.68.201.66 with SMTP id jy2mr13378669pbc.90.1372457090414;
	Fri, 28 Jun 2013 15:04:50 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.49 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:04:08 -0700
Message-Id: <fe7f6de1a8b37b6e6df341104bc9249a2cfc3124.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 23/24] python3-sphinx: New recipe for documentation system
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:49 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-sphinx_1.1.3.bb                 |   39 ++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-sphinx_1.1.3.bb

diff --git a/meta/recipes-devtools/python/python3-sphinx_1.1.3.bb b/meta/recipes-devtools/python/python3-sphinx_1.1.3.bb
new file mode 100644
index 0000000..0d4b6cc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinx_1.1.3.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "Sphinx Documentation System."
+HOMEPAGE = "http://sphinx-doc.org/"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d06c6f6aa1fbbe0b4752370d26c065eb"
+
+DEPENDS = "python3"
+
+# sqlalchemy jinja docutils
+RDEPENDS_${PN} = " \
+                   python3-codecs \
+                   python3-compression \
+                   python3-core \
+                   python3-docutils \
+                   python3-image \
+                   python3-io \
+                   python3-jinja \
+                   python3-logging \
+                   python3-netclient \
+                   python3-pickle \
+                   python3-pydoc \
+                   python3-re \
+                   python3-shell \
+                   python3-textutils \
+                   python3-threading \
+                 "
+SRCNAME = "Sphinx"
+PR = "r1"
+
+SRC_URI = "\
+  http://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "8f55a6d4f87fc6d528120c5d1f983e98"
+SRC_URI[sha256sum] = "34dc95b70a2b07a61b5d61034c34b05f82514aab54ad27adedb49cee911bb8e9"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools3
-- 
1.7.9.5


