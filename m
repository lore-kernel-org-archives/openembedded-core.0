Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.1397.1623708076881514024
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 15:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G9StDJtu;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id bb10-20020a17090b008ab029016eef083425so112282pjb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 15:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iFJV2/IwTOjo5ReZIZUDUaLPKMuhS2SJfMs/f0dYxdw=;
        b=G9StDJtuyO5k6wtPvYqD1V515dFnnfXqh2+5Q+OvOFrW0moC9RF/McIQYfaKJtk6II
         S4GYMpOfljBowjGxINBrAn7xxvOh185+d7+JvVXFvJY8y2hTY3KWMPvAw6BgKgMjR8xV
         anSNZz3WYXE4heahR1liaCqebOdgNxyq7lZHuLYcwZ76Q8jjAieXoXG5cJkfn0FYmHHJ
         rmd0IRAl/9iCQMsovUxNYsMplXxpfOHokdyeveNkMz56PKiRXcD95jyLRLkMC5FYsvGS
         wu1o7JbSiLLyrq3McLh7GS/OhROtNeIJ2l0RzxJBp8S/4s4qjh+e8QDCv4w4VDaFCHV8
         5XdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iFJV2/IwTOjo5ReZIZUDUaLPKMuhS2SJfMs/f0dYxdw=;
        b=unP8t9TRQ18QULfX0vknq/KvPHfES2b7Mafu4btQ3SAr6yLyYdyK3FNbG0LchhW5j0
         xA0cptyEBQF6I2qy6kxNZZjyqEBkkLiPYE4fNR0pmnUTwy6THNA0HdEgSaiV/rPpkVig
         ym/JOfg6RiGuZc30K5qICqqPFhZwXN13VtG5PRylVouhFPBLO2SgPtxHydsemtFWbbR2
         WfWbwgdDaIqF5DYWneth8bt8o3fNxu9GLZeiXiKC6QhWwtTwSBPEZTwkhP+kHTG58Qk6
         WG7jdEld/ot5koFZ8EdgQ9OJ1Ma+Vg//v5fHVTqAezF+qw4rI73+BQVPvfQGmtIupIY3
         TT2Q==
X-Gm-Message-State: AOAM530awA7aQOSVaktENYWiUGd2Uc/zK34zELDv1h8F4yvk0h8xl33O
	dt1rlbVx7gG/U16qBMjI3Crc9JgxCpdGgA==
X-Google-Smtp-Source: ABdhPJwOx6KzBEA9mGAq3P8BO2hIAj/mtg2ycjz7QhG5dIHXNDAI1mYjwoJUgc6qsTriUpi5XaeeeQ==
X-Received: by 2002:a17:902:b203:b029:11b:1549:da0d with SMTP id t3-20020a170902b203b029011b1549da0dmr903524plr.48.1623708075993;
        Mon, 14 Jun 2021 15:01:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id n6sm5544612pgt.7.2021.06.14.15.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 15:01:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] linuxloader.bbclass: Add entry for ppc64 LE glibc loader
Date: Mon, 14 Jun 2021 15:01:11 -0700
Message-Id: <20210614220112.3956295-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/linuxloader.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index 30925ac87d..3ded1fc786 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -40,6 +40,8 @@ def get_glibc_loader(d):
         dynamic_loader = "${base_libdir}/ld-linux-mipsn8.so.1"
     elif targetarch.startswith("mips"):
         dynamic_loader = "${base_libdir}/ld.so.1"
+    elif targetarch == "powerpc64le":
+        dynamic_loader = "${base_libdir}/ld64.so.2"
     elif targetarch == "powerpc64":
         dynamic_loader = "${base_libdir}/ld64.so.1"
     elif targetarch == "x86_64":
-- 
2.32.0

