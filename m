Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B33CDB46A
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 16:56:52 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.21927.1697043406856973885
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 09:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RvJUJGYv;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9ba1eb73c27so624776066b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 09:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697043405; x=1697648205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O7t/JHQA2VxlsfoMEJDnneoy0stFffPU47oXEOXy3WU=;
        b=RvJUJGYvXH8fc9Av4jksjcrygFJi1edJu+MK54q3pBxSWTu1xNjt53Xb4XBVl5XBc3
         Whl91kB4PIXynoRduzRMAO+y6H8VikTvxUfyI9cox4EFVcwpuPoV7pwOJPK0WLNnpWPj
         QlTSgZj6jVmpNwAnIpQWl8KESw/wfeyDz82ZYeFgxE8tLSZbQdv6eWB3V3og2F6s27mu
         KbulUCvBZL/S37kF2X2vHKrV86bAsHkWdHSrHV1TLSiDJcKKd+2yh/x7r7GDFNYLOnr3
         c8CRhB3Vs2R0lstEhYvWHyCBR0s0BFIMKI18cR10y1gJtbevl/AgF/z7jqg1y2ZjYgel
         9V/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697043405; x=1697648205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7t/JHQA2VxlsfoMEJDnneoy0stFffPU47oXEOXy3WU=;
        b=O0FcGAWjCaxTZVW8t82vnEHc9cNOOPXo3jMxHPzQP7t2FwjhPGk+3343RCSEMxZiIr
         UAYhsUdk8XPtGTU3kEPFGq2CZttyqHb1fM142A8ilpOfLFWBOahcmgljYc7J56ZuiqXL
         ouhAtroWuGgPiM9ew+rvBi7z4zkhu+j2cPlDR4ouH5eh6ICo6KYqZ7ec0dn1iHj23hRn
         k0diHRR3yvb7/wHm/GOUptQIzPyAl8HwhzOvFG5vPAL9pOSalDqrUyds7ew46+bCv7hK
         gDeeZM4kMJ5ftGhDCknqOqysdCEp/Tfby8drpchu5MRhuDnG5f+Mgqfshfoimi8w8tEv
         Csaw==
X-Gm-Message-State: AOJu0YzI+irnouxTAryHc/ZFfFMwxxfhn4utOBBQscM6c1wE21dtBDIe
	63uhPnlMz0N89h/fnrgLX4KBAVStStw=
X-Google-Smtp-Source: AGHT+IGR+kZ+0yobzpUJURWpRl8QLa8fpYtHqEYmxTWwsZfsFuW6fZtKcLA5DWtXoHBicns4w/DcbA==
X-Received: by 2002:a17:906:100b:b0:9ae:5270:46d5 with SMTP id 11-20020a170906100b00b009ae527046d5mr21226984ejm.73.1697043404928;
        Wed, 11 Oct 2023 09:56:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j18-20020a170906411200b0099ccee57ac2sm10095682ejk.194.2023.10.11.09.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 09:56:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] nghttp2: update 1.56.0 -> 1.57.0
Date: Wed, 11 Oct 2023 18:56:38 +0200
Message-Id: <20231011165638.2148676-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 16:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188968

This release has a fix to mitigate CVE-2023-44487: HTTP/2 Rapid Reset:

https://nghttp2.org/blog/2023/10/10/nghttp2-v1-57-0/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../nghttp2/{nghttp2_1.56.0.bb => nghttp2_1.57.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.56.0.bb => nghttp2_1.57.0.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.56.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.57.0.bb
index a011bd45360..0cf1e3e34ca 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "\
     ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "65eee8021e9d3620589a4a4e91ce9983d802b5229f78f3313770e13f4d2720e9"
+SRC_URI[sha256sum] = "9210b0113109f43be526ac5835d58a701411821a4d39e155c40d67c40f47a958"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.39.2


