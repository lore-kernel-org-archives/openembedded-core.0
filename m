Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6AFFD78715
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 11:59:47 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i186so2909311wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 03:59:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cm/CrxerKHGyOf+z+JJ5AZ9+9HJcqVY/FzZJjdFXqkU=;
	b=tdEDoNdd68Jp4/Do4KjSu4sq8PJfhMKkt7guWEYS3OWbHt72geIk3C2+yf5aEBUaKP
	TuX3HNdPe2dQY6Jgu78q2kkpO6X0mrn9uC3mh7KJniN7RvhhIojzY1L9XViHvwtvr1MU
	eZEOJJpcaM2UquBdiCJjpZonyvrnrqcX6vGQlM8aUbtrGhudDDnCq2pThFpX9zaH19J3
	8DqHdiwyPy6B/sYlEj2X4SesqKKmysDNKrqZhnShxI9aOv2Og+e6SmZGRSDWMcqg4KrN
	dCgvdOhpGCN1WYm1f0meVVzKmhRDZ2jNG6GQDRWdmnKH64YQhJ8LGDe97Ww3y9M6EEHy
	+3wg==
X-Gm-Message-State: AKwxytcp5BMEB0NCfsBbviHC7SBxMl3eZaKEdiLD7gxUJQ9iSPQ51Q8v
	XgDH1KdMZka5fADsKF+ZK9oHBKG2PQU=
X-Google-Smtp-Source: ACJfBouv2MeyyfIIfMO/h7N9FoSiukj9R9i2J3shoYfg6UTkkHBvyHEAOut/bXxEVFwoKy0TDT7r5g==
X-Received: by 10.80.151.137 with SMTP id e9mr12607403edb.102.1516363187918;
	Fri, 19 Jan 2018 03:59:47 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	f11sm6042455edf.26.2018.01.19.03.59.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Jan 2018 03:59:46 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jan 2018 11:59:45 +0000
Message-Id: <20180119115945.16687-1-git@andred.net>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Subject: [PATCH][pyro] python3-native: Add python3-misc-native to RPROVIDES
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
X-List-Received-Date: Fri, 19 Jan 2018 11:59:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Fabio Berton <fabio.berton@ossystems.com.br>

OE-core commit 800753069f667cd1664d70b3779150c467e3b3fe remove
RPROVIDES list to get runtime dependences from manifest file.
python3-misc is added in python3 recipe, we need to add
native runtime to use python3-misc with native recipes.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 31fd20811f6d11e7ed6ac84caf776ac46cd6fb6f)
Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-devtools/python/python3-native_3.5.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.2.bb b/meta/recipes-devtools/python/python3-native_3.5.2.bb
index 3f4b567278..782e2cda9f 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.2.bb
@@ -79,3 +79,5 @@ do_install() {
 	# Tests are large and we don't need them in the native sysroot
 	rm ${D}${libdir}/python${PYTHON_MAJMIN}/test -rf
 }
+
+RPROVIDES += "python3-misc-native"
-- 
2.15.1


