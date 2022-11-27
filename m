Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6E5C46467
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:13 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.91892.1669557369894561445
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:56:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7A+R6PD/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 136so7734728pga.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6v8g2yXv4xzZ67CQbSOhV9E8GGoME6XGYDaA31ZONU=;
        b=7A+R6PD//oawoQvCoCOYLdM1I5VKStkN2D5gbZZWFchWleX1QOsZDtBtQEMobia5U+
         IHqMjoAqJp3SHHcErFynTxX+COQ2j8Q4TIUCAZYpitam578aaZFTmkgULkdTBxSkNHWK
         rNVEZNIbCmePuqfnkuXdQY+XP6SttjyZSK8FilWWleqMBZUG8gMvEilZGi2SZ9BS8ktB
         z9aSzUjvU03I2AzkQ0NbyjGrOH7JiipYQ92YpMLNE/DXmok7rD4dABvVfD1m/s2Y9OR0
         3jMZv3Ktl4CfX3KkR53Qm1Rrf263e8vcJ1ugMGZFA2uG76U3mlS+1BoUTOgH8yS327u0
         O4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6v8g2yXv4xzZ67CQbSOhV9E8GGoME6XGYDaA31ZONU=;
        b=eDuQv0kXnhi6cZOPwmW4tJqMyUKJxE0+nU2NMo9cJ6OtGje+IrpeEdzZITEyMpEuAH
         79NDHpMg3HjK6q8kG/6VCugHatF+Jg3lLXPQ/jLtAdy5pC/8q94W7IKxgniRImFCUwb4
         TwqLWURkBG8dT62uFiqZ4uFClYRCg/DEgxv+ZdEQdsA0lQCb02TIBy2DaepERD6xR3ac
         atYH5CVFaDaMZ48QeYHp4RbVNNrUb18x1/fxZCnbELwfJOp/mVjaNKY9oZ9Yo2VOV+Vu
         BRgwMvob2ZopQdQRUS3GzCJztfPrmHCmyRK6VH2CuhVdDkZUj0y4m6sy2s1kLnDx0WKi
         JBeQ==
X-Gm-Message-State: ANoB5pkXFJge+MF4VwAkK1hcJe5xkrij40ODhb/c/P4DQOUNSZiWiTLz
	P3amOR2HiF/HyDOVVJnl9P14pTVUOuWMgIcVcgc=
X-Google-Smtp-Source: AA0mqf5WTRtOz0gEcLesYyltixEa+JVOjVTAz/SpaCcATfqRLdrege97v0vbGAHgeAGIs9Zk4q8UGw==
X-Received: by 2002:a62:1507:0:b0:574:8985:109e with SMTP id 7-20020a621507000000b005748985109emr16721643pfv.56.1669557368872;
        Sun, 27 Nov 2022 05:56:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.56.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:56:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/31] babeltrace: upgrade 1.5.8 -> 1.5.11
Date: Sun, 27 Nov 2022 03:55:04 -1000
Message-Id: <e1e74360ef3fe2adfac95b3c142ca31e1ee180b7.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173863

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix: distutils removed in python 3.12
* Fix: use-after-free with popt 1.19
* configure.ac: Basic fixes for autoconf 2.70
* Add gerrit config for stable-1.5
* port: disable debug-info by default on FreeBSD
* port: add missing includes for FreeBSD compat
* bindings: try importing collections.abc first for forward compatibility
* man: fix typo in babeltrace.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a8f3e4f92f968eb96df11203ff442e6e42634915)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/{babeltrace_1.5.8.bb => babeltrace_1.5.11.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.8.bb => babeltrace_1.5.11.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
index 19601e7d1b..8e2fe4164d 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
@@ -10,7 +10,7 @@ DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.5 \
 	   file://run-ptest \
 	  "
-SRCREV = "054a54ae10b01a271afc4f19496c041b10fb414c"
+SRCREV = "91c00f70884887ff5c4849a8e3d47e311a22ba9d"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>1(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


