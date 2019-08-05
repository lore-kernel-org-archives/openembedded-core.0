Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id B81017F284
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 12:36:05 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id t28so79152455lje.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 05:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=g9IMw09bzrY8+2KCGgUbp/SJ1ts5C4yCI554BJojero=;
	b=Xv0nFDYVT3TKtk1d8uNtfFWWLY70O5ysyrtq2El+7EZUr2z+bD4JTJtlXgkkQbBlLA
	QknM6bOSqcswnuQYSPFRAWgP0hbBwodo5pyWxkCrY7ZpSsW2nOG72f9eXFCUF/sAaKJs
	/Qie/WtmmZfSg5m2QPd5HCTFiqx6QMT/ztpLh5Q72efy4ZAPE4jY9CDaWkuiaawSA0hy
	lYUgU/pZp151WhfsadV7stIecgu1qQ/g3irQqS1IWdpcoBW24zni2plb7Nc9SCqhkKYS
	aIfVKFp8vIOnq9PkrfuO6M9WggL7nOwM5oEnfEkrqMAQ+c6PmnJItzoR8EQWA/suec96
	1HBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g9IMw09bzrY8+2KCGgUbp/SJ1ts5C4yCI554BJojero=;
	b=m0kjYrtvvsqTKj034lEeDA/yG/XYSi+ks3WhpjbVuDeTVXIvCWWFpiY4ugArcdok9+
	MJI6pPJlnXFIRLnZDZz0QFqbKwXAxR2yVgdyiLwWZyC0HiqegPSoNPoC34h6DQ/q3VAW
	1E57eVcxQoMOcGfsvU70iyqEzyAUBq/SNd/gx0CItBBnRxLcD+/maGCtveqKvabNt4+G
	07+yCU7St5pBPaGH4T+dRUcGr0a9wLIfV61xo9L1AsfZJGQLgUvQusiWWm1EalPUSqiE
	qlC5UeC1IpWwr+6ES+IyfXROuHdcxJ1IjQcljapqS4bOSjF3NaCBH9RIqNtYK2OOq83Z
	VLkQ==
X-Gm-Message-State: APjAAAV2hTO/JHiNQhZeaL30fJ8f79YFF3ZidmC2GqLOyGt7ctGmJ6PK
	wGg7MNayf8QzFynI3q5uShWOyXFF
X-Google-Smtp-Source: APXvYqw1+I5jojjYxs+w5T5kHNjoVfuQhT1R5CmUH9W/d5UHea433/d6lbVq8NiWeadSth0PfXIq1A==
X-Received: by 2002:a2e:5b5b:: with SMTP id p88mr41095163ljb.192.1565008565658;
	Mon, 05 Aug 2019 05:36:05 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id g12sm705695lfc.96.2019.08.05.05.36.04
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 05:36:05 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2019 14:36:00 +0200
Message-Id: <20190805123600.15631-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ell: update to 0.21
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
X-List-Received-Date: Mon, 05 Aug 2019 12:36:06 -0000

Changelog:
- Fix issue with resetting DHCP lease on client stop.
- Add support for GPIO helper functionality.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/ell/{ell_0.20.bb => ell_0.21.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.20.bb => ell_0.21.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.20.bb b/meta/recipes-core/ell/ell_0.21.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.20.bb
rename to meta/recipes-core/ell/ell_0.21.bb
index 81caa80fab..487fbccab5 100644
--- a/meta/recipes-core/ell/ell_0.20.bb
+++ b/meta/recipes-core/ell/ell_0.21.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "920189f5be4ee4cd72d610baeb20da65"
-SRC_URI[sha256sum] = "d4aa08915f4058ecaab509dffbe22665d71dba6fe9626caff63c0e5f4b78a394"
+SRC_URI[md5sum] = "f94f8c812b0426b0c30b651fa5142dd9"
+SRC_URI[sha256sum] = "a0db4e3057ba41035637354b6af2aa4c74f83509e0c3e563d682df9d72eaff17"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.17.1


