Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.172.1630174367646149330
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BWwqTXLv;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.171, mailfrom: steve@sakoman.com)
Received: by mail-il1-f171.google.com with SMTP id v16so10842824ilo.10
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/rD4F3DFgVqJyFVaKMPm1vdYWv7kVmMESGSw+nqgoEs=;
        b=BWwqTXLvSKd0pWM+lsH1/TbRItU67HcPi5Xc7OTzMf/e+G5DY8fKKpUuX0i3w0WYwR
         TGJmfQjWjbkARjJdwjh1UP/uhqnEekDSayv4SwPZzIMqvdMwp0gYUpIhJY06RlGS2/QM
         qWlE+gCnfl6j+M8zpK4i42nEULUjx89lD1yCGdBNI+28tVK+h5UpfI3Ow6CA8BcY6cyK
         zyggjA1MIWOriVPBgiR3+RGyzM3AAtujBComOMCjgV3TZjxXmUN3AQWJ9zpnNEE4rMwh
         skPFwE6XJo9rPx00/axnvjVOo0AzRYQz1XQXfeKIO4YMoIQpzdZfizCtJb00YTzflyTH
         3T3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/rD4F3DFgVqJyFVaKMPm1vdYWv7kVmMESGSw+nqgoEs=;
        b=Q4676FtBUKMlfRletPZeZAXNEmf9TFjDmO1ILxx5/noLPVpyEVn3IU8kxpX3/HJfJP
         4hMYnQw/8WtHMxHtuOGKJQWqfYNCaLwoX/2FBh1Gju4Mtsmh37koK2Neew6ZZFClDcwL
         zWQOyMMJT+jkhn+K0rHBfWMFTGYiubvkcT89lyX9JhDnVBPShgBkRW4mEZQT9L/S9EyB
         Z1KFi+E+s6yvZzXjx4wpOo+ML+Ou35rEj3FJ5uSj34HYWBH07X5aLaM1yMLKkG6Gk+a1
         weiSdUjuAFI/jo3Sak0jtEfDxgDaq6dPPVXrYQ9zAt0gdGmAYjebt4616x1rxvRPTlc5
         ub+A==
X-Gm-Message-State: AOAM532cOHqCe8brz0FWgDpNAwTMi9DHgOSNVU8m/wYxebRExMmSr5xE
	VgvbOYNXISawMVXdPZGZII3FHiPl+2Mf1VPc
X-Google-Smtp-Source: ABdhPJweq1atdNF8URl/9gaIbCkHAhDgRsUMnHP69LGmizyAMDJzuHVsUpTYwYMIs7dIB7AnQPBYLw==
X-Received: by 2002:a05:6e02:214e:: with SMTP id d14mr10768043ilv.142.1630174365962;
        Sat, 28 Aug 2021 11:12:45 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.12.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:12:45 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/36] qemu: Security fix for CVE-2020-29443
Date: Sat, 28 Aug 2021 08:10:59 -1000
Message-Id: <1765005f73303d9857f9fde93efb1cc8534964f1.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: Qemu.org
MR: 109315
Type: Security Fix
Disposition: Backport from https://git.qemu.org/?p=qemu.git;a=commit;h=813212288970c39b1800f63e83ac6e96588095c6
ChangeID: c0296e285169cc937cc9758c9d84ac690297ee54
Description:

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-29443.patch            | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 76bfb4fcf9..bd1a83955f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -59,6 +59,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-25624_1.patch \
            file://CVE-2020-25624_2.patch \
            file://CVE-2020-25625.patch \
+           file://CVE-2020-29443.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch
new file mode 100644
index 0000000000..1528d5c2fd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch
@@ -0,0 +1,45 @@
+From 813212288970c39b1800f63e83ac6e96588095c6 Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Tue, 1 Dec 2020 13:09:26 +0100
+Subject: [PATCH] ide: atapi: assert that the buffer pointer is in range
+
+A case was reported where s->io_buffer_index can be out of range.
+The report skimped on the details but it seems to be triggered
+by s->lba == -1 on the READ/READ CD paths (e.g. by sending an
+ATAPI command with LBA = 0xFFFFFFFF).  For now paper over it
+with assertions.  The first one ensures that there is no overflow
+when incrementing s->io_buffer_index, the second checks for the
+buffer overrun.
+
+Note that the buffer overrun is only a read, so I am not sure
+if the assertion failure is actually less harmful than the overrun.
+
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Message-id: 20201201120926.56559-1-pbonzini@redhat.com
+Reviewed-by: Kevin Wolf <kwolf@redhat.com>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+
+Upstream-Status: Backport
+CVE: CVE-2020-29443
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/ide/atapi.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
+index 14a2b0bb2f..e79157863f 100644
+--- a/hw/ide/atapi.c
++++ b/hw/ide/atapi.c
+@@ -276,6 +276,8 @@ void ide_atapi_cmd_reply_end(IDEState *s)
+         s->packet_transfer_size -= size;
+         s->elementary_transfer_size -= size;
+         s->io_buffer_index += size;
++        assert(size <= s->io_buffer_total_len);
++        assert(s->io_buffer_index <= s->io_buffer_total_len);
+ 
+         /* Some adapters process PIO data right away.  In that case, we need
+          * to avoid mutual recursion between ide_transfer_start
+-- 
+2.25.1
+
-- 
2.25.1

