Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6B4DF72F94
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 13:19:04 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id n37so7477335qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 06:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=q5+IAtHBWS1lz9z5JfZz9onJSmkLR4wPRGJQQRnm68I=;
	b=CwjDjOOz/+l4tI04AUfc+0QQLv4LaZcGfaVAdBc72ROyRSNN1JAf+V/vA471OX6laV
	CrzCgC3qlr4fd7rdjIe9TXeOzx8DtSigNJlxg+OUIx83hKeOIneim9c5Nx+63MLtJsrQ
	ywj6OzT7vNn+Y6mwQfz7JkNfNiVMdX7uRYHRY7Fx6BZV4iacMKSEvh1Qhjcu1fGTHBel
	TcP0OA11UjLUuPo9U7dpAcYceWupyLBmyfx3nTVT5uBXCMV9YagTXAoxOgumdR8vLKGv
	qQchGks5y5EusCKLf9Pfou0Hn/5/YetwIGaSEMrEx0GGGLgEoNeJlyKXb8iWuKDsjMSr
	Yv2Q==
X-Gm-Message-State: AFeK/H3xsbIqgcfwJNZdqND78ZYUpdE4CW1HU4tjXUx9ItYmdm08aP64Qybyz7DDTk9I5A==
X-Received: by 10.200.56.210 with SMTP id g18mr19859230qtc.63.1490620745050;
	Mon, 27 Mar 2017 06:19:05 -0700 (PDT)
Received: from localhost ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id i65sm342773qka.13.2017.03.27.06.19.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Mar 2017 06:19:03 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 27 Mar 2017 10:18:58 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Mar 2017 09:57:33 -0300
Message-Id: <20170327125733.8585-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.12.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] u-boot: Update to 2017.03 release
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
X-List-Received-Date: Mon, 27 Mar 2017 13:19:04 -0000

This 2017.03 release is out since March 13th, 2017 and is the latest
stable release prior Pyro release.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Fix typo in commit log

 .../u-boot/{u-boot-common_2017.01.inc => u-boot-common_2017.03.inc}     | 2 +-
 .../u-boot/{u-boot-fw-utils_2017.01.bb => u-boot-fw-utils_2017.03.bb}   | 0
 .../u-boot/{u-boot-mkimage_2017.01.bb => u-boot-mkimage_2017.03.bb}     | 0
 meta/recipes-bsp/u-boot/{u-boot_2017.01.bb => u-boot_2017.03.bb}        | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-common_2017.01.inc => u-boot-common_2017.03.inc} (86%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.01.bb => u-boot-fw-utils_2017.03.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.01.bb => u-boot-mkimage_2017.03.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2017.01.bb => u-boot_2017.03.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.03.inc
similarity index 86%
rename from meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2017.03.inc
index df24c853dd..c115f36831 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.03.inc
@@ -7,7 +7,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "a705ebc81b7f91bbd0ef7c634284208342901149"
+SRCREV = "8537ddd769f460d7fb7a62a3dcc9669049702e51"
 
 SRC_URI = "git://git.denx.de/u-boot.git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.03.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.03.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.03.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.03.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot_2017.03.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2017.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2017.03.bb
-- 
2.12.1


