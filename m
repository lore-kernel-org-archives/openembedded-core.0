Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE88607E1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 02:13:55 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id c11-v6so5582605plr.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 19:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=egaJHsuq7YCLKi73UY9h9qfsO7E/+ptd5p9lqMEyxHo=;
	b=RfmoRGRpsUgCONH9e2xCpcYqmwfwRi6rP99O7pak+yINR+9w63nP7DUThGel8QDZ+w
	POVkga9w5JUW9m28/XU0fdXkAa+ZeWxm1UZptr+A4AK/GPcsfzAuE/v3SXOeszpVk4MM
	uFUyFJew3n3jQEFQSj5Y0m0+5FRUhV7N0GLLVJOG6xXBEuHf6FhBl7W/5pMOcafwWgxe
	R3KLun4XFDgB5bRVFQcbqei0TvKC8kxklRV7LS8kWkCoUl+brNYxMHsaMR04bFRKpd8E
	Fl8GmuX+8ToonbYkKaPzhTF7yApXOqCnq1rZpdPkL40Stmzt+8a8kM0aW6yWfaFabAyX
	Gjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=egaJHsuq7YCLKi73UY9h9qfsO7E/+ptd5p9lqMEyxHo=;
	b=sx7qxFNsqPqq2BePy3RnLbkzmU+aqQhxdNu9+kIctJADoMmnkkCCa3rzI5lyMPzY7S
	+7/AzTrlJpIV+oQRCG8z8QaQXgK2LMKR813jXg30zXDoB+sdUiLst6+aD3Z/eLn/lVja
	+TAaB3onfiQtiSHfxZJi0ck8108kjZoxj6a0Dz9rc30J3AlBXDOl51OTa1tpp0JDlN9f
	6FJQ0Oi/CHPcKTFhEUPlUaqrkPLt6UQqkKWGCu7sx1n2kOL0c3gnPAnmBO+pNxn0WybE
	PASSTY56Ev0ZQ4Z6RrhRzcbkwGlgkGqxWHV7rbFXHqH4WOTJ3ZTQy2pRB305qfZ4DHNq
	J//A==
X-Gm-Message-State: ALKqPwelDhC29FnosKFUMYwFkJpmJSknFWjIBVU+H7jUG5Pt/P+OxAdV
	YyrBF+rfjSjIg6H5HPv36eZ/ng==
X-Google-Smtp-Source: AB8JxZrOWC2h4s0LUTWOiOxJSrz+ePwPkEmvnZVG9Vfi4HxKDxOS1pR0fbqIcUr5fmAs3wn/SJvubw==
X-Received: by 2002:a17:902:d886:: with SMTP id
	b6-v6mr11880778plz.361.1526696037220; 
	Fri, 18 May 2018 19:13:57 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:ed41:dd75:6b53:32ea])
	by smtp.gmail.com with ESMTPSA id
	n10-v6sm19307081pfj.68.2018.05.18.19.13.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 May 2018 19:13:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2018 19:13:48 -0700
Message-Id: <1526696034-3857-2-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526696034-3857-1-git-send-email-akuster@mvista.com>
References: <1526696034-3857-1-git-send-email-akuster@mvista.com>
Subject: [PATCH 2/8] kexec-tools: upgrade 2.0.16 -> 2.0.17
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 May 2018 02:13:56 -0000

From: Armin Kuster <akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...rm64-Set-fno-PIC-along-with-mcmodel-large.patch | 33 ----------------------
 ...kexec-tools_2.0.16.bb => kexec-tools_2.0.17.bb} |  9 ++----
 2 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Set-fno-PIC-along-with-mcmodel-large.patch
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.16.bb => kexec-tools_2.0.17.bb} (92%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Set-fno-PIC-along-with-mcmodel-large.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Set-fno-PIC-along-with-mcmodel-large.patch
deleted file mode 100644
index 786fc0c..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Set-fno-PIC-along-with-mcmodel-large.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a12dfe9be05f9dee96c7637a20c01e05711c563c Mon Sep 17 00:00:00 2001
-From: David Michael <david.michael@coreos.com>
-Date: Sun, 7 Jan 11:26:57 2018 -0500
-Subject: [PATCH] arm64: Set -fno-PIC along with -mcmodel=large
-
-As seen in GCC's gcc/config/aarch64/aarch64.c, -fPIC with large
-code model is unsupported.  This fixes the "sorry, unimplemented"
-errors when building with compilers defaulting to -fPIC.
-
-Upstream-Status: Backport
-
-Signed-off-by: Simon Horman <horms@verge.net.au>
-Signed-off-by: David Michael <david.michael@coreos.com>
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- purgatory/arch/arm64/Makefile | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/purgatory/arch/arm64/Makefile b/purgatory/arch/arm64/Makefile
-index 636abea..80068ca 100644
---- a/purgatory/arch/arm64/Makefile
-+++ b/purgatory/arch/arm64/Makefile
-@@ -1,6 +1,7 @@
- 
- arm64_PURGATORY_EXTRA_CFLAGS = \
- 	-mcmodel=large \
-+	-fno-PIC \
- 	-fno-stack-protector \
- 	-fno-asynchronous-unwind-tables \
- 	-Wundef \
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb
similarity index 92%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb
index bd87b37..f4ec586 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
                     file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
 DEPENDS = "zlib xz"
 
-PR = "r1"
-
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
            file://kdump \
            file://kdump.conf \
@@ -20,11 +18,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
            file://kexec-x32.patch \
            file://0001-Disable-PIE-during-link.patch \
-           file://0001-arm64-Set-fno-PIC-along-with-mcmodel-large.patch \
-         "
+           "
 
-SRC_URI[md5sum] = "5198968de79b5ded96f97f3c2ea9637b"
-SRC_URI[sha256sum] = "cf17fc99bf77c9b39f06ee88ac0e86d0349c4a0c3f8214a3cc78eece872f6f3a"
+SRC_URI[md5sum] = "8e071ca473694a71e4ae60ed7ef6f377"
+SRC_URI[sha256sum] = "450c87ba048641eb05f9717f5567aca57f063c266149ae663b58a34e5852deaf"
 
 inherit autotools update-rc.d systemd
 
-- 
2.7.4


