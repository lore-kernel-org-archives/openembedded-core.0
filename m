Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.8398.1590840715726501973
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2020 05:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fojqmHpK;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id x13so6811602wrv.4
        for <openembedded-core@lists.openembedded.org>; Sat, 30 May 2020 05:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Lm8gAoeG/giIIQPbwF0mx39Q1q5zBPvj3b9oAhQwfuM=;
        b=fojqmHpKu6WewOqbK02JlKzI/bl8tD1vhoUaZ7dTRyp9vAT9f+MMkTrT4jPCeXqGiQ
         RZjfjkfdr+/koWy7NmSyrloiJTfVFduak6fAvHGtwmeXYhgvB6eY5jIpvfOfPlNyX8y4
         suIHQwkm0y1kEBwPXCDhwQ2ckTqiKfyMkjaBUP/z9YitNmdi01SIAsFGTDEi4EYYFJvr
         qR0mX0oFEjOuFCbwhoSfDmzuYMNMwVA17+cmjR2zfODzkFWTkjKdUT93FQih0g8jLHXO
         NlQgcGytYvHJkDCcUXM+CE1S7hQ+G1rCsenne6HQQ35RHM7XWuCTemUG8fXEmEFdctQT
         VlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Lm8gAoeG/giIIQPbwF0mx39Q1q5zBPvj3b9oAhQwfuM=;
        b=WUdBUUrkOUwdYfyDZxP+vTq3XLpNOicS18VOIwkc4nEvD6xGDl1R6kuritKU/whASJ
         bQIJr91rTLhkNRYPBjDzIpzxK7zkOSb9shEjPqJAq8TWP6jA2PlXM1iA4XaYVL+innyz
         ZjUZVbmVxHhjqibDfS75cFSx1oD7PC9+Yo3mogl/iT1Ousk2MXByLoEWX/P97fsu5iT2
         h8CALnrd9lQ4jPKTZ6aTNmspRS/9z4qn1NCVoXg7v7yWJEHCxsXUFbzxEWOAyGyWHVbl
         Fy31lFkEUAgFrnhBRrEWTs87/lzMvCQX9LDRO1TEhDwOUMou1wiovNBR/ewohQ661tIZ
         OoKQ==
X-Gm-Message-State: AOAM531MGhwaSATBkmXz2tvvF32XF5yGMsrNeAC7Bu0VkXzT7WOn/QJb
	lr0G+mWvy6+313K4RhR5HHLYch+6
X-Google-Smtp-Source: ABdhPJzoo6RIsjVZL1npxjs6a5llBx67aBqgLo1ZXsoTFBk7whyKlZOSXH9XWkSBN3zVCnwnUQuwHQ==
X-Received: by 2002:a5d:6581:: with SMTP id q1mr12794050wru.43.1590840713817;
        Sat, 30 May 2020 05:11:53 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id l5sm3157902wml.27.2020.05.30.05.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 05:11:52 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] openssh: Upgrade 8.2p1 -> 8.3p1
Date: Sat, 30 May 2020 13:10:45 +0100
Message-Id: <20200530121045.30428-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../openssh/{openssh_8.2p1.bb => openssh_8.3p1.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_8.2p1.bb => openssh_8.3p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_8.2p1.bb
rename to meta/recipes-connectivity/openssh/openssh_8.3p1.bb
index d879efc2012d..fad321898c73 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
@@ -25,8 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            "
-SRC_URI[md5sum] = "3076e6413e8dbe56d33848c1054ac091"
-SRC_URI[sha256sum] = "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671"
+SRC_URI[sha256sum] = "f2befbe0472fe7eb75d23340eb17531cb6b3aac24075e2066b41f814e12387b2"
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.17.1

