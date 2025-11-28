Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DBF9D116F1
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 13:26:20 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15911.1764336378306490386
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 05:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=EKD8C+I8;
 spf=pass (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=4204b036a=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1764336378; x=1795872378;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=65NLeBjp0Qel04utrhSaQjhvFcegOnBwLqj3bU4p6mM=;
  b=EKD8C+I8IEGozhZNmfucYTpLSLQInH12m8cZylpEgqBT7GOUQcD+9oRq
   35/gYjrzXnx2AEAzVE+jKluEOsRIFWNQcJ3aOM4c9j4xo3UifPiwBdSNj
   zLFka6wnwX7G7TPgPLd8Euhg8li9AfEdpAsbKqpJfSyU3jvFLO/zE/joO
   k=;
X-CSE-ConnectionGUID: P16bgSvKRxeqUpVWWct/Ag==
X-CSE-MsgGUID: IP0ixjmmSZmY/MgtDln9bQ==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 28 Nov 2025 14:26:16 +0100
Received: from unknown (HELO esabb6.muc) ([10.31.187.137]) by esagw4.muc with
 ESMTP/TLS; 28 Nov 2025 14:26:16 +0100
Received: from smucmp19e.bmwgroup.net (HELO smucmp19e.europe.bmw.corp)
 ([10.30.13.171]) by esabb6.muc with ESMTP/TLS; 28 Nov 2025 14:26:17 +0100
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp19e.europe.bmw.corp (2a03:1e80:a15:58f::1:6d) with Microsoft SMTP
 Server (version=TLS; Fri, 28 Nov 2025 14:26:16 +0100
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Fri, 28 Nov 2025 14:26:16 +0100
X-CSE-ConnectionGUID: etH793hCT+OYHj8YEWqcuQ==
X-CSE-MsgGUID: lrlDVcJOQd6iQlQGQYY4rw==
X-CSE-ConnectionGUID: WswBZb88RWuQ4uNR7YMZug==
X-CSE-MsgGUID: Ydi0G87QSTiOFQNswj0KhQ==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] recipes: Fix typos in CA bundle environment setup files
Date: Fri, 28 Nov 2025 14:25:51 +0100
Message-ID: <20251128132551.2982578-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp17d.europe.bmw.corp (2a03:1e80:a15:58f::1:66) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 13:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226907

Fix a number of identical typos in comments in three environment setup files.
---
 .../recipes-connectivity/openssl/files/environment.d-openssl.sh | 2 +-
 meta/recipes-devtools/git/git/environment.d-git.sh              | 2 +-
 .../python/python3-requests/environment.d-python3-requests.sh   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index 0e75e34f9d..77747c1fda 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -4,7 +4,7 @@ export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
 export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"
 
 # Respect host env SSL_CERT_FILE/SSL_CERT_DIR first, then auto-detected host cert, then cert in buildtools
-# CAFILE/CAPATH is auto-deteced when source buildtools
+# CAFILE/CAPATH is auto-detected when source buildtools
 if [ -z "${SSL_CERT_FILE:-}" ]; then
 	if [ -n "${CAFILE:-}" ];then
 		export SSL_CERT_FILE="$CAFILE"
diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/meta/recipes-devtools/git/git/environment.d-git.sh
index fdfa721c3b..6b4d941e79 100644
--- a/meta/recipes-devtools/git/git/environment.d-git.sh
+++ b/meta/recipes-devtools/git/git/environment.d-git.sh
@@ -1,5 +1,5 @@
 # Respect host env GIT_SSL_CAINFO/GIT_SSL_CAPATH first, then auto-detected host cert, then cert in buildtools
-# CAFILE/CAPATH is auto-deteced when source buildtools
+# CAFILE/CAPATH is auto-detected when source buildtools
 if [ -z "${GIT_SSL_CAINFO:-}" ]; then
 	if [ -n "${CAFILE:-}" ];then
 		export GIT_SSL_CAINFO="$CAFILE"
diff --git a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
index 400972814b..5be7a3a9ad 100644
--- a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
+++ b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
@@ -1,5 +1,5 @@
 # Respect host env REQUESTS_CA_BUNDLE first, then auto-detected host cert, then cert in buildtools
-# CAFILE/CAPATH is auto-deteced when source buildtools
+# CAFILE/CAPATH is auto-detected when source buildtools
 if [ -z "${REQUESTS_CA_BUNDLE:-}" ]; then
 	if [ -n "${CAFILE:-}" ];then
 		export REQUESTS_CA_BUNDLE="$CAFILE"

