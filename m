Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 971E17199A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 15:57:06 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id z128so3481277pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 07:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3de86VQWNFlU8Oph9HDNcs6qP8KuCjo/YhnCmTi0/iU=;
	b=SC6FHiG2FznSGoIkYlnaakliThJIyc+K/5iYOKNOs9i29P39UZ3rbPVIkEmeuL/hCZ
	DeQQ6TPX7dfTd+nzqurPbl4Cbzt7vr1LJ2WfJ6TfLeLdqlgvE9fN1zXwmKxdGplcCFEg
	OrI2w505Eu5y1FuuiDt5a80T8ZrGF4Qb5iv7adNH+y1bs+fMm38gjrKZ0f2Q9nJCtwLU
	U9cYYuB8fuxeFAX5mAQ1yOBX6G0eM6MMuz6hYxcWHABdSYOLvPHBovmMHN86drx7eRgH
	2CcfKBX2KVk7/aYFu3bGVRHMtTG6lcLYnJYV3HA6zdVmZoEJKXRZEq1AumBfGsBe5GJ7
	73UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3de86VQWNFlU8Oph9HDNcs6qP8KuCjo/YhnCmTi0/iU=;
	b=N+aSOQiBV5qMK3Q7yeWhsA94LSM3t4yaYAH/zSWNODDMIvpp/WwAqa7NR0umI+VV1y
	7YpeuLn6GDceVoR5rI1TkTdW7FaqnP7lIZGetb55K2kg6aHNg3mpG0uhhn+49/uSsNG8
	XhiIkajh40jY+/96aUji243ywgi8gz+ESTDgGl2rBAvDBhxrDrFQb6O9nvXqthRgb76+
	DuMQ2m4DVhN0AW9uJ1JfYlxw6T2dcpopP6SFvPOnU+6hKZIcsB3a1HN65CtuRuOLrWXK
	qmsc2KmpvZvffU9iKrh/Q06gnUKJc5GcmJjUkHc8g+n+iglmyh3pcAJwffBpX0+k8jrp
	e2Og==
X-Gm-Message-State: AMke39l+/Tg3Cj4zwMDiSIIOM8Aopy7/s81BQcfaFV4Uj5DrkyqFHhLsE2cJNfBlKukLmw==
X-Received: by 10.99.60.24 with SMTP id j24mr4324354pga.32.1487951827402;
	Fri, 24 Feb 2017 07:57:07 -0800 (PST)
Received: from localhost.localdomain ([180.151.211.39])
	by smtp.gmail.com with ESMTPSA id
	o66sm15856581pfa.119.2017.02.24.07.57.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 07:57:06 -0800 (PST)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2017 21:30:31 +0530
Message-Id: <1487952031-3996-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] ell: Initial recipe for Embedded Linux Library
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
X-List-Received-Date: Fri, 24 Feb 2017 15:57:08 -0000

Based on the ofono recipe, add ell.inc for generic recipe components
and use it from ell_git.bb.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 meta/recipes-core/ell/ell.inc    | 10 ++++++++++
 meta/recipes-core/ell/ell_git.bb |  9 +++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-core/ell/ell.inc
 create mode 100644 meta/recipes-core/ell/ell_git.bb

diff --git a/meta/recipes-core/ell/ell.inc b/meta/recipes-core/ell/ell.inc
new file mode 100644
index 0000000..b5e185e
--- /dev/null
+++ b/meta/recipes-core/ell/ell.inc
@@ -0,0 +1,10 @@
+SUMMARY  = "Embedded Linux Library"
+DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
+LICENSE  = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
+SECTION = "libs"
+
+inherit autotools pkgconfig
+
+DEPENDS  = "dbus"
+RDEPENDS_${PN} += "dbus"
diff --git a/meta/recipes-core/ell/ell_git.bb b/meta/recipes-core/ell/ell_git.bb
new file mode 100644
index 0000000..fd438be
--- /dev/null
+++ b/meta/recipes-core/ell/ell_git.bb
@@ -0,0 +1,9 @@
+require ell.inc
+
+S = "${WORKDIR}/git"
+SRCREV = "399099946abaeb2f3718a0667cc11436a7c0be14"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
+
+do_configure_prepend () {
+    ${S}/bootstrap
+}
-- 
1.9.1


