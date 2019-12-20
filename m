Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1F3A87FD10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:23:56 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id g17so9986916wro.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 08:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jJUzzPNKxxsk+takncvUffOaWwT542HQ5/3tdIHyFvg=;
	b=QseD8+5u+OZw9zABlAA8Jp9SotTJfqmEm4uWalEcSxRoS1quwrZmI2cwTUiGWlq1Vh
	pBbk6WMUIj7k9/CqPRAHUFrQbpd7u4wqZ+uKArSRV9ximFaCK+B2W8c3pgcqaZNsrnm1
	C9iw9dq+uFtOJXnrRtYJ86XQpT9JEbdQxexLSy9Gt5jrB8qgLrLMUtPHoAHYpPXXsgX+
	DgAhPKLOQEdh1expddmpO7Jck1xOBYcV4g/VHw1cjd3R2GPoxJRvAynY+M+T4Qilfwn8
	PGnBt7Gi2MvF/GlLVvGfxuLDrSG9ZpLquv8w20JqF9v/oeocHrEEi85VC//MO0kClsN+
	zBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jJUzzPNKxxsk+takncvUffOaWwT542HQ5/3tdIHyFvg=;
	b=Kk+CdD2el68PSiK0q2OPg2Q4hI67jDXJK4gKt/MNL1BQil7WxR8wvJribA7CioPnBs
	ZGUgJ9CxMt6S/n/IMmFcMz7xE1N0EBEgv7sZnlC8+SwxYVR5zpXEFwRmLIoLQY8D5pgg
	k/NCdVtFlyTb1EpxFFFgEzHsC9ZC6tPzbP0yJmZu/ZnKw21Ssmh+MFyfNJJqhnxx2Dyy
	gP3A5Fzu9jUOS+IiNmLFrhsBAB2m0B1uf8RQrOaFul8Fy2SbkOTK1ts88IDXwc1lQA1b
	EqBjbpvZa+A3rNpTsBM9whINA5MBQR7Bse4vkj4P+WHSkkfVXBF8t1wBsqepK1B5WiYv
	EPOA==
X-Gm-Message-State: APjAAAXeTWwb8lU18oQnRGpNl/StZdXYCuI8NhzG/cpnJcVhjrJsbtHT
	SP7+1XO+mlYZvhUN7wABnkEqSu9CZ0E=
X-Google-Smtp-Source: APXvYqxp2On98FJ+nFlpsR7wr7C++fEblDcKXJY8FLkc2BzGXK7askDIaaHemdBN3+AR150oVlb7hQ==
X-Received: by 2002:a5d:50ce:: with SMTP id f14mr16107467wrt.254.1576859037552;
	Fri, 20 Dec 2019 08:23:57 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	w17sm10436356wrt.89.2019.12.20.08.23.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 08:23:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 17:23:42 +0100
Message-Id: <20191220162351.94498-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220162351.94498-1-alex.kanavin@gmail.com>
References: <20191220162351.94498-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/11] acl/attr: restore the package split
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
X-List-Received-Date: Fri, 20 Dec 2019 16:23:57 -0000

In version upgrade packages were accidentally merged.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/attr/acl_2.2.53.bb | 4 ++++
 meta/recipes-support/attr/attr.inc      | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta/recipes-support/attr/acl_2.2.53.bb b/meta/recipes-support/attr/acl_2.2.53.bb
index c95e0524eb4..6db4d940aae 100644
--- a/meta/recipes-support/attr/acl_2.2.53.bb
+++ b/meta/recipes-support/attr/acl_2.2.53.bb
@@ -21,6 +21,10 @@ SRC_URI[sha256sum] = "06be9865c6f418d851ff4494e12406568353b891ffe1f596b34693c387
 
 inherit autotools gettext ptest
 
+PACKAGES =+ "lib${BPN}"
+
+FILES_lib${BPN} = "${libdir}/lib*${SOLIBS}"
+
 PTEST_BUILD_HOST_FILES = "builddefs"
 PTEST_BUILD_HOST_PATTERN = "^RPM"
 
diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 5661301c15a..54b1a81d904 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -17,6 +17,10 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/attr/${BP}.tar.gz \
 
 inherit ptest update-alternatives autotools gettext
 
+PACKAGES =+ "lib${BPN}"
+
+FILES_lib${BPN} = "${libdir}/lib*${SOLIBS}"
+
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "setfattr"
 ALTERNATIVE_TARGET[setfattr] = "${bindir}/setfattr"
-- 
2.17.1


