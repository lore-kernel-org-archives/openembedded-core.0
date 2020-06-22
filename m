Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.18516.1592835558048199124
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 07:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c23c1ZBj;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id u14so2922207pjj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 07:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=boN6MW+/Y4S+4/pIYGkoWgGy4LFcSHYNzpKjjXOA57c=;
        b=c23c1ZBjMvyc17tXLuDMeg6jpS94dFHVSNQYgMMTU7/rN8J3IUSPgYUNjlcTRReK2V
         MN6gEIW/POwT7XeAsGhxUhYYH5oAgZZNhIemBf7udB+1tebNcufCZb4TXWy0LQILhN3t
         R5d90k+fi6Wcrf8O48dUVxaMWHVi8kvsOWSNIUWffrN9NgYUd1+Z70HN5tgP1fznolYf
         Ap99vkl79GQb67wlYhBzGBSgbhpubbshVevsBjcatLB95vhazMhsaq6F/b7MFOyU7Fai
         faKcBxiSgd/MvWyhrgiurKy4A3T+bJ2Kg+bs0LddaCYRelohgPE/JBtvpIxI9UVRa5mn
         Zuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=boN6MW+/Y4S+4/pIYGkoWgGy4LFcSHYNzpKjjXOA57c=;
        b=cfLOhLWsLk28elPjd8r//vOa47Yf03fD8myX61Mc40jb9kKaP1IUbiYTwE6pCts20z
         YHy1LCUYK1BTCkIGD94lIm3prGp5ekhpb4njyGVACBtnWPqfUNi2kCmXN27+3iUqKvJ3
         he6toABk0DKbdNoilrcHF+Tk0Dw/Yp+059U5qn6cHMku5R4XGQ4PJNdvRjkkS3VOeK26
         527AN0xvmIfIHic2MZUjJx/4J1QG7IuzLg0dpAuBeTT6OeJXer3c62bdX3zT3jRZLMG0
         MVyW6ol00nRjlyt6Kd4t9i5UD5oi9OxhtzRrW/O9nYoIc5fhblOxjxgqV/e/tMP52pm3
         71PA==
X-Gm-Message-State: AOAM533wHOu+8fH5Xy8SWoaxt8z1r8zIH0p64YAwm4KswqhE+zJVkPNb
	YqMEG4Oxq57yOtjQhgZJwljv10wX
X-Google-Smtp-Source: ABdhPJy0YCP9SHahrQP8w3OarymRWOZf0U9eB/agekDxZFWivYTU9osthwBv9S4rChJT8xHVnuHbYw==
X-Received: by 2002:a17:90a:e60c:: with SMTP id j12mr18765753pjy.185.1592835557369;
        Mon, 22 Jun 2020 07:19:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:489f:ae11:ae3f:a4e7])
        by smtp.gmail.com with ESMTPSA id 23sm14188840pfy.199.2020.06.22.07.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 07:19:16 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 1/6] libuv: move from meta-oe to core for bind update
Date: Mon, 22 Jun 2020 07:19:10 -0700
Message-Id: <20200622141915.31932-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622141915.31932-1-akuster808@gmail.com>
References: <20200622141915.31932-1-akuster808@gmail.com>

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../libuv/libuv_1.34.2.bb                     | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-connectivity/libuv/libuv_1.34.2.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6496a48e40..fc1b5272da 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -393,6 +393,7 @@ RECIPE_MAINTAINER_pn-liburcu = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-liburi-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libusb1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libubootenv = "Stefano Babic <sbabic@denx.de>"
+RECIPE_MAINTAINER_pn-libuv = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libva-initial = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-connectivity/libuv/libuv_1.34.2.bb b/meta/recipes-connectivity/libuv/libuv_1.34.2.bb
new file mode 100644
index 0000000000..234cec37bb
--- /dev/null
+++ b/meta/recipes-connectivity/libuv/libuv_1.34.2.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A multi-platform support library with a focus on asynchronous I/O"
+HOMEPAGE = "https://github.com/libuv/libuv"
+BUGTRACKER = "https://github.com/libuv/libuv/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
+
+SRCREV = "f868c9ab0c307525a16fff99fd21e32a6ebc3837"
+SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+do_configure() {
+    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
+    oe_runconf
+}
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

