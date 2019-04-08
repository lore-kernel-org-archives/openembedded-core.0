Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 103547D43C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 20:50:24 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id o199so3447763lfo.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 13:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=xujoW6w1hPCzB4PuUrAnKJYtizI5YQ0bsw5VDKtkyEs=;
	b=jK7LjYU/P2bBPgVFlaQXLM8RGhJX3njtA05aovC7BBrOjRoGYibhgwGHFQG2GUZ9f1
	fdkmZOtHp2/WzoqGdYtGkEhfDQYMsvHD3hpumb8ejwa3F/oWF0waPt9w7PleGUm872gE
	Yqx0dhFfS5KDvzBhxeKGtirDh+4Y9kEvcWiikGKOIpx6simjDVXfHTsQfUHEbA1YWRSd
	FxB9MiMRfjr57Fq7JlNqDFCp5R4newrS0gDDm8oYIkXqFjmv1DSt75aB/PaO3mPoslRe
	iOgd8imLTXNRX6OuyJXP+Ua6YUodnXd3ssNAyKYXPo7CeegRsZj2YWANeeuVqRaN6D2B
	ykeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xujoW6w1hPCzB4PuUrAnKJYtizI5YQ0bsw5VDKtkyEs=;
	b=GdTMSBbkGd8j/nc5t5tldMaBPyo0jqfQUcgkBfAJ9OL0/A+4eGtUmAB1rDxGVmU0Iv
	wsXQ5knPfXxcUt1p/aeB3kqv2tchMf4/DlAMa254Z9M5RSALl9tZPbDVbFNRlo/9MYQd
	xlw8ECsfG4w7WvI/vEYkd5+m6rGL5r+VtrDmonafQtpJzDLqG3zOyLcic7f4BuWSj1za
	OYzvgIiR+A3b7JEBW8Hi4F0yRwy/ssgq0PVeLh5RLXhOvuk+njohEXU6MeJ46TPXLrJw
	bjfAYwqO8uexEeYKHkt8QH/kHIXcUD94m5XU2lwO/e2KxxGkKaj+KKVdEvbfEe1s477m
	6RgA==
X-Gm-Message-State: APjAAAVHHKn0dlyGBc2xAwsweFHUZ/pXknByFKZM/RNejArBihvFLFwC
	r7j8/SvvVKa8OsmT79JeU/9NYXRpSLk=
X-Google-Smtp-Source: APXvYqwWHvwmiIM6V9HxhEw41pIpxGE8GtSex2aqXkk33+eDncVYGHhCQMoHn0m0GX2n0s+iCXBL9A==
X-Received: by 2002:ac2:5629:: with SMTP id b9mr13212084lff.100.1554756625139; 
	Mon, 08 Apr 2019 13:50:25 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	f25sm5700437lfk.69.2019.04.08.13.50.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 13:50:24 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2019 22:50:10 +0200
Message-Id: <20190408205010.29163-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ell: add recipe
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
X-List-Received-Date: Mon, 08 Apr 2019 20:50:25 -0000

ELL has originally been part of meta-openembedded, but newer versions
of some of the poky components depend on it, e.g. ofono.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/ell/ell_0.18.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-core/ell/ell_0.18.bb

diff --git a/meta/recipes-core/ell/ell_0.18.bb b/meta/recipes-core/ell/ell_0.18.bb
new file mode 100644
index 0000000000..ca27f4dcda
--- /dev/null
+++ b/meta/recipes-core/ell/ell_0.18.bb
@@ -0,0 +1,22 @@
+SUMMARY  = "Embedded Linux Library"
+DESCRIPTION = "The Embedded Linux Library (ELL) provides core, \
+low-level functionality for system daemons. It typically has no \
+dependencies other than the Linux kernel, C standard library, and \
+libdl (for dynamic linking). While ELL is designed to be efficient \
+and compact enough for use on embedded Linux platforms, it is not \
+limited to resource-constrained systems."
+SECTION = "libs"
+LICENSE  = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
+
+DEPENDS = "dbus"
+
+inherit autotools pkgconfig
+
+SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${PN}/${PN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "18e2be697a54811e49bbe34590a13a42"
+SRC_URI[sha256sum] = "2c4c1a129f1b697e63ba3f63927dbae1482f6329b48c14a1748d9ab8ac4ee7e3"
+
+do_configure_prepend () {
+    mkdir -p ${S}/build-aux
+}
-- 
2.17.1


