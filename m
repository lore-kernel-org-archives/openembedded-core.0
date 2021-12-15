Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1479BC433F5
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 01:56:49 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.35078.1639533408622193735
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 17:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OBqQnEiS;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so17703705pjq.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 17:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eK1Kei7esYAe2x/fryIERfzHMNnWrs5VL1PeKXgyzx4=;
        b=OBqQnEiSYzd1zBwEnrTSAAW/9O/bSwq5qNPzMMGNkixHy8mmGLu45qUGfXHimOoiP6
         YeR2ioF/pwBiARtjKWJ8YNJaTyV940YBuohLKHW86QC/QMQJM+bzQ+rori4UGWuXBEU3
         0ZLOHz+qQtJ+evj8ULyt/bPYGxv1X6bylZlI3VViPZDyV949blTRB/SmiDU7ABuGGhBA
         SIfVI7Kwttrl8I3btPWo6Sg8RP4YI1zIplNN5AwyXMqMva5t1bQtr+nUdWUDSnM61bnn
         klG8YWz44/bw8dJaejLxjIr99kxQwBFQmdW43ZAGafPxvWoHpdyLPXL30xikcM0ec9u9
         XQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eK1Kei7esYAe2x/fryIERfzHMNnWrs5VL1PeKXgyzx4=;
        b=W1mKJXMPQjJQkm1yEEdZxYs/zUwkDA2J7kYP8VCbJNt+x8/CIj5idpGRcBuMn4031h
         iqMoAMSNrgMStAk6MQhe9JRTKAOlNNph65Veo/vZtjlHu1+gFYwR9dsq0pKa5hDwbe+F
         BGL1pfRtOHSAkX16ZEforoYjAAK/q4AWmf4cBcx5UMAh03pEm9IZ8i4NBemHISo8hZV9
         a349LX9YDW1PmKkm49f7xV8eaCFDBE8+WGURta0LyBwyMS/+yq/qBEvJeXlDR2q3khxR
         bHHLY+aJzrvKBZ7SjpyunbuHHO/hsA3nTc6wXzHUUEtugye2Om25Ztdd4Uu8UMYESJDc
         bLaw==
X-Gm-Message-State: AOAM5311XEHJ/BnkU6vjfoMMOv3nZ50LnqAptr7qTus0JPmJHWltNreH
	HHuVLjP5OuERdrKetJDS6b/AcYHhRVa9oQ==
X-Google-Smtp-Source: 
 ABdhPJy0rzLJUx3GCB5ukrNaOj5aKDO2CClSGxISvND0IEogWGRo0EEYxekiHDR/OoRM2kY32U3+/w==
X-Received: by 2002:a17:90a:460d:: with SMTP id
 w13mr2468979pjg.177.1639533407875;
        Tue, 14 Dec 2021 17:56:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2b9d])
        by smtp.gmail.com with ESMTPSA id
 m16sm363139pfk.186.2021.12.14.17.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 17:56:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc: Update status of musl stddef.h patch
Date: Tue, 14 Dec 2021 17:56:44 -0800
Message-Id: <20211215015644.1310134-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 01:56:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159710

This patch has been accepted upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
index 86f75d0d51d..fd7d604e988 100644
--- a/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
+++ b/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] sync gcc stddef.h with musl
 musl defines ptrdiff_t size_t and wchar_t
 so dont define them here if musl is definining them
 
-Upstream-Status: Pending
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=85a438fc78dd12249ca854a3e5c577fefeb1a5cd]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-- 
2.34.1


