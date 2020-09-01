Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.8426.1599000141593050806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JjbCOoZP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id a17so3196284wrn.6
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 15:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pFMAzKpQaRL894yCDMvOz/5ImzvoN4RfSgb692GGpQ8=;
        b=JjbCOoZPseg8Og2oTSqkl9JisBVdkQ/oaRU/uZkmv8XqW6shtlcgXFViQC+nMFOdga
         /Nlir2ehy8kkqCBFwz9M68QelLgqG2H7331ovCNKKQlj7q1lWdHIIyw+dRWxr9mZbF4X
         IffLWpF8gHKE5+GlPLlVNwDV1ayTS1ZtZOF2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pFMAzKpQaRL894yCDMvOz/5ImzvoN4RfSgb692GGpQ8=;
        b=CtY47uK8SW9vq5jFR3prcQRCZKZzvxKXjtLP8HPLGB0HH0YEwV9OAYWRe+qYMa0Nr2
         EiH7qOLYc+fpEtQILZbVGmCEDTINa08elwQ74iZn3uh6tQQLkMb3VEl1s3A+iaI6cIed
         7ntp5gioxsdj2pG+mAcUurWjAFdsBv7XTkQJTgbr+VN3iSCbTAUZkEwErt1UTCrb2rqa
         DsFJCgrusWFKoJjwNn0uLzttuspIwMlDVL33cDq5f9xlSm4RYs8wISSDfEPISyMP5lRb
         HOKt3D3i0JN+nz4FInzkQZOHcyiX/uyfrplHPBzjsKeXUGN+pVDgLrQ4L/OGHGetglC8
         mp6Q==
X-Gm-Message-State: AOAM533MCwPzJxq7wME6xwwTMolZ8FpmkGKbarDQWaKwispZYgFgVke6
	gASOHtKJG1IR/wFbqzfoJ4Ogaa3VVjpDpIIm
X-Google-Smtp-Source: ABdhPJzBhQ3gZkuKy/JH45vWLoOfo6KE8UQ30n7k9g2SiaXBKOw6m+GET3+dM6fJcwM+b5MklAHGiw==
X-Received: by 2002:adf:82f6:: with SMTP id 109mr4377629wrc.25.1599000139456;
        Tue, 01 Sep 2020 15:42:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.d.2.7.a.9.f.9.6.8.f.0.2.a.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:d5a2:f86:9f9a:72df])
        by smtp.gmail.com with ESMTPSA id t13sm4091540wru.65.2020.09.01.15.42.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:42:19 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] build-appliance/packagegroup-core-base-utils: Replace dhcp-client/dhcp-server with dhcpcd/kea
Date: Tue,  1 Sep 2020 23:42:17 +0100
Message-Id: <20200901224218.1677415-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dhcp-client/dhcp-server is obsolete and unmaintained and about to be removed,
replace it with something which is maintained.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb      | 2 +-
 .../packagegroups/packagegroup-core-base-utils.bb             | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index c9367dd0c48..e6258a2d4b6 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegroup-self-hosted \
-                 kernel-dev kernel-devsrc connman connman-plugin-ethernet dhcp-client \
+                 kernel-dev kernel-devsrc connman connman-plugin-ethernet dhcpcd \
                  tzdata python3-pip perl-misc"
 
 IMAGE_FEATURES += "x11-base package-management splash"
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
index 75018379371..1e63da7f166 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
@@ -21,8 +21,8 @@ RDEPENDS_${PN} = "\
     coreutils \
     cpio \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "debianutils-run-parts", d)} \
-    dhcp-client \
-    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "dhcp-server", d)} \
+    dhcpcd \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "kea", d)} \
     diffutils \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "dpkg-start-stop", d)} \
     e2fsprogs \
-- 
2.25.1

