Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1D026754B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 16:45:33 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u18-v6so2748731wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 09:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vbZ18BvdwjHVY9Xcob87oCluGmyKZgA30QvzNmRNEGg=;
	b=Zme9c3mBsbJIqV+9myK9ZjeZs7IfGitEuhv7E5/Q9PJZcRVOOPcP8vuVKxKK5s+wmy
	xbFpAyHQlttccgPDjrS+PCSZkK16IYUfXhgAmNZ5diLyUqRxJXpBaFtmKktom9s4SYQc
	kQ0Z44ziMCXsvWv3wnYJv2wtU1HYsFiE6oqMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vbZ18BvdwjHVY9Xcob87oCluGmyKZgA30QvzNmRNEGg=;
	b=GKXe4I+Zm1i2zKHJX+509+ul0qqYOk6wFv/zmz0406fgyuIHujqPkGOrPt3QgtM14h
	lsL7u9Avd3eAa7UbdFdlolhDakuwdx1STjGUm+CTZQoKi8+Q+EEne8RGwXIuTDxgtCSb
	WOOPb3hcW0FVJAJlRncn9xgSbycxOSvYNy9tWKofeTTFIUwtlwzj3ZwQRNrGFaspSsqW
	f6+RA3/dlcntVZxg8AFj7WGrXq+X+V1B0ppkQEkzhenjDQViU2UCksCTon4YTXsD2QKr
	BFuTiF2QQp+Fh/EDdX32z3SynEg+TaxYn7PM7IUquFAwLaqQ/fxwccvJSaX+ObIMpvJT
	l/fQ==
X-Gm-Message-State: APt69E1oM+kGTufVdMvrLqHrRwRLJ3YOLlYmv8RN8yuhvFfEYX2+hf7i
	gcta1Ss4o8iJ9np1zthO7jaovKWH9Zw=
X-Google-Smtp-Source: AAOMgpfG27kHiFwHZtyDS1fFI/XlEIPhbvdRjB4CY/1+go82IcVIe3IpFnD2mtid+SHtGVV2k7xU0w==
X-Received: by 2002:a1c:b1d7:: with SMTP id
	a206-v6mr2396139wmf.61.1530290733605; 
	Fri, 29 Jun 2018 09:45:33 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p7-v6sm1649062wmc.0.2018.06.29.09.45.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jun 2018 09:45:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jun 2018 17:45:27 +0100
Message-Id: <20180629164527.6325-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629164527.6325-1-richard.purdie@linuxfoundation.org>
References: <20180629164527.6325-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] xtrans: Fix multilib .pc file conflict
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
X-List-Received-Date: Fri, 29 Jun 2018 16:45:33 -0000

Error: Transaction check error:
  file /usr/share/pkgconfig/xtrans.pc from install of lib32-xtrans-dev-1:1.3.5-r0.core2_32 conflicts with file from package xtrans-dev-1:1.3.5-r0.core2_64

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-lib/xtrans/multilibfix.patch          | 18 ++++++++++++++++++
 meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb |  2 ++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch

diff --git a/meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch b/meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch
new file mode 100644
index 00000000000..c513bad20e6
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch
@@ -0,0 +1,18 @@
+The xtrans.pc file is installed into a non-arch directory yet contains libdir
+which can vary depending on which multilib is configured. The .pc file does
+not require libdir so remove this to fix multilib builds.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: xtrans-1.3.5/xtrans.pc.in
+===================================================================
+--- xtrans-1.3.5.orig/xtrans.pc.in
++++ xtrans-1.3.5/xtrans.pc.in
+@@ -1,6 +1,5 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+-libdir=@libdir@
+ includedir=@includedir@
+ 
+ Name: XTrans
diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb
index d5b7f1a2c6b..200716fb023 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb
@@ -12,6 +12,8 @@ require xorg-lib-common.inc
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=49347921d4d5268021a999f250edc9ca"
 
+SRC_URI += "file://multilibfix.patch"
+
 PE = "1"
 
 RDEPENDS_${PN}-dev = ""
-- 
2.17.1


