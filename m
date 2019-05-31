Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 189917E5B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 15:56:22 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c2so6854611wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 08:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4OJtMPa0A1KBCcptbVlqQXEIG5XWGMOZkRFmqYEqfdg=;
	b=SpFwOirB3blQK4FK9E5aPI1LkW59rCW3CYHrK6VVxBoFy3naxgroi5L7B3D0YkBDh2
	8bSXUtwDlPUsUEoQNeNv/khtWDBU+fo50rupc0qGuG18Aor4dd0wxXsuTRVIIJWPKx4P
	KSDA2DFjUcjsbcQhQqgZGmNfz1vT4qqSHEKuJm8i3w9Dwh/7ywqNlt0MbYjJEXRApATX
	8QPV/DQk3Y2gKoTkZAOEAOgCtUs04TQl4MIFxpzUW8tXarqHOSVwLalAyFJ3HxqXBEMq
	dUYiEkOm+H0BTh2m0hVzy4NKDtWC/1fIU4zh29Vx6a3aDBGu28Pu4x8pikL+D8UxxxW7
	Bwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4OJtMPa0A1KBCcptbVlqQXEIG5XWGMOZkRFmqYEqfdg=;
	b=NbctDPLomS18VP9qILZmB0MMbHjZ/rn+5a2On1oeW3xgKA6q/1RbQIWTwinfr/ahPz
	BvJn3a3jfMAYddP5wCaU4gklgCnbBrrRSLPMFKpTOxOvtvUC0Yoqc3MrsZ+/ENpDwGN8
	Lq0CcuO/DWtbk+1blTdKrHR1SOZmTAEkcLeCWux8NxPmF00tHTKLMpnjxHX8DWQTctDI
	LjGc+8JA+0vv+8msaENgWaprPAisHGNVRvSduX2XmLK6cxRC/3UAcqvVBmbzKH2W3JG0
	xn0korrr6l6+VsEdHg6DNpsjUHr1oGtXEREETauKLv95y6uV3eZ8ddv2h60zoSj4BAWr
	s60g==
X-Gm-Message-State: APjAAAWW1aHnH8zITvSI+Y5uHjiUznQO83uVSwc2NflH6BQMatXxx+Nf
	IKYrqiYfIJNADgImpjWvyKrRZelFrFDNhQ==
X-Google-Smtp-Source: APXvYqy6OJLmpdsaDl3mH3uVmxi+h5okDuMkxxiKstpXzZT6KtFCR4EYCcIdrKd83qS/VjuPPYrF7w==
X-Received: by 2002:a5d:658b:: with SMTP id q11mr7400463wru.130.1559318182645; 
	Fri, 31 May 2019 08:56:22 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	u19sm16496445wmu.41.2019.05.31.08.56.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 08:56:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 17:56:07 +0200
Message-Id: <20190531155612.75663-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531155612.75663-1-alex.kanavin@gmail.com>
References: <20190531155612.75663-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/8] python3-pygments: add a recipe
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
X-List-Received-Date: Fri, 31 May 2019 15:56:22 -0000

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


