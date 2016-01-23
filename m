Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id E4ECA77058
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 23:10:19 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id o11so7625175qge.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 15:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HcluAA1dxwcBCjDbtUUMOJ35NXI0I+hsdZYSYQcJXJk=;
	b=l8ha39FPksm/xAK1uUe1usvHBwFPdefNpKWaNupGdGpSwnUtEctQSlxNwugUCLNBkU
	0QPM2F8Ew4nMBs16p2dxE5DHx/owqYC73wFThL4IC8qQMzPOasB9bSZsRgbgIIMhGnXm
	1WF6afOAXK79cUr5mv3y3Qr1Ux+k5SSpvExCpNG6QRaDAzcVgZe6AnV13faoxiih+BtK
	Ms/h468+QwhBAYecRhatuK/KUCngmrbNmuO/cBEghWwRXODp9jHDvQORekNNPNHy+7Bg
	w4yhyS6me/SkdJApgXpj492gcUHUu4v7HeGAjwWO/YJcaD5jD8gqSlMn0GRj2qv7dcI+
	yQCQ==
X-Gm-Message-State: AG10YOS2Mo/IigVBh5QQdKzkzYfPN3z8p+cjNWbTpcS8l6R3Oo4clupB/8H5gqdQOXaTFA==
X-Received: by 10.140.219.208 with SMTP id p199mr13331745qhb.80.1453590620838; 
	Sat, 23 Jan 2016 15:10:20 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 67sm5769501qht.14.2016.01.23.15.10.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Jan 2016 15:10:20 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 18:10:02 -0500
Message-Id: <897be8375c4d9ac673b1e4f6e2f0383a95c5f9a7.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 05/13] python-decorator: update to 4.0.6
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
X-List-Received-Date: Sat, 23 Jan 2016 23:10:22 -0000

---
 meta-python/recipes-devtools/python/python-decorator.inc            | 6 ++++--
 .../python/{python-decorator_4.0.2.bb => python-decorator_4.0.6.bb} | 0
 .../{python3-decorator_4.0.2.bb => python3-decorator_4.0.6.bb}      | 0
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-decorator_4.0.2.bb => python-decorator_4.0.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-decorator_4.0.2.bb => python3-decorator_4.0.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-decorator.inc b/meta-python/recipes-devtools/python/python-decorator.inc
index a599fd8..65598c1 100644
--- a/meta-python/recipes-devtools/python/python-decorator.inc
+++ b/meta-python/recipes-devtools/python/python-decorator.inc
@@ -9,7 +9,9 @@ decorator, just because you can."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=41e24e0e235a97e60cdb5c4137fa2cd0"
 
-SRC_URI[md5sum] = "033c9563af492c4ce2680ee6ca481fa7"
-SRC_URI[sha256sum] = "1a089279d5de2471c47624d4463f2e5b3fc6a2cf65045c39bf714fc461a25206"
+PYPI_PACKAGE = "decorator" 
+
+SRC_URI[md5sum] = "b17bfa17c294d33022a89de0f61d38fe"
+SRC_URI[sha256sum] = "1c6254597777fd003da2e8fb503c3dbf3d9e8f8d55f054709c0e65be3467209c"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-decorator_4.0.2.bb b/meta-python/recipes-devtools/python/python-decorator_4.0.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-decorator_4.0.2.bb
rename to meta-python/recipes-devtools/python/python-decorator_4.0.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-decorator_4.0.2.bb b/meta-python/recipes-devtools/python/python3-decorator_4.0.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-decorator_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-decorator_4.0.6.bb
-- 
1.9.1


