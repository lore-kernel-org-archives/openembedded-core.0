Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QPsw5-0003DZ-W5
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 11:02:26 +0200
Received: by fxm19 with SMTP id 19so1427112fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 01:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=egGAF75hh2SqQA0TpNU8xO2LpOgu0UqO2LEhtBUbXqI=;
	b=LzkZ5PpcDVVpWwMWkvdXIAtfbDG9BLFWYmfA+TXZsFP2gV/fmcdTDWVBu4+KNF3tfc
	MkV0SAXcM8O0zHgRtmZ7MoaNFnZQgBtyITobByeidtG2nXJQSaUxdZBuoNrcirlFx1Tq
	omlbsv1HQWvk9vFJnQdGzAihEcbZO1IyJ5tbo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=jW3S43akZWOb447445xzilIT2GMh52rFzmmaMU9lUXE5xKDMF0dzF+EWwaaTmZwZ7A
	e0442G8V/q4sU27S6wmTBeI49OvqBCZJgCvnoo8WDFwTLVa1ISDTn+SDIoW87YQUsElw
	qYjQ18xtSoWHnFTrnC0ET6Kfnp57leIK5bbBM=
Received: by 10.223.156.67 with SMTP id v3mr2046239faw.34.1306486757591;
	Fri, 27 May 2011 01:59:17 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id o23sm592636faa.33.2011.05.27.01.59.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 01:59:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 10:59:09 +0200
Message-Id: <1306486749-17889-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [PATCH] libcap: add native BBCLASSEXTEND to fix gnutls-native after ffc32d6436bcd11bd9a431affb9d2508fdb3992e
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 May 2011 09:02:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/libcap/libcap.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 292fa78..1b4c0bc 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -6,6 +6,8 @@ LICENSE = "BSD | GPL"
 LIC_FILES_CHKSUM = "file://License;md5=731de803c1ccbcb05a9b3523279c8d7f"
 
 DEPENDS = "libpam attr perl-native"
+# attr and pam are disabled by EXTRA_OEMAKE_virtclass-native
+DEPENDS_virtclass-native = "perl-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/libcap2/${BPN}-${PV}.tar.bz2"
 
@@ -32,3 +34,5 @@ do_install() {
 # pam files
 FILES_${PN} += "${libdir}/security/*.so"
 FILES_${PN}-dbg += "${libdir}/security/.debug/*.so"
+
+BBCLASSEXTEND = "native"
-- 
1.7.5.rc3



