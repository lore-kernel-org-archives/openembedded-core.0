Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E608C0219E
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 04:35:43 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.8009.1739334940706144380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 20:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OLwrhOP9;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so62576835e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739334939; x=1739939739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uDSCOtZp+ADS64i3sHtAD+dK1HqaMDDvAm6TH8aRPWs=;
        b=OLwrhOP993F+9sWrw/cBzKaPv1d1DFuJMAf88ejH2lfm+PSSadT9wnS0tTE9LLzIC0
         ZkiYPFwDlZpnQUy2QMhXqvsYwyfVAq9CFRTkhWlg/YRPxYzz/yOSAxk8peZFcMaX8g1d
         jVxn75i3FCuchvjHP/QnXIrLBUjqIHoTZmNJUlNc4xuRwIJg4dnLJfbWdDQVvnjh/PfT
         UdcncbUkXRZy26sxlvC1f2/S3RhDWbI8fxuBrQr3v5/sZ1LAS0Z4tjRhnZ7PP1PwXI5F
         g5whAjcdxZORQgyMuubcQRoDJFhcpdOicSynpq6AfBxmFu7lTdaJPKeVEROXvr1q7/OO
         468w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739334939; x=1739939739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDSCOtZp+ADS64i3sHtAD+dK1HqaMDDvAm6TH8aRPWs=;
        b=eyI6PNZSgU01z+47MiQPEned5WuC/rC0YMFrcoh05yzAkef5Pn9FMpFQcRwY+0j/KU
         YCypv7tDJ+Ej2KUyPl7qmFKR/fhlP1FBJrWZwrCFZEze6otJst1A4YBXn7ZzPw18+b0I
         O7wYKFopuEAEBKdPtdhYBLq/yRdPzGeFnIKKDzwaYUVLdW1aplUtXLrVg98JyVqjsOvd
         +KxGQ5VL/t93++ka4AsHcY7ZtNRcx3ZdpD0aBA/YUTmvbbQtQ/dTxzCG4CuHc7H4ygbq
         LCasUZ0U93vup3sb7ZJlwxQM4tQ4/l7UnfssPD4gMySSBxhD9ore35MYWQduPi8lm3DB
         291A==
X-Gm-Message-State: AOJu0YzDvryvj+QtMuO3Z6nPqH+iCxpiN94BK04tSPLgV7BMUkU6jS4n
	nsjGRYXbfOEK5nZcEBbzPCX/wfk1PEg42UPP8ggsI4h5mMI97HrxLdNKiQ==
X-Gm-Gg: ASbGncvINg9Y2ipo0tr6frexOB+bJviL+16IZUdNFwwqCcrcXJfNc/TTyWzp1sa0VFi
	4qEU4W4ShHT9TKWJlDBxdcCoUkOSUWJzpQ7jj8CqQwTms6vhvGmIag0wO9AqSxIoq/gxRuk8k1S
	vmQVjXTDs1OYuIIhZ/X4SogwHS5032rdV+LBaG3ZHOTeKC3ol7Q5CVipr3D0D8HBKF1jhCjZxWa
	qeiekr2r5Fhuedii5Uv4LcAu0zeQxqd66q/gig4OVkv4AR3tpUCOikfFvBhTDGgERtqkNi90aa3
	D4N9Y167PU+1r5UQOuksRG4YtNA0qHL5T9uWRtZReV0I2w==
X-Google-Smtp-Source: AGHT+IGjlfRMqiXSV1CxYEI6Lkv3FmdlETTpvqAlK2Mgn/jKsN3+ZfXQufXgZw9X/jLZuMdoMtynDA==
X-Received: by 2002:a05:600c:1ca9:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-439581d1f44mr14700625e9.31.1739334938303;
        Tue, 11 Feb 2025 20:35:38 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a070ea7sm7487815e9.25.2025.02.11.20.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 20:35:37 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v12 1/5] rpm-sequoia-crypto-policy: New recipe
Date: Wed, 12 Feb 2025 05:35:28 +0100
Message-ID: <20250212043532.1258912-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 04:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211203

This ships a crypto policy file for rpm-sequoia.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../rpm-sequoia-crypto-policy_git.bb          | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index bec55a7c1c..648c8fceb8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -744,6 +744,7 @@ RECIPE_MAINTAINER:pn-rpcbind = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-rng-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-rpcsvc-proto = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-rpm = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-rpm-sequoia-crypto-policy = "Zoltán Böszörményi <zboszor@gmail.com>"
 RECIPE_MAINTAINER:pn-rsync = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-rt-tests = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ruby = "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
new file mode 100644
index 0000000000..37ace2c78c
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Crypto policy for rpm-sequoia"
+HOMEPAGE = "https://gitlab.com/redhat-crypto/fedora-crypto-policies/"
+
+LICENSE = "LGPL-2.1-or-later"
+
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+DEPENDS = "coreutils-native openssl-native make-native"
+
+inherit allarch python3native
+
+SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
+
+SRCREV = "032b418a6db842f0eab330eb5909e4604e888728"
+UPSTREAM_CHECK_COMMITS = "1"
+
+S = "${UNPACKDIR}/git"
+
+do_compile () {
+	# Remove most policy variants, leave DEFAULT.pol
+	# It speeds up the build and we only need DEFAULT/rpm-sequoia.
+	rm -f $(ls -1 policies/*.pol | grep -v DEFAULT.pol) || echo nothing to delete
+
+	make ASCIIDOC=echo XSLTPROC=echo
+}
+
+do_install () {
+	install -d -m755 ${D}${datadir}/crypto-policies/back-ends
+	install -m644 ${S}/output/DEFAULT/rpm-sequoia.txt ${D}${datadir}/crypto-policies/back-ends/rpm-sequoia.config
+}
+
+FILES:${PN} = "${datadir}/crypto-policies/back-ends/*"
+
+BBCLASSEXTEND = "native"
-- 
2.48.1


