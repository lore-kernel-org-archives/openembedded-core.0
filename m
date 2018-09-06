Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id EDC2D795E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:45 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id s10-v6so8445586edb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fnAjwBwzv/myqRWPapVecZy2rGrnhcl2Dfj3d8wJel8=;
	b=Rb30sc7NIKThB6NqZOJfTv50RuX46InENWDThvlEkiYtMp6uu9c2crGbvXVwDvmop9
	6P/d6XtG0pLM78O59qZxI7NSKzZw1VPQesjXfZ6A2DZrdN3u576nKlS39XSOMPc7PiWj
	vw3T1N7zwDb37uC+kFrzCTmj/ncNO2RsUcZu2sBhJv96SC8HzU9zoqZSfVWsIXc54wMw
	W5qONB/Pkb4Q9MkFganildKQH8/DL53zo6Pjrz2/v5u+nI8RhXAYTYXskz/liV/uJ9Yt
	SqWkuxhF0Zk7gPw3NcXGDkcgReoc6/78wC/Ugfvgs+OZ+O/oxmxX+oMcojv/BQNDK3ji
	OTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fnAjwBwzv/myqRWPapVecZy2rGrnhcl2Dfj3d8wJel8=;
	b=Ax3e55L9SfV7fA/R1qBpdiUCj6cDiuBWenU0EW5F2xlPEjKWFa4jOfoTB26vWpe6ry
	5NvopV6/ltppUk08EFAcixuzroH2uw28flBDsY+KH6CWoe2Km5EYRTJLcoMDnRXc6PT/
	F9DJJppUUOMStp89usmX+FWR8BEcjK+sNwYIbcwNhQrRHXz8A5T1l00KkUMHgSMeawWZ
	/pIZQPwJBy5GJWxXz29Mm+TMLFLqNmnpca0zrxWJXasn3vD3/rfHSiPPYt+iq5tfIUaw
	a6I7P7CNmr4ftIMkni5OTXu4KK0fIrF1HtqINd5g6Uq4U64Je4ZMvgdBLxd6YYHwsDWS
	pIZQ==
X-Gm-Message-State: APzg51BZKzUM1lzAAhCTTGBEo5r7bdvRfM081OFhbd3fgYWhdWpCxWIi
	/vVfdAPAV0SJNupemOsZzi1JiBNtO/k=
X-Google-Smtp-Source: ANB0VdZIcXl9qUhR3yuJGh5OfTjfT2q/gdIOsREjZsMqORuVr5jte9zPO9APp3OR5pjK5PY/X/A4eA==
X-Received: by 2002:a50:8be1:: with SMTP id
	n30-v6mr2780205edn.216.1536229786403; 
	Thu, 06 Sep 2018 03:29:46 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:16 +0200
Message-Id: <1536229770-29600-7-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 07/21] libsolv: update to 0.6.35
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:46 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/libsolv/libsolv_0.6.34.bb | 30 -------------------------
 meta/recipes-extended/libsolv/libsolv_0.6.35.bb | 29 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-extended/libsolv/libsolv_0.6.34.bb
 create mode 100644 meta/recipes-extended/libsolv/libsolv_0.6.35.bb

diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.34.bb b/meta/recipes-extended/libsolv/libsolv_0.6.34.bb
deleted file mode 100644
index 5950194..0000000
--- a/meta/recipes-extended/libsolv/libsolv_0.6.34.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Library for solving packages and reading repositories"
-HOMEPAGE = "https://github.com/openSUSE/libsolv"
-BUGTRACKER = "https://github.com/openSUSE/libsolv/issues"
-SECTION = "devel"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
-
-DEPENDS = "expat zlib rpm"
-
-SRC_URI = "git://github.com/openSUSE/libsolv.git \
-          "
-SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch \
-                             file://0002-Fixes-to-internal-fopencookie-implementation.patch \
-                           "
-
-SRCREV = "f0ef172a591d9c1ca0e13e09955054ac9c473d67"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-
-S = "${WORKDIR}/git"
-
-inherit cmake
-
-EXTRA_OECMAKE = "-DLIB=${baselib} -DMULTI_SEMANTICS=ON -DENABLE_RPMMD=ON -DENABLE_RPMDB=ON -DENABLE_COMPLEX_DEPS=ON"
-
-PACKAGES =+ "${PN}-tools ${PN}ext"
-
-FILES_${PN}-tools = "${bindir}/*"
-FILES_${PN}ext = "${libdir}/${PN}ext.so.*"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.35.bb b/meta/recipes-extended/libsolv/libsolv_0.6.35.bb
new file mode 100644
index 0000000..0956453
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.35.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Library for solving packages and reading repositories"
+HOMEPAGE = "https://github.com/openSUSE/libsolv"
+BUGTRACKER = "https://github.com/openSUSE/libsolv/issues"
+SECTION = "devel"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
+
+DEPENDS = "expat zlib rpm"
+
+SRC_URI = "git://github.com/openSUSE/libsolv.git"
+SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch \
+                             file://0002-Fixes-to-internal-fopencookie-implementation.patch \
+                           "
+
+SRCREV = "38c5374d4712667b0b6ada4bf78ddbb343095d0c"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DLIB=${baselib} -DMULTI_SEMANTICS=ON -DENABLE_RPMMD=ON -DENABLE_RPMDB=ON -DENABLE_COMPLEX_DEPS=ON"
+
+PACKAGES =+ "${PN}-tools ${PN}ext"
+
+FILES_${PN}-tools = "${bindir}/*"
+FILES_${PN}ext = "${libdir}/${PN}ext.so.*"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


