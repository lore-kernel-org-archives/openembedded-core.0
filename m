Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id 58FFB7D010
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 15:50:24 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id h21so8612955ljk.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 08:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=LOpt5z1i4pmqHh8Dav17StCFiaGUb+b9XgRMbFHWy/4=;
	b=TTzWqLKEMHog6lLLtUOPO94v5ZaBXq/BVberADEK2tQoJ6esYzbHE4NKmq8OvnNnrM
	wutRi7LC4+rlC0IeuYAQE6GLg9fOSz7lrVwgMYvUDes9ykk+6+XtC4YnqVSp4fHWEw2T
	oO88sjRzRkTFGXFPqNA0PIC/w/pZ3qWc7jCIY9Mr8mwHkDIewtU7vVaCZ6bqh9pj+mdE
	b7jdvMrX5akRvmxnzsTLdKgugnAtv6/2dVFLgiN8+Tf4hHYKSj9WuexJ3Zyt3Ix1zxo7
	npicqE/DFP/dBtrZGzn9FNXktbwQaUnWGoAWPODuy1S9/bDpny/EgN/rapX2Ci410YUC
	/lFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LOpt5z1i4pmqHh8Dav17StCFiaGUb+b9XgRMbFHWy/4=;
	b=iW5BpDBoxHaaBgxLRzwqvmU8hGHFMowan4FByZPiFcRp7oShMkCsnaQ+vdOAZpNq9O
	OQU/NOmHIYXGBWc0u7G09BIOhxHmCGPW+YakdzD+jigUcJBTRIn1FJE+BjydcTLa1+QO
	BBY1Zic57iSAzA3xVaFnv24uy+uC4jjrEuwHy+oFG4Lko6EBk8v54WG9dczj//1Bk33E
	nc62py6JlV4Qn2etJ9zhz3A1bdMwLwyjYM9NYW+sZZ0vLlqCmfZ8fyBAufraXDx9t8in
	a4TJF8JEa7XTWxfqKLiW5LNWBFoJA4516o1bAgftQDKmEDHiyBxKT9A+t8UPyHje/2CM
	q/uQ==
X-Gm-Message-State: APjAAAX5z67r7Gowr9J81XCEFH7jKk7OxvSIXRc7UBup3NF2ARdqGEcF
	cs9R4S//wtuOe0kzPCA29EGqL8ScawI=
X-Google-Smtp-Source: APXvYqxjb9aGTrmWv354BH+1kIqefilPfE1VRjEfBV99tlF7l7VofIO/LjY17Eiz4zz6jL0188+K2g==
X-Received: by 2002:a2e:8089:: with SMTP id i9mr1627188ljg.137.1554133824026; 
	Mon, 01 Apr 2019 08:50:24 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	i24sm2204391ljb.31.2019.04.01.08.50.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 08:50:23 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 17:50:20 +0200
Message-Id: <20190401155020.14404-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] libyaml: update to 0.2.2
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
X-List-Received-Date: Mon, 01 Apr 2019 15:50:24 -0000

LICENSE checksum was changed due to copyright year change.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libyaml/{libyaml_0.2.1.bb => libyaml_0.2.2.bb}        | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libyaml/{libyaml_0.2.1.bb => libyaml_0.2.2.bb} (62%)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.1.bb b/meta/recipes-support/libyaml/libyaml_0.2.2.bb
similarity index 62%
rename from meta/recipes-support/libyaml/libyaml_0.2.1.bb
rename to meta/recipes-support/libyaml/libyaml_0.2.2.bb
index d77891825f..d2b39f3495 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.1.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.2.bb
@@ -5,13 +5,11 @@ HOMEPAGE = "http://pyyaml.org/wiki/LibYAML"
 SECTION = "libs/devel"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5591701d32590f9fa94f3bfee820b634"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
 
 SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
-SRC_URI[md5sum] = "72724b9736923c517e5a8fc6757ef03d"
-SRC_URI[sha256sum] = "78281145641a080fb32d6e7a87b9c0664d611dcb4d542e90baf731f51cbb59cd"
-
-S = "${WORKDIR}/yaml-${PV}"
+SRC_URI[md5sum] = "2ad4119a57f94739cc39a1b482c81264"
+SRC_URI[sha256sum] = "46bca77dc8be954686cff21888d6ce10ca4016b360ae1f56962e6882a17aa1fe"
 
 inherit autotools
 
-- 
2.17.1


