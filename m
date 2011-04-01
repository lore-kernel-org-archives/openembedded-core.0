Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W1T-00059U-AB
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:47 +0200
Received: by pvc30 with SMTP id 30so571774pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=kL0A1GbCxmhDtEnmp/Mgye4O/G7sC8nTTpWHs/Jz2ho=;
	b=u7ZKrEXPH+eTYcVIXeMvsEqcgAUuYsncCnHRV3XBIWqr/eT0H84/v+sYU59pOEta1+
	CzJtM6GcqtaVOyOnwcP6pNyKITtMgZ9cb4F24zme1YuRDq1Ck2wOOi3Cz9nDWOND52iH
	fWGO7lJ7YkdQtcs3IC27FLiOc2FXb2+C2yfHE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=su8uXL24LgLzSBbuQvSAwj+N2Of+JqqfGn8r6x0Qx/WStrswBEsxgmj20zoxUNvZDj
	vFfPYHu0zv2Q649XjAx/iYUN3n0tmOHRX75Lb0dmKFY8Cgcfqv/Xl006M5XJ/AzQLHHQ
	wWkayP7VbG2gPiSXd4dfcAMJo4YalOZFKbFps=
Received: by 10.142.142.13 with SMTP id p13mr2837483wfd.324.1301632185933;
	Thu, 31 Mar 2011 21:29:45 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n4sm2393507wfl.2.2011.03.31.21.29.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:37 -0700
Message-Id: <f214e8a888be526701b896c97fb89706b82f6204.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 27/46] xorg-proto: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Fri, 01 Apr 2011 04:31:47 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-proto/bigreqsproto_1.1.1.bb               |    2 --
 meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb  |    2 --
 .../xorg-proto/xcmiscproto_1.2.1.bb                |    2 --
 .../xorg-proto/xf86bigfontproto_1.2.0.bb           |    2 --
 4 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.1.bb b/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.1.bb
index 19fe328..9c31a39 100644
--- a/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.1.bb
@@ -3,8 +3,6 @@ require xorg-proto-common.inc
 PR = "r0"
 PE = "1"
 
-DEPENDS += "gettext"
-
 SUMMARY = "BigReqs: X Big Requests extension headers"
 
 DESCRIPTION = "This package provides the wire protocol for the \
diff --git a/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb b/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb
index cd62534..f1f7cbb 100644
--- a/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb
@@ -13,8 +13,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7dd6ea99e2a83a552c02c80963623c38 \
 PR = "r0"
 PE = "1"
 
-DEPENDS += "gettext"
-
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "e7edb59a3f54af15f749e8f3e314ee62"
diff --git a/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb b/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb
index 1b34a5d..af5ddfd 100644
--- a/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb
@@ -12,8 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=09d83047c15994e05db29b423ed6662e"
 PR = "r0"
 PE = "1"
 
-DEPENDS += "gettext"
-
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "cd7372cd827bfd7ca7e9238f2ce274b1"
diff --git a/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb b/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb
index d80c0f1..969fc91 100644
--- a/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb
@@ -12,8 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e01e66e4b317088cf869bc98e6af4fb6"
 PR = "r1"
 PE = "1"
 
-DEPENDS += "gettext"
-
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "120e226ede5a4687b25dd357cc9b8efe"
-- 
1.7.4.1



