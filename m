Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 10830719D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 20:07:38 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b80so4285052wme.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 13:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8sdc+GRVkKKRy5YRvGtsVJjJHxryJfSlnx8mx/YyBrY=;
	b=0G21vSB2vrV1ECKL4WTJl0m15plG6VywcR0ImtPQA6wGpqwsO2m+/ZSevVmgP/eL4J
	3FuAFOxpavSa7MW0IGpcs3s0YY+aWTL07Mj3bOO6oBIV1DOjpzEGOpAiWbKRv7W66gD3
	YpKkq/kLephmw/cU1v3XbnUZriD+tudFA/uLtbxKIT/EwbqKMuMCF/snkU4zDJyFn559
	BG7huTpMXcFEcKGLPz5DLfUmVLrJrB8EKCBLCku/RhaqHeURvGRMqQ/MkY77Ook27Hhf
	sBqKF4/tJ7bfIGI8v3ciJEOF11/7H6ooW7x5Zj4jTn3BlctX7/teFxmxOyVWd+YauZg0
	ASvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8sdc+GRVkKKRy5YRvGtsVJjJHxryJfSlnx8mx/YyBrY=;
	b=AQv9RUq9tlWZeZNwXBbJu/HnAW5TxBnN51NHeVf8vCnajsjtx2IsTm0YYoXcapaYyR
	uae5Bwr8d9/Ju2v3Je6/2oXzlLTdEOrBJxqWPZLiJeWY5YfFGUG1RV7rYwEBBuv845aC
	mGC5iHfQ+tA1DNnRVpPtxq3K/UZKUFX2W84FZOnDTEb8YHsF3o0Y5IAqdNoWzsPyMRjh
	JhpfKe8ACaN7EczJmtlsNRegE5kTYuo3L7Q/UDYpJkCuA9H4hIr4E5GkrqcN0MoGef4v
	CFegClMvUJ2eI08Dc6ud0WmQNNF7QaOI/ghHQBWXJ8wiV03Wp0Id9LV9hg8n4mbBmngC
	Gjew==
X-Gm-Message-State: ABUngve6gFAn8/8LhDttrFvdpEOXftGhH9GTlxB9aKe2hWrIYswkgcJdNTjr2OcZwIkvZg==
X-Received: by 10.28.191.3 with SMTP id p3mr148295wmf.112.1477598859746;
	Thu, 27 Oct 2016 13:07:39 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3F33.dip0.t-ipconnect.de.
	[91.10.63.51]) by smtp.googlemail.com with ESMTPSA id
	a5sm10294203wjv.6.2016.10.27.13.07.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Oct 2016 13:07:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Oct 2016 22:07:20 +0200
Message-Id: <1477598840-1768-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1477598840-1768-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477598840-1768-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH v3 2/2] taglib: update to 1.11
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
X-List-Received-Date: Thu, 27 Oct 2016 20:07:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-support/taglib/{taglib_1.9.1.bb => taglib_1.11.bb} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-support/taglib/{taglib_1.9.1.bb => taglib_1.11.bb} (67%)

diff --git a/meta/recipes-support/taglib/taglib_1.9.1.bb b/meta/recipes-support/taglib/taglib_1.11.bb
similarity index 67%
rename from meta/recipes-support/taglib/taglib_1.9.1.bb
rename to meta/recipes-support/taglib/taglib_1.11.bb
index d125308..c29bda9 100644
--- a/meta/recipes-support/taglib/taglib_1.9.1.bb
+++ b/meta/recipes-support/taglib/taglib_1.11.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "zlib"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "0d35df96822bbd564c5504cb3c2e4d86"
-SRC_URI[sha256sum] = "72d371cd1419a87ae200447a53bff2be219283071e80fd12337928cc967dc71a"
+SRC_URI[md5sum] = "be39fa2054df40664cb557126ad7cf7c"
+SRC_URI[sha256sum] = "ed4cabb3d970ff9a30b2620071c2b054c4347f44fc63546dbe06f97980ece288"
 
 UPSTREAM_CHECK_URI = "http://github.com/taglib/taglib/releases/"
 
@@ -21,7 +21,7 @@ inherit cmake pkgconfig binconfig-disabled
 PACKAGES =+ "${PN}-c"
 FILES_${PN}-c = "${libdir}/libtag_c.so.*"
 
-EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
+EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
 
 do_configure_prepend () {
 	rm -f ${S}/admin/ltmain.sh
@@ -30,3 +30,6 @@ do_configure_prepend () {
 	sed -i -e "s/atomic.hpp/atomic-not-exist.hpp/" ${S}/ConfigureChecks.cmake ${S}/taglib/toolkit/trefcounter.cpp
 }
 
+# without -fPIC depending packages failed with many error like:
+# | <...>/ld: error: <...>/usr/lib/libtag.a(modfilebase.cpp.o): requires unsupported dynamic reloc R_ARM_THM_MOVW_ABS_NC; recompile with -fPIC
+CXXFLAGS += "-fPIC"
-- 
2.5.5


