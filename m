Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 88E507E681
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 11:26:28 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d18so8152068wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 04:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4OJtMPa0A1KBCcptbVlqQXEIG5XWGMOZkRFmqYEqfdg=;
	b=lxgYQ9ycUQp+OA8M51d4ZaCgYs6dTlaUrIDgR2C3ROxTbKNMC1b21F3PisTIiOCS3Q
	UwqF6PxkoPVFmPnu2DzdgjKIJMOzf4NYL0xfMHq/T0sK5MZoS4+XXVAf6jskRK7F9w+A
	ewwVkgJLY4ad+fsqjfB7UJPm16A7VZESk3/k/pBuBZtTvs+BA/iBbJ1xN1HZRii6+xdn
	uGv5ASZAMA3wmT1jjSDr7GQbzFD8cAISiNB4zRJSryHByKOZ52IFxET5CJnYlFofGbUn
	N0FJgFhIUyicwKPFOi7QFWxiqpJBirKDNHZMuhOMYjTG/5PF/AIZmtuKhxqGpmVne0XX
	12Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4OJtMPa0A1KBCcptbVlqQXEIG5XWGMOZkRFmqYEqfdg=;
	b=ZgMFBhJhU5yD03Tpcx7UM6UPBX+QMzrfjf1RYulKoCk+9PDyXCgxdEXdX0MH5rqIUY
	zVHGDJKyUxFssRJpjXec53pLFJ+A5A9ORBJkipJPjWxTdmzysHbDlH0QAonPSxjsAGYN
	pxTEyV+1CCU78Ex7t0IrKubXQyOWbJ3eAsKSKg+yBVmizRUzg5EapLp3csEBq+plurkE
	L6cZzjBc8eFInx4orqIi/G+kkhQu6XuWJApZLPlply/eFGnvP+YnRjd8+mBLn2ViafWo
	RC1riKQUtEJwspBYoceqYC7ygaRu8IiRn+2BdH5QvFWk+Yw4+//EsnLt4NmDg78NMuM7
	QBDw==
X-Gm-Message-State: APjAAAXCvSPpWBhZzfIDF3+UtkERT1bVJfFIB1zlklkWHPXXM+Po56Hd
	FUwgVOUjGb0SxfTEXlsi6f5rQGxfN10=
X-Google-Smtp-Source: APXvYqxXlK3wg3fcHsRJQWYfrztE4kfx18dc4PUUvzgm14Npb0wbAW5pIuxaQ/WULikpX/ZX8sNxng==
X-Received: by 2002:a5d:554b:: with SMTP id g11mr9593847wrw.10.1559388389034; 
	Sat, 01 Jun 2019 04:26:29 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y2sm16270606wra.58.2019.06.01.04.26.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jun 2019 04:26:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jun 2019 13:26:19 +0200
Message-Id: <20190601112623.80424-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/5] python3-pygments: add a recipe
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
X-List-Received-Date: Sat, 01 Jun 2019 11:26:29 -0000

This is the new source highlighter used by gtk-doc.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python/python3-pygments_2.4.2.bb          | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pygments_2.4.2.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index a9a689fb09d..35f10c2a91a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -602,6 +602,7 @@ RECIPE_MAINTAINER_pn-python3-numpy = "Derek Straka <derek@asterius.io>"
 RECIPE_MAINTAINER_pn-python3-pbr = "Derek Straka <derek@asterius.io>"
 RECIPE_MAINTAINER_pn-python3-pip = "Derek Straka <derek@asterius.io>"
 RECIPE_MAINTAINER_pn-python3-pycairo = "Derek Straka <derek@asterius.io>"
+RECIPE_MAINTAINER_pn-python3-pygments = "Derek Straka <derek@asterius.io>"
 RECIPE_MAINTAINER_pn-python3-pygobject = "Derek Straka <derek@asterius.io>"
 RECIPE_MAINTAINER_pn-python3-setuptools = "Derek Straka <derek@asterius.io>"
 RECIPE_MAINTAINER_pn-python3-six = "Derek Straka <derek@asterius.io>"
diff --git a/meta/recipes-devtools/python/python3-pygments_2.4.2.bb b/meta/recipes-devtools/python/python3-pygments_2.4.2.bb
new file mode 100644
index 00000000000..35c0ac6a578
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pygments_2.4.2.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Pygments is a syntax highlighting package written in Python."
+DESCRIPTION = "Pygments is a syntax highlighting package written in Python."
+HOMEPAGE = "http://pygments.org/"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e1d7b7bffbfeaa14083fd2bd3236aea8"
+
+inherit setuptools3
+SRC_URI[md5sum] = "5ecc3fbb2a783e917b369271fc0e6cd1"
+SRC_URI[sha256sum] = "881c4c157e45f30af185c1ffe8d549d48ac9127433f2c380c24b84572ad66297"
+
+DEPENDS += "\
+            ${PYTHON_PN} \
+            "
+
+PYPI_PACKAGE = "Pygments"
+
+inherit pypi
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
2.17.1


