Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 07C3F7E403
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 10:10:42 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id n9so12372248wru.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 03:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DY5tCk5pUTjXXJXQLhYiSKdn0f+k10NLqj2+Zg5VjXI=;
	b=yLygIoj4Q2foaKMhl0ZX/RaTBWxd+aG5JuOLNgrUECLVM7+eh+c4ic/AbnpPBttgHE
	sfkW3jNOzk8OW2s1vZRjjLs8SOUjci+cIbrmuMqV9Yx5DIfJZZDLP9+Pj63rDJyxaP5+
	4paXs4zanQ3/msLKCwK34bPU7uR6wvzT+SzCV4BaYwEiIZu6JO/pxBa6rn07pNdm4fHF
	+L4+diCZd3K0fsQdNFKMlqxGxQTuZHifN49xvse+wfEWenhHG42fSAPDT9V6LFl4UkgO
	sEl8Orzt4OIYwrnA/jhKiC0ZfJc5ADwoh5q3m+KesIHY/dmnqcvaNo7TyQVy5VZI4SYb
	tWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DY5tCk5pUTjXXJXQLhYiSKdn0f+k10NLqj2+Zg5VjXI=;
	b=ahaUL7+pEuCOBJhfluh82lvdgyHIXwsJ+Iw9wH2enW92PpV4/uTINJkI02LzUp9lwU
	43eBNBf3aKdWlJnecMo5lkaHo4vv6+GXylfUJX3XQyzkBMkZ2fR9gRhZoREgMit59Izd
	PwFJ3SXu52BpretDA0q4OGlvKkHCYZz0gD3u4oiVljVEbIPz4HdA9oYUG0gKI7O6dFLK
	amUeDd4o34Jn6JLka2RTWvgKmFbXWHjvDRmmJePdQPy1c7MDCbFDYSvjOh0A7MTuGnQi
	uQONw0niMGPJJC/bzT4YbTOl2pznWo5rn6cfbw815MbeBSaTb9/c/Y+6PB5kUkkrc1Yi
	Ga+A==
X-Gm-Message-State: APjAAAVJJAUlytsLj01wcvcUgqyGaAGoluSkWsr9nv6c6a6EFy7oLLrE
	nAx7Cr5U46uo6pVhSeZeNKMiZMBLS5I=
X-Google-Smtp-Source: APXvYqzNAQjs5qS3Rp3F451Es4PJaxOv4CG3mdTlqOKWKw/M4DxFXk17/en7wLmD/jk5doj116JokA==
X-Received: by 2002:adf:83e5:: with SMTP id 92mr24807906wre.274.1560247843260; 
	Tue, 11 Jun 2019 03:10:43 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g17sm13724124wrm.7.2019.06.11.03.10.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jun 2019 03:10:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2019 11:10:40 +0100
Message-Id: <20190611101040.29095-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python-nose: python3-nose should be default
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
X-List-Received-Date: Tue, 11 Jun 2019 10:10:43 -0000

We have nose recipes for both Py2 and Py3, but they both want to ship the
unversioned nosetest binary.  As Py2 is approaching EOL, remove the unversioned
binary from python-nose (leaving nosetest-2.7) instead of renaming the binary to
nosetest3 in python3-nose.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-nose_1.3.7.bb  | 4 ++++
 meta/recipes-devtools/python/python3-nose_1.3.7.bb | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python-nose_1.3.7.bb b/meta/recipes-devtools/python/python-nose_1.3.7.bb
index 6d69d2d62e2..fab609df901 100644
--- a/meta/recipes-devtools/python/python-nose_1.3.7.bb
+++ b/meta/recipes-devtools/python/python-nose_1.3.7.bb
@@ -1,2 +1,6 @@
 inherit setuptools
 require python-nose.inc
+
+do_install_append() {
+    rm ${D}${bindir}/nosetests
+}
diff --git a/meta/recipes-devtools/python/python3-nose_1.3.7.bb b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
index 8bc1f49835e..13dbf96179a 100644
--- a/meta/recipes-devtools/python/python3-nose_1.3.7.bb
+++ b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
@@ -1,6 +1,2 @@
 inherit setuptools3
 require python-nose.inc
-
-do_install_append() {
-    mv ${D}${bindir}/nosetests ${D}${bindir}/nosetests3
-}
-- 
2.11.0


