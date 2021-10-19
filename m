Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54025C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:30 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.11506.1634657669017683241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RZ2T5gbZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id v127so12467663wme.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r4c3MqI92gEqUdu4nce3rUjWtwmVTT/f2J2/iB3ENwE=;
        b=RZ2T5gbZLDWZJO3dksZqoFwo78OlpQCIftzbXd2wWsZ4WzUPpumIlnhdosoKBAplWO
         rJGZ2SWC6JLEtckHmlP+J2PGE++HaDcMtX9CALAduEK4PLuIsSKrVnWY2kFHGPcySh59
         /ar9lJIalXSWpirb0px5+Gi9T4glVSD5fYbbhZQ28rZgSZr6rkpKCY8Inn6YquCdMrrG
         ux4SoPqZI9uAC4UDJE5xfOeQoNWvibnqYZ7TyzAkqa9PUx4rj6GHrV7VzwWD83gaLjER
         QKy+viBAEolTV47Asik0NA1LswsxHiF1fkaCONW82e5shrYWH7d+37abD2hhtFh3Efny
         kHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r4c3MqI92gEqUdu4nce3rUjWtwmVTT/f2J2/iB3ENwE=;
        b=N1JyTzdIbysaQdpjcus7qCURw2zvJFk2cCsinQwiRzieq7foXkAmbMrpD8Hcw6H7KP
         w/Vjr9B0oJ+QDrr6/qySfuM547sua1CsR2yeyTY74xI5u1SP7WRGkjiVFygS6Rg1rtNt
         94DG22SIDId9S/qjamMFg5KsDr4xFT8NWmKQu3i0OMhIUA2LRlncPbhaddy7S/yJdnu8
         IVlz99i9ddFNLiGgnimIFOh8Y2bEx9XwepmTrPZhQ9IL2zDOhbHJjZvZkEUAr0dutEym
         kDAviycAmMLlKIksdD7TArgIbGQCc30SnccDj23xc5HnwEqLzRW1JQflvx+DtG1tYGSo
         LlYg==
X-Gm-Message-State: AOAM533yTchPm0Ux431JLKLE2VhXvF/igikheTBygLoC5020G8tNnGWP
	UFJqETLA71tXyhOXjiiy3u/9ievD24o=
X-Google-Smtp-Source: 
 ABdhPJwBF1wLIwxp3jOc/kqo6WlP6ta2iEGAy5NOukdVYcQ6HROho31lshcUB3/xYJ70qxu++JQQeg==
X-Received: by 2002:a5d:6e07:: with SMTP id h7mr45348529wrz.316.1634657667660;
        Tue, 19 Oct 2021 08:34:27 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 06/65] bluez5: update 5.61 -> 5.62
Date: Tue, 19 Oct 2021 17:33:20 +0200
Message-Id: <20211019153419.3319802-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157125

Drop the patch as issue is addressed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 -
 ...se-funciton-to-avoid-shadowing-glibc.patch | 48 -------------------
 .../bluez5/{bluez5_5.61.bb => bluez5_5.62.bb} |  2 +-
 3 files changed, 1 insertion(+), 50 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-audio-Rename-pause-funciton-to-avoid-shadowing-glibc.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.61.bb => bluez5_5.62.bb} (95%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 68f3b586b8..0a5fc9d4b8 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -53,7 +53,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
-           file://0001-audio-Rename-pause-funciton-to-avoid-shadowing-glibc.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-audio-Rename-pause-funciton-to-avoid-shadowing-glibc.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-audio-Rename-pause-funciton-to-avoid-shadowing-glibc.patch
deleted file mode 100644
index d9067df02d..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-audio-Rename-pause-funciton-to-avoid-shadowing-glibc.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 8adab7f1e04948e78854953f9373cac741445a0f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 30 Apr 2021 21:09:33 -0700
-Subject: [PATCH] audio: Rename pause funciton to avoid shadowing glibc
- defintions
-
-Fixes
-profiles/audio/media.c:1284:13: error: static declaration of 'pause' follows non-static declaration
-static bool pause(void *user_data)
-            ^
-/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/bluez5/5.56-r0/recipe-sysroot/usr/include/unistd.h:478:12: note: previous declaration is here
-extern int pause (void);
-           ^
-../bluez-5.56/profiles/audio/media.c:1334:11: warning: incompatible function pointer types initializing 'bool (*)(void *)' with an expression of type 'int (void)' [-Wincompatible-function-pointer-types]
-        .pause = pause,
-                 ^~~~~
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- profiles/audio/media.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/profiles/audio/media.c b/profiles/audio/media.c
-index c84bbe2..7110089 100644
---- a/profiles/audio/media.c
-+++ b/profiles/audio/media.c
-@@ -1281,7 +1281,7 @@ static bool stop(void *user_data)
- 	return media_player_send(mp, "Stop");
- }
- 
--static bool pause(void *user_data)
-+static bool apause(void *user_data)
- {
- 	struct media_player *mp = user_data;
- 
-@@ -1331,7 +1331,7 @@ static struct avrcp_player_cb player_cb = {
- 	.set_volume = set_volume,
- 	.play = play,
- 	.stop = stop,
--	.pause = pause,
-+	.pause = apause,
- 	.next = next,
- 	.previous = previous,
- };
--- 
-2.31.1
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.61.bb b/meta/recipes-connectivity/bluez5/bluez5_5.62.bb
similarity index 95%
rename from meta/recipes-connectivity/bluez5/bluez5_5.61.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.62.bb
index b2e5dd66a9..411ac8b5a3 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.61.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.62.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "83afd6c52179554bfeabbcb538fec2eb6be90a8ac3c40871b49d7ad8b49c423b"
+SRC_URI[sha256sum] = "38090a5b750e17fc08d3e52178ed8d3254c5f4bd2c48830d5c1955b88e3bc0c2"
 
 # These issues have kernel fixes rather than bluez fixes so exclude here
 CVE_CHECK_WHITELIST += "CVE-2020-12352 CVE-2020-24490"
-- 
2.20.1


