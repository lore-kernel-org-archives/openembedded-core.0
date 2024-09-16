Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B24C3ABC1
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 02:19:56 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.127888.1726453195930897531
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 19:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xjjKB8xj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2057c6c57b5so23389705ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 19:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726453195; x=1727057995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XS4rSI/CRhHNTkawp2AaMOE1DdcImoSrgHWaJnaXhJI=;
        b=xjjKB8xj1podnQIjXzJesQvWzYhizucteq3ydeO38czGglYvjQ1nvNBB9g1DlwE/g3
         TpnlXDWMtZXkCKG38bWsmowDNRes2SRxz0hSUr+1GyeiIvhPreAg0JcH9qW4JAHxhjDP
         7QMN+awLn7N2bNBqhB6w1M05GDek+bjVITczwqltXRf+3eex+7QC7T5odBPpHA0lc7fC
         Rljhbbthn4slEFUV0jBezFH8niMQwGa9U10Vcxv3lFkcYzzNDieEvA9vDtUAKEI9Ld6P
         xF4n7SS02WrPPhxfGo84UkdHzrmZVzWMBwQbD76MbORdbizJ6X+/ki9vrD6eW++kJbAT
         0b+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726453195; x=1727057995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XS4rSI/CRhHNTkawp2AaMOE1DdcImoSrgHWaJnaXhJI=;
        b=Lfs2eRWcr5QSa4a+xhZ8r7tJh2yHO/q/AHlAFHQv1LOmzNiVl/ICE3Eze6Z1kNJda7
         b/fPolDLJY7w6XQnU3sbzIONhiEMDPJJyG3/96U71duttoSbKe4bS8/MtEzPAUSMRx7F
         g/Ky3Dro/x8H4M7TjDbS5owcjVy3luDY9X/7O6GKoZyZB2fVhRgC5m23eNf0dm7yPZ0p
         fjqzKttViiQNAhmEXMPdrl+mCNllrGkU3P4kEiJHVUVM4HoMqMEFUH7lQXO0tLrJ6ejT
         U/t/VxwOJ6E9J3V6vjjN3V75zpKRu1VH8+JNmSW+o9czEYTe9ztVM8nKNURV9yQDJ9F4
         VABQ==
X-Gm-Message-State: AOJu0YyFEuC6ZrfTNNCVYbDgdcG0vQQVRVO0/4GGdtPemynwlWDADMlN
	9I2RUqSKdFbKf6Nr4USksES6jJj6i4LvhscnHWzhLSMQcJiTZCohGjYPdD6J+V2YAKTitLbZUk2
	U93Y=
X-Google-Smtp-Source: AGHT+IHUESdzoQg+a9fEgNuBhxQSuoEW7CrJcsnIcyULVmF0XIAsITN7LqqBoHP97eNhhUNQf3w53g==
X-Received: by 2002:a17:902:e751:b0:205:866d:177d with SMTP id d9443c01a7336-2076e5f7af6mr187560555ad.21.1726453195271;
        Sun, 15 Sep 2024 19:19:55 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794764144sm27698175ad.304.2024.09.15.19.19.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 19:19:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/11] zip: Fix LICENSE
Date: Sun, 15 Sep 2024 19:19:32 -0700
Message-Id: <c9bc2bc9c9d0482b13b27505b57df050ebe01898.1726453060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726453060.git.steve@sakoman.com>
References: <cover.1726453060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 02:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204596

From: Niko Mauno <niko.mauno@vaisala.com>

The contents of the LICENSE file included in the current source code
package match those of Info-ZIP license, which seems to originate from
the year 2007:

  This is version 2007-Mar-4 of the Info-ZIP license.

(From OE-Core rev: 3739a1af61ff6f0faca23bb565f9e71666953715)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/zip/zip_3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index ec54206335..58144baa14 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.info-zip.org"
 DESCRIPTION = "Info-ZIP's purpose is to provide free, portable, high-quality versions of the Zip and UnZip compressor-archiver utilities that are compatible with the DOS-based PKZIP by PKWARE, Inc."
 SECTION = "console/utils"
 
-LICENSE = "BSD-3-Clause"
+LICENSE = "Info-ZIP"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=04d43c5d70b496c032308106e26ae17d"
 
 
-- 
2.34.1


