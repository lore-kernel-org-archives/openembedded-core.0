Return-Path: <mike.holmes@linaro.org>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9464B65C88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 21:03:00 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id i50so1507842qgf.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 14:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ACm+dS1It0bdQiu2vH6Y/enoHtHo5O8ADajlTcQ5YGU=;
	b=dldcfOcnV+NH9P+aqXNCsj51qPkXzoq02XovdnO/ZYuSQLC/qS9G3vzvOEKPo9GKWi
	OVMxUX44oB3Q+isemZyrB+kYbt0wO4TpECoe0InnZEJ1G/sjUjbg/0n1rILkjA/hvGg9
	hL55XMZ6gJMZgHp032bRGbPJlMQgUQ3kBzJXdXlJ2chfdVlzCzLlK0oSJftUzKRu4g78
	TxxGFSAahF6Mv0sUn/Sb52dvHtYIH6qEYV29dX8s8ux6wMfpKPj9huws8g0RPBsRytJg
	RSv86LGaaLcLXcZPoPmzFYhL3ca9EUm3hA6el/Bt9eG+Pv9n3KyLj0+hv5IxRVlFoA8C
	JNcw==
X-Gm-Message-State: ALoCoQnAnrdtVHqjygHTMeW6BLYdJUEMfilR5wxCzGcw2b88GmCaUppY2ECiwCsk3JNqhNQyKZT6
X-Received: by 10.224.127.133 with SMTP id g5mr16514393qas.24.1413925380690;
	Tue, 21 Oct 2014 14:03:00 -0700 (PDT)
Received: from fedora1.holmesfamily.ws ([98.221.136.245])
	by mx.google.com with ESMTPSA id
	m36sm11679500qgd.28.2014.10.21.14.03.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Oct 2014 14:03:00 -0700 (PDT)
From: Mike Holmes <mike.holmes@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Oct 2014 17:02:37 -0400
Message-Id: <1413925357-53983-2-git-send-email-mike.holmes@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1413925357-53983-1-git-send-email-mike.holmes@linaro.org>
References: <1413925357-53983-1-git-send-email-mike.holmes@linaro.org>
Subject: [PATCH] add CUnit test suite
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
X-List-Received-Date: Tue, 21 Oct 2014 21:03:02 -0000

Signed-off-by: Mike Holmes <mike.holmes@linaro.org>
---
 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb

diff --git a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
new file mode 100644
index 0000000..0e9b2ff
--- /dev/null
+++ b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "CUnit is a C framework for unit testing. Test output supports comandline and GUI reults reporting"
+HOMEPAGE = "http://cunit.sourceforge.net"
+LICENSE = "LGPL-2"
+SECTION = "libs"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7734aa853b85d6f935466f081490ddbb"
+
+S = "${WORKDIR}/CUnit-${PV}"
+
+SRC_URI = "http://downloads.sourceforge.net/project/cunit/CUnit/${PV}/CUnit-${PV}.tar.bz2"
+SRC_URI[md5sum] = "b5f1a9f6093869c070c6e4a9450cc10c"
+SRC_URI[sha256sum] = "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214"
+
+inherit autotools-brokensep
+
+EXTRA_OECONF = "--srcdir=`pwd` --prefix=$INSTALL_HOME --enable-debug --enable-memtrace --enable-automated --enable-basic --enable-console"
+
+FILES_${PN}-doc += "doc"
+FILES_${PN}-dev += "${prefix}/share"
-- 
1.9.1


