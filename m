Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.25218.1591602511762901197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qe+70zpb;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id m32so7402391ede.8
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YNUgYGUWOEug9QzcCuNwbzTy6c9EVbtLLPduwGKZEc0=;
        b=qe+70zpbn0B6aIrqagSY/Qk9ttlED5+5g1FgQOzpLJWPughs+mQcoOmKtAV48EAoCi
         +ZGUjxu2t5BfszCYSeAEJ6m3qQvx6/YrxsVO8JG+XkpR/OJnBp83wQRWXVvXfqV5k+0f
         KMz4JYQfMNdVCaJL04IBHBmP+nB8m8JHOCBsYPSzFV4bBKccGN4Xzz2vjafXSAjcYNmc
         jZZ3pjEwVmFuN7QGEYHWJHUsAWY/0JfsYAeVY9yVjUiKt13m4ZxZ1yLKcjYOjSqn5v53
         vTcPxnbpYWbH/Z3N8Y6CJXFi4zpA1UMQWvM3owzKRWqX2zKd9pC1Dlij5JfNzcrirAcF
         q62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YNUgYGUWOEug9QzcCuNwbzTy6c9EVbtLLPduwGKZEc0=;
        b=N4f8fxmAy298Rl+C7uRkOgqgHEYuE0KA31ZDCZmAqEOx7wUGY9hQXW/x6k+rn4ey+g
         loR+/27JBFUSz+ecs2fHmIvtQBrbatLfQgQdE27GUYLNdehPTKYf5MBQQt2L4iu88BrF
         N2SnQWREPf4n8eMzMr/dvUCwoanoAO/nme6tt5799ezUSEe2l3RqRSWhfF70lZzQlGDn
         nUQnmt/obaOXu2iIca9chrTkaAybAXmb+hiihM/T4JvMbYgmZS1rsfVGSdvmpW9ZfO8K
         CCGL428+8ZceAsRsMGNG7aKsbFDBhNePW7ADbqu0rpSx0Mrg6no2DBAFN3s6iRfPwX7V
         Q2LA==
X-Gm-Message-State: AOAM531H5MTi/nbO/p8c6fmqUt/tU57LLM6oxHtJ7IXTmonaJT9esneg
	oOlCShKAsq/LNOlt/uX9rNmvGq3ad5s=
X-Google-Smtp-Source: ABdhPJzSXvw1vrrDPlUvwOIx6Ou2q0aUDPsFGzMifnJ3iUGPyqLYktVZlkAcMQqVmQl+QHUFDdOdGA==
X-Received: by 2002:a05:6402:54d:: with SMTP id i13mr18175512edx.330.1591602510063;
        Mon, 08 Jun 2020 00:48:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/42] linux-firmware: upgrade 20200421 -> 20200519
Date: Mon,  8 Jun 2020 09:46:36 +0200
Message-Id: <20200608074659.7051-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: added more entries to WHENCE, all redistributable
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...linux-firmware_20200421.bb => linux-firmware_20200519.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200421.bb => linux-firmware_20200519.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb
index fa0507a88c..fcad7df629 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb
@@ -125,7 +125,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=cb9a66eff0464b55335d3a7374fbc51c \
+                    file://WHENCE;md5=c15cee50b1a59d27106a37c2929d5291 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -196,8 +196,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "229a93395f4033da68429f165a62b952"
-SRC_URI[sha256sum] = "6dd7cba25d694c031f65529b9027cc8faaffaddfae70a4e3b58c2e4a0af3bfa8"
+SRC_URI[sha256sum] = "584c49c58291136b966ceffb0a456a672c23d4d759bab8bf86cbbe28061e415e"
 
 inherit allarch
 
-- 
2.26.2

