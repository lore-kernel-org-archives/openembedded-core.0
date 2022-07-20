Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D34CCA487
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:45 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.51537.1658306704453342136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ug7XA2+x;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id z23so31812294eju.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wI3dU9i6M4lLAugxwBwkDVL3q4tS78cNrMBfDRb6mNk=;
        b=Ug7XA2+xkfaTZlg/XIRAyqmXTaxwfB8p2X6LTsHs1pt+OYuwcC4CICzdKxIP0xgFdS
         L2qCYYMt33Tp/oEJz03h1uinBl1+DITmJM9dB43rrgAyKlcofkHedr8uP3uIJswNwvaO
         I3myV4d4zsaiwUVFc5Iy0IxZPBW3eU3CKpKKs4DBbzxY0goDWtPwP0R8UR0MEAWYJqfG
         iSY0xoXmkymbxzII0HD+MHFrSjCZSgbriYjcBvnpUP6+b+8l4pKD3CQ3EwVXpot787/r
         wp0Bwm5v+ivvHZdtMRIpQL4+eE2bZW6AvEfV7TEtS5l0Qlw2ueqFEOaFpfgH+E9X51i/
         CZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wI3dU9i6M4lLAugxwBwkDVL3q4tS78cNrMBfDRb6mNk=;
        b=04DTBKp/8hRpHT4CWOcusbWZlL2TO19x9lYGC+EBRHO6kxzCWE+MWsE/uYSvkesQJz
         69fyPHTrYbJFrfwTQUYvAS6JMpwcyY1+o7vHH/u+fPXONi/WzhZuRWMjXi0tMhHyRvXD
         mlBdICIPVY+MvzqCz/PwAa1UK3AzhbW1vNgqt6N+Lc6k3CWMS19gcX1og1XYqo9ZIvwy
         xf1dBSs6xZe23+4yi/LuJmrx4U98pElEllnBRuGYG+bTMMaRNviRRFldHb/zJ6XFirFs
         NTSF8fTxFC3J1NpT83KigyjrMhuVqNp8BPCOB6Nkha0jXzZGx3yTVBudN7Q6lKpJGAtF
         n7bw==
X-Gm-Message-State: AJIora/RJ3MVHlaf6YvXdn8FMRfqP9nSPRBvF11jplIt/zVCb+ayy4id
	CXihGFXIq+A4lz3Lew73nn2k9fq5T+M=
X-Google-Smtp-Source: 
 AGRyM1u/NBS9o3d0MAxruvSkM+5yFT9uA1jrlpNMf4ofARhXfx9DJX88TLj0l9bW+IZmpkNM2ehceQ==
X-Received: by 2002:a17:907:16a2:b0:72b:87c9:af07 with SMTP id
 hc34-20020a17090716a200b0072b87c9af07mr34390008ejc.121.1658306736179;
        Wed, 20 Jul 2022 01:45:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 47/51] vala: upgrade 0.56.1 -> 0.56.2
Date: Wed, 20 Jul 2022 10:44:38 +0200
Message-Id: <20220720084442.2940187-47-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168341

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/vala/vala_0.56.1.bb | 3 ---
 meta/recipes-devtools/vala/vala_0.56.2.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.56.1.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.2.bb

diff --git a/meta/recipes-devtools/vala/vala_0.56.1.bb b/meta/recipes-devtools/vala/vala_0.56.1.bb
deleted file mode 100644
index 48d21685e8..0000000000
--- a/meta/recipes-devtools/vala/vala_0.56.1.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[sha256sum] = "c518b81dfdda82d1cdf586b3f9b2323162cb96bd3cb5a2c03650cea025d91fb9"
diff --git a/meta/recipes-devtools/vala/vala_0.56.2.bb b/meta/recipes-devtools/vala/vala_0.56.2.bb
new file mode 100644
index 0000000000..08c8ccca1d
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.56.2.bb
@@ -0,0 +1,3 @@
+require ${BPN}.inc
+
+SRC_URI[sha256sum] = "66c9619bb17859fd1ac3aba0a57970613e38fd2a1ee30541174260c9fb90124c"
-- 
2.30.2


