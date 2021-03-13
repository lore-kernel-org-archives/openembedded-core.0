Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web08.2527.1615661408928265575
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:50:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CCThWsIX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id a17so5176618oto.5
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wwq85JYMZxWDKlgiQEbdwSQ26ZaF2erNUtlQoQDMtRI=;
        b=CCThWsIXB2yLtXBkeprzuNk8YXFfDkdCKcQnrOX7AWHEd7tT26wYyPan+pvFIZfgA7
         5uSr2LLuyr+8w4nrtAQdjGNiCHkn3EXrVTZPGhmgaatTnTeTjr9qWNGUc7geYkmvJ5m4
         U3MR45ZfJW4IMkBNgU2+8GuVP3llTv0lQDIovJQc7TRd9JU99LXwhBjP+I3BsOCldNT/
         /V7X4l0K5Z7wssxLoo+hjcCNjT2XrgVAhc60bAT15b9EsOfPXXAspXS6hNFCDyHdwq8c
         snhwIP+zU2ft07szzvehzb5tx7ak1P3lXphn4czHZ4V+sgS6WPw4HaMo+RoCM/geq6/m
         KZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wwq85JYMZxWDKlgiQEbdwSQ26ZaF2erNUtlQoQDMtRI=;
        b=kiaVl/dKzVuP7sLHiSSbs+3g0yMkiy17lMeeqkS3JpS0e641d3Zjr73i1PqGinXjIW
         UzRstr+KBArlEHMhr0+pphhpHcuIN3hspOrxzNAvnD2Dz5iQXOnyl1qkPZYuTQqdhPw+
         +zFw3d2nRR9gMZ2x2PjcHQwTumi0qA3YWnlQ2a3AXQhLGSLMJlrk/kDovsxX+BzxTdGJ
         Aeh3U9COCjb31aYzS+wOh9IiKe6xndEr1V0Ohl0wBwGLyPPrP+q/X+LmXGqC+StAkUUo
         Jt/HiSyuR3sO6kBM6NYRxqkJTR2xGozPtzkC0DaUfoo9TIv7oYbJf2l5NnbJJHgJrjBM
         3Kxg==
X-Gm-Message-State: AOAM532PKzxrHBtVwqhNP7SFB8F5C9lMB0o8r5pNGmto/eLA8Xi6cM+f
	ySlMFZgtzYKU9LTcDVAAQHu39tFO69aMWeuA
X-Google-Smtp-Source: ABdhPJxDB0I5aSey5YdD7OuBnMQ/f1SJs/Yu+fy2190Mc9b2FCNExF6gef/1zpiVFLkwa6gr3tGULA==
X-Received: by 2002:a9d:7103:: with SMTP id n3mr7782147otj.223.1615661407813;
        Sat, 13 Mar 2021 10:50:07 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.50.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:50:07 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/38] shadow: whitelist CVE-2013-4235
Date: Sat, 13 Mar 2021 08:48:52 -1000
Message-Id: <8836a56a9f17f238908b7d0e286a6d386f7be290.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>

This CVE is about TOCTOU (time-of-check time-of-use)
race condition when copying and removing directory trees
which had very low severity problem and marked as closed
and won't fix. Therefore whitelisted CVE-2013-4235.
Master, gatesgarth and dunfell all have shadow version 4.81.
Hence, this is applicable for master, gatesgarth and dunfell.
Link: https://bugzilla.redhat.com/show_bug.cgi?id=884658

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1c6cd87bee6b019619dc5728fd6c36bc87ed696)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/shadow/shadow_4.8.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.8.1.bb b/meta/recipes-extended/shadow/shadow_4.8.1.bb
index c975395ff8..ff4aad926f 100644
--- a/meta/recipes-extended/shadow/shadow_4.8.1.bb
+++ b/meta/recipes-extended/shadow/shadow_4.8.1.bb
@@ -6,5 +6,6 @@ BUILD_LDFLAGS_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'p
 
 BBCLASSEXTEND = "native nativesdk"
 
-
-
+# Severity is low and marked as closed and won't fix.
+# https://bugzilla.redhat.com/show_bug.cgi?id=884658
+CVE_CHECK_WHITELIST += "CVE-2013-4235"
-- 
2.25.1

