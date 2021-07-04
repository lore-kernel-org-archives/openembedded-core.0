Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.8224.1625397729867102291
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 04:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DVDJzoto;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id h11so7334575qtp.5
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jul 2021 04:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LQLl+tZc1AjuGbGIGpAiIHpMa7XvJXoC/eT1W38QSVM=;
        b=DVDJzotoK/fXqCU9gfn3ttXGxUS/LdXWw/DbbPXz3ZAuXdsdMhGGzLjMvD8vBrOBsv
         vlUH3AxotzfV0KS9I5NXU7+uXPjPXTKLipq+1x59zN5VgoM4SyDc3mEVYPY+CKzB2iCK
         UIylLNZlW/Ra1+2c5sTSuk8z4ye/JfezzvEv/rwy3xeGP7fSW1zm0KfoGlxKSqBVVyZI
         PAz1c3J72Q/hPSVBQX3YyKUGHSjR9+wYRnfyZ1O8B9zfYw8l8hOUPiGzW0FzFBfz51Fy
         Hl+NeO/dwQcwA4o9i808/8b81Ro4O+IZIEramZ8oIwsZweVpY5d+P8RgUqfJbt8MLGA4
         FueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LQLl+tZc1AjuGbGIGpAiIHpMa7XvJXoC/eT1W38QSVM=;
        b=GDcgvhZ95FsYUtS6M86cpHZdtC7TDDSB8OyvQQK3KOqA8YbNFTkGC+026HMYebQDDT
         mK8Rgj8Uo/9pcJh2pnjFcIZx9dXEdQq26of/RBLwLRZhpA3yn3xjdfObJnmsSsgGN5g1
         Wh2nRGTeHicaTuI+EPYmZyxS8p6dYAWjAsfpWo0VZv9EAZh840fXK4riyhVv9303CYnD
         sHxsWlGQwvYWj+e8ult8fS55/dw87MPmPjhiLQJxNCsX8FTLuTsG7cUgpWC0WRLaG6QV
         hAzZ+0ymDvelbuvSGSqO6DPBPOdWE4qICYgcknJ1UXH7+0iwjOsuOsSrJchBTMrCUYGc
         qDhA==
X-Gm-Message-State: AOAM530/nFbKLo4xy8sI7vlvReYUnU5RxhnyHzS2IDXBwczAGHsg1C3V
	GnszrNFzo0sZcYE9yNbaOFw=
X-Google-Smtp-Source: ABdhPJzVDf7n2KXnC/0+V+TAO6ZBFZWmW8vab4JDJiU92QZKGUi8C8GiXW/aH+J6KmJR8FI+Zn/uxQ==
X-Received: by 2002:ac8:7f0e:: with SMTP id f14mr7932604qtk.103.1625397729020;
        Sun, 04 Jul 2021 04:22:09 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id s25sm3901418qks.129.2021.07.04.04.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 04:22:08 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH] glibc-package.inc: To fix build issue with glibc-testsuite.
Date: Sun,  4 Jul 2021 04:21:59 -0700
Message-Id: <20210704112159.150061-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <CANUMPcU0ibVFbf5x0OzEunTymSd8+_chCD3432xa3CTeL7QzjA@mail.gmail.com>
References: <CANUMPcU0ibVFbf5x0OzEunTymSd8+_chCD3432xa3CTeL7QzjA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added condition to check "$cleanupdir${datadir}" exists.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 92e5dbac61..df3f612192 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -230,7 +230,9 @@ stash_locale_cleanup () {
 	rm -rf $cleanupdir${libdir}/gconv
 	rm -rf $cleanupdir${localedir}
 	rm -rf $cleanupdir${datadir}/locale
+  if [ -d $cleanupdir${datadir} ]; then
 	rmdir --ignore-fail-on-non-empty $cleanupdir${datadir}
+  fi;
 
 	if [ "${libdir}" != "${exec_prefix}/lib" ] && [ "${root_prefix}/lib" != "${exec_prefix}/lib" ]; then
 		if [ -d "$cleanupdir${exec_prefix}/lib" ]; then
-- 
2.31.1

