Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F642C4321E
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:56 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.70831.1669472129956938808
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=aAbHOPdW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id y10so6311105plp.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6v8g2yXv4xzZ67CQbSOhV9E8GGoME6XGYDaA31ZONU=;
        b=aAbHOPdWN/ZdWv8psqozTu/uE1JRiknaWJow5WDWKOxvGqOIwb1iAClxRhns/+i4HP
         RyeOauYL5eFoKnVlH7m0DSiMkTLfFmuUPSNW4dboqlwbtaRfEBFmM59CPYwjxT9OqdYI
         ACAWnk8xQsryma/SDYv/uzyDclLSVf2TCBoxp7Gw7kchMGXUkc3pCxE/TrQ5DP6eoWcR
         2RK/AZ64uxWGOWxL5MiVhsBGQ1dn/fWPOBIciVOHYK3Ri+1hso9HrDOfsKMk1uf/Kh4c
         GGx3zIX7mNox0QBRR3uG80z4MWd1TTHamUpZr/k3ICdE6ZES2/gPanUeEIVZ4BachkP+
         U4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6v8g2yXv4xzZ67CQbSOhV9E8GGoME6XGYDaA31ZONU=;
        b=wBrpuNvX47LN4i36BhVECYIQ2++J0f68i1u0qixR9cIhfmkNE72s4yfEjJdxoGIfqC
         nvcIiQq1RoQ030VHXjnLEpPqiTQFRbBlBxXQN8rRSXJvAWVSReBCxm8GhQD67kov9Dvv
         U6o1B/AD+y44gjtuXQDGHXAVtcS8KRf/WzelcEKBdTonXLyp2s1DRK/hsYknmx4ONAKp
         MK62Un2KA00W5Aj2pl/V+54YjmQdKs8+Gkjjyf6A9YNB1X06GLVGxo6TZtgJX0iS1OpA
         AQKMQSrYlPoYX4pGZtMLNCoij9EEVd9zeKymVA+zGBuZUMenKOgtCP6jpJfT9afMPiUK
         NEBA==
X-Gm-Message-State: ANoB5pn1rUhriLxQJoP88e9kjHFTOSc3nHFzdsa51IpK6PSFTeuT1/Ph
	ABOpCmqJQ7jJH9fvOpoRjpff/VCodpeKBaxp0sI=
X-Google-Smtp-Source: AA0mqf4ZCATdIU6ZMdYlBKHPx8zpDrcgjYhrXE0GPinxUfkKVSi+xwqopE7CD+kgRq5mewUZzJOYfQ==
X-Received: by 2002:a17:90a:fa46:b0:200:1df3:a7a9 with SMTP id dt6-20020a17090afa4600b002001df3a7a9mr50445594pjb.202.1669472152478;
        Sat, 26 Nov 2022 06:15:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 22/37] babeltrace: upgrade 1.5.8 -> 1.5.11
Date: Sat, 26 Nov 2022 04:14:26 -1000
Message-Id: <9a90f969dfc836ebe5b966d44bf978d72da96d65.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173815

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


