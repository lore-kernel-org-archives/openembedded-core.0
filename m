Return-Path: <abongwabonalais@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69477C47096
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.9253.1649179201675763831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 10:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q0IjA9ys;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: abongwabonalais@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id r13so20343499wrr.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 10:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UXzTCLXZhEf1xFNVE+lf6p2UaWIlKHi3kn88zoe681g=;
        b=q0IjA9ysuIjSWZlCKPs6OAj2eTzXoi41LbxsTGXKH/LFJwnJF127DXwmu4I2itN2z3
         RXlH9kBrSHokZWCjtEk2R2SbBH0M1ED0g6Rt01l5PiJLncVoeH7DTnLRfgTCM+vzn6CL
         LZbjVA/y1SGOk1zlskgs7AU8DidEJA5nZtg9/nOphNQUTVUtJxgdI4Q/9E4GOWHykBRk
         FRTpM0C5kikZ7KovRi46jOZ6TsaxH3QBaMvVoE3RP/6n4Knq3qUG1IrDgoa34yf/qdPg
         gFAVmZz5GgflX+l/vo5d/8qb8lsoaxx2/l2ZRW0YMrw9cMs/zZ+ULX/mBsdnkHTVb9Qp
         iAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UXzTCLXZhEf1xFNVE+lf6p2UaWIlKHi3kn88zoe681g=;
        b=RPx1bfTCpI2ZE1oqzKYEwNh7wAwUd5zeLMiYcCUpfffoYJBZxwnnwymR3gmlDjp+j0
         9qPPb9AaudmQH9gTyuVSoDDtc8kGngQDYha8Z/2CWgkvzCUYaiIAeffpko2DspDxzq6A
         MojuDaZrPyzCkhgMtfCTDEsLsMBkoQcgftPH9DeF2bDi30yPZSPLqSATA6Zpv9Xv99nd
         E71aDyEuAvpe5WgljcpkjX4aCaNNHm8N874EQC/9O6iSQLLp1c+m8/GkRy9IH+EgH/hM
         P3HXDD7HHqItJS3lWtv0f+TLr77dIKHyXYlPVnRHt5c6+8tdLwUw8YBnbVOJReHuWClQ
         2jaw==
X-Gm-Message-State: AOAM530CunHwWaAEbLpwkf7CwrcseH4s20qsMkeQylvaAoYlLyrvfYjB
	XNW/qA9kRUiD6rCqn6GUguk6ChsTNc9JjA==
X-Google-Smtp-Source: 
 ABdhPJxIpkXGa7bkJSUQEc5TYcgwEz6i9mHzzIg98nlK6CyqXP4RfuimVrJbL0VIlHo8TjJ/RVg0DQ==
X-Received: by 2002:adf:c543:0:b0:206:993:8269 with SMTP id
 s3-20020adfc543000000b0020609938269mr3503714wrf.4.1649179199834;
        Tue, 05 Apr 2022 10:19:59 -0700 (PDT)
Received: from localhost.localdomain ([154.72.153.155])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c4ed100b0038ca32d0f26sm2947869wmq.17.2022.04.05.10.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 10:19:59 -0700 (PDT)
From: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
Subject: [PATCH] Added quotes around variables to prevent word splitting in
 the oe-init-build-env/oe-setup-builddir shell scripts.
Date: Tue,  5 Apr 2022 18:17:18 +0100
Message-Id: <20220405171717.54715-1-abongwabonalais@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164050

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


