Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.6186.1592916795780646083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 05:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BGmbz0Vs;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id x18so23255450lji.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 05:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6JLHv2ItoFb+e3B1e0NuugJRQ+JInBAg1lfDpd8JQNI=;
        b=BGmbz0VskR1sVIskszATBWuy0rcfRzfTMHUYNPCYD3Mf8mk+HP3BCV7jcxZWjG/Ufy
         IdTo7ZiGulijPxjtSWfrtWCWLND5Ui0lkLnCz6EPUAseZwU5kHO+0sElnGbY/DjGa4BK
         6UPoF/rY6TqXPHBKgapQs3ZEHd4so/R1ARfzMBjGcWJ+XF7H9BOfG4yh6zNlCwuQyC8o
         aEDEttwAEZTdN+MUXRtYQkKamN+p8upTm3RzV4gH/PFELBJY4N2FZfsdGJTFbkHLfpsE
         9AmGD11HU6Z8NYDoZXHefmAJNmDtdoBMy3muHV8+HI3ZIUAZYVOJQHSIACVMNknEJDT3
         V/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6JLHv2ItoFb+e3B1e0NuugJRQ+JInBAg1lfDpd8JQNI=;
        b=svFsIy+EElhAAbX8HrFdByZ2NQ+Utagqti/hSPSNvlZOlTdIEa26UpjH7lZoIcRVk0
         bSkHBO9yi19GGGzqyANxW2fM9/iWm+w/6G0sqcGTlQMO8S1lypT4BME/naZQpApsvC/Q
         C6gMchjjpdMHgmNwiOGkfnF671GsC9SO2LlvTp7A2B57cRYMpwggmRwLTocNSbbm1oVm
         BvN77AqXA5t9UQ76fIjJAwcT5CTKL4HH1dAtMYNW/k6K/7QQB/JTrgijIlFOtnMsClMe
         Aqb/jtqroABmuN4hfMQvP7xwnH9qX0Q1aykCANI25MRtKaajV/keznb7vO6ekDUrc5dJ
         TaDA==
X-Gm-Message-State: AOAM53004WqQTPoYKmv9ncm4qB8mFkMjJexpcEccDF4RfuABTt12rqAb
	j7HKiETcJOqJPVxzyh3ly1n3IVQh
X-Google-Smtp-Source: ABdhPJxe1JAWeQthlhxETMDV/xwQItzlar1pNGv8BGRUD3Gqb6UDZViOBXjv/BXzfbriDyjVm5ZZ1Q==
X-Received: by 2002:a2e:8890:: with SMTP id k16mr1162324lji.113.1592916793496;
        Tue, 23 Jun 2020 05:53:13 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id j12sm3278907ljg.15.2020.06.23.05.53.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 05:53:12 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] distro_alias: Remove unused grub-efi distro aliases
Date: Tue, 23 Jun 2020 14:53:04 +0200
Message-Id: <20200623125304.1659803-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The target architecture is no longer embedded in the native package names.
See OE-Core commit

 53d3f12739: grub-efi: change to generate EFI image in target package

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/conf/distro/include/distro_alias.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 0e4a9a9f8f..2f9e1b1132 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -102,8 +102,6 @@ DISTRO_PN_ALIAS_pn-gnome-desktop-testing = "Debian=gnome-desktop-testing Fedora=
 DISTRO_PN_ALIAS_pn-gnu-config = "OpenedHand"
 DISTRO_PN_ALIAS_pn-gptfdisk = "Fedora=gdisk Ubuntu=gdisk"
 DISTRO_PN_ALIAS_pn-grub-efi = "Debian=grub-efi Fedora=grub2-efi"
-DISTRO_PN_ALIAS_pn-grub-efi-i586 = "Debian=grub-efi Fedora=grub2-efi"
-DISTRO_PN_ALIAS_pn-grub-efi-x86-64 = "Debian=grub-efi Fedora=grub2-efi"
 DISTRO_PN_ALIAS_pn-gst-player = "Ubuntu=gst-player Fedora=gstreamer-player"
 DISTRO_PN_ALIAS_pn-gst-plugin-bluetooth = "Ubuntu=libgstreamer-plugins-base Fedora=gstreamer-plugins-base"
 DISTRO_PN_ALIAS_pn-gstreamer1.0 = "Debian=gstreamer1.0 Ubuntu=gstreamer1.0"
