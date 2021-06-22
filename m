Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.7550.1624360897816929249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zqf75esr;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id c7so22177943edn.6
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3rAdTViX74hNU3wB0m+IWQGAmUrYTnyb/uyrN6X65io=;
        b=Zqf75esrBCITd+Z1FXgCIjR1Pb3svg+8Wirc9J1mVD0RdHYeMa5cGynf3MuUISQ2/F
         xvXHOaZA2U8sX4dZhSz0ArLUukpRsDIuBGrAjEvYUwSoP7opHlMurhlu/jdskFInMbNv
         EdfjxDa5aZnQ+SUzdM28Px2ALuBtqirLF7byETbZVd7YaOwZwSCGVW7uaDn4Bhrw5Kq9
         DyU3EqCWlAMmOqS8LBLfuaa37wU86KgqFwSbZ7Z5EH6mXZftIMc0SBvrbYNPP7a9P23s
         iVY/X8X2bHj5k32k0DoEiHjz4vel5mH5yORCnd+qxV4uswVFv2f/IDWRi6xP2q0neGbD
         DFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3rAdTViX74hNU3wB0m+IWQGAmUrYTnyb/uyrN6X65io=;
        b=F6D/CPwjfdbsN6fRcDS0SkElAaPXPiOZE720ZyKHmaWzJ4bhxONaZRuW4JLxfvDp9j
         8Uq1RVfROP34f4zjiLeyiHL8ydr9NZwCKEkAaDBgW7dj3llaK49zNA53SzWLggB2/3Zv
         aexSCta6ko7K+Wvd1+jWRunpqZKRlcnalbrho3XE5cCkbkunhSQ+dXlEShWoAZF903rP
         6Eqz96ZkswAil90+SLMtdwErKJcSgqRaxbFWbL686aZ6l+BN8HLopdrhcuGRIvWuQ1FF
         gc9HE+3xJRJDYDx2hZtR2oo4rY6ieAivkmD4EemwBmnQ3EVVT5Jv6qOyZu5eOVxkn7Zg
         tQkQ==
X-Gm-Message-State: AOAM530Hci0LQoblNq09E4oTZ/gEVecJSxhqKAQap5ykDB85fvUvQyyA
	gEkdATxPDptg0/WXW9mQYrM/xkJYYCD9cg==
X-Google-Smtp-Source: ABdhPJx6TK1AfX1IGHmRxVu2Xq/BJzilcYkxCPy9DIwbbV5yckob6/RGzk4v2bbno/N1UYopIsLVFw==
X-Received: by 2002:aa7:cac9:: with SMTP id l9mr4195814edt.373.1624360896421;
        Tue, 22 Jun 2021 04:21:36 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/19] dejagnu: upgrade 1.6.2 -> 1.6.3
Date: Tue, 22 Jun 2021 13:21:16 +0200
Message-Id: <20210622112126.2026646-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../dejagnu/{dejagnu_1.6.2.bb => dejagnu_1.6.3.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/dejagnu/{dejagnu_1.6.2.bb => dejagnu_1.6.3.bb} (78%)

diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb b/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
similarity index 78%
rename from meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
rename to meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
index ce242c3593..ce35b806ba 100644
--- a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
@@ -13,7 +13,6 @@ inherit autotools
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "e1b07516533f351b3aba3423fafeffd6"
-SRC_URI[sha256sum] = "0d0671e1b45189c5fc8ade4b3b01635fb9eeab45cf54f57db23e4c4c1a17d261"
+SRC_URI[sha256sum] = "87daefacd7958b4a69f88c6856dbd1634261963c414079d0c371f589cd66a2e3"
 
 BBCLASSEXTEND = "native"
-- 
2.31.1

