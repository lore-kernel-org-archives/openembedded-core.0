Return-Path: <matt@madison.systems>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 181C26079F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 10:49:30 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id u144so782624pgb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 03:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=74FiyiHsCKkXZCGWns9H2NxiddW6YGdVl3HwbIrMzxU=;
	b=Ew/en+gbRdbvKabXeUFkeeLRU5jdc3pmjh4uscyM5oGVsEUdwLDfvd6QYCRWbHCxGx
	mr0Cmao0gi959LMr8gj0jei5zvCpIq2etbAp1AKk6iGmn6EKeXE4BpB1AXG9ztotN9nu
	E14ykZcwfbX28tx8dw+cZUSmYo63OkpWxsdz/Q08h0fjAsmXoDeiBeOngQMSCSQnfNDx
	3uFvKVCcjRmaoE3pMv9tpdzufLZZzfwDA1x4G9qo/3+5lPcgs3lvK2VuotdWi3yd6RBp
	Lu35V/uDvBkqqhCaSX9A+Atwlp3x+TYcs1g/XPy7XQG8MaH+7gqDGxXv6Q6o3ulR9Yjn
	mwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=74FiyiHsCKkXZCGWns9H2NxiddW6YGdVl3HwbIrMzxU=;
	b=A69bdf/iMSPav3G1K3qYEwaMGGCXMCQAKjkOFaaCKN0/7ztgUX4GK/bLcx1QwV3xlo
	GMCKK+0f4y+fPDePElcfusIaC6X1nRzKe9m54XoLUZUsb/mYtw5D0DOrKy6w3y+ySYL3
	FN+SKCkFIMSDh6CKtykkmXzrYYrv/BkHvgTTN8KzxNRa4iZ3h3nrwm6MZ6RFDe6e+jj1
	sMHvLBJhXtGLQXQnANzQYjlQ5RTXXeGXUqhhZPSZ5C8sxCcn5NAMwC9IlgXT31HtamTE
	TiRagvYA6HvUq2ttX5Qz/ohz9wWquY+HXSX8lXt4d07y8q+rQnnSQxWu5SdWNRaEMHSC
	2iVA==
X-Gm-Message-State: AMCzsaUpW6dZnZLcH1icArO4iepbAtHqdNFaBkdlVTVh8OLPlecL3xhB
	37CAvmxqUfdmgaiCgAz7wL9OgMDr
X-Google-Smtp-Source: AOwi7QDzTWYGrmRzhYvuXXgjs6h/ujd8ZIY6vEPzQ250snCA5MJx5bHZQkDYhQ5GEw3GpAVxs5uZlg==
X-Received: by 10.84.229.143 with SMTP id c15mr8031533plk.389.1507718971708;
	Wed, 11 Oct 2017 03:49:31 -0700 (PDT)
Received: from workhorse.madison.systems
	(c-67-170-200-185.hsd1.ca.comcast.net. [67.170.200.185])
	by smtp.gmail.com with ESMTPSA id
	g16sm22648340pgn.43.2017.10.11.03.49.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Oct 2017 03:49:30 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 03:49:13 -0700
Message-Id: <1507718953-9032-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] go: update to go1.9.1
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
X-List-Received-Date: Wed, 11 Oct 2017 10:49:31 -0000

Addresses two security issues, including CVE-2017-15041

Reference:
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-15041

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-1.9.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
index 65adaa8..eab518d 100644
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ b/meta/recipes-devtools/go/go-1.9.inc
@@ -1,6 +1,10 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.9"
+MINOR = ".1"
+
+PV = "${GO_BASEVERSION}${MINOR}"
+
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -16,5 +20,5 @@ SRC_URI += "\
         file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
         file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
 "
-SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
-SRC_URI[main.sha256sum] = "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
+SRC_URI[main.md5sum] = "27bce1ffb05f4f6bd90d90081e5d4169"
+SRC_URI[main.sha256sum] = "a84afc9dc7d64fe0fa84d4d735e2ece23831a22117b50dafc75c1484f1cb550e"
-- 
2.7.4


