Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFB9C36005
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:11 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.4278.1742272743896145597
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FHJG6jrQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2255003f4c6so89380405ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272743; x=1742877543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Not2OL6jS1+oGzZ+d3jIQHLqET8KaVvwVrxHBriJkpg=;
        b=FHJG6jrQOrY8KgqY6szQRirp7l0y83mKwTnwNjwxRnDJxFWXOo5oHi3UitrLrQqjqN
         9FUUsjIfmvNEnYzqEmlT9DqutY5ACufIb9jXnpf6e8Qv2pEIRNX8pSeKdz7dnTNCrPj6
         7ZKqwA/wMIFewG1hVgDc4yYF0Zkeeum5yU1ObqR3qzcbiGO8fpfeSZ14bwvtIpIwYxEW
         WmXLgDM1K+Tjvdn/X5Ua4SolzXnW/o5VPveSN9qEjtGT3CgQjZJKnmZ3AP9YIumaq5/E
         +xseTnNbnbNYmuKEqnEMV7RGuEBzdS6Mut85vUKZOP+WytraSrAvw1rivx92nXqRSHL/
         xDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272743; x=1742877543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Not2OL6jS1+oGzZ+d3jIQHLqET8KaVvwVrxHBriJkpg=;
        b=DqwdeWB4D+k/+L9AspfaDTS+wOW0kULafw5GItUQh+vRMLmsSk/XB0+tw1uNfs4agX
         t2hW3WLbisCaLIhdiBmzq50K6F+cU9kppyvZTap3aUBuT2MqQaEX08ji71Gmcttfugsg
         RWAAPxFqHn/A6Xcp3qxm6b9hdoK+sPN3fdmxdo5ZkVEtCcLvsDMU5Qx+WOZcK2uGP9m1
         L19aocWokCV8qRmMpPKNadZhJRRtJFWNNX9upO4YRpHihQu439/AGROjgbK476egedWA
         flstoI00rM57iaAyjZCt7twN/lRtGUD3aa3jOjxH075hO1VXPKJSQdYs2aDxO8hQh6qy
         Ngqw==
X-Gm-Message-State: AOJu0Ywu9INOixVS8BBogx+T7etUpXWNKOEYHWeuYYm+mUyNKcyhzsgY
	z9GBmJlnlLmYMhgtlSaOS98gI0IvZecw/apiP9t4Z2yBGx6TC1rM5DOtHITU
X-Gm-Gg: ASbGncvRbdomzo7OTCunse9fq/Bej5oF9lnk65xPr93ghl6pXsOYojy5ybE4KkPrhfV
	InROJ9fgEGDNqjRzcRn67rrpyLp5TkBCl3+9AjqddN2V1mWwMLMm0sBbt+sfvld3bR8HGe7jgSJ
	iiZcTbytkS88HFlp7PHFTvqQIL1N40iYvYmOD+DSHvKP93+ZgdG6UWLw2izcKWFSqh1G382ZtP8
	Nou2gdUGcGvMew0iRF+AtYdQw2sTL4gL84cDmO6DsRFQkHB960WDRQkzmh4Tda2TJ9gR3RZ5A7+
	giFCnhVUkMglG/QQGHs2jRUdkNHTqKffUXn7hZ3g4TIOXh8=
X-Google-Smtp-Source: AGHT+IHx5m0t/akSgFdB+Xf+ihJcNemmwmB/3gtnxRG83NeWKqxDjivewkq/NZ30j2xIou5QaT/A1Q==
X-Received: by 2002:a17:903:3c50:b0:224:1579:5e8e with SMTP id d9443c01a7336-225e0a3635emr202468435ad.1.1742272743051;
        Mon, 17 Mar 2025 21:39:03 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:39:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 15/24] libmatchbox: Fix build with gcc-15
Date: Mon, 17 Mar 2025 21:38:35 -0700
Message-ID: <20250318043846.2422141-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213149

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
index bf3f5c005d9..e99b66855e1 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
@@ -15,10 +15,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
 
 DEPENDS = "virtual/libx11 libxext"
 
-#SRCREV for 1.12
-SRCREV = "e846ee434f8e23d9db38af13c523f791495e0e87"
+PV .= "+git"
+#SRCREV for 1.12 + 1 patch for gcc15
+SRCREV = "312c04b6ba60dca0d6c4a7d1393f0ec816a265e3"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
-
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig features_check

