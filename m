Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 307356D756
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 15:18:22 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id y1so7716988lam.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 07:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=m6mYi/1HD6QG/OSKaphc/fqiMGxGaRR42Rr498GlS3I=;
	b=AzhsUeEaihyHXThZlah5kWup28DXdKtXkD4ZgqVVmaAeqGa3idm15ehMYMlcaMUyVq
	KMZaLkGbj4jn0TV3I1ebptt6CZWYamAgMtGzzsI6J00gTPoEkYiaNPQdYkhWoeI8JKeA
	o3O53bAcGC9+k//ovEQv5JTI/w5GDKCSJ0E2dtmNn5vrv67y5bGOn/XAOJgPk2mqYdYI
	mcI20r1dlZFChNHN5E16I6nqGt1Yx8dqI8hpHPgOzXFUksNyPYG8MVFWUW/rqBtzIf6b
	dzFKAa6sD6LaDMWznY+uxPSVtjnpNOkdC6jcMNVZ3XLWuitCNlQ0Xl82lDtfzHFSVV9Y
	qeug==
X-Received: by 10.112.181.232 with SMTP id dz8mr2738382lbc.8.1386170300612;
	Wed, 04 Dec 2013 07:18:20 -0800 (PST)
Received: from nysan ([79.102.212.129])
	by mx.google.com with ESMTPSA id rb4sm9937334lbb.1.2013.12.04.07.18.18
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Dec 2013 07:18:19 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 6C2631C6A44; Wed,  4 Dec 2013 16:18:17 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 16:18:15 +0100
Message-Id: <1386170295-26774-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] rpm: Fixed Q&A Errors in netivesdk-rpm
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
X-List-Received-Date: Wed, 04 Dec 2013 15:18:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ERROR: QA Issue: nativesdk-rpm: Files/directories were installed but not shipped
  /opt/poky/1.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/rpm/bin/rpmcmp.real
  /opt/poky/1.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/rpm/bin/rpmrepo.real
  /opt/poky/1.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/rpm/bin/rpmdigest.real
  /opt/poky/1.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/rpm/bin/rpmspecdump.real
  /opt/poky/1.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/rpm/bin/rpmcache.real
  /opt/poky/1.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/rpm/bin/debugedit.real
  /opt/poky/1.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/rpm/bin/rpmdeps-oecore.real
  /opt/poky/1.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/rpm/bin/rpmdeps.real
ERROR: QA run found fatal errors. Please consider fixing them.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 4b95a90..9d376a5 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -223,7 +223,9 @@ FILES_${PN} =  "${bindir}/rpm \
 		${libdir}/rpm/bin/mtree \
 		${libdir}/rpm/bin/rpmkey \
 		${libdir}/rpm/bin/rpmrepo \
+		${libdir}/rpm/bin/rpmrepo.real \
 		${libdir}/rpm/bin/rpmspecdump \
+		${libdir}/rpm/bin/rpmspecdump.real \
 		${libdir}/rpm/bin/wget \
 		${localstatedir}/cache \
 		${localstatedir}/cache/rpm \
@@ -284,11 +286,17 @@ FILES_${PN}-build = "${prefix}/src/rpm \
 		${libdir}/rpm/pkgconfigdeps.sh \
 		${libdir}/rpm/pythondeps.sh \
 		${libdir}/rpm/bin/debugedit \
+		${libdir}/rpm/bin/debugedit.real \
 		${libdir}/rpm/bin/rpmcache \
+		${libdir}/rpm/bin/rpmcache.real \
 		${libdir}/rpm/bin/rpmcmp \
+		${libdir}/rpm/bin/rpmcmp.real \
 		${libdir}/rpm/bin/rpmdeps \
+		${libdir}/rpm/bin/rpmdeps.real \
 		${libdir}/rpm/bin/rpmdeps-oecore \
+		${libdir}/rpm/bin/rpmdeps-oecore.real \
 		${libdir}/rpm/bin/rpmdigest \
+		${libdir}/rpm/bin/rpmdigest.real \
 		${libdir}/rpm/bin/abi-compliance-checker.pl \
 		${libdir}/rpm/bin/api-sanity-autotest.pl \
 		${libdir}/rpm/bin/chroot \
-- 
1.8.3.2


