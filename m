Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBD9Q-0006xT-2h
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 23:40:04 +0100
Received: by wera1 with SMTP id a1so3010518wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=46kxJJJT5TeaBGnlKw+yDZ6zVR5g0g5UJw0MeMee9jM=;
	b=BHg0+u6b2TlHPZ+qBp0CO6yRvP6JShKzLesDSOBLfX0n28u6lQHNSepyv29yi526P7
	wMoznuqVKOs1uyNfC5uKR0MKETm3jKYwJ49cLOh9zINofVSzbGoceS4iLynESffXlKpi
	J3vtV2lf9QCIl725rit6cCPRd7TD73NTxgD0RidAjHziPSO8uyzLChtgFWi2q15sSrO0
	YtkpjMjDE4CPeM2m4ZFzkZXJHcdbIJ8H8yRvz7d0ilI7Do4Qyhx8YzjxPWLxeeil5XaO
	7IFsA1FpqRzmYuIdw+TMt8pT0+h51pb1WEP+H+xMXmud9eIc1fpIhfw66f9VrQcIW7zV
	6WOw==
Received: by 10.180.85.35 with SMTP id e3mr647228wiz.6.1332541867764;
	Fri, 23 Mar 2012 15:31:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e6sm17475709wix.8.2012.03.23.15.31.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 15:31:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 23:30:42 +0100
Message-Id: <09a7f739d507a4b38f34f942f7dd09f97f889ae6.1332541342.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
References: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332541342.git.Martin.Jansa@gmail.com>
References: <cover.1332541342.git.Martin.Jansa@gmail.com>
Subject: [PATCHv 03/10] classes: scons: add EXTRA_OESCONS
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
X-List-Received-Date: Fri, 23 Mar 2012 22:40:04 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/scons.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index 211746f..a07a366 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -1,12 +1,14 @@
 DEPENDS += "python-scons-native"
 
+EXTRA_OESCONS ?= ""
+
 scons_do_compile() {
-        ${STAGING_BINDIR_NATIVE}/scons PREFIX=${prefix} prefix=${prefix} || \
+        ${STAGING_BINDIR_NATIVE}/scons PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
         bbfatal "scons build execution failed."
 }
 
 scons_do_install() {
-        ${STAGING_BINDIR_NATIVE}/scons PREFIX=${D}${prefix} prefix=${D}${prefix} install || \
+        ${STAGING_BINDIR_NATIVE}/scons PREFIX=${D}${prefix} prefix=${D}${prefix} install ${EXTRA_OESCONS}|| \
         bbfatal "scons install execution failed."
 }
 
-- 
1.7.8.5



