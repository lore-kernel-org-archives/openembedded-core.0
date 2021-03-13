Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.1076.1615625843459351612
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 00:57:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=goy+a9eY;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so11879991pjq.5
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 00:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zU253FKJenqENjoRcyM834E292YwPpoFONV2aT34UnA=;
        b=goy+a9eYj7WzxPUCj88LQNIjt02xM2S4lYV2lcijoH4M37XNebHH1DDGIsgddKPuqY
         lgBADrGPIExbOwzZQ74jjhN/JB1NDs/wtQZQO+vfwkbXIHOx8JDUzd/r+tgZKmvJB0GT
         eW9DIEVWWUU1tk7vi6vpfKc6JpkUaSC5sALYvds/pkcEm5++8b+NwabCS/Vfl1Bs6PZw
         czRMpbuNvDYnKaneolmbe9HaJJcxc0GzCooo97/mmrfoJDBQ+GQaIfKwTQC0kpBtKIed
         g7qI3J7EUTSa3Oa2LHU/ah7k1xEylf2JZJCcNVr4DLLdqhf8IdrHxPI+H9h+nGSIZi5a
         MVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zU253FKJenqENjoRcyM834E292YwPpoFONV2aT34UnA=;
        b=r/C8UMTgTFBn8i4lEo43AFzIrZFrAOqrvQqAz3/Hgd7FBBjXPIWRiyMbadt8e+50dA
         POrLFVoH7x3/dYv/ZZ7mBP2ujbS0mEeFpQtO+jrK/XODVo1x7T38yZeT80EQ2tSjtXX0
         0nVh8tXL31wi2Q4/yc8/FPIIJXHvOzMBWCdY6yRSe4LVYtAvGHuRavEioocUFUjN7xEc
         m9cSvPlXu0wQeTWWmtPvIxXhE+kNLS3MgofgRc6mZWqMnlhtmCiYT1nrrQxQxQTJLFbf
         dTyIgR5D61cp4A4Noo4Bj7iGFDe+GJJKCTPUCXLk7FG802Mb/maqHBE1RPTFO0vbvBv2
         7CcA==
X-Gm-Message-State: AOAM533IncYvnEEgAS7EgCi8Q71hBbROo/ZLb8yTCkG6D5YpeosJ8lJE
	iFsy1Yek3DaW2w8vp4BNMfWIwHkmLMjHwA==
X-Google-Smtp-Source: ABdhPJzb+XyzCQWE3/CrVJ0901GEBUa38SXvgFXyzFG7liWwJ+ee9pvFGDnBufJvHKNSRjamS63r7w==
X-Received: by 2002:a17:902:d114:b029:e4:87c7:39f5 with SMTP id w20-20020a170902d114b02900e487c739f5mr2500876plw.72.1615625842354;
        Sat, 13 Mar 2021 00:57:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id f19sm8005665pgl.49.2021.03.13.00.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 00:57:21 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] cmake.bbclass: Create cmake arch mapping for ppc64le
Date: Sat, 13 Mar 2021 00:57:19 -0800
Message-Id: <20210313085719.2795796-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 4af22268b7..70e4f3b6fd 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -81,6 +81,8 @@ def map_host_os_to_system_name(host_os):
 def map_host_arch_to_uname_arch(host_arch):
     if host_arch == "powerpc":
         return "ppc"
+    if host_arch == "powerpc64le":
+        return "ppc64le"
     if host_arch == "powerpc64":
         return "ppc64"
     return host_arch
-- 
2.30.2

