Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id A0A2071971
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 18:39:14 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 1so3937515pgz.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 10:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Pk5B7KPJs/HNd0DoxtSs4JE6EY0wJsPvXDK+i3C+ul0=;
	b=UhWpg95q7nSA0rwj1KTYTe55xp4LG3LqjtfwIlfga8lfjot3YJ9AGP2tEoaleTmoMd
	PzQIDOQPKuBNVKHbE6XsoeQzYoDfF/Skwp9zzUsfb6NfCDGbwpYEWDQBGujUAo1/m1CX
	OU2gnYFQdkQWOG+watkQx2UIHeO6EnuC1ynOCFYjqmz9r/rce3v5lHMtBPf/L5Q8aX14
	iAcIX12Rk/QkwQCRhCmUEgMQ4Sb6uxGxKXJM7NsbMt7gIysFJ5sRk3ISsciWw/ROjTSQ
	/08VpBa5IQ45j/ElKfxrJ/P9Br0E4RzjCovIPGiPK4cRYbLPKXLgD0K8eNQSw1OQlJWL
	IklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Pk5B7KPJs/HNd0DoxtSs4JE6EY0wJsPvXDK+i3C+ul0=;
	b=qYvR0zRZuPQPqW1xLEYrkT0/ddnto+M+xJPPnIKaZzrdpenXTUtJnDzeMVtheFxSmG
	nvKs+yzLuu7ovZi+fE0RAYKw01z95SEadu5fhQyImUuoGV5475jYlrQkFE/yUQptVwd7
	iU4JTEtFMeuE8peoxBk+GIdwGWyVzKQzsHOCymNrALwlV4px8heA4jnIcLq611R5XP9S
	6yXy3kjzndW6wZM2xibjjNpFywnNzIyt9JFRXVvR0gyzQ07NhtTuFeD1EmXTPkQHAdtJ
	UKT9dFAY2d3z/T85qLe0RgonSRBMWUVecMyX3jBziWbDAnjj+m0OLQQ4D1yCLVgb/gJO
	MRVQ==
X-Gm-Message-State: AMke39mqBhr2t4fFWu5SdQ19HLFMDka4Y7sMmKK4bHNPYopYwmowb6Q1QWTDaTt3e7y3XA==
X-Received: by 10.84.209.194 with SMTP id y60mr5744480plh.115.1487961555575;
	Fri, 24 Feb 2017 10:39:15 -0800 (PST)
Received: from localhost.localdomain ([180.151.211.39])
	by smtp.gmail.com with ESMTPSA id
	a24sm16431528pfh.33.2017.02.24.10.39.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 10:39:14 -0800 (PST)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Feb 2017 00:12:19 +0530
Message-Id: <1487961739-4548-1-git-send-email-ankit.tarot@gmail.com>
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
X-List-Received-Date: Fri, 24 Feb 2017 18:39:14 -0000

Add generic recipe for ELL.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 meta/recipes-core/ell/ell_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/recipes-core/ell/ell_git.bb

diff --git a/meta/recipes-core/ell/ell_git.bb b/meta/recipes-core/ell/ell_git.bb
new file mode 100644
index 0000000..d259f52
--- /dev/null
+++ b/meta/recipes-core/ell/ell_git.bb
@@ -0,0 +1,17 @@
+SUMMARY  = "Embedded Linux Library"
+DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
+LICENSE  = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
+SECTION = "libs"
+
+inherit autotools pkgconfig
+
+S = "${WORKDIR}/git"
+SRCREV = "399099946abaeb2f3718a0667cc11436a7c0be14"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
+
+do_configure_prepend () {
+    mkdir ${S}/build-aux
+}
+
+DEPENDS = "dbus"
-- 
1.9.1


