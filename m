Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9EA4E7D151
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 19:02:06 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id q66so9223824ljq.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 12:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=jpqyDiJbU+5o4kzXSxuPUPMr4NejxiMMYR1JnmsLgAI=;
	b=a9e3NftcB17PM0CqB32n3RNAjhyROkmZ5ScZosm5J7cWGdcHMcem+RP3anuqT4SkfZ
	nmcaGQaARkAf7TKXUtaEJaz1TvsOwtwh8BII1h/t25CQsFWV9UKtbUCoNyNrFtCIYW6v
	zmWSMsoQWbxuAt4FZaRvJ1wSksYEyrzM92eEpuXtlaIp1XOHtOnL+8DvwocgPOFYi6b0
	uRBMKGYLyNvO7imztSrvbRFjzJkCJdHW6vSpjAvP+v1p+0dxL0yIwjywcf/cAHCK9GoC
	JKGJcIz4nQjvK9YimyMEUssVmk1XCnnqv6aun1AE0iKU9pEPBEDNfo+xQW1cgcHn6ANU
	tgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jpqyDiJbU+5o4kzXSxuPUPMr4NejxiMMYR1JnmsLgAI=;
	b=ixGB/yAZrHj95WVIc6Ibk9TaDGNSgAE3r+moRWssSdloOl/xqik/wBqufAsr+fk1M2
	4NhUf5cpDLIlPQsoj4xapt62nNBGUih0ZvmWKem2RNZbNNddzyz2Xf9jWu8mzzU42nhv
	/M6Giuy1U8LNilArd5pIxQ2SjVoNicwhPFtJhlRkRdy5sHl7x4fh2Zlmd+Nfy8QN9e+Q
	nDhoRsyd018t49DKJgfSN61z1h1mvi+OSEHx+jRHFLBYNqUGN1/xSuIko92C9W9wkKOn
	2HH30cZRx2fOY/ZzbWdTXSUuPgsQKfVVyWyNLBKB6rwq0FtxyyILZ0pmvItVWO+CduEM
	YApw==
X-Gm-Message-State: APjAAAWgwBe467AKQNA6WVLZxkUDvjVcs6+txWWDv19MTfts23LCh3hu
	twFjhh/iF++S6Ylrw6r6whwJO2dkDOw=
X-Google-Smtp-Source: APXvYqz7ueB0LuWh3Air1bwR+ePobPlbdJYrCjDIa8xXU+rVjtDPPhN+OMqhdZrVrMxkoBAE73MizQ==
X-Received: by 2002:a2e:99d2:: with SMTP id l18mr27292843ljj.27.1554145326689; 
	Mon, 01 Apr 2019 12:02:06 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	b14sm2387815ljf.53.2019.04.01.12.02.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 12:02:06 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 21:02:02 +0200
Message-Id: <20190401190202.21539-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v3] cronie: update to 1.5.4
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
X-List-Received-Date: Mon, 01 Apr 2019 19:02:07 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../cronie/cronie/crond_pam_config.patch         | 16 ++++++++--------
 .../cronie/{cronie_1.5.2.bb => cronie_1.5.4.bb}  |  6 +++---
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-extended/cronie/{cronie_1.5.2.bb => cronie_1.5.4.bb} (94%)

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
similarity index 94%
rename from meta/recipes-extended/cronie/cronie_1.5.2.bb
rename to meta/recipes-extended/cronie/cronie_1.5.4.bb
index 3abca7f920..d35c6672c4 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.2.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.4.bb
@@ -16,7 +16,7 @@ SECTION = "utils"
 
 UPSTREAM_CHECK_URI = "https://github.com/cronie-crond/${BPN}/releases/"
 
-SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}/cronie-${PV}.tar.gz \
+SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}-final/cronie-${PV}.tar.gz \
            file://crond.init \
            file://crontab \
            file://crond.service \
@@ -25,8 +25,8 @@ SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[md5sum] = "703314f58a49ea136e9966d3937d9bf4"
-SRC_URI[sha256sum] = "370bf34641691489330e708bd4cdbd779267296a030668a12f77b7e36872fd75"
+SRC_URI[md5sum] = "20233b96997e17a142e1fbe0d7ce8223"
+SRC_URI[sha256sum] = "af8970559cad4262f8ffd7ec72abf682d2dcce04fdfb8f206a71d96566aba882"
 
 inherit autotools update-rc.d useradd systemd
 
-- 
2.17.1


