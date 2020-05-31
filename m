Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.17627.1590940424594811051
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DL4twLnz;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id g9so5414494edr.8
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=drGrL8Tq/I2rZWRS1ksqwLUO1+pQAwqDz7hwW5OXgRw=;
        b=DL4twLnzEtjxZCjCDRd3+GkwA+n7SkaTBXwf8srJWNeJ96/FQ0UpQ+gzsWYLq9f2Tj
         FaJJtoyXjW6V+ouekIgryZvtoXsP+co488oI8liQ7SdgwOxvayGKzTLv5HdgbcFR7ALF
         NZ2Dm6hykdYzKHkPfGIsOVtmXivhDOcpdhhcF6x/bfLisGatBh5Keu4Z13aKiNlmkcN7
         b7k4I6vUp16VBG8Uc5rTNEfOm5PPuSty86+nSmV9HSUYin5Q5ilPZdHCHadSnsOzqbHp
         xZ0/aX+n0YQNqHTwT/uhfTc8HHZ57wUswLp2K7KhwEbyehA4Nyp2wGHJmtwsgIUJX6SX
         u9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=drGrL8Tq/I2rZWRS1ksqwLUO1+pQAwqDz7hwW5OXgRw=;
        b=WLYEOM9+IEajh8E8pP/IK79e1G5TziwmTQxlITPTFYKCUEH9WD6CVWaA4AbqmOVStj
         Ti+AOMioSQXna+oElsSoEKvuHHbY9CSZQPt20xK92vKIlbOlLEv+mp/v2mcHL3gr8Psc
         5FZx8VTSkU1lWDjPn8HOOYwX0jNZPCEVvO0rymDa6X3eUbKxq5fyMuu8IR43YCnewbJA
         dMNyO09AI2tCXheRmFYrGenOAb34GdPDU7/xeOvNFTIaq0cZzPV3BqY/DdpiyJywtwY3
         fGEnYbj9NNUIdGLEVSlhDaF/1wq/NB7ePY9nLJ2xbe7Fvi9wOGQqI9+8YQ459eCTUrzL
         UKig==
X-Gm-Message-State: AOAM530cdrp1rkQFTWsBuwkCuRE4UClUg4SnziPlL7fu7JQ/M2SnmLN2
	WM+B3wVExCikuRTr6ELe02C1sqIN
X-Google-Smtp-Source: ABdhPJzwjhmLgfm4Ii26t3L58mVFj5ogaNndPUN+Nz3KajZ8gw82AIwoM7v6GWqy0cYVpTGIz/PycQ==
X-Received: by 2002:a50:d1d3:: with SMTP id i19mr17311662edg.35.1590940423030;
        Sun, 31 May 2020 08:53:43 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:42 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/70] cups: upgrade 2.3.1 -> 2.3.3
Date: Sun, 31 May 2020 17:52:03 +0200
Message-Id: <20200531155254.10283-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/cups/cups_2.3.1.bb | 6 ------
 meta/recipes-extended/cups/cups_2.3.3.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups_2.3.1.bb
 create mode 100644 meta/recipes-extended/cups/cups_2.3.3.bb

diff --git a/meta/recipes-extended/cups/cups_2.3.1.bb b/meta/recipes-extended/cups/cups_2.3.1.bb
deleted file mode 100644
index f5230faf81..0000000000
--- a/meta/recipes-extended/cups/cups_2.3.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require cups.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-SRC_URI[md5sum] = "8ad8897c97cf4d90f20dac4318f47421"
-SRC_URI[sha256sum] = "1bca9d89507e3f68cbc84482fe46ae8d5333af5bc2b9061347b2007182ac77ce"
diff --git a/meta/recipes-extended/cups/cups_2.3.3.bb b/meta/recipes-extended/cups/cups_2.3.3.bb
new file mode 100644
index 0000000000..5caeb6f58b
--- /dev/null
+++ b/meta/recipes-extended/cups/cups_2.3.3.bb
@@ -0,0 +1,6 @@
+require cups.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[md5sum] = "412434ceefbdf3ec71bc9188a035f589"
+SRC_URI[sha256sum] = "261fd948bce8647b6d5cb2a1784f0c24cc52b5c4e827b71d726020bcc502f3ee"
-- 
2.26.2

