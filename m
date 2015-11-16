Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 525177653B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 11:39:38 +0000 (UTC)
Received: by qkfo3 with SMTP id o3so108672405qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 03:39:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=d9j++xURMYOSzHMC/67hkegURjM09sNQKOJb30cApS4=;
	b=GbZmCoWEaeFHvG4GUMhAnJ85c6bkAutnuURyNt+RhU+VlZICmeCFdwkucSb/NZq4Tx
	HGIaWknhdfqrzpt4Scb6J7QW7YEKXHFf+UHSzcbv7nss4YmUFkDbGRkBOJwjXufOgeHf
	QRjze/vJadnFNCaO42VFoUattYWp093uOoJ35aByorPELgwRZHbHUl/amTwVaAdIZb4X
	uv6XyR5C8CvTtq0MIggi5EfEkiYO3VCvpPtMYTgq1JNPD8uZHFZrbRepWNLGDFRX+iRZ
	4ibZRUfCflkutnkwLOm4KRlNlC5lJmMpVreC29DBvmxaRcWdCQGpBuVzgEmt8oLvM70+
	Ut3g==
X-Received: by 10.55.79.145 with SMTP id d139mr34510181qkb.101.1447673979111; 
	Mon, 16 Nov 2015 03:39:39 -0800 (PST)
Received: from localhost ([177.100.174.62])
	by smtp.gmail.com with ESMTPSA id g63sm4795486qgd.5.2015.11.16.03.39.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 03:39:37 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 Nov 2015 09:39:32 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Nov 2015 09:39:30 -0200
Message-Id: <1447673972-31812-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/3] lttng-modules: Upgrade to 2.7 release
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
X-List-Received-Date: Mon, 16 Nov 2015 11:39:39 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 meta/recipes-kernel/lttng/lttng-modules_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
index 54544fe..46cc1f0 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -2,18 +2,18 @@ SECTION = "devel"
 SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
 DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
 LICENSE = "LGPLv2.1 & GPLv2 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1412caf5a1aa90d6a48588a4794c0eac \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=362844633a08753bd96ab322a6c7f9f6 \
                     file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
                     file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
 
 inherit module
 
-SRCREV = "7a88f8b50696dd71e80c08661159caf8e119bf51"
-PV = "2.6.2+git${SRCPV}"
+SRCREV = "4247236df9113aca059d79c78d85779c1ff4edb0"
+PV = "2.7.0+git${SRCPV}"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|arm).*-linux'
 
-SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.6"
+SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.7"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.6.2


