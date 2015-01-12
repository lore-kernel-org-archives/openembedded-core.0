Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 303A960601
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 22:25:50 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id tr6so28057705ieb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 14:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NBF4xPRgzJ9hXqtU8bMKoLcZS6Zhos5pN9pdZMUHR70=;
	b=Kw2m/UKE+lHk/D9G+8rZqx1QHCAli9r4lTuHIwVw91z3mxlccm6dSAidcVse8n0u8K
	nNIdhrisvqUeuA0ZYU/jmN9NThkWg2VjKjsKGuzUBLDUbCoFPClJQeJwWhIqZ8xo7YG7
	iEhKi6WSwm7x7Y9McpWIpaVKUFY5iy9ratOunYYkEPqCVAF9woupNT81AG+A8hasX4Hk
	OV4f2F3CGqllq/Ja7n/4SWqYXgxLfgm1b2uKeR/d+GusLfJVFQhVfyipXxRPsRIut+Uj
	Qiw2JqR0ztmQjqRSyqYQEy0vgSCTIDOmiaWzPx/KozKpgNQATr3XJaI+FDJejcIJmnYW
	RXNg==
X-Received: by 10.107.132.210 with SMTP id o79mr30340093ioi.50.1421101551142; 
	Mon, 12 Jan 2015 14:25:51 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id qs2sm5014817igb.1.2015.01.12.14.25.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Jan 2015 14:25:50 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jan 2015 14:25:31 -0800
Message-Id: <1421101531-20833-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1421101531-20833-1-git-send-email-armccurdy@gmail.com>
References: <1421101531-20833-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] udev: remove obsolete dependency on acl
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
X-List-Received-Date: Mon, 12 Jan 2015 22:25:53 -0000

udev_acl was removed from udev in v182.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/udev/udev.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 31d1230..44a2d72 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 LDFLAGS += "-lrt"
 
-DEPENDS = "acl glib-2.0 libusb usbutils pciutils glib-2.0-native gperf-native libxslt-native util-linux"
+DEPENDS = "glib-2.0 libusb usbutils pciutils glib-2.0-native gperf-native libxslt-native util-linux"
 RPROVIDES_${PN} = "hotplug"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-- 
1.9.1


