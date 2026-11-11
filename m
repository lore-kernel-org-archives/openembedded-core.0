Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2748.1794426966815463155
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 11:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=nXAOZ73Q;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so1494483a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 11:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794426966; x=1795031766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzNALlCuEyOZXkk29BwX2+76/gi2S/lfCu3sJPs4DZA=;
        b=nXAOZ73Q5UhW0MqkHA1aiIW3LI6m242RzX1OCs68HZCH+N+O77NK0k2MAMz2lFSDJ7
         jqm1m6+jqrsS0sSMBtsx1JtBv38/C3Hjt5GvACQXSVLsBUT4A2VsiLsQmHmoGUr7mqaB
         Isf7AK/7BFxJs/Xfo2otMOjSxeZ74v4ZD6sctlMi/PN63xdpQi/ahHi9plRMRUm7Av8b
         7WcIzWjJC0zS1TgLoSWsvn9MjkyX0tFumStWSkRvw2+wkabT7rzZKmVkTC4nvSPflq8F
         Do9ExQu0wbWkYsXr3mKaMV3oKU95P9dBXUu+BxikIXw1VIAClKY6Htm3NviYpUGRfFzU
         TWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426966; x=1795031766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzNALlCuEyOZXkk29BwX2+76/gi2S/lfCu3sJPs4DZA=;
        b=hdB6jMo1JO9sjdb0dBAI3cccSJD4Fv7YWS5a/jHbf/heClYS0rCaysYGeMWrwWa5nl
         /cCf1Qje+E3jftSayfATwhQJAqyRk7D6B8nNN/SVRWsi53+WJtgBUgtlYyRuoKT/3X+6
         P86fk7zG4Us7MpzXfyY0AWcAQu8lsDlFit42D6fjAFOLt0nZRx8cibKftHwToNIMpTYn
         zmZQ7gVpni/6sPVzoUJa3sV0DbGtJ2NgbgA7AUUva5MkdZMQ2oIL9Ccdfz6f+McJnJaC
         dZ1QV+RuP+DjZKDsRRZ25ueiOk8GzH8sRlySwYlgnOs8dGvczD/KGcK+4MQ/iL7NAU4R
         AGtQ==
X-Gm-Message-State: APuU4Z+pE1oC72bP1HR42tldMHfxbUGyYYp+IR+aBEJdgF2ZMtzXHsHd
	J23sWICpYvJhM9qMLh0cCstw3dO9TozTXSqXLTWJgj2/SSlhTmXFw8d/qUQbyg==
X-Gm-Gg: AYBFou1O3vXWTzpT+9EsOfzpY0wYHsEn8PmCzOEtD5vfnGqHTpZ9RSSruHlBmKGETRz
	Et5pW0kwYUFqHa+lqHd0XAhTl5gB8ASPUknCF/LL9igUt9sypwdMvJWBP9H4xfckRWnRrkhVIZi
	SMbQ/C+AVZP5A29AZn5nQi3LFr8Vu5Pry6byp9Q6tNEGB/zo1Vkh07gK5ErSOQMCD5RpE8xd0GV
	WGKntkEqHU/7p07EQrIV2h8ThyninDezuur7ChyUvrEqB4+/4T7PGUBYDo/FsgzmifIxLFWoL2z
	y25R4U0of8HfViBw+Z2piX7R8OV7YRVASOn+wftY96GRdwo51ywcOxoiTf9uv+SLckWYRuqIRTy
	qTTsUkVl9MfN6H4o8wOCymiIWHtVqg9uhgBvY1g5hHM57f2wq7BpxEKJdILyRweTcQn7Ag2/GMy
	iM7X/plTvd0hDpLfqNtVws0ia/KL/i+U6gXwwrWQ98/CcZMdu1wU7tb6vlXjkyXskiuTU/bcvPj
	gPzbehm47JanAfyrPV1qaWuAD2Ectdp1GpgVEwaKbS27ScHRR8pkkrCdLu64PA2uhK6qpDe4P1Q
	A7KCTHgyz0yvz4x47w7x6tAci0Mb3/KgOJWnGOzc3sD7ehc3CXNxzQSPVzFowIM=
X-Received: by 2002:a17:90b:2f07:b0:3b0:a970:caad with SMTP id 98e67ed59e1d1-3b182f26e50mr3427330a91.28.1794426965802;
        Wed, 11 Nov 2026 11:56:05 -0800 (PST)
