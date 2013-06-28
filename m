Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id C26AE6AF62
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:42 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id y10so1286303pdj.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Ch7PTw71jOMuFMR0iRVLqRWUi6okjPJyKCawPCrLK5A=;
	b=IYGc14OUEBOiYLkGTCZG6FutNAIeEIYfPgPf7LedV+FmRmAhca9EqtozmDHdtLZAcK
	ZOakXSv9agqWxlghLiNzHlsBNpdPP93d02/XSsvxgw+n494i0hgSq+VyVr9p3o5ujImb
	tVlEVUcsPvHIzJwJSgo+EoielJQCaVmU7/7iVZDd4MmO9sHO1mJtfC2X3Ut34eMwbTkZ
	McnsRxqE8TWpHexSYKAhMz2O1y3QtnZtPQ8pzH3RU3Y7HzeepMzQOP9DtreYte3qKN7Y
	N1/7yjFI+96xLjK7lSpG5WUQWb9JRI3aFpvW3E/k0wP466g+9/VwGvHT6Nc11N8jJ4ea
	DtlA==
X-Received: by 10.66.122.41 with SMTP id lp9mr11130908pab.6.1372457084134;
	Fri, 28 Jun 2013 15:04:44 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.43 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:04:02 -0700
Message-Id: <524b7a39b1196d93b0383c86912fc508e68f6cf6.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 17/24] zeromq: Add recipe
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:43 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/zeromq_3.2.2.bb |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/python/zeromq_3.2.2.bb

diff --git a/meta/recipes-devtools/python/zeromq_3.2.2.bb b/meta/recipes-devtools/python/zeromq_3.2.2.bb
new file mode 100644
index 0000000..4929bba
--- /dev/null
+++ b/meta/recipes-devtools/python/zeromq_3.2.2.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "ZeroMQ - Intelligent Transport Layer"
+HOMEPAGE = " http://github.com/zeromq/pyzmq/"
+SECTION = "devel/python"
+LICENSE = "LGPL-3.0 + EXCEPTION"
+LIC_FILES_CHKSUM = " \
+                    file://COPYING.LESSER;md5=ad8c3bd15d88ea9d4509fc89bebc915c \
+                   "
+#
+# libpthread  --  libc
+# libuuid     --  util-linux
+#
+DEPENDS = "util-linux "
+RDEPENDS_${PN} = "util-linux "
+
+PR = "r1"
+
+SRC_URI = " \
+  http://download.zeromq.org/${PN}-${PV}.tar.gz \
+"
+SRC_URI[md5sum] = "df68431d9300da84a1a5f9a2784e33de"
+SRC_URI[sha256sum] = "2b4eeda60fe47a9fa0804d53d76f656665c5f84dab7e63a1d496d9430b554f99"
+
+inherit autotools binconfig pkgconfig
+
-- 
1.7.9.5


