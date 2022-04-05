Return-Path: <abongwabonalais@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0C8C4321E
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:46 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.4550.1649155735651667756
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 03:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IK3e+08N;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: abongwabonalais@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id t19so10318334qtc.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 03:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2TmZvL+X5RBNv8SDppLQlWCdQRInsOt5HDoN10cwCRQ=;
        b=IK3e+08N7pEVGCK2JLYBUMVcE3w78zvQfhp77d6suoKLcMHWmZCzz9peVDF2N1trHX
         Y3e3793+3ygjjsRoXpMwnuNDaBWdiskl9/DbSLVgX2MZfk4bLnTydRFqC4ghmg4uY7/u
         FZoF2Cqqgtc8dvCdMj/riqBjqKHC9A8NG+lGQmdPZWqFg6sPjdl9UHKHwzr18piAzFkf
         BiIKhouFMtCuoZE32CjvTi0tTk/7qRC4iFfksilLOxDN+oImvBLKAy/+F9qu4v1xocRH
         AUGUh3aPY93ys1qMGENmMd25r+GfgAJouXhQCjNJEGbQYWU4cXE7aoh9qfvwVic6LSBR
         3NJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2TmZvL+X5RBNv8SDppLQlWCdQRInsOt5HDoN10cwCRQ=;
        b=NZWd/xnhs8beBrnXS8KSn+RSjAGPwYz8egEBVqnSSAvXaWbYyx3xB5V/9F6v22YOKm
         YMefAE7jLH+kuKcVz7UXs5wnvu7Rplc0p/B2puZzTeEo3PTetlEgo6QoQfqXGeLRM1bV
         C1wDMHno4XX++RF76hUlOnCQ3EIZRsaIdwFEZmKFFBvy64BSElUaEirCiNFoKdOfDq8n
         iJsVhTqAbfwfckshXjAVg9K4BibPRjfXtpP4TgOT7j8kZv1dZeTO0PhW4u7pPiY57WTs
         2LxJUWk2WRQ7dles1q65x1Tj9SytVPmQnNTd6ywONOcScEAhs/jVQvIBO6Y0Js/EJGpY
         pt/Q==
X-Gm-Message-State: AOAM530/IObEQ+vgWjQIyHmchI6Idu+YKbAuKXmp/AuvvOuaWn7IRR2a
	yXTKhunL2CIS3sBfS0GuynMTTuzP52Y=
X-Google-Smtp-Source: 
 ABdhPJwZfoSOoMPFrG1o6qc08flTHhtyk2c/efRz1BLxrnAam1BU1W0frhs3hv3LZ/R8aOD210kJ3g==
X-Received: by 2002:a37:b03:0:b0:67b:2b47:d09f with SMTP id
 3-20020a370b03000000b0067b2b47d09fmr1670374qkl.621.1649155734603;
        Tue, 05 Apr 2022 03:48:54 -0700 (PDT)
Received: from localhost.localdomain ([41.202.219.243])
        by smtp.gmail.com with ESMTPSA id
 bl3-20020a05620a1a8300b0067d4cd00231sm7743293qkb.135.2022.04.05.03.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 03:48:54 -0700 (PDT)
From: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
Subject: [PATCH] Added quotes around variables to prevent word splitting.
Date: Tue,  5 Apr 2022 11:47:05 +0100
Message-Id: <20220405104704.45538-1-abongwabonalais@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164016

Used shellcheck to add quotes to the variables. This is to make sure that 
directories with names that have space between, such as "Desktop/projects/test repo/poky" 
will not be considered as 2 separate words. With this modification, running the command "source oe-init-build-env" will not give the error "bash: oe-init-build-env: No such file or directory"


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


