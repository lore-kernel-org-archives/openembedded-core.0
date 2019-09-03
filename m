Return-Path: <drew.moseley@northern.tech>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5D7D77F2B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 21:21:30 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id t5so6496033ybt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 14:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google; h=from:to:subject:date:message-id;
	bh=P/qYAaTqOOAR+2rLPtXSvqJcBiY9wy4ZHclGwddxlrM=;
	b=m0Dq7JKGS/AeVFyFLlfANUAxlZ2PM8FaJNt1+p0f65sOOvOHVclcj+yvVfSBcMNzoU
	Sk1O7f3+Stuf8zB8NuVa4HvZgnVdLIvmm1y32PYXx07k+jlJiSNoeu3DaSYWF+2biN+z
	GHfRHSQ7p28Yv9/ajdDerckzswII9Xk/KH3gCp+XQPQy3Ysq2PhX9Fwh+JDw7hvBWk4t
	je7M23V1JXIgKb+nUhtBehQWAhGcCrCHMVc/4mnW9PzysbASFARsvlIUcyoOK9zsDdLy
	FyQroGCm081b2b21qp0jvVlsgCIASjtviZH5fih7lVp70Wg0TAvEYPaNciRf2xIldsLE
	sqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=P/qYAaTqOOAR+2rLPtXSvqJcBiY9wy4ZHclGwddxlrM=;
	b=Z84AcmrxmH9z2lDTgYWd7KXlUlU42n6zB0yLIRqx995hd0W7Wyl7TiZddmK8mlfCpf
	31RIygn8Kug4Xke7gOutmwpGUiSIRyM94NL+jKt/QiHfacq9X5hsrITnycF8NQQKmSmS
	cN/sv1EDjcN0LSirv/1hwGHuhERd+og31hIc74J8yOdLo/6hqeoubTFMDqV39hOEW1Qr
	MaUd2rgIwrkmHaMYvYVGvysoH3mxDofUSF9jfErJSzJrglYUkes9eRiyH4h1n5+WbRYz
	Zw9bQOEGV7LayyAwwViiMZ7xXCd2i9k0mV+fUjQquyvxYPSEKyGwkZEMXOa9LIjJFVKt
	kYmA==
X-Gm-Message-State: APjAAAXWoR0vhk+/Z/NoCy3FgZsQBprEeGDHRuNIcTNpIDgc26WSM3S2
	vjOiSrAwJCFfO3ppMsr+9Ey4VKNgLlg5xw==
X-Google-Smtp-Source: APXvYqzITBvaA6E6SckvfHdqpp/zjMdDX8EjCij71SnLh2Cn4kvOCS0Za7tFMUHf7woQRaonCE5kIg==
X-Received: by 2002:a25:d143:: with SMTP id i64mr25764325ybg.111.1567545690524;
	Tue, 03 Sep 2019 14:21:30 -0700 (PDT)
Received: from tobago.home.moseleynet.net (user-24-236-82-253.knology.net.
	[24.236.82.253]) by smtp.googlemail.com with ESMTPSA id
	y11sm2735452ywd.84.2019.09.03.14.21.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 14:21:29 -0700 (PDT)
From: drew.moseley@northern.tech
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 17:21:25 -0400
Message-Id: <20190903212125.25405-1-drew.moseley@northern.tech>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] runqemu: Fix typo in help text.
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
X-List-Received-Date: Tue, 03 Sep 2019 21:21:30 -0000

From: Drew Moseley <drew.moseley@northern.tech>

Signed-off-by: Drew Moseley <drew.moseley@northern.tech>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 4079f2b17d..44128b118b 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -83,7 +83,7 @@ of the following environment variables (in any order):
   bootparams=<xyz> - specify custom kernel parameters during boot
   help, -h, --help: print this text
   -d, --debug: Enable debug output
-  -q, --quite: Hide most output except error messages
+  -q, --quiet: Hide most output except error messages
 
 Examples:
   runqemu
-- 
2.17.1


