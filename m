Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA64C83F2D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 21:09:50 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.6190.1752613782774799486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 14:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L3+tQsq1;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74ce477af25so3753435b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 14:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752613782; x=1753218582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky2wivjpEuNxxokg+g/2w/8FP9Cxb6iLlTdKC/3EapE=;
        b=L3+tQsq1C9P8KborO6Xxiax8B2/UY20Uattorafcoi6EdNR9s9Dbdq2fsBuyr+Ccul
         dq/4XNrH/Xa3tq7S+SP4+MBLHphqgfFtGCOEMIpiPWM3d0g33zIU1rhPN2fQsVHMUGqJ
         aBxJm2OTt8RqhzPhuotJxDQegQpf/ociaJRAOs+jSlb1Kz8/HPnAYPcSR+CrPKcGfkQX
         mg+I0LoPzgUHtbXv57aFfg0PVae3hLXZPgrSsme4kxUc3kpC7r06kwMfoWKF0E2HIL3+
         17emOSHWDJpvyyCzBl01UA9MGDZ/lF1FDXkq9cDCkeC4ADbE03fOdBXr6Q0zwkUCbYgA
         72UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752613782; x=1753218582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ky2wivjpEuNxxokg+g/2w/8FP9Cxb6iLlTdKC/3EapE=;
        b=B7tJlUahOjdu+ZWJWYzvgvBjU6zoryi1OWAaKDxpZsJEvc3pWXJ8C6HfZQsIadRMGe
         2kGR6dH07XbSCBo+bYiFNigwWZgsG+GdyjxhQ3AjiVxYnN81JFC70finQXjUMlWHjUoF
         G3NSskKjBVYKLlroIrLiyB7g+/mOEgQmDlnMdrGvoFACa/1if1gfejqvmRwQ23+y2jvc
         Qhb78SRJvITjLF14YcyVECN5EUp8PPqGC8UTsnZ2baKMWW2sbz2WTjAL4b0T5Q6L5ZY6
         A3VicwrBzFo7hSPWj5kPInI9JBVxBNIFjQvvtepJf+7AEEBJNIP36AGQTmfaDnfdHFsW
         hfZg==
X-Gm-Message-State: AOJu0Yx6ICff5JxavSJMYsYQce0yRoXMkYSp09J7qpUfwG9jxxyLlIsa
	e58t06cjP4RMm3LssTqQ8tUa6uc/05wJ9FzAIsEiRB2hRTWoGNf5vtZ/h2adzpfs
X-Gm-Gg: ASbGncuEat3WgwGaYfXf1o+C7Sb8MZ6S7sKH2KSie/q/ThnT+RRaMKQENTTGqHPK6oO
	p15DCIkAKT33fK5jy4sDFMaEbwBTUltpSWK5BNY+sNG+qgzAq7+PN0lVqRgeJW0Dww0OlO17DR7
	/c35Ka5RR6u4hsNN+LQfa5eRpgO6zOvJNGnvpZYBwxs9kVHHdAuSj1v4QAcJZfnQbcScBemIYzS
	Z+ZnbCrezupwBAyrD8LA7h/EFpGJrPBdnb5NgerqA5fSbXNfdCWzQfbiEhX+m7mxYQrx4LCZ/kF
	SVPkPocCEpgMdrQoCu0sljf+U+8xqsGu9YNgsKDRdX4Pv6TrwYqWwoy/emeLTJaK9O8JdkqJ6g+
	fKHL+08hSXkisug==
X-Google-Smtp-Source: AGHT+IGhPo1fJalsanOEPvF/1hdK/DiazzVz5WYyl6fX6MZDGlYVOEndaep8qBU+ePUqb6bRyAnsUg==
X-Received: by 2002:a05:6a20:12c2:b0:220:9e54:d5cc with SMTP id adf61e73a8af0-2381295e6d3mr137443637.31.1752613781372;
        Tue, 15 Jul 2025 14:09:41 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a8d6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4b3b5sm12745770b3a.123.2025.07.15.14.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 14:09:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] python3-pdm-backend: upgrade 2.4.4 -> 2.4.5
Date: Tue, 15 Jul 2025 14:09:36 -0700
Message-ID: <20250715210939.3226204-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 21:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220426

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ython3-pdm-backend_2.4.4.bb => python3-pdm-backend_2.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.4.bb => python3-pdm-backend_2.4.5.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.4.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.5.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.4.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.4.5.bb
index 71275f3ee84..e0fe16bd715 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.4.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.5.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "f72551eeb319f74ca25856c24fb4026684eeb0dddd9df68482901ab0dc481258"
+SRC_URI[sha256sum] = "56c019c440308adad5d057c08cbb777e65f43b991a3b0920749781258972fe5b"
 
 inherit pypi python_setuptools_build_meta
 

