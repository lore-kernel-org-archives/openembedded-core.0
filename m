Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.1245.1604335805636432169
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=boSe2Xco;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id j24so19754049ejc.11
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ROTSUjcru6IukJyPGDsBCrXPjKdeXtbApjb5B5CVqN4=;
        b=boSe2XcoR1UATlE4EijSVKOJCunBZGkKRuOa4hZjAVjVzIjnK3Bquy1yOuImFGvSV9
         18l6V3Kn2FVs6b7/54VSCp9Tbbl8IKX3L33cfIEJEbU9qogNgtA5Rb18q8zW4dv1g3ix
         JOGdT8nInqyN1b1NeL+1ezxfs+h69MFQa5yq3CqW/uULNmoy/qDJA0a0Pd8r61o4Ep1k
         q067mXDA0Vtw5fAC6Fx/tC9vTqwTECgkFYb7FNHvwP1tYrKCHqRzPe0ApXbtXgDB0PPU
         E/daa+Pqa70ydbCNC4LL30GUU6x8iHQ+Xs8Q1P/IeoogheoDFY/uYV+PvK3Z6DUUyiPH
         ZCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ROTSUjcru6IukJyPGDsBCrXPjKdeXtbApjb5B5CVqN4=;
        b=t6R7J9W+pdyrKQlCZrjwsSk5D8M+XwZz6LR9hr/8Uyc/KrWuKLdxgohYViPxL17qvS
         qgZCfoTl6UQ4DBPBGohdfzouzYNFOpBhdL9iv2viqke38KYwOPks99WfKaM21lQNjXJL
         MV3irGuSB6oO9IBP3A/IAKJNEeGpB4pT03hNoAMOVEEbKu4p7+AesEisK/8x0ryvN1O1
         BN1MPjv2xb6GYTG9LeQOpEslCFMuMmv5QI0ysQQ2ActnBsjCe2NfWXtHBo1YnlWOI8sH
         c+rkbG7SGHR5QrEf9gNjcOImFJvejPjr+gs/bQpA4x6Dr0ex25m27wsuNA7osUGQbEpt
         /TCg==
X-Gm-Message-State: AOAM533+Ipe2urLYTLgTpUnEKOPHaIuSPpiysbSsB7+dN6RoZUiaPf3m
	4VYHSuG0d2qh68hlqCTpdLYbvJunWIxaDg==
X-Google-Smtp-Source: ABdhPJz9duL13FmdChBpbR0azAXctBkeFUwJpi2B8Y7fw0wuQSLxk9isYW+K4RJfp95VPpdNTwDOlA==
X-Received: by 2002:a17:906:52c6:: with SMTP id w6mr15256736ejn.199.1604335803993;
        Mon, 02 Nov 2020 08:50:03 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:03 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 52/80] git: upgrade 2.28.0 -> 2.29.2
Date: Mon,  2 Nov 2020 17:48:39 +0100
Message-Id: <20201102164907.27572-52-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/git/{git_2.28.0.bb => git_2.29.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_2.28.0.bb => git_2.29.2.bb} (51%)

diff --git a/meta/recipes-devtools/git/git_2.28.0.bb b/meta/recipes-devtools/git/git_2.29.2.bb
similarity index 51%
rename from meta/recipes-devtools/git/git_2.28.0.bb
rename to meta/recipes-devtools/git/git_2.29.2.bb
index e90787d060..6433a2e2b7 100644
--- a/meta/recipes-devtools/git/git_2.28.0.bb
+++ b/meta/recipes-devtools/git/git_2.29.2.bb
@@ -5,5 +5,5 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "f914c60a874d466c1e18467c864a910dd4ea22281ba6d4d58077cb0c3f115170"
-SRC_URI[manpages.sha256sum] = "3cfca28a88d5b8112ea42322b797a500a14d0acddea391aed0462aff1ab11bf7"
+SRC_URI[tarball.sha256sum] = "869a121e1d75e4c28213df03d204156a17f02fce2dc77be9795b327830f54195"
+SRC_URI[manpages.sha256sum] = "68b258e6d590cb78e02c0df741bbaeab94cbbac6d25de9da4fb3882ee098307b"
-- 
2.29.0

