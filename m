Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	by mail.openembedded.org (Postfix) with ESMTP id ECBFB7E7D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 15:51:21 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id 136so1914967lfa.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 08:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=wQeUqijgjkPBsxF/Ycg0yYkKXccV/l6oV9zHdyUSkDw=;
	b=eHcJwEF0StYT8Et1HosthoAUkTp4MZaPh1z3fDwUzQ5OppwjIwRHhdlnXlDSD8PEmo
	TUS4LJWzPb3jEKS6UvLSjnqkAFwVsFqnh3ShEr/crEl0ieUC8qg4RCriBxt70eWHHKvI
	zRQFXpegZGzfFoJQ+a8w7L3BFmRBX4W9rj7N9fGJXodpVrCx7cHn+T/6z7LpSJJa3EH+
	HgCK2sewIQrgzMviNV56BLEI8ezxGhtoSYyi1AectMb6ONIi//fzQVeCE2ATNHZz0D8N
	ckH4IKHrKTsVAogGgm9fyeJEHg9YC856WWDhZNzBp5q0VSkMXHmZcemtwhU6Pq5zSw3G
	HIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wQeUqijgjkPBsxF/Ycg0yYkKXccV/l6oV9zHdyUSkDw=;
	b=LLGVs0N/ZJvGlCOhgUJSM6/lCFzES4ZTa9blsWb2lbkNhpLumcbosGucMvfYE9DXab
	D8WfMCAdpbD3DVCWgRj4fKXi6JqImq1ITxSLZKm0HEUWwgIJTJFUOukVK4V11VJhjqGU
	3sBi36dXR3WsvIJXSq7CWwKPduiWoeYiu4TzU7q1tIg8vPy1TxXIz9SMAMWB3pgJzoTA
	wzOXr5lJE6MLLex6NDUgtPYPzWSVcwUngBqBua1tODJ9oeGX5I47gvA6KIPnhLT2GECN
	CFptlZaMbfUpQ81PzIZPYrUyqKFVc1l6Jzj4XZUs4NpJkS9f+E8BWDI5O5Zp/ZjvrAa5
	iMqA==
X-Gm-Message-State: APjAAAXCM8jL0XedvWQyWfIyb0Bszg0fDMyL1qppfFBn3DUwdITLH533
	dq7N5bgCC4EYnKDdGfRFDSpNq5dCn4E=
X-Google-Smtp-Source: APXvYqzHF8WMowyGEUYbkcdxA86xB9KBk5epKfgyKn22V276AwC6vBr3BxqEQ2pq8onDeSDfiIIkAQ==
X-Received: by 2002:a19:671c:: with SMTP id b28mr2499620lfc.164.1561650682029; 
	Thu, 27 Jun 2019 08:51:22 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id p5sm544024ljb.91.2019.06.27.08.51.21
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 08:51:21 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 17:51:19 +0200
Message-Id: <20190627155119.7685-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-mako: update to 1.0.12
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
X-List-Received-Date: Thu, 27 Jun 2019 15:51:22 -0000

License checksum changed due to madified copyright year.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python-mako.inc                | 6 +++---
 .../{python3-mako_1.0.10.bb => python3-mako_1.0.12.bb}      | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.0.10.bb => python3-mako_1.0.12.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-mako.inc b/meta/recipes-devtools/python/python-mako.inc
index 20808fe5ac..31be8f1d50 100644
--- a/meta/recipes-devtools/python/python-mako.inc
+++ b/meta/recipes-devtools/python/python-mako.inc
@@ -2,14 +2,14 @@ SUMMARY = "Templating library for Python"
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1bb21fa2d2f7a534c884b990430a6863"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=df7e6c7c82990acf0228a55e00d29bc9"
 
 PYPI_PACKAGE = "Mako"
 
 inherit pypi
 
-SRC_URI[md5sum] = "a94d376078dda65f834ea5049a81ebb5"
-SRC_URI[sha256sum] = "7165919e78e1feb68b4dbe829871ea9941398178fa58e6beedb9ba14acf63965"
+SRC_URI[md5sum] = "4a7aef27217a8e6c1a29447c9b1b00ab"
+SRC_URI[sha256sum] = "0cfa65de3a835e87eeca6ac856b3013aade55f49e32515f65d999f91a2324162"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
diff --git a/meta/recipes-devtools/python/python3-mako_1.0.10.bb b/meta/recipes-devtools/python/python3-mako_1.0.12.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-mako_1.0.10.bb
rename to meta/recipes-devtools/python/python3-mako_1.0.12.bb
-- 
2.17.1


