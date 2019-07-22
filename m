Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id B13CB7EF36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:18:26 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id t28so35759799lje.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 17:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jlmXt/68JZoL/eWcn779S0J6OgR6MNGn71MMEoATZUs=;
	b=X3xO9dVyIz8Z9CuAFHskq8IguIMBo5ccwrMA7x6w/T/jS+VLL3WVOxCDXa2T0RO2Tc
	52pZYXUIEsgNBpeEGF9Nyb7/j2Rarh8Un18vczwC+TBlsbjOlYMgTy6ZfcVEgHUQAkub
	6iYsa5npd6Ae3BBNaEJbBEVWM4/9xY5KrxZJZJcvcF6BUHY++Srx0CHuiGQvm+MMwxvC
	HIFlrdJezJSPjRsxwkVTBMANji5qjJkRnmgGvCWRVPAit0Nk8iavzXF4Fws/ePRJs4kj
	6glP2+EwH0IpsjdMFb/ZxDDHCG4Acxg0w+3UF7XOVTpkoqE60/uae1Rc91hJBeElTt0l
	v1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jlmXt/68JZoL/eWcn779S0J6OgR6MNGn71MMEoATZUs=;
	b=qWD3RPc9vWEfVG/K+3QdnC6yyl2puCSYUJO2KUcHsHQxDk8uY8v3wPcyiC12xdQ/fj
	ZCSkegpAGe7Qr+NAw/gEQHahOJuVvltaCK/ckg6Ousli51oQ+j1b6fsvEUuq1d2DxIUE
	x3otXvjE2q3OvZE2EpCr9O50q3bCFqohIzVgB9mX4wzm6IGW0t8A0ztURjTlp268U8hT
	QngY4zz7XThgKlR2FqFa0lDlD/V234Wr0xUfXU5A8kkDXD/gelSrXWSDghzUzIqeXp8i
	2+up7thWEBKfRdw6Ej4qxaieRkkl7mbda75GULQTnJqGshq6+wzvDjY3CkzcbYie29pD
	7o5w==
X-Gm-Message-State: APjAAAWYd539FB4Tla+eMClaYH8Lu9ffvJgQqaPlQeF3a/9ogCnVXVlt
	WfdglBxHHRvbJvYwOZYzCjiyUsHt
X-Google-Smtp-Source: APXvYqyAjIs0DltXOI0q0my2X71NbXlrmfzJxsgvcHyb59KsDeds6XmDokWHk9taf4XfpXGyLhdwOA==
X-Received: by 2002:a2e:b003:: with SMTP id y3mr35064005ljk.72.1563754707057; 
	Sun, 21 Jul 2019 17:18:27 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	d21sm5771826lfc.73.2019.07.21.17.18.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 17:18:26 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2019 02:18:11 +0200
Message-Id: <20190722001812.14947-5-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
References: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 5/6] python3-mako: update to 1.0.14
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
X-List-Received-Date: Mon, 22 Jul 2019 00:18:26 -0000

Got rid of python-git since there is no python2 version of the package.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python3-mako_1.0.13.bb         | 3 ---
 .../python/{python-mako.inc => python3-mako_1.0.14.bb}      | 6 +++---
 2 files changed, 3 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-mako_1.0.13.bb
 rename meta/recipes-devtools/python/{python-mako.inc => python3-mako_1.0.14.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.0.13.bb b/meta/recipes-devtools/python/python3-mako_1.0.13.bb
deleted file mode 100644
index 17803f1b00..0000000000
--- a/meta/recipes-devtools/python/python3-mako_1.0.13.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools3
-require python-mako.inc
-
diff --git a/meta/recipes-devtools/python/python-mako.inc b/meta/recipes-devtools/python/python3-mako_1.0.14.bb
similarity index 71%
rename from meta/recipes-devtools/python/python-mako.inc
rename to meta/recipes-devtools/python/python3-mako_1.0.14.bb
index d71df956e8..d2f5188cc4 100644
--- a/meta/recipes-devtools/python/python-mako.inc
+++ b/meta/recipes-devtools/python/python3-mako_1.0.14.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=df7e6c7c82990acf0228a55e00d29bc9"
 
 PYPI_PACKAGE = "Mako"
 
-inherit pypi
+inherit pypi setuptools3
 
-SRC_URI[md5sum] = "ad6c7dcb5d39c99f4fdf4fec892c5dee"
-SRC_URI[sha256sum] = "95ee720cc3453063788515d55bd7ce4a2a77b7b209e4ac70ec5c86091eb02541"
+SRC_URI[md5sum] = "e162578170331f0cc6a4adb063c7c0f6"
+SRC_URI[sha256sum] = "f5a642d8c5699269ab62a68b296ff990767eb120f51e2e8f3d6afb16bdb57f4b"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
-- 
2.17.1


