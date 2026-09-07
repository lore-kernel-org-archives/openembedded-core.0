Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5E4C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 21:46:39 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6225.1788817593381665234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 14:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F1rPfodd;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8487214ad2bso4028956b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 14:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788817593; x=1789422393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wv4yhVKay33/Mvp4J36z8oj2Q5yNtSiQ7bsgWMeSlAw=;
        b=F1rPfodd8AquEQi0faMyNCje/++o5UBSSYMRb5DiF5XrDjzo01ZCPOqtlIZQM5zvKA
         JLpYNvJuZo/vw7MrKdKk2634f8uCG6NRqTgxcO7Met+cpKncHoWWE92yfMpzDyVOCJwU
         fNjUHpdthZV9Y/VnKhOA6/8Qx4ZxESDR3EtMB/88ee5oEKAxGLgkWDOcXftYYU+0fMMN
         J/KXA82nNXhHqzzVr1BcG+YC8uWb8SlacBUcOkFjIHZRxHbfSb7XgGiygFud15qjArZB
         9fMNamDtDHUSagXWfYBwt8MriMUYCvy+cQpGHrFmzCXJBPFMYbqLqvOK227eZVDy39iF
         oWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817593; x=1789422393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wv4yhVKay33/Mvp4J36z8oj2Q5yNtSiQ7bsgWMeSlAw=;
        b=OAGCzHgMNQ8+yQSNUCr5BK//XXIPhqUQNZ0+nv5cfPKO40iR0cJfKxzNo3smqIlMg9
         wuRdgoTm5e6DqeIf2omANRnJSGKe8TAijnlUXpnf42RqwMIAY75KogqNmRdIdaYZiPKC
         gwX5bsxC4Y8oOx+wXBj/R2iGuO9aTkJ8TQguAXY3syoF7dFP8p/rOYKsNni+JNptS/qv
         5hZ4vzyl7mh/B0IDnaev4PMZWURrUn4mDwPo8Bgu1WbJ8GYrIUxHh8BTQn+0lALv+Htq
         pscfFx2Iu6t8nifHoSmE9D+h4FMeWI3dt+3vHTQNFjd11dsucNt/FPV0F96PPOs5EgIX
         RQ3w==
X-Gm-Message-State: AFuF++kcxmHWQrDuokOB94ssKWYjRs4cgTwPhDtcxk81fH28UU/jPES5
	hHvMEa5UDcvZGLMTEDcbhy/XxPxaGmAyZHE6jlSJIzrGlRstv9Vt01/eMdMgZowW
X-Gm-Gg: AYBFou3RVFMePReWrDgGzmzGNd/Ag86fTs6TxhSuPfoWAKxCV0hGSyCit0Jougb9Jww
	cjRJZFyIaVZkZDGU2xXySrbInpYGR3Tq0RO+TnqDoIsApdJfbXBcxPOQwDL7oFHODSTerH8kFNq
	jOyT4kIcA/Vujk2fL3NsPCDjmHpRrqTILdHqaLcROfYs07ZXATLHTghOxo5z7jZDxXPppLVzmV7
	MOH9Q9WoPDY2EOmfoBRrBq7q5wKNyFo5Rip3z+oPV1TkgsgaFL2rynCyZd6sePYeMcmVk+K+Yko
	ySRl/bshjltYJYlzDZwd+kehYUakDTO6U9/2f+/5PGXeeOqKsPByMfMUpiGMXTgaNji8SjBAT+O
	wsJPSEvvYkLHTONmh5NrA3J+1nCa/ApDOWxecGpLhgwauny0Ae4TSEGndt/ktNxl+sRXwj5tkjT
	OED2+ivoPeez/5NwSLHSeBGg0P1xNJVUXDFy0gUDLlOdkd1MyE035uQ8rJxMwLDSkKydHadMcR
X-Received: by 2002:a05:6a00:3693:b0:857:726d:270b with SMTP id d2e1a72fcca58-8616d53bad3mr37446961b3a.23.1788817592739;
        Mon, 07 Sep 2026 14:46:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615371e5f9sm4763519b3a.47.2026.09.07.14.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:46:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][wrynose][PATCH 1/2] wireless-regdb: upgrade 2026.05.30 -> 2026.09.03
Date: Tue,  8 Sep 2026 09:46:20 +1200
Message-ID: <20260907214622.3484241-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 21:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245306

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e92e1fe36a5767a7b31d96b9897357e0aa28cec)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ireless-regdb_2026.05.30.bb => wireless-regdb_2026.09.03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.05.30.bb => wireless-regdb_2026.09.03.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
index e544b72965..ad84208f6e 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993"
+SRC_URI[sha256sum] = "b22e0901227b820cd1c280abe681a15b773a5103a5e10dc442e94ebb34cbf58d"
 
 inherit bin_package allarch
 

