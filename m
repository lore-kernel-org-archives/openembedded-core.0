Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.7684.1614526647717829655
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eeZcHAnv;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id v13so912664edw.9
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FGamzZvtP1uoc2IVEWPw1QgL7VlEMcInETSSYeObmQc=;
        b=eeZcHAnvoxAihW8E1ClQ5UHSYGwHOdhmSuW5KfCsqaKGwvWPp9mOdm3iMV+EkIvktD
         TgDcu6IEDcL8bGYNly4tloXTjFtEivO1itTsCUPN9Tz63WNK3v0OqhgjXnYLnGf/Mpls
         Db1jQh3OpdqTgiC8jJ5WoAKUTBTLvNN4n7hhv7069zrKht+OLXtVPTZRvXCtTG8957lh
         vIEGRpWOsYsAVQ+LeP4znKJRnu/KTqUg6dYoRWGkd/qFp6u/lhKH/E2FNTOlBMQBBKvd
         hCaOJwka4zRAE9BH3pGKknn9kxNLkfUeZcn/NLUNj2w6tKNpLXUBuQuhBu6LFcIDlthv
         FxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FGamzZvtP1uoc2IVEWPw1QgL7VlEMcInETSSYeObmQc=;
        b=AHO86BrRhPoVd8dWHtKJUxaBEOSaCeQdZPZPPLL5c/I+467aDM/GyAbBDpdcA+khdU
         uuynPo03xJ6O9Y26dWP6papnD80wDCF9mf8f808wHkCQqc2xOiOPMvTe9Fbh4D9e3nbk
         2oQLJwoyzTQ8sVbmbrtro+2okjcXHj8rb6AIDe8gnKsyeDaaocP14fRXQXxTX6TzgcJm
         V2QRKgD67SyA0qzGQyah1q8EGNGSBoYfpjCBfoUS6EJp7RgteNnvJVjl/uYC/WrmnvOe
         pphM8CisvhIj9I0n5lYVQQaUTOBGAb761+NaxRg9UAPr3wK+8UdBHCZiVuOiVH7BgRCi
         UBYQ==
X-Gm-Message-State: AOAM5339NY2E899ZKa28H4x16lGmeQU767Mp7Jltm0GrjZue4Dj9TgYR
	iV7idNkJgb/JDydmLth+cGDl1k34iaKy1g==
X-Google-Smtp-Source: ABdhPJx67/MO4PjG14EhiG0Y10+y9ws8xGfglw1Le0shJg1At0y/So1V8Qk44Wh95LOPnSENqX6zQA==
X-Received: by 2002:aa7:c804:: with SMTP id a4mr12194880edt.251.1614526646356;
        Sun, 28 Feb 2021 07:37:26 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:25 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/24] syslinux: use NO_INLINE_FUNCS in CFLAGS
Date: Sun, 28 Feb 2021 16:36:59 +0100
Message-Id: <20210228153702.498275-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is required with latest versions of e2fsprogs.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index fbb2da7f91..8d78f62efa 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -44,6 +44,8 @@ TARGET_LDFLAGS = ""
 SECURITY_LDFLAGS = ""
 LDFLAGS_SECTION_REMOVAL = ""
 
+CFLAGS_append = " -DNO_INLINE_FUNCS"
+
 EXTRA_OEMAKE = " \
 	BINDIR=${bindir} SBINDIR=${sbindir} LIBDIR=${libdir} \
 	DATADIR=${datadir} MANDIR=${mandir} INCDIR=${includedir} \
-- 
2.29.2

