Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id CB8CC7ECC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:18:20 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id p17so35767321ljg.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 17:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=JU0/g+qixWSIREn/bDxBtkNonZvkC5n+OR+pJthYJ4s=;
	b=tCKuxFeu6JqNcVzdgDAyyVjRdlVczOxL3XuCk89OcN5SQkWoP4eBwpCReMZyqoxnt7
	/vYAHNsnQt4dWJlafW+XoKqxoOH23izvHgY4mkywdDPCF2dqwwrYZLMg9kjgYmexnpkJ
	6vpklEdCxipzlLU0Y7ygIZmnz+HDqZbFOc7uPkJ7xGYttkE5ASmsA2k79c7a8Nj8vBZH
	c5FiESZ9FgavW6x04JNM+LjgLtNEJCnsGHxXgOwdG+vCZ6L58p/ysfySoqCAerVZk01T
	KcYQexw8D1p+Sb7yx29+mABUePm0hHt4zYyjMerCxuc209tQ10W7TwJJe3do87DrfVG2
	hy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JU0/g+qixWSIREn/bDxBtkNonZvkC5n+OR+pJthYJ4s=;
	b=VL8ihjhSVUqKee9bp78lwgBT0rdqXpwbrt0DVbcro64lWnTci0OreFt5vDhuywzXPb
	EJ7R37kyRW7kmcuQsYT395p3df9nPUGWhRj4BSwqDWEpYbFYJUui09zlRrxzutzI1XRF
	35INrqO8UKQAl9SrVaA2ixl6DjNMJdTZYv6LxOb2YRDI1mlRaDzpjpGtMfucfzjsdjqo
	Dh3HoIRwkzKzXb95l2qLN0AjzoBqPx7gQJ31lRa0qU75XgJ0pd7au0nU+z/6n90WnSxq
	cqIQPN5GEHvk7EvmwAxkbLa9Xr/xAKJ3irFaD7jOG38IrZE8ubOS6qCW5obkgCAnmL7K
	gckg==
X-Gm-Message-State: APjAAAV8ulNR/wMsnEU0WIZRSi38EsA3PkmCOWaqp+uvpL2rnat68OGe
	HP5jc9azbfACtUmSoBdnCNIXrBx7
X-Google-Smtp-Source: APXvYqxqsJR++XLv2qotNWagFi60zx9tV0pcF4poD2QOv24RV5mnV9Xjyo0+1YXe+EatqJeog/oT8Q==
X-Received: by 2002:a2e:80c8:: with SMTP id r8mr34516693ljg.168.1563754700673; 
	Sun, 21 Jul 2019 17:18:20 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	d21sm5771826lfc.73.2019.07.21.17.18.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 17:18:20 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2019 02:18:07 +0200
Message-Id: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 1/6] python-scons: update to 3.1.0
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
X-List-Received-Date: Mon, 22 Jul 2019 00:18:21 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...hon-scons-native_3.0.5.bb => python-scons-native_3.1.0.bb} | 0
 .../python/{python-scons_3.0.5.bb => python-scons_3.1.0.bb}   | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_3.0.5.bb => python-scons-native_3.1.0.bb} (100%)
 rename meta/recipes-devtools/python/{python-scons_3.0.5.bb => python-scons_3.1.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python-scons-native_3.0.5.bb b/meta/recipes-devtools/python/python-scons-native_3.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-scons-native_3.0.5.bb
rename to meta/recipes-devtools/python/python-scons-native_3.1.0.bb
diff --git a/meta/recipes-devtools/python/python-scons_3.0.5.bb b/meta/recipes-devtools/python/python-scons_3.1.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python-scons_3.0.5.bb
rename to meta/recipes-devtools/python/python-scons_3.1.0.bb
index 939c15bcc6..b174050583 100644
--- a/meta/recipes-devtools/python/python-scons_3.0.5.bb
+++ b/meta/recipes-devtools/python/python-scons_3.1.0.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=37bb53a08e6beaea0c90e7821d731284"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
-SRC_URI[md5sum] = "9f9c163e8bd48cf8cd92f03e85ca6395"
-SRC_URI[sha256sum] = "df676f23dc6d4bfa384fc389d95dcd21ab907e6349d4c848958ba4befb73c73e"
+SRC_URI[md5sum] = "e2fe9d16f81b0285b969238af4b552ff"
+SRC_URI[sha256sum] = "f3f548d738d4a2179123ecd744271ec413b2d55735ea7625a59b1b59e6cd132f"
 
 S = "${WORKDIR}/scons-${PV}"
 
-- 
2.17.1


