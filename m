Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2217FA5D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 00:55:54 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id 195so9199368lfj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 17:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=xBff94lVJhcHyhJtp2dh22J1fW044MJiuPrY0tYVdXw=;
	b=D8q0J9I+QSfbzWJxQRddWhleT/d38Y4YfotcM4ffLJWQtylT5hPZ8A8r2qx7il3xu9
	VfskBD6qU9+lc7dDqn/0752ue4njaZxXnDstRvjFVRpS2Eo+EKMP/hJIx5gADMRidh9Q
	aw3pWreliePy3+7OUjj3KELyrt5KNI1w858lrCxKLMrM5BOjTOJsJMpPaUTbvgg2y80L
	yom6pGUeRaXVLCBQ4htk/me+x+84mpZltnTsD/Xeah7btb8WhZohlbMOzyVBnslqYJR2
	Jq04i7R/pUUQQTthrW2T8DgxOMD9ICZN+C/JIYa5u7NMBfQ1OX7V+JhivASaPUqmJ74B
	2AXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xBff94lVJhcHyhJtp2dh22J1fW044MJiuPrY0tYVdXw=;
	b=SlrkGSKyRdvOYLuUkTjkuqa+9b+DatqWn9SvmVou9qu2hDbn2dzDcC7c6HD5ghK6hs
	O7zuicNbQ+c7Imacl1Br1GgH97PozkADhxHQyQG9n7KDOx/DICSbDq7Y0rP7mpZbTVWE
	fnr2EFlBtQnq7q1XBv1iYwuJ9GbdcG+vf22IvST6mVMhrxKjcBV8rmlfYQ+dpxr+0S0l
	+n8bBhfTQlqP4WhYwUmX0vt0IOE0Mqbi+MB97B7RyoZ+pgPRpoh1nMaRMIBBD9X7sa7v
	oZEAdNVkJ189+jzzJC0/YepgQ3i43JhjdI1FVLVWNjIQ2gIL5/s78GRIWaO133YO9AKD
	zN4w==
X-Gm-Message-State: APjAAAXhyIwk6VuwD4s9FvLTh2OkuC2h0nD1ASlkaNYGIySHUucNZ98s
	HXl7BkvvUKoXgvg1DoBfKrC0hVRUPYY=
X-Google-Smtp-Source: APXvYqyieLS+nfbuID0PoPDhTKqNS+Yxq4L7jHCW7mXK/W+HbxFo6TDbUYhBMEA9roAEoeC0M7bs4w==
X-Received: by 2002:ac2:4d10:: with SMTP id r16mr385245lfi.70.1572310554526;
	Mon, 28 Oct 2019 17:55:54 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id e8sm8877139ljf.1.2019.10.28.17.55.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Oct 2019 17:55:53 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 01:55:47 +0100
Message-Id: <20191029005547.32199-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ell: update to 0.25
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
X-List-Received-Date: Tue, 29 Oct 2019 00:55:54 -0000

0.24:
- Add support for extended groups in settings files.

0.25:
- Fix issue with stopping DHCP client and owner notification.
- Fix issue with time calculation overflow and DHCP.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/ell/{ell_0.23.bb => ell_0.25.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.23.bb => ell_0.25.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.23.bb b/meta/recipes-core/ell/ell_0.25.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.23.bb
rename to meta/recipes-core/ell/ell_0.25.bb
index f6e91ef6fd..f6201f9bf6 100644
--- a/meta/recipes-core/ell/ell_0.23.bb
+++ b/meta/recipes-core/ell/ell_0.25.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "be8214ff5b37012c4314343c8e6bcf15"
-SRC_URI[sha256sum] = "2efd9f7cdf57dedb9f1ba81bec534a3e0432476b1cb35ec0bc69973772a5f89b"
+SRC_URI[md5sum] = "8a8adc712718c770a72e4df6c9855c26"
+SRC_URI[sha256sum] = "7f2be568219d991d566ca50c58a56e69df9a248619fed758dcd9a4b04e655e5b"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.17.1


