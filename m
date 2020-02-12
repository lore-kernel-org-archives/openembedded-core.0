Return-Path: <jpewhacker@gmail.com>
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
	[209.85.219.177])
	by mail.openembedded.org (Postfix) with ESMTP id 19B4460B53
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 03:14:42 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id x191so317005ybg.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 19:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=v4Rk5g8GqVlgakXZpSxVY30RPlYnaMEILufyRYsHZbA=;
	b=AKvUpExjwn5Vr2EXsbrCMzaTPnO/mlkL+k5XekHAAoLkuYoHviSEvJQF6aiB5+edd2
	+gbk3ZvnXr2oMcd7uo2Q3FcAovLqwXj/KzdwiG/AT3T1QA4dACOUbpPBQFwloy68bI67
	S7e3EEgM2dRlXLvTfx0PmYHCDDNQAseuMnjWizICQu2Cf7s+M05RNL7ZwqneOrjUH6Wo
	LSF5/VhYZRGUDpO2s0Sb2SsTLdAPbTYHkRFh4qtCmmmNv7Gl+zlCZ6oaPCb0lnJ5WoaZ
	CUGrAGFD6cmBub1PNkC8ZoxddlIonPGfgs91VnAFq+cPHGP95OBFBc9bW05vqjPvgsH2
	nKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=v4Rk5g8GqVlgakXZpSxVY30RPlYnaMEILufyRYsHZbA=;
	b=RliPfkQi/ZQ3UNFzWkMjEa88bApHcDqjXFfzQzEiFlCq7K1J2E4aj0bQJrICegcuG2
	1qNWPX0XSwu0/6fDOOoapclK8p2x/aBQFrD0as+rL7EkEbIGroZMXHcI3gGsffibzPv/
	AScqqYi9Z6ezKkscJ49JWi4vgk7CvL0dEEdOA48UxttFvcfdlgZA37hbJlWeMVoJwgBW
	O1b/KUUlGPnHkhlHLO+h7161Jj0Ekzoo9sOn98OX/LmNKjRI7wybE+pfBCwoYvnPvtqw
	H+NIDp16VOReSAQtpVXK9wlEzJrBVkPJdy/ca037vX6AvLr/85DFly9P8sFw0HJBp7Be
	F9sA==
X-Gm-Message-State: APjAAAUbvT8ED9YxU2OrWSMslY/45Ad8RYx1R7F0aazuKYUSvaOiRIjj
	EEPpdkcKVhStbUKW6QWi7y+OJ/rQ
X-Google-Smtp-Source: APXvYqycKv7633GCvAlGNfQazF5qCOYoMJCOIGOgrHdY/lHNRPp0GvUZ+nhCHzyeyyuAoqnv+KNcig==
X-Received: by 2002:a25:3c2:: with SMTP id 185mr8744607ybd.425.1581477282853; 
	Tue, 11 Feb 2020 19:14:42 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:4f37:550:d1b1:6f01])
	by smtp.gmail.com with ESMTPSA id
	h193sm2677370ywc.88.2020.02.11.19.14.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 11 Feb 2020 19:14:42 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2020 21:14:33 -0600
Message-Id: <20200212031435.792802-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200212031435.792802-1-JPEWhacker@gmail.com>
References: <20200212031435.792802-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] python: Add magic recipe
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
X-List-Received-Date: Wed, 12 Feb 2020 03:14:42 -0000
Content-Transfer-Encoding: 8bit

The python-magic module is used by diffoscope tool to make
build comparisons.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python/python3-magic_0.4.15.bb            | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-magic_0.4.15.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index abbdb74a0d3..171a43615e3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -580,6 +580,7 @@ RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kr
 RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
+RECIPE_MAINTAINER_pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python/python3-magic_0.4.15.bb b/meta/recipes-devtools/python/python3-magic_0.4.15.bb
new file mode 100644
index 00000000000..698016ba4c2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-magic_0.4.15.bb
@@ -0,0 +1,19 @@
+SUMMARY = "File type identification using libmagic"
+DESCRIPTION = "This module uses ctypes to access the libmagic file type \
+    identification library. It makes use of the local magic database and supports \
+    both textual and MIME-type output."
+HOMEPAGE = "http://github.com/ahupp/python-magic"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88"
+
+PYPI_PACKAGE = "python-magic"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "e384c95a47218f66c6501cd6dd45ff59"
+SRC_URI[sha256sum] = "f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5"
+
+RDEPENDS_${PN} += "file"
+
+BBCLASSEXTEND = "native"
-- 
2.23.0


