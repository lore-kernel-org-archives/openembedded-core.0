Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.3687.1608344629781055515
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 18:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jLjupuir;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id r4so2362988pls.11
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 18:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TUGE/LfN8lBxVLS9eRS35690cUWNo67ij28TgQRkk7M=;
        b=jLjupuirUUP/ohwk0PJCVAQzNBaepcN2Ax7nFVB3OouPMwSmsGLKk9XYV/DYAxcq9j
         JZFTxJMUdS+BF0Ik7zM+fWgFC6PYVMpYa3uU5S8UxNK9q5I7CNza5iySJY+Z3YXsEvG0
         47vV1h7fzTU0j2S7rv+Z1eAPvZfsWUVKQhJg1aVEcrQG1ddRc+LhMEQvMJk+zqINOVsP
         N8QFywuqzOjmlcdGGGeV95flecaKQs36owcyzIHTmFD2cpQ2uijdn+ZyH71GUcXhfICF
         qZFgxIo3CfIgPg8404/xjAMFp7RLQHwK96uxpuDJgKZkL3a6l6kCGBd+t6edPmuntSuh
         Cyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TUGE/LfN8lBxVLS9eRS35690cUWNo67ij28TgQRkk7M=;
        b=T+7v7f6clXj4cQf7OXNYhdFu2x/SdPPvUc9QLVXxDjcaDULGHfLvTbg0F+Z4NxysV8
         fTVFQnEm2HE3Hy0X4TpdK6EYhMbTDooUwvaxb+qziZnpnyTlb2iYRYVbvHH76LBZVDBp
         l58yiDMY6wS2tOfiDwQ7eu2f5Y24bMAwzGs+2rqrl42e5gNe3cvNXsiGVp/qDcEFLJ6V
         I3uEDCeFZ1KtWdcmLo34ryKGqNgtvm/4FIh3UZcwpFEwgu7nu/otl3Td1xVpDRD2GKIv
         DTzc8ws3xeIdidXdF7UPk0HwB8JXMn9xTmGYtR/dDdP8E/SutVFZN7b+nv5p389Z00d7
         q4BA==
X-Gm-Message-State: AOAM530QX1FsLXmVwvxLJ6Q7VmyKazzVEpyFrjlYNCkwaDUt4IMl0UTq
	6+qUxijxxFEszbjLMXfixsdGsBTjMQFerA==
X-Google-Smtp-Source: ABdhPJyg8Ri0IKE+l7/kzqIbuI4Y8YGBZAiy4Bv32jZOULdpwEJkDPF33BpsrLQx+lLzYy9ZQIfDbA==
X-Received: by 2002:a17:90b:1c0d:: with SMTP id oc13mr6883060pjb.113.1608344628884;
        Fri, 18 Dec 2020 18:23:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9ac9])
        by smtp.gmail.com with ESMTPSA id s7sm9936514pfh.207.2020.12.18.18.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 18:23:48 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] busybox: Sync rcS.default with sysvinit
Date: Fri, 18 Dec 2020 18:23:43 -0800
Message-Id: <20201219022343.3362531-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201219022343.3362531-1-raj.khem@gmail.com>
References: <20201219022343.3362531-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/files/rcS.default | 29 +++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/recipes-core/busybox/files/rcS.default b/meta/recipes-core/busybox/files/rcS.default
index 66513daf2d..44c9747e34 100644
--- a/meta/recipes-core/busybox/files/rcS.default
+++ b/meta/recipes-core/busybox/files/rcS.default
@@ -1,2 +1,31 @@
+#
+#	Defaults for the boot scripts in /etc/rcS.d
+#
+
+# Time files in /tmp are kept in days.
+TMPTIME=0
+# Set to yes if you want sulogin to be spawned on bootup
+SULOGIN=no
+# Set to no if you want to be able to login over telnet/rlogin
+# before system startup is complete (as soon as inetd is started)
+DELAYLOGIN=no
+# Assume that the BIOS clock is set to UTC time (recommended)
+UTC=yes
+# Set VERBOSE to "no" if you would like a more quiet bootup.
+VERBOSE=no
+# Set EDITMOTD to "no" if you don't want /etc/motd to be edited automatically
+EDITMOTD=no
+# Whether to fsck root on boot
+ENABLE_ROOTFS_FSCK=no
+# Set FSCKFIX to "yes" if you want to add "-y" to the fsck at startup.
+FSCKFIX=yes
+# Set TICKADJ to the correct tick value for this specific machine
+#TICKADJ=10000
+# Enable caching in populate-volatile.sh
+VOLATILE_ENABLE_CACHE=yes
+# Indicate whether the rootfs is intended to be read-only or not.
+# Setting ROOTFS_READ_ONLY to yes and rebooting will give you a read-only rootfs.
+# Normally you should not change this value.
+ROOTFS_READ_ONLY=no
 # Indicate init system type
 INIT_SYSTEM=busybox
-- 
2.29.2

