Return-Path: <abongwabonalais@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C395EC433FE
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:46 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.4347.1649153291405122056
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 03:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c8HwTbVY;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: abongwabonalais@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id j21so10244488qta.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 03:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JF/+3L86whCSnc+Vi2Vm/ZUxKog6ghTzz3EkahWNX+g=;
        b=c8HwTbVYOsmXngcaxpz9eZFO/GifLSb2sRHd1ATdnjf1gEIkQSIlRSUccUhVNAs8Vb
         m8ALh/bNUd+s7+AY8YKTGUKxbyjSJ1Umu0Fad47DuY8l9P8NfjwOXo7Mxw0m3rvCGXQ/
         TAa7ndCEvd5jEMb3BLLKLoJHCZktVZ1/lDuD07YmFAkpXVRoM8m4qEVHTF5ZCyGK9IbT
         tBwwQRv1TS84oju/HQNyPBwNRonNlh5/bh3louj+HI3yYjnqTBtaClt1pATurnn9qfnf
         N8xX9smQoYgVUHsxXpqcu9WtC29Zwbxz0GNxsjkZT6diYL5DymTt5bbHcfWSqZI3QXAu
         THyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JF/+3L86whCSnc+Vi2Vm/ZUxKog6ghTzz3EkahWNX+g=;
        b=UQ7rzMp64wVpWgvy/cyntQGHa57nXvBiFz6JeDZYXEypUSwXEuY7kGgH9WVsBHRU0R
         av1GJAfzZDkDhuwJ0jByIgjTAj9/JvqMyy+Ewp8xCsHDUBcNc+eAJjaodO1QXPwtpOgQ
         MjtEHLQmZL7EYK8k+z5KgmoKkGMR+eJKLY91xlGYbNFHYu81hWAxrocKk3D7idX2AxrY
         zVDmwEylZergEEXSku2qbhkJ6yrHDPZvVKqsPi0qfHjMjUL9FJiIcHFJzp9b616c5YdK
         rH+noxqFlObsRXzhoV52KtqJOyurEq/G5fQN5Y0OSBgt+Hp5F/YzWZDQq62MVuid+ySn
         Hw8w==
X-Gm-Message-State: AOAM532nk9Woki8CoHP3UncmOJUhV2PC2oATtA79JBjp2WvNSqTQOWpQ
	1wOx2tlZSTlLz0DBNs0/dXE+mptGo4g=
X-Google-Smtp-Source: 
 ABdhPJwfctIDAXJN7EQDc6hj9vFGS3FcDZAxTtTeMPIsBw0SiaPtD7IW+VmtNhXFv5IIiORK31ry0g==
X-Received: by 2002:a05:622a:4c:b0:2eb:8c6d:59dc with SMTP id
 y12-20020a05622a004c00b002eb8c6d59dcmr2110335qtw.210.1649153290409;
        Tue, 05 Apr 2022 03:08:10 -0700 (PDT)
Received: from localhost.localdomain ([41.202.219.243])
        by smtp.gmail.com with ESMTPSA id
 t7-20020a05622a01c700b002e1b3555c2fsm10242777qtw.26.2022.04.05.03.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 03:08:10 -0700 (PDT)
From: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
Subject: [PATCH] Added quotes around variables to prevent word splitting.
Date: Tue,  5 Apr 2022 10:58:35 +0100
Message-Id: <20220405095834.43554-1-abongwabonalais@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164014

Used shellcheck to add quotes to the variables that did not have so that 
directories with names that have space between, such as "Desktop/projects/test repo/poky" 
will not be considered as 2 separate words.

Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
---
 oe-init-build-env         | 4 ++--
 scripts/oe-setup-builddir | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index 8c1bd54e57..38333ab858 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -42,8 +42,8 @@ fi
 unset THIS_SCRIPT
 
 export OEROOT
-. $OEROOT/scripts/oe-buildenv-internal &&
-    TEMPLATECONF="$TEMPLATECONF" $OEROOT/scripts/oe-setup-builddir || {
+. "$OEROOT"/scripts/oe-buildenv-internal &&
+    TEMPLATECONF="$TEMPLATECONF" "$OEROOT"/scripts/oe-setup-builddir || {
     unset OEROOT
     return 1
 }
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index d4ac074ad9..54048e62ec 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -42,7 +42,7 @@ if [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
     TEMPLATECONF=$(cat "$BUILDDIR/conf/templateconf.cfg")
 fi
 
-. $OEROOT/.templateconf
+. "$OEROOT"/.templateconf
 
 if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
     echo "$TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"
@@ -79,7 +79,7 @@ example, select a different MACHINE (target hardware). See conf/local.conf
 for more information as common configuration options are commented.
 
 EOM
-    cp -f $OECORELOCALCONF "$BUILDDIR/conf/local.conf"
+    cp -f "$OECORELOCALCONF" "$BUILDDIR/conf/local.conf"
     SHOWYPDOC=yes
 fi
 
@@ -100,7 +100,7 @@ EOM
     # to replace it for compatibility.
     sed -e "s|##OEROOT##|$OEROOT|g" \
         -e "s|##COREBASE##|$OEROOT|g" \
-        $OECORELAYERCONF > "$BUILDDIR/conf/bblayers.conf"
+        "$OECORELAYERCONF" > "$BUILDDIR/conf/bblayers.conf"
     SHOWYPDOC=yes
 fi
 
@@ -125,5 +125,5 @@ fi
 if [ -z "$OECORENOTESCONF" ]; then
     OECORENOTESCONF="$OEROOT/meta/conf/conf-notes.txt"
 fi
-[ ! -r "$OECORENOTESCONF" ] || cat $OECORENOTESCONF
+[ ! -r "$OECORENOTESCONF" ] || cat "$OECORENOTESCONF"
 unset OECORENOTESCONF
-- 
2.25.1


