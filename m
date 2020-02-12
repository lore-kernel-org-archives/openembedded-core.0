Return-Path: <jpewhacker@gmail.com>
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
	[209.85.219.182])
	by mail.openembedded.org (Postfix) with ESMTP id 141E360B1A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 03:14:40 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id k69so339208ybk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 19:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=C7OuFxUvpulZQU+5KTaoIQtmxyPg+YxPixoLjJHscg8=;
	b=nPEt9iW5mTpvfv85Mm1q1zntsVbJIEhrQX/ndW4FGqHosXC5icE6nlb8xubvSu0EVr
	HakheAomLie7noTc85cFoB98AUDfAKIeJihla0+6xV8rFJ4zgnNTWfHhQhWKUfRkquw2
	SmiQXdRwO0vSqrAIqe48QaulP2KqVgs+4nJ30vLaMq3EsxN6kHHBP7iAuVlfDfnnr270
	SXklh38wIM1S2k0UtEFJBhdBcMwSX/gTK9MOtOHzKE0IQJ14wU6rzCgotBq94MWKGDu0
	tEsYprLKvnH2iiawV+QJ46QVdgxA+3bY6IJSYJ/3nEE2rKc8Cn+uhHHQ4QRGcgIuExJp
	u4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=C7OuFxUvpulZQU+5KTaoIQtmxyPg+YxPixoLjJHscg8=;
	b=mnesSAIQEiMHRp8PHbP7B/RCLtKi3BRoIxMJ5ut/JPQ9WR4x/5Psb6cYKnVWtDjFiT
	Cwx9aHy3u1DUwxaBD/n3IegaerckPtk+MlfuufPVUUDbdf/6V+ai9gkG1M0ukyAWTKUs
	4JS4zKlqQ1ZAyVAbUvYwuym/bUZ+Z/kebYgm4YrrDV91+omHdauuJOtRVvMO7KF9ZOR/
	Xte0tzDrm+354YhdrPQ/tJU+gHccOD9Yi50wu7BaSd87faIaCyghQtAq1xXcRWaOs6z/
	Er7JUZnr8nDBv6F2DA9+TgwQkF1ywX40m+fLeYM8YjCiICNj3XxGhTJ3zscgLrL8RdPE
	RXWA==
X-Gm-Message-State: APjAAAXZU10DBIO1gQFeeEJRP5sf9ETMbs5tuLFX8bYVaWmsCJiW2km9
	cSc1KJZEQMVz09SSi2CJfPIR4t6Z
X-Google-Smtp-Source: APXvYqyK7LhO1O4afW89KzbaFhlDDfxotrCAerivPdpiPHodpTWwzHivSLWhKGI5wLxW1LHqkTjRdQ==
X-Received: by 2002:a81:6ec3:: with SMTP id j186mr8008199ywc.442.1581477281622;
	Tue, 11 Feb 2020 19:14:41 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:4f37:550:d1b1:6f01])
	by smtp.gmail.com with ESMTPSA id
	h193sm2677370ywc.88.2020.02.11.19.14.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 11 Feb 2020 19:14:41 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2020 21:14:32 -0600
Message-Id: <20200212031435.792802-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200212031435.792802-1-JPEWhacker@gmail.com>
References: <20200212031435.792802-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] python: Add libarchive-c recipe
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
X-List-Received-Date: Wed, 12 Feb 2020 03:14:41 -0000
Content-Transfer-Encoding: 8bit

The libarchive python module is used by diffoscope tool to
make build comparisons.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/distro/include/maintainers.inc        |  1 +
 .../python/python3-libarchive-c_2.9.bb          | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-libarchive-c_2.9.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c68e9edf634..abbdb74a0d3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -579,6 +579,7 @@ RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr
 RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb b/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb
new file mode 100644
index 00000000000..4983ae527a1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Python interface to libarchive"
+DESCRIPTION = "A Python interface to libarchive. It uses the standard ctypes module to \
+    dynamically load and access the C library."
+HOMEPAGE = "https://github.com/Changaco/python-libarchive-c"
+LICENSE = "CC0-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=bcab380227a83bc147350b40a81e6ffc"
+
+PYPI_PACKAGE = "libarchive-c"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "083bd2cb0043c1e22a52cb9a05e31532"
+SRC_URI[sha256sum] = "9919344cec203f5db6596a29b5bc26b07ba9662925a05e24980b84709232ef60"
+
+RDEPENDS_${PN} += "libarchive"
+
+BBCLASSEXTEND = "native"
-- 
2.23.0


