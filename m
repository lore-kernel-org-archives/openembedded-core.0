Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F048AFA3745
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 11:47:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.8156.1667216861590470092
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 04:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ohZjfans;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id w14so15563075wru.8
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 04:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yjxxbyGqy15ZxT9T36WGz0f5Fnmi78eM45j6coh6kg=;
        b=ohZjfans8kxEC6eYr56ynQmLejM3Dz6Icm/ZFjL3eIrUNRLjDeAWfcye3v/jslc8gY
         td5QsTLdwp7L+VDzpOXe2lQCBzbYplcWZkIkyLLgYzpGnYDKaCGegO/kOQ/4iYmN5wPU
         ZQkMCVk6My8mfoxVYkRGiK3sZGfC2lIvt3WlkAiRMMGfjzGdAznNUKQ5dMx9fVjypMH/
         fiGJvT2PsRhK7x9s+DcSuPAy78MlBe7ALl9C7EUJeLErigAmKja8No3FB916kvofWdty
         mqzpTJpoGcPen/G8pw66jl4EpHZiI8Fp51/DkiXuNdmflgER+F6wI+BU5j3pq5uNQC3s
         ZkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yjxxbyGqy15ZxT9T36WGz0f5Fnmi78eM45j6coh6kg=;
        b=UV6mSOkCcCFRNN46LeFilr3fFiZ/4DCpalJr4fqgO80sMsOK36jKMLa52ZUWufQ7+5
         Q4ythmkjbLwOuzYy6U93AuULyuFXo91TZcY5W+bhJCw+BLqD53Qw1MtMKN7/RHfpq/nH
         aUDbUtsGuXisXQRi+4ble19g1a8Hwz3VlMsH+M9ZZFZ0LpcMZHWdR6WsLDBSjusU1UJX
         gOseAzfnrQXeGUxTLEk7QgNkqabQm7pjsv/tYjr9o3lBlvemyX7HHq3YLu+E9LoXQ6ep
         StGXlO5NcK/LA2VY9BN93HVcXevW2J2bDOoIUEx48akM+4urdLxYaHnNS7sN+CXXZrDh
         W4KA==
X-Gm-Message-State: ACrzQf0CAmOUSfJeiKL0zkJoUR362gpUlk7IbVj4k+SnZ/aIy3JncmTw
	yiMH9cyVBZ4TUmvZJmBLZvtIN/YcvKE=
X-Google-Smtp-Source: AMsMyM7oDV7zJJ5mwUAyZffuj8OBl7ZTtMXY65OUbsn8UTuF5hA8SyPNLq5KdLzU3wZZHeAapN6r7A==
X-Received: by 2002:adf:ebcf:0:b0:22c:9eb4:d6f6 with SMTP id v15-20020adfebcf000000b0022c9eb4d6f6mr7852642wrn.251.1667216860101;
        Mon, 31 Oct 2022 04:47:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m11-20020adfa3cb000000b002366e3f1497sm7017965wrb.6.2022.10.31.04.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/13] groff: submit patches upstream
Date: Mon, 31 Oct 2022 12:47:10 +0100
Message-Id: <20221031114719.2725967-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031114719.2725967-1-alex@linutronix.de>
References: <20221031114719.2725967-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 11:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172306

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../groff/files/0001-Make-manpages-mulitlib-identical.patch     | 2 +-
 .../groff/files/0001-replace-perl-w-with-use-warnings.patch     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch b/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
index 9105da6457..c3cfc7cea8 100644
--- a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
+++ b/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
@@ -3,7 +3,7 @@ From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Sat, 7 Mar 2020 00:59:13 +0000
 Subject: [PATCH] Make manpages mulitlib identical
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [by email to g.branden.robinson@gmail.com]
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
 ---
  Makefile.am | 2 +-
diff --git a/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch b/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch
index eda6a40f51..b028fa20aa 100644
--- a/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch
+++ b/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch
@@ -15,7 +15,7 @@ doesn't work:
 
 So replace "perl -w" with "use warnings" to make it work.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [by email to g.branden.robinson@gmail.com]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 
-- 
2.30.2


