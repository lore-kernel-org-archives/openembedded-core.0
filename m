Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C233FC43219
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:41 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.16503.1667744316393742973
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=egQCvpM7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id y13so8434238pfp.7
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mw3Zc1z5X4o7rZQMaQv19p/OKIUDzVcwuFdUHEtr9cs=;
        b=egQCvpM7XLrtwlLx56X1KpbKy8a3Y4+w+TcgEzQtJ3ukvSIR9x2AzPc1odqlvdMIdS
         0u+FWF6v6wquHf+uk2lvzR9JOnITf1nx8Yh5s/hyTSsBHKgEDSbGv4P61rB41JzvP+S5
         V3KsIKurjqKrEoYVZaEwXmxs8ItnrTm7a6X2SChwMCEGXJ9amt1mafIdP54FlRNsU4UL
         vB9Z77dMP1We74Bv0wlZ0jgJGoOL0fel9X59SzGLQWYb+6EOluDLHWO98C7FEtW9jN1c
         gOdTObgl4LKlmfi49J72B38mRvfeklP7odOxIzVsUld6aFO9Tj2/R0V2aj3oplcSJv6j
         lV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mw3Zc1z5X4o7rZQMaQv19p/OKIUDzVcwuFdUHEtr9cs=;
        b=A1hVZArHp0BSMl+KHdPRTEQGceE4Miqfn/ct+6c1/s+uRUeIpNOIBcuKHEnwgEVdb+
         PFIpt1+5K9NMVO5zm2Xaq1wUx+FKjKxryrRzg+GAs4y3GNwRugLvzwxFVp4OCXLnTw3d
         znZugcwmXkwR9NE2YyFR8SfoUNdnQ6Nbm3zehjk0FphGcstR8FS8KFP3RcMLFOayhDFm
         vOgxtR4W8yKzTZJlGp5kRVTT95aihZvkhatFZgMl0tc+qnfHcqzTqc8+AwDgE0C6x8gF
         kVPj0wLtDfUU5+B5qaloFLqWA3BzvotmjIEhGkznHnv3dPCE9fzV25h5wrMdCNaH4Ake
         sqDg==
X-Gm-Message-State: ACrzQf2aNM3OgT6G9ivGZRYGBchZwplsK846Qj95mqlgIkHS5F9krMq7
	Jf/tmseczI0LJucmy7AL5+hxoBZhQ1pBU0s8
X-Google-Smtp-Source: AMsMyM6KkAt9JNhZsNdBEfBe8w93FqddjCIaUZoO2GCBq/4l5tKKfolOT02WNsIMFUKwUsPnjrG7MA==
X-Received: by 2002:a63:ff55:0:b0:438:fa5d:af36 with SMTP id s21-20020a63ff55000000b00438fa5daf36mr39080639pgk.533.1667744315488;
        Sun, 06 Nov 2022 06:18:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 33/34] rust: install rustfmt for riscv32 as well
Date: Sun,  6 Nov 2022 04:17:16 -1000
Message-Id: <655b9a0bbe07b33db8aa6ebf7c49f3d9074cc5e0.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172801

From: Alexander Kanavin <alex.kanavin@gmail.com>

With the above rust arch fixes it builds just fine.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f417ae30c79fac99e2549324ed351f6f63cc4a25)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust_1.63.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.63.0.bb b/meta/recipes-devtools/rust/rust_1.63.0.bb
index 1f9dbd3cce..dbf74cec8f 100644
--- a/meta/recipes-devtools/rust/rust_1.63.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.63.0.bb
@@ -57,7 +57,6 @@ rust_do_install:class-nativesdk() {
 }
 
 EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
-EXTRA_TOOLS:remove:riscv32 = "rustfmt"
 rust_do_install:class-target() {
     export PSEUDO_UNLOAD=1
     rust_runx install
-- 
2.25.1


