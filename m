Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 446547D151
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 18:41:13 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id a6so7075737lfl.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 11:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=GQZ24bYzzfG4QukmBhs9WZrE03MQONxD3zXL43GIH7U=;
	b=XrPD4T/ZHCFVHPcvBPLVp3Lz0KQDUEu1/+tnkNaub0zxvWEvtSAk6b0TTIJWoyAOgd
	/kWYVsfurKW52Pbah6vcSoQabrLCENO/Todj47hpkBf6CVPQdtTQMFdReG25sKHheD+X
	qOurr3Ms+raulFSlzws/wzhYT1z1wQLGisC0xfbt+MDhfOy1pKW0y4fo8W1DBx2AkMnM
	vf0QsF18agiS/3VtlmxfzvA3dcp06r8YBzattxoU22AD5RyeTuVmmF/QoXQf21xfn6c8
	yrYRsIMrxT7GCy1boDPDyRLFRyO/0UYGmjhiTAnzmq5UtrbXnP1EXaWhipgo1hh8UsXG
	pA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GQZ24bYzzfG4QukmBhs9WZrE03MQONxD3zXL43GIH7U=;
	b=VIQjEUe/hH7sbPfEhM6+cfIxc870Pfn2FwAOHYnhwWP8s8jeCPIv/zmmGaH0PuUsXp
	E0L5KXYo4HN25nZd48bZPsQPP9+aEoECrU+39tdfrWqB7CGndtJjK4iwvtTkyk0poBEz
	z6QSNX+StDdZuTxyeuvAQlpSWL/5PlrVwtY4qQOlJAcEcsm8pUT3lvn20Q5hSDrfjnMp
	SegkD3iv5UvPTukrIzLmKCWtQ8B8Pf+R89czAx89k/fKI38xQtFb+PH1vxpickWr3C9V
	/ZJY3hxXYO8QneUmvIwuDI7SwvsloncDvJjDnplKcqPELG6B6VcG2CVryqJ764WYwiSR
	Z/Ew==
X-Gm-Message-State: APjAAAXYjRZsFHvfbaUF4fr8DFVlh2TWAhWKyyQqPUKFmRkKPHGjA/Qd
	0d2ZwZq3HVrrZplSWQIgSf/grbjo5kI=
X-Google-Smtp-Source: APXvYqwCrkNC07gSowhAuIgOhDhiwqC8nV4MxFnHUTmA181RPcScfqB4XTRSt/qBMuLBC/O+JzySpQ==
X-Received: by 2002:ac2:5325:: with SMTP id f5mr23501544lfh.77.1554144073695; 
	Mon, 01 Apr 2019 11:41:13 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id r2sm2309331ljd.16.2019.04.01.11.41.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 11:41:12 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 20:41:10 +0200
Message-Id: <20190401184110.11186-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] cronie: update to 1.5.4
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
X-List-Received-Date: Mon, 01 Apr 2019 18:41:14 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../cronie/cronie/crond_pam_config.patch         | 16 ++++++++--------
 .../cronie/{cronie_1.5.2.bb => cronie_1.5.4.bb}  | 10 ++++------
 2 files changed, 12 insertions(+), 14 deletions(-)
 rename meta/recipes-extended/cronie/{cronie_1.5.2.bb => cronie_1.5.4.bb} (89%)

diff --git a/meta/recipes-extended/cronie/cronie/crond_pam_config.patch b/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
index 6c928165cd..c374790d1d 100644
--- a/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
+++ b/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
@@ -4,19 +4,19 @@ configure files instead.
 Upstream-Status: Pending
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-Index: cronie-1.5.1/pam/crond
-===================================================================
---- cronie-1.5.1.orig/pam/crond
-+++ cronie-1.5.1/pam/crond
+diff --git a/pam/crond b/pam/crond
+index 560529d..95a6457 100644
+--- a/pam/crond
++++ b/pam/crond
 @@ -4,8 +4,8 @@
  #
  # Although no PAM authentication is called, auth modules
  # are used for credential setting
--auth       include    password-auth
+-auth       include    system-auth
 +auth       include    common-auth
  account    required   pam_access.so
--account    include    password-auth
-+account    include    common-account
+-account    include    system-auth
++account    include    common-auth
  session    required   pam_loginuid.so
--session    include    password-auth
+-session    include    system-auth
 +session    include    common-session-noninteractive
diff --git a/meta/recipes-extended/cronie/cronie_1.5.2.bb b/meta/recipes-extended/cronie/cronie_1.5.4.bb
similarity index 89%
rename from meta/recipes-extended/cronie/cronie_1.5.2.bb
rename to meta/recipes-extended/cronie/cronie_1.5.4.bb
index 3abca7f920..e16b5d49cc 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.2.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.4.bb
@@ -16,17 +16,15 @@ SECTION = "utils"
 
 UPSTREAM_CHECK_URI = "https://github.com/cronie-crond/${BPN}/releases/"
 
-SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}/cronie-${PV}.tar.gz \
+SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}-final/cronie-${PV}.tar.gz \
            file://crond.init \
            file://crontab \
-           file://crond.service \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+           file://crond.service"
 
-PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[md5sum] = "703314f58a49ea136e9966d3937d9bf4"
-SRC_URI[sha256sum] = "370bf34641691489330e708bd4cdbd779267296a030668a12f77b7e36872fd75"
+SRC_URI[md5sum] = "20233b96997e17a142e1fbe0d7ce8223"
+SRC_URI[sha256sum] = "af8970559cad4262f8ffd7ec72abf682d2dcce04fdfb8f206a71d96566aba882"
 
 inherit autotools update-rc.d useradd systemd
 
-- 
2.17.1


