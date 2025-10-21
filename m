Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4953ECCD1B9
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 19:05:17 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.21478.1761073512460518431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 12:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CtgvkE3T;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-471066cfc2aso13593305e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 12:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761073511; x=1761678311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I5P/A4VZ8Zfi11GjFTa3wQdqKt6dbmMF/CALPETK+2Y=;
        b=CtgvkE3TcJ9Vlso9NuPifve++HmiLtgSC1xm2tX94xyGUaPfK0SUGz8uYyJHKxX4ib
         lfTQOkrU1DkAdD1LDFvXfDwZw3sTDTUzRytWW/p5A2OPfvzGFUe5BpO5W7msnibPpyJc
         mLxi+2KDvk9GmXc5/RveqZrsgiRbo58MSR7ZgSjNA9h3qyy6gasWLxjpkMT5OCHBwPyZ
         k/9p5ZtXy5lDN7XPo/TcYPqv1sVMBnrRKvlMhuQlLJ5MkLD2hE5iMw9BNC9ZQit90JwM
         z85d6D1OT2icX7ohoZP/fY2MOPzDRUeN0uLfQ0YebdIReiN70OuW6gBpWAvvBBUBfSay
         mCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761073511; x=1761678311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I5P/A4VZ8Zfi11GjFTa3wQdqKt6dbmMF/CALPETK+2Y=;
        b=q2oscrC6E8rofuEaw1ZQHfEqHeVrPn4pAV0dICawf0sAUmbKihPBWSjoNIXYV64UR3
         4InVDfyBKM4deQif/lkgkYwunpDtI0gADbZIdWug0E8/iXeru5ykl5uKDSFQzXxSNvog
         tOhXM8PLJlCoIKQjWZPybpWmPwixMyWxLq4FCWBc7VOzvYeR7Gv3xWS6qevSfwOnfvMR
         e4HwD1r3UFsosH++H1ee4dSOwRtOEvVPqLh9W4GnYq1+tv7D+lOVQrEZjRobJb9A+yuX
         ka7It5vCnRn2qAZbzDNZAg6VbnP6+cIOqc3sl+KkeDIG0FpI4cIKByjCN3MG1+w/Y9oF
         AftA==
X-Gm-Message-State: AOJu0YxMjggjX5BYhtbCJH1mk9YD1qpO4UwYk3+cIDuDLgkL4Ql5W7ed
	NWi2QrTLZi6WPcuVMOsd9JVgNetgepJYvSXxS1vH6+zM7cIzIpHN45TgdtIdAA==
X-Gm-Gg: ASbGncsZlftAEta8Qm2T2YpwNBiTOHik836Tesrj1dglw/Jx/8F6wNoVGIpL8UmOqCx
	okKhY4/RQvBF6/cvsI3v2hFjDR0IrWt1ZIRxG/qjI2yK+dtygz2SzL7ycRlh7rVG/UddZOBYkJ/
	jPYEzRL4l7e9vucEQT9PPytdl3oBseQPB0X8hskFM4+IwqXLALQIyRU6m2sACkeC/N/UltsE/jU
	FMRWhiiJrQ6fYepP2KKJ8uV6ANZ7vGg2AThoWjejkls5EzYaa2br8jNlUn/gmAJNy56tdESwX0/
	6yWnz9Pqr9BaP9ECB2S9H/moG/xg1D4ZpvY7DoATm/UxqdtjZDh4dv/bVSDfo7F0LS1t96x1cl6
	OY/LZrZjIiFyXN9zr4lISjVIlJ5gns8HjoorY9CLbz1j+3/sqwOcO356d8Yvx3W10G/jvlscsVS
	ditRySNil2
X-Google-Smtp-Source: AGHT+IHxfuHQIaVIeybC7dc0dzF/xxVStwb/Cg+1ZPz6SH9EwS8uaRX2DLAPwyphgiOU6TEpO/smjg==
X-Received: by 2002:a05:600c:19d4:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-47117903e2amr122481855e9.26.1761073510749;
        Tue, 21 Oct 2025 12:05:10 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428ece8sm6658065e9.7.2025.10.21.12.05.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:05:10 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] fmt: add ptest support
Date: Tue, 21 Oct 2025 21:05:09 +0200
Message-ID: <20251021190509.300000-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 19:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225162

Execution takes around a second.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 meta/recipes-devtools/fmt/fmt/run-ptest         |  5 +++++
 meta/recipes-devtools/fmt/fmt_11.2.0.bb         | 10 +++++++++-
 3 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/fmt/fmt/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index e6e725bd25..06d113e264 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -19,6 +19,7 @@ PTESTS_FAST = "\
     expect \
     findutils \
     flex \
+    fmt \
     gawk \
     gdbm \
     gdk-pixbuf \
diff --git a/meta/recipes-devtools/fmt/fmt/run-ptest b/meta/recipes-devtools/fmt/fmt/run-ptest
new file mode 100644
index 0000000000..a069e4543c
--- /dev/null
+++ b/meta/recipes-devtools/fmt/fmt/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+for t in `ls ./*-test`; do
+	./$t && echo PASS: $t || echo FAIL: $t
+done
diff --git a/meta/recipes-devtools/fmt/fmt_11.2.0.bb b/meta/recipes-devtools/fmt/fmt_11.2.0.bb
index fd5dc0c4ab..06ba523ada 100644
--- a/meta/recipes-devtools/fmt/fmt_11.2.0.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.2.0.bb
@@ -7,11 +7,19 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https;tag=${PV}\
            file://0001-Workaround-an-ABI-issue-in-spdlog.patch \
            file://0001-Fix-compilation-on-clang-21-libc-21-4477.patch \
+           file://run-ptest \
            "
 SRCREV = "40626af88bd7df9a5fb80be7b25ac85b122d6c21"
 
-inherit cmake
+inherit cmake ptest
 
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
+EXTRA_OECMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', '-DFMT_TEST=ON', '', d)}"
+
+do_install_ptest(){
+	for t in `ls ${B}/bin/*-test`; do
+		install $t ${D}${PTEST_PATH}/
+	done
+}
 
 BBCLASSEXTEND = "native nativesdk"

