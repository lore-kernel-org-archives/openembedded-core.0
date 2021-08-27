Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.2707.1630030161769480326
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 19:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E71Bcwpb;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id w6so2955716plg.9
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 19:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1hMQdzKuzI1UTuSkanwOhiA6DvaHumh0puZwW8RyyAw=;
        b=E71Bcwpbt6kD8ATPQQ4jwn7WJ1sMStZjecekhcCZcFkpXHFEgg242hAOW/xIPtYx1d
         aFF0ux0x0ZnfNZHlQQaXmC4qGHsAoijIsK5z2wqEoFvDipA4kBPxFPzTtWfn2R/RSwE7
         XxthNl++TWtDIKzhIO1nSbB7ZasHJ2+h3UoM5DjJgFY6uns8ohDB8fb1Lv0PzX0cswTX
         3sN90V2ci6nYeI0xcKmCWH0bFYrdpWjhGv/Oo86E6InaAJxUyz6lIYdZgO/A9nF5+iJ5
         Ij7QqmiDRQVKzz5BHd9rFeIzFO1r7DFsyT2nUg4VS4JKMxfAGVAG3vKDp4Ud52J/bKEN
         JSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1hMQdzKuzI1UTuSkanwOhiA6DvaHumh0puZwW8RyyAw=;
        b=lA7+IzdSSvAhs3uEEEis5vzXXb0b2sD3DTf3UgO7hus0eKSxo9TEsQjE18EAm/dzM7
         NRlqwi4LdX8ZUVwJUTCWvYsmi+BgMJ40wY96pbX0SlAzkLEux1CNgq3WvmVAwEepOH8x
         fnZolkhSHbv7H+mX3rx3MB1icVuFPj9MxR0Mc9oXzry3hUUIVgLQ/e2edyMZyZZ+Ncux
         vKIlQ5G4pfAL5YbH637ZO3mLisU2dfKpr3OHPnLaBCCnghbOmn9uXyy463B108c9VbOW
         9XN8MSvUx2iRA5IpaVS4MSDGpYCY9QN3MBFoDXO4o6mAGVD7zW5+cPdT48UwH/rHXgiw
         leew==
X-Gm-Message-State: AOAM533uAyz+HX30rQjXxwKDHCj36HA0AhiKOHQXX6hp6rYFOTQMJHBI
	/CokUf//xFW+7ZTKeo9/Ium+RTW2F34=
X-Google-Smtp-Source: ABdhPJzHASNeq1s/3mlZ/OqfLuo/3Ne6wKMaJemhZW0SjyVTcNKpZVOmmeh+mDfhC/u4WDrQBnkWOQ==
X-Received: by 2002:a17:90a:460e:: with SMTP id w14mr20317726pjg.143.1630030160935;
        Thu, 26 Aug 2021 19:09:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:fe04:ee7:4da9:eb01])
        by smtp.gmail.com with ESMTPSA id w3sm4097723pjv.0.2021.08.26.19.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 19:09:20 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][hardknott][PATCH] lz4: Security Fix for CVE-2021-3520
Date: Thu, 26 Aug 2021 19:09:18 -0700
Message-Id: <20210827020918.3700472-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: https://github.com/lz4/lz4
MR: 111604
Type: Security Fix
Disposition: Backport from https://github.com/lz4/lz4/commit/8301a21773ef61656225e264f4f06ae14462bca7#diff-7055e9cf14c488aea9837aaf9f528b58ee3c22988d7d0d81d172ec62d94a88a7
ChangeID: 58492f950164e75954a97cf084df6f9af3d88244
Description:

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../lz4/files/CVE-2021-3520.patch             | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/recipes-support/lz4/files/CVE-2021-3520.patch

diff --git a/meta/recipes-support/lz4/files/CVE-2021-3520.patch b/meta/recipes-support/lz4/files/CVE-2021-3520.patch
new file mode 100644
index 0000000000..5ac8f6691f
--- /dev/null
+++ b/meta/recipes-support/lz4/files/CVE-2021-3520.patch
@@ -0,0 +1,27 @@
+From 8301a21773ef61656225e264f4f06ae14462bca7 Mon Sep 17 00:00:00 2001
+From: Jasper Lievisse Adriaanse <j@jasper.la>
+Date: Fri, 26 Feb 2021 15:21:20 +0100
+Subject: [PATCH] Fix potential memory corruption with negative memmove() size
+
+Upstream-Status: Backport
+https://github.com/lz4/lz4/commit/8301a21773ef61656225e264f4f06ae14462bca7#diff-7055e9cf14c488aea9837aaf9f528b58ee3c22988d7d0d81d172ec62d94a88a7
+CVE: CVE-2021-3520
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ lib/lz4.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: git/lib/lz4.c
+===================================================================
+--- git.orig/lib/lz4.c
++++ git/lib/lz4.c
+@@ -1665,7 +1665,7 @@ LZ4_decompress_generic(
+                  const size_t dictSize         /* note : = 0 if noDict */
+                  )
+ {
+-    if (src == NULL) { return -1; }
++    if ((src == NULL) || (outputSize < 0)) { return -1; }
+ 
+     {   const BYTE* ip = (const BYTE*) src;
+         const BYTE* const iend = ip + srcSize;
-- 
2.25.1

