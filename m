Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5ABC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:33:43 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.43701.1742834022859107491
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V78DiywT;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2239c066347so104719395ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834022; x=1743438822; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/i/tPJNPgp4B3hNJS7m5wAW2mOVyP6J7XtncrtjAiI=;
        b=V78DiywTK5NieMce4N9jQAkj9SM/HSDxNDhrn90yxHrXcKE0smMH2fM+IolLd02KN6
         VMDjy+Mec0o72mBkY18vs+LI8B3wqEfftb08xYNaRNaa0OX7+dblqUorlgENEKZ9+9ZF
         gizXC+mG+EtmxOo/KXgEfmd+FV2vM3VUoZhrCBfGmlWM7Iy5B09WdwygBTRgTBzs6w1J
         i8SkfDYwcmj2SjWCgvz++nM1pDITNDJGFD7vAMn/7YHiqYrwiPal795bAg09snc7dsQM
         +aEoFAWbAfumPpzeIXY7VfDk4F5vgOAg0jOL2hafysGKWnufAw0adbetf47i1ZfSWag9
         4UQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834022; x=1743438822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/i/tPJNPgp4B3hNJS7m5wAW2mOVyP6J7XtncrtjAiI=;
        b=OI81n50CGyhoupK9omSq5CmhRF6Y3DIb5BmkUeq/GYlGHufovvzZQZShLjKAiFtvnS
         TGniTv10WIfNM2fGal3zGmNCTgKEvPsd5OwrNeNnFzn3SJ+mIlwv9edHNDOOtVlUGJTx
         vjwCUAjH93qY/xXjigrE1wum95KCJ3s4m/0BYk+ayqZZ/HlqIziB0/EEi6CCaco2jnqU
         RF6EuJGHNcz8qTqOOfce0As+/ptUZV46PkdLn44nx8e0Dye4AgLQzBjBEs9OWSQCofOc
         wW2GjwB/wX3aFToCTtOJNBlr2PDEHXhrFbJQpAmMecFR7wi32P++Af6tLV8e5ZJ5qPs7
         XMSA==
X-Gm-Message-State: AOJu0YxokOgMcfsp72Gnya5tG42haYYt9QrW/RJiuXLLgbUlMUMRL2jg
	5YtjKixCymXIMpIBT1GAKEKwadSuC28C2twOZlKUljrFDbrMUmIXBy+A60ca
X-Gm-Gg: ASbGncsmrf1MXoRsaXduITxykvs9GsVwuJjgb1LcGL5qZcE0x3Qk9V095E8PvRBtLNZ
	Vc1SoSZXTVLK9fq15Gh87WTngWW2x9iXR2B4bsgF4IlEcZ8LeCUaKpLW+qz8GzBHRil33cfztsH
	hiJm63A07+1mW2R1xKjmtq/d9lWKAJKHvY9O/DJ32Yw/flenZ49cTFpV9Oi2MPOLE728gjt3hlu
	daVKJJ7mHDSIC+M3vudxmMKEin2HnH8Ihma5Y7cTaOnaAzWLfL03a+q9SQu06k8PdJTM7lLRQ5c
	L4SMvbvCW9EoFvF9algT5o9G5yCgOm72wsPICuNvWNNSBSM=
X-Google-Smtp-Source: AGHT+IGD2UGs1QBxV38d08XvrK9tgZNSYkknzIDREwpS3EtXs17CGAPRHuvgQQgNJp9dYTBNj8OPFg==
X-Received: by 2002:a05:6a20:c886:b0:1f5:79c4:5da2 with SMTP id adf61e73a8af0-1fe4331ddc4mr26134153637.31.1742834022103;
        Mon, 24 Mar 2025 09:33:42 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:23 -0700
Subject: [PATCH 02/21] unifdef: Drop md5sum for SRC_URI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-2-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213534

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/unifdef/unifdef_2.12.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/unifdef/unifdef_2.12.bb b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
index bf0f3e1b17b8b6fe8b265e07c33dcc3faff57709..e3bd4eb0f9d6fa9276c218dbee18e0c4fe927b2f 100644
--- a/meta/recipes-devtools/unifdef/unifdef_2.12.bb
+++ b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3498caf346f6b77934882101749ada23 \
 
 SRC_URI = "http://dotat.at/prog/${BPN}/${BP}.tar.xz \
            file://0001-Don-t-use-C23-constexpr-keyword.patch"
-SRC_URI[md5sum] = "ae8c0b3b4c43c1f6bc5f32412a820818"
 SRC_URI[sha256sum] = "43ce0f02ecdcdc723b2475575563ddb192e988c886d368260bc0a63aee3ac400"
 
 UPSTREAM_CHECK_REGEX = "unifdef-(?P<pver>((\d+\.*)+)(?![a-f0-9]{6,})).tar"

-- 
2.49.0


