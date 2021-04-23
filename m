Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.64.1619200985702687310
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 11:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZjXP/L4p;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id u17so75180247ejk.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 11:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7CSZjl5/2hhTgnUxHPSloEj5s1nR6/avs3odK8BkO94=;
        b=ZjXP/L4ptnN684LeVf6wv3Ucavb4TW7zuOvGECAnoBBw0+q65iwE3+wL/gV+rlEAS7
         kRNWb5n42JQnInY7pJImK/0cKQ8Rs2wkW9Wcez+x/0Es6Jcvyaq8RY6SO6Sq9QNlWBSk
         qIiYhDlu32xop5vjpFlFWOL5eq0N1NkH33kZZ61UoPQHoBqNF8wZa34BcuTJ2OSz5l4h
         4FGPJgdNd8EL7zNsRyRnBRB6zJ0hK4jRdp5Xkq3LgCOb28MaaKrSo3M0UNpsKhBVoVlC
         t0dof29XXyNKVPa2mF8TOKYrkWGpGMzr3Zii/reh+s6H7W00hP1ulgoO/yNiV+Byx+xx
         DZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7CSZjl5/2hhTgnUxHPSloEj5s1nR6/avs3odK8BkO94=;
        b=B7epPV8a/Qc9jQpNRYcwZXltBCsofyXenIzmn2lDJ8Co6zL+XMCszpQYRZSSeApnf3
         ik+0z0DDoFoF5Hvwz/UKm2TTH1u07RRAZEdNAPzU7ZriRDYo1+PvIYbYFDHTd7Uz2Sz3
         oo8z1lJ0BM3FvAqvx2JBp9d7MaOTx+Rg+hwd5gVqaBsapttviASERkkl2jkC5URwT+ZP
         G5z0cVcMf+N7TKYSZZoWLmqDP59aKF3Ity1GCGlRwajp2YeHmCXOW0NMaSKWu1obXMcy
         yeVImDOxsA/cyMYMvQIPWz9OA0LIE4CeCO6m8PTmBsoSH4sEOU9SZ7TSwUJCMbloREH1
         3/4A==
X-Gm-Message-State: AOAM532CSVJXPWkmnrjwaYhXiOpfM9ei7rDRmkd04I+ReKhbUftOZf2f
	U/NL6eDQXc/X/Y1mrX5dU6TBeel5z2iNEA==
X-Google-Smtp-Source: ABdhPJxdlf0HRddt1E/q4QXcDVmATFg8DMV72jT2J/hn7hFwTt3M1ORo7k82HYA2qGsp/tXyKkV5TA==
X-Received: by 2002:a17:906:4ec3:: with SMTP id i3mr5567471ejv.119.1619200984355;
        Fri, 23 Apr 2021 11:03:04 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id z14sm5315849edc.62.2021.04.23.11.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 11:03:04 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 6/7] default-distrovars.inc: add wayland/opengl to default distro features
Date: Fri, 23 Apr 2021 20:02:53 +0200
Message-Id: <20210423180254.706537-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423180254.706537-1-alex.kanavin@gmail.com>
References: <20210423180254.706537-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This puts them on equal terms with x11 distro feature
(which I think is due).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 9fcc10f83a..384ee7fc98 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -10,7 +10,7 @@ LOCALE_UTF8_ONLY ?= "0"
 LOCALE_UTF8_IS_DEFAULT ?= "1"
 LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
 
-DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat"
+DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat wayland opengl"
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
 
-- 
2.30.2

