Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id CF0FA73219
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 02:41:23 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id fl4so26979429pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 18:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8MTZdGFHvUQ2cSr5QqpQZCiljyOTYEP0LV/Rd2McB9c=;
	b=C1l+0bAVqz+0XMZnNSTwqpf45S9dYSXJSAHjAyOS1pIaCOg6ka7jC0dUvIhQLwOTsW
	wI/z+McMXyuKGNOwtYjfg0b0n8FHEd6HH3o4eykCA5CvULl5fOmr1ZFS9WnDQusBLHBj
	a+TtZE5eTsN0xRO7oqeb3+YUbOEapatezUfiBP7j6r+FrNKYUZV6kb0PqoqtcKgtd4Se
	vrqdq2XRYbXKdtYw9ariQ++WmQc1KkOcAMI96GygLgeGjHRNTvqB5V/sLgJUPuUTdmf/
	75kPVgSiiEEJclSfoRrzVDiaGsoD595yhs+tRYO7yP75orPjCKxfyOXOM5HWuE2BMGrT
	+A9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8MTZdGFHvUQ2cSr5QqpQZCiljyOTYEP0LV/Rd2McB9c=;
	b=FLEfWErEahZxzT4aAyRu3nbDW2PmdcxKveboOkcesBWrJzBJk7AzSGijv45Jl3c+PS
	us15b3JbUs1Cu4fYF8Ob6tWWHMbp47+z8B1ZlOdObyLoBkVfCFezbmrKahAwOkqEVnYQ
	SfRWoOFOF7uI8rO1Zw9zVD+I/d+LbmnS6JTU8kfkcr8byxdtKiGOkY/cf0jhWUg9Kzmx
	IY8DIhY44dftq4X4KInIPMeZg+2e2c2/rsZ05eLrLC7nhpk9n3xOgQlUmsoZIYLujunf
	Uom1iQ+TgcnAEaSBJQfSk9/XoPmn3FYXhRu0p9Rgj6bucgb3RTSoq6K4F7RLC4Zmb/4q
	ftGg==
X-Gm-Message-State: AG10YOQVxipaAlYS4Fjojxz0RGDNJ8fhpXppM2oTzOkXtDPJg6xiyROptvQE16gYtiK0CA==
X-Received: by 10.67.22.166 with SMTP id ht6mr71968426pad.9.1455244884375;
	Thu, 11 Feb 2016 18:41:24 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	mk3sm15215631pab.20.2016.02.11.18.41.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Feb 2016 18:41:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 18:41:18 -0800
Message-Id: <1455244878-7901-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1455244878-7901-1-git-send-email-akuster808@gmail.com>
References: <1455244878-7901-1-git-send-email-akuster808@gmail.com>
Subject: [fido][PATCH] libpcre: Security fixes and package update.
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
X-List-Received-Date: Fri, 12 Feb 2016 02:41:24 -0000

From: Armin Kuster <akuster@mvista.com>

this is related to [Yocto # 9008]

8.38:
The following security fixes are included:
CVE-2015-3210 pcre: heap buffer overflow in pcre_compile2()  compile_regex()
CVE-2015-3217 pcre: stack overflow in match()
CVE-2015-5073 CVE-2015-8388 pcre: Buffer overflow caused by certain patterns with an unmatched closing parenthesis
CVE-2015-8380 pcre: Heap-based buffer overflow in pcre_exec
CVE-2015-8381 pcre: Heap Overflow in compile_regex()
CVE-2015-8383 pcre: Buffer overflow caused by repeated conditional group
CVE-2015-8384 pcre: Buffer overflow caused by recursive back reference by name within certain group
CVE-2015-8385 pcre: Buffer overflow caused by forward reference by name to certain group
CVE-2015-8386 pcre: Buffer overflow caused by lookbehind assertion
CVE-2015-8387 pcre: Integer overflow in subroutine calls
CVE-2015-8389 pcre: Infinite recursion in JIT compiler when processing certain patterns
CVE-2015-8390 pcre: Reading from uninitialized memory when processing certain patterns
CVE-2015-8392 pcre: Buffer overflow caused by certain patterns with duplicated named groups
CVE-2015-8393 pcre: Information leak when running pcgrep -q on crafted binary
CVE-2015-8394 pcre: Integer overflow caused by missing check for certain conditions
CVE-2015-8395 pcre: Buffer overflow caused by certain references
CVE-2016-1283 pcre: Heap buffer overflow in pcre_compile2 causes DoS

8.37:
The following security fixes are included:
CVE-2014-8964 pcre: incorrect handling of zero-repeat assertion conditions
CVE-2015-2325 pcre: heap buffer overflow in compile_branch()
CVE-2015-2326 pcre: heap buffer overflow in pcre_compile2()

LICENSE file changed do to Copyright date updates.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/libpcre/{libpcre_8.36.bb => libpcre_8.38.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.36.bb => libpcre_8.38.bb} (91%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.36.bb b/meta/recipes-support/libpcre/libpcre_8.38.bb
similarity index 91%
rename from meta/recipes-support/libpcre/libpcre_8.36.bb
rename to meta/recipes-support/libpcre/libpcre_8.38.bb
index a4b7f6d..6ef5d70 100644
--- a/meta/recipes-support/libpcre/libpcre_8.36.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.38.bb
@@ -6,16 +6,15 @@ SUMMARY = "Perl Compatible Regular Expressions"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=ded617e975f28e15952dc68b84a7ac1a"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=7e4937814aee14758c1c95b59c80c44d"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch \
            file://run-ptest \
            file://Makefile \
 "
-
-SRC_URI[md5sum] = "b767bc9af0c20bc9c1fe403b0d41ad97"
-SRC_URI[sha256sum] = "ef833457de0c40e82f573e34528f43a751ff20257ad0e86d272ed5637eb845bb"
+SRC_URI[md5sum] = "00aabbfe56d5a48b270f999b508c5ad2"
+SRC_URI[sha256sum] = "b9e02d36e23024d6c02a2e5b25204b3a4fa6ade43e0a5f869f254f49535079df"
 
 S = "${WORKDIR}/pcre-${PV}"
 
-- 
2.3.5


