Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web11.360.1592848784508473895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 10:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0C0TEcA5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.67, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f67.google.com with SMTP id m2so13773422otr.12
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 10:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=MWpIOhYrCqawuD26DL8zc5XNNcIT9hHcEIad9I7qrdI=;
        b=0C0TEcA5ltvnSrxZnN7difsmAxdcoITjqgzUqoO1IIIFU1lusphMQUGv3YJVfcG4jd
         s7dL6b7mNWXzWwzeHt/14PH1FdXZIpJfzOafFMDj9N6sjXUz9PtVbt+0roq9xuHx10jj
         ZH+vT+MLcgKXl8/DfiSvjkkGJ+wl0mSgNMP8boof2Avy/DnWxWOnjSoiLbxCK9vpPbHA
         F8KbR+C1X4q2N60yJ7RoVXPRH3x+/6bh5RiJu2R+V2+QZhOSdCs95SyLLIafbCpGiilf
         mfwTyVOuLnnIyqMhI1mi0iW+F86KRznr8g64q8Bvrrcnf89Ly7CMd9Vx/6F7S378jFvn
         /vYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=MWpIOhYrCqawuD26DL8zc5XNNcIT9hHcEIad9I7qrdI=;
        b=CHm2nOclMT8RnaSURuBvXSzwI1cUx8XTrZBDHy3K+61LdDF2wBTmZQSwHnmC4Y+vIJ
         GvGxKIjeXBeGj/+c898uESrFJ1g7mUIkFt52opPj9PHue4RNEv+v+MBw6Xw+T2GAz/cp
         wDEKP7WC4fKpFYPCaplSg8q4sh3/bzxcgKvrD8G5IgnGttYA+goCFgeOhTA6kKVfc8l3
         1C9na3TxqngdwKFmpeEHrKEM0ZCNDFlTRf22x2xzb72bREd4nVyQ4sTTBbtVzqh2Lyix
         f1LIS9cM8bANFx+j3mvyMElID2DHyiPFlrMPPPQk6Bgfji8UDZvX7P5DGEMozhHX0zrc
         wkNg==
X-Gm-Message-State: AOAM533CkhcUow9idJ50aIUGKTua/kB6tHLigf2niNG+zrlcaUZFGLkE
	uCIY2f3lKi3dTVqnaTfLX1he4BGPC9749g==
X-Google-Smtp-Source: ABdhPJy8opff2FYRPzk1CjN0ufoK+WV0mEgl0Wriacha1bBMKQf+j2Traui4E/8++0DN8qMG0Egbew==
X-Received: by 2002:a9d:7dd3:: with SMTP id k19mr15364003otn.278.1592848783359;
        Mon, 22 Jun 2020 10:59:43 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.10.59.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:59:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/33] mdadm: remove service template from SYSTEMD_SERVICE
Date: Mon, 22 Jun 2020 07:57:59 -1000
Message-Id: <f54c3c049eacce423d9c75c823f8ab15ba185167.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Kai Kang <kai.kang@windriver.com>

Remove service template mdmon@.service from SYSTEMD_SERVICE which should
be not started by systemctl directly. It is hanlded by udev rules.

Replace tab with spaces in SRC_URI as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a55b2b29bb86d98700836de5b7d68965c7cd5ee5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/mdadm/mdadm_4.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 40c5273e00..001d3331a7 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -19,8 +19,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-fix-gcc-8-format-truncation-warning.patch \
            file://debian-no-Werror.patch \
            file://0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch \
-	   file://mdadm.init \
-	   file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
+           file://mdadm.init \
+           file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
            file://include_sysmacros.patch \
            file://0001-mdadm-skip-test-11spare-migration.patch \
            "
@@ -30,7 +30,7 @@ SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1
 
 inherit autotools-brokensep ptest systemd
 
-SYSTEMD_SERVICE_${PN} = "mdmonitor.service mdmon@.service"
+SYSTEMD_SERVICE_${PN} = "mdmonitor.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 CFLAGS_append_toolchain-clang = " -Wno-error=address-of-packed-member"
-- 
2.17.1

