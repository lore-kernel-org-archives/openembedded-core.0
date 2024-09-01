Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADFDCD3420
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 18:58:43 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.22470.1725217121499997577
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 11:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NiNAFWdX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42bbdf7f860so19860635e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 11:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725217120; x=1725821920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=C5NACzIa7KiK+KelV4pethX9xSCiOEcEdxnPV4xHJgQ=;
        b=NiNAFWdXTULwQmywJ7RC0Iyd486MLqBf61OSLE70OmYdRt76VkXLqrvMU/c+LhGNs/
         BbhWL9fv2ZfZPzGRbcSl8bhgvJFFW85/TsKVCGqCnm9CimLVqOowPLAVL8mYw+tSBw45
         3s/CrGY0syuBtr9JdrPYJRUMt6QkVxxTL35Js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725217120; x=1725821920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5NACzIa7KiK+KelV4pethX9xSCiOEcEdxnPV4xHJgQ=;
        b=uctKgodZwKvZKmHNRRM639dCU3/H988uNXV4m0NOxpw6K5kBuleB1Ng1pykGHys5tB
         QfcQ4/5vOcRP61MxrDVJUfxilR5oMdrDyyy3q/AtyDczzjVt9elWBoqEsfdBg+zQTwsD
         pXj+8apQ2cUsue+3YDo3x72Banep4I+OMVJvlTVSgo/zJJma6sd7sxevmZmSkfUUhGj8
         AUlxz4D9TdXPFbL+BGD4DtkEdybl7KEPdL0lPG3Ns3WiwNOaRm5V9oLH7hO+1LXmRdaA
         DyFvZP0XJT1gNuH3pQcodhKW5XAjN6LvWe7PdMuzP97eh9d1MPze2PeNMLcOcDqHw71B
         c/0A==
X-Gm-Message-State: AOJu0Yxhsa+vpmYSuF2++8TeHPi083dIgbFzv78ILW3C0AoKQQnQSQoM
	mIIt1x8KpNZCrhnAzlDIt2TPNRC+iVvMMvzPD3Qw1NcZZ0WEGHnhfNKVQQxmFJk9hhCY2BoHLYd
	y
X-Google-Smtp-Source: AGHT+IH01o4h+/uggPqf0WzWd4o5mz+JS16GaAVVrB/LXCyhL932/g+o9t2XsfYAkio1cAcAyFSk7A==
X-Received: by 2002:a05:600c:4693:b0:426:63b4:73b0 with SMTP id 5b1f17b1804b1-42bb01fd12dmr99376875e9.34.1725217119545;
        Sun, 01 Sep 2024 11:58:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d8a8:ecc:6edb:f5dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e27c70sm113285695e9.35.2024.09.01.11.58.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 11:58:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lttng-tools: 2.13.13 -> 2.13.14
Date: Sun,  1 Sep 2024 19:58:37 +0100
Message-ID: <20240901185838.194043-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 18:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204053

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/{lttng-tools_2.13.13.bb => lttng-tools_2.13.14.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.13.bb => lttng-tools_2.13.14.bb} (99%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.13.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.14.bb
similarity index 99%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.13.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.14.bb
index e73dd4801a6..65d19b6e5fd 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.13.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.14.bb
@@ -41,7 +41,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch \
            "
 
-SRC_URI[sha256sum] = "ff5f4f00b081dac66092afe8e72b7c790670931cf1c1ee0deaa7f80fbc53883e"
+SRC_URI[sha256sum] = "53bdf7c4ad07dbfe660ee4d9affc63fe44ae59e9a73c6f7a96e0fca140e5adcb"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 