Return-Path: <bbnpreetsingh@gmail.com>
Received: from localhost.localdomain ([108.180.159.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c771aesm682648a91.12.2026.11.11.11.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:56:05 -0800 (PST)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH] oe-init-build-env: fix unbound variable errors under 'set -u'
Date: Wed, 11 Nov 2026 19:56:04 +0000
Message-ID: <20261111195604.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 19:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250051
Content-Type: text/plain; charset="utf-8"

Sourcing oe-init-build-env from a shell running with 'set -u' fails:

  ./oe-init-build-env: line 29: BBSERVER: unbound variable

Give the variables that may be unset an explicit empty default, here
and in oe-buildenv-internal.

[YOCTO #15469]

Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 oe-init-build-env            | 14 +++++++-------
 scripts/oe-buildenv-internal | 22 +++++++++++-----------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index 5a2bd0f4d9..660c6ad02e 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -14,9 +14,9 @@
 # when being sourced.  To workaround the shell limitation use "set <builddir>"
 # prior to sourcing this script.
 #
-if [ -n "$BASH_SOURCE" ]; then
+if [ -n "${BASH_SOURCE:-}" ]; then
     THIS_SCRIPT=$BASH_SOURCE
-elif [ -n "$ZSH_NAME" ]; then
+elif [ -n "${ZSH_NAME:-}" ]; then
     THIS_SCRIPT=$0
 else
     THIS_SCRIPT="$(pwd)/oe-init-build-env"
@@ -26,16 +26,16 @@ else
         exit 1
     fi
 fi
-if [ -n "$BBSERVER" ]; then
+if [ -n "${BBSERVER:-}" ]; then
     unset BBSERVER
 fi
 
-if [ -z "$ZSH_NAME" ] && [ "$0" = "$THIS_SCRIPT" ]; then
+if [ -z "${ZSH_NAME:-}" ] && [ "$0" = "$THIS_SCRIPT" ]; then
     echo "Error: This script needs to be sourced. Please run as '. $THIS_SCRIPT'" >&2
     exit 1
 fi
 
-if [ -z "$OEROOT" ]; then
+if [ -z "${OEROOT:-}" ]; then
     OEROOT=$(dirname "$THIS_SCRIPT")
     OEROOT=$(readlink -f "$OEROOT")
 fi
@@ -43,12 +43,12 @@ unset THIS_SCRIPT
 
 export OEROOT
 . "$OEROOT"/scripts/oe-buildenv-internal &&
-    TEMPLATECONF="$TEMPLATECONF" "$OEROOT"/scripts/oe-setup-builddir || {
+    TEMPLATECONF="${TEMPLATECONF:-}" "$OEROOT"/scripts/oe-setup-builddir || {
     unset OEROOT
     return 1
 }
 
 unset OEROOT
 
-[ -z "$BUILDDIR" ] || cd "$BUILDDIR"
+[ -z "${BUILDDIR:-}" ] || cd "$BUILDDIR"
 
diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 2fdb19565a..6b2e4ea518 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -19,12 +19,12 @@ if ! $(return >/dev/null 2>&1) ; then
 fi
 
 # It is assumed OEROOT is already defined when this is called
-if [ -z "$OEROOT" ]; then
+if [ -z "${OEROOT:-}" ]; then
     echo >&2 "Error: OEROOT is not defined!"
     return 1
 fi
 
-if [ -z "$OE_SKIP_SDK_CHECK" ] && [ -n "$OECORE_SDK_VERSION" ]; then
+if [ -z "${OE_SKIP_SDK_CHECK:-}" ] && [ -n "${OECORE_SDK_VERSION:-}" ]; then
     echo >&2 "Error: The OE SDK/ADT was detected as already being present in this shell environment. Please use a clean shell when sourcing this environment script."
     return 1
 fi
@@ -39,8 +39,8 @@ if [ "$py_v38_check" != "True" ]; then
 fi
 unset py_v38_check
 
-if [ -z "$BDIR" ]; then
-    if [ -z "$1" ]; then
+if [ -z "${BDIR:-}" ]; then
+    if [ -z "${1:-}" ]; then
         BDIR="build"
     else
         BDIR="$1"
@@ -61,7 +61,7 @@ if [ -z "$BDIR" ]; then
             return 1
         fi
     fi
-    if [ -n "$2" ]; then
+    if [ -n "${2:-}" ]; then
         BITBAKEDIR="$2"
     fi
 fi
@@ -72,9 +72,9 @@ else
 fi
 unset BDIR
 
-if [ -z "$BITBAKEDIR" ]; then
-    BITBAKEDIR="$OEROOT/bitbake$BBEXTRA"
-    test -d "$BITBAKEDIR" || BITBAKEDIR="$OEROOT/../bitbake$BBEXTRA"
+if [ -z "${BITBAKEDIR:-}" ]; then
+    BITBAKEDIR="$OEROOT/bitbake${BBEXTRA:-}"
+    test -d "$BITBAKEDIR" || BITBAKEDIR="$OEROOT/../bitbake${BBEXTRA:-}"
 fi
 
 BITBAKEDIR=$(readlink -f "$BITBAKEDIR")
@@ -89,11 +89,11 @@ if [ ! -d "$BITBAKEDIR" ]; then
 fi
 
 # Add BitBake's library to PYTHONPATH
-PYTHONPATH=$BITBAKEDIR/lib:$PYTHONPATH
+PYTHONPATH=$BITBAKEDIR/lib:${PYTHONPATH:-}
 export PYTHONPATH
 
 # Remove any paths added by sourcing this script before
-[ -n "$OE_ADDED_PATHS" ] && PATH=$(echo $PATH | sed -e "s#$OE_ADDED_PATHS##") ||
+[ -n "${OE_ADDED_PATHS:-}" ] && PATH=$(echo $PATH | sed -e "s#$OE_ADDED_PATHS##") ||
     PATH=$(echo $PATH | sed -e "s#$OEROOT/scripts:$BITBAKEDIR/bin:##")
 
 # Make sure our paths are at the beginning of $PATH
@@ -114,6 +114,6 @@ SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
 SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR BBPATH_EXTRA BB_SETSCENE_ENFORCE \
 BB_LOGCONFIG"
 
-BB_ENV_PASSTHROUGH_ADDITIONS="$(echo $BB_ENV_PASSTHROUGH_ADDITIONS $BB_ENV_PASSTHROUGH_ADDITIONS_OE | tr ' ' '\n' | LC_ALL=C sort --unique | tr '\n' ' ')"
+BB_ENV_PASSTHROUGH_ADDITIONS="$(echo ${BB_ENV_PASSTHROUGH_ADDITIONS:-} $BB_ENV_PASSTHROUGH_ADDITIONS_OE | tr ' ' '\n' | LC_ALL=C sort --unique | tr '\n' ' ')"
 
 export BB_ENV_PASSTHROUGH_ADDITIONS
-- 
2.43.0

