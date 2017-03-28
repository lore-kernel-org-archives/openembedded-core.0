Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1F0B171A21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 16:15:24 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o81so562262wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=e68Mu9YaPcx1Rat0aqFZtDqkzOtQ1TkFVPzxoG3d1+g=;
	b=jruF0tCpEdpvKYwZS6WRUIOWNZHbkP0M4d2VZGflazhZSKFG5VThlxIxOTggg7Fs2O
	Pv5d6SRbUKTZ/4cS02NMM9nLMvHVyHlalVO8DxdABZqceZZ0W30v94N7VrhLjXLN3ioC
	1ms6j3IQEsssTX1KxBybrJx330QlJ8hIGLuKrbzxjar5tfJAlzkUJ+JTNlYx0Pfg276z
	XPi+H/PFgljoGmXpasgL+Cxq4DBhEv7XmfT1ouqSq4SO86eJRn4YzUIeSAFW5RUylfH3
	U0W6eznSoyjEXdDwlRiSxop41TkJ0YQ+wA23ybtG2bGWDtwItuzL3/qh4KNQwQ1FHyX/
	aPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=e68Mu9YaPcx1Rat0aqFZtDqkzOtQ1TkFVPzxoG3d1+g=;
	b=PC3EhPMui2Hy1V9mQkSBcnpwG+nPPkntRuuDJhUJAP9zKe3ztAmISJYHdSMQrXt077
	uODfFoTItBYrk33vsIJXCDI8Jg2MqwHpz/gkalHeEd5/wgE6OtDkB1tiOcj8JUGrUCiL
	fDtWww8+Xl8SOuCIEYxlAszcf0eKiajpUKFeQynX0A6giGIL53ihTzZO/uRugg5AqSNH
	zc0CE6fe3nSdktwqvt/I1bRw2NOzAvob0yvI9W0cJ5p4fDn5bhMEPQWUqoKTggEeztke
	eUcsbZRFN7LMyOpxsyrIkuWHFPGgzsaJlCuaDrAECa4E6saksqt+taIJ5X0mnqZIq+Wz
	0InA==
X-Gm-Message-State: AFeK/H0++6lP5ZUjsZjX9I4f88ZMRtp7oJnOP5y8+B/BGZmMaA+bfbv2Q70pQdFX13fsPw==
X-Received: by 10.28.170.206 with SMTP id t197mr15671831wme.61.1490717725241; 
	Tue, 28 Mar 2017 09:15:25 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	a18sm5462946wrc.58.2017.03.28.09.15.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Mar 2017 09:15:24 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 21:14:56 +0500
Message-Id: <571fe26dcf1d704cc97e834b19adb51b782b4cca.1490717618.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1490717618.git.chris_larson@mentor.com>
References: <cover.1490717618.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] systemd-boot: write startup.nsh
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
X-List-Received-Date: Tue, 28 Mar 2017 16:15:25 -0000

From: Christopher Larson <chris_larson@mentor.com>

This aligns with the behavior of grub-efi and gummiboot, and is needed to fix
auto-boot of intel-corei7-64 for non-GPLv3 builds.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/systemd-boot.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 6d002c0e4e..4e69a2c6b5 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -37,6 +37,8 @@ efi_populate() {
         install -d ${DEST}/loader
         install -d ${DEST}/loader/entries
         install -m 0644 ${DEPLOY_DIR_IMAGE}/${EFI_IMAGE} ${DEST}${EFIDIR}/${DEST_EFI_IMAGE}
+        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
+        printf 'fs0:%s\%s\n' "$EFIPATH" "$DEST_EFI_IMAGE" >${DEST}/startup.nsh
         install -m 0644 ${SYSTEMD_BOOT_CFG} ${DEST}/loader/loader.conf
         for i in ${SYSTEMD_BOOT_ENTRIES}; do
             install -m 0644 ${i} ${DEST}/loader/entries
-- 
2.11.1


