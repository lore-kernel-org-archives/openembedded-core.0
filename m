Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7045C78049
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 07:42:51 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id d8so1521761pgt.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 00:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yRGjXpfkfBAUYFahI25jzEhSHIzBtaOZs3fQvVzKm7U=;
	b=vBW86QS6X7bYnlpHfShVvMb/RDVTzBzo9/HqdXV595ENlPD7DAYycJRgIxRWLUtGkC
	uCwkyMBHi/p36Dw8pMbEwhb5TznZS5ZO7H4/DJD5LkNT9MTV3IVkLW/9tAEP3Qppje0e
	B8E3WvaDIxkMssQXE2wh2yNprUgaln49J+yJOJTxP4MK0ELL4pwXEpJdAsU5ByDmyfq/
	ujHTwFiH4xA0Fwn13uNRiT1OYRHXdkALtaeTteLf1X7ih2WmjUJSRebPNImcFg7Sfps1
	WKKQAQ5tAk2t6UgBSfn9W1V1FKNpPDjT6iNUs0U9G0P2zIGP6Ql5mCPZeZQsGib7muHU
	45AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yRGjXpfkfBAUYFahI25jzEhSHIzBtaOZs3fQvVzKm7U=;
	b=Ebxw/TmSPYDEiKhnAvoV31du5BIWYL+6u14DYbXO+U4YsxVFoMe0yvYTMj7B8N/v3O
	9VLXCPDly/S2xWapVgIo+vxOL6dTTDim41x3oqP/IZFMCajne1bekFycQ7UsiFzb+agD
	dAweBIzWO9IEefJBaz4hNE7FbrbuH7BFP9M/uXjrj0IV1cE/ZtznC+T6FBVfnLCXp7D7
	7+bGs+zNF0EEc6TmJkW7OzqrlnmlXMQ5csKBB96ztPq4l1GCLvcoSjSuQUFT2wJT7mjp
	onXzsd01UckkNMHuTg2nK4Or4xLeEIqgfSZMdoVgDI0qEflowUeP/aao0WU6eItb2fC2
	ji5w==
X-Gm-Message-State: AHPjjUgnxQTum3vKM1NfRxFIIQvP5I0LUIx9XNU12Rggl5ZtnAjt2lrc
	voGLXaA0Jd1qpnizKupOPQ==
X-Google-Smtp-Source: ADKCNb6BApL3BCqcapR4kQUQOBo7pt2Zbsm0fqDVqUzsnQCMGNdSNKI4cBL3J3KNXzSKfizrPQ8xMQ==
X-Received: by 10.98.236.198 with SMTP id e67mr2767537pfm.157.1504597372447;
	Tue, 05 Sep 2017 00:42:52 -0700 (PDT)
Received: from ankit.iind.intel.com ([134.134.139.82])
	by smtp.gmail.com with ESMTPSA id 27sm254409pfk.91.2017.09.05.00.42.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Sep 2017 00:42:51 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Sep 2017 13:16:45 +0530
Message-Id: <1504597605-18076-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] ell: upgrade SRCREV and move recipes to core
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
X-List-Received-Date: Tue, 05 Sep 2017 07:42:52 -0000

 7b7c15c build: Include check for xxd binary when in maintainer-mode

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 meta-oe/recipes-connectivity/ell/ell_git.bb | 17 -----------------
 meta-oe/recipes-core/ell/ell.inc            | 13 +++++++++++++
 meta-oe/recipes-core/ell/ell_git.bb         |  5 +++++
 3 files changed, 18 insertions(+), 17 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/ell/ell_git.bb
 create mode 100644 meta-oe/recipes-core/ell/ell.inc
 create mode 100644 meta-oe/recipes-core/ell/ell_git.bb

diff --git a/meta-oe/recipes-connectivity/ell/ell_git.bb b/meta-oe/recipes-connectivity/ell/ell_git.bb
deleted file mode 100644
index d259f52..0000000
--- a/meta-oe/recipes-connectivity/ell/ell_git.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY  = "Embedded Linux Library"
-DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
-LICENSE  = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
-SECTION = "libs"
-
-inherit autotools pkgconfig
-
-S = "${WORKDIR}/git"
-SRCREV = "399099946abaeb2f3718a0667cc11436a7c0be14"
-SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
-
-do_configure_prepend () {
-    mkdir ${S}/build-aux
-}
-
-DEPENDS = "dbus"
diff --git a/meta-oe/recipes-core/ell/ell.inc b/meta-oe/recipes-core/ell/ell.inc
new file mode 100644
index 0000000..7bed240
--- /dev/null
+++ b/meta-oe/recipes-core/ell/ell.inc
@@ -0,0 +1,13 @@
+SUMMARY  = "Embedded Linux Library"
+DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
+LICENSE  = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
+SECTION = "libs"
+
+inherit autotools pkgconfig
+
+do_configure_prepend () {
+    mkdir ${S}/build-aux
+}
+
+DEPENDS = "dbus"
diff --git a/meta-oe/recipes-core/ell/ell_git.bb b/meta-oe/recipes-core/ell/ell_git.bb
new file mode 100644
index 0000000..0589809
--- /dev/null
+++ b/meta-oe/recipes-core/ell/ell_git.bb
@@ -0,0 +1,5 @@
+require ell.inc
+
+S = "${WORKDIR}/git"
+SRCREV = "7b7c15c2e5caff88fc45e7a8b874a47196a0eddd"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
-- 
1.9.1


