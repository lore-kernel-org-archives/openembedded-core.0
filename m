Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id CF3D87BDB3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Jan 2019 22:05:01 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id g62so19946216pfd.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Jan 2019 14:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=1HczAecj+B8jYC148xmtfeJmFkTzWz/AcrFgYz6DRms=;
	b=JU0WhWp9d1Ty/KQQC53Inh07hT3fmgBNxl95jPOyyYOXAHrJD6jvQ0BsLYNQujFpVC
	+QLDr2nd5ejysgwzf375hZMlVToWXFqDdjlZqLONMIgcxMTYhsWetNQpPd2N1GLtUhJw
	WS2peU4N0PtwyUcBYcQnQRU+VF3onb+oSHWVd1QkKRVldDM8gswOBbUDCMUAMtdovPA8
	8KAY8AJDkjEFuHFGcUOe3xQnrARhQ/yhXvxLh5xk4zi9cAaxwgdC+JlUBEaoH5F+zWNN
	zLDOC24476q8rD06qKVjHEG1rAicW/Bz3pIHIUF/zl7E9CPpctW87UMr7PeostKmsYIx
	E7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1HczAecj+B8jYC148xmtfeJmFkTzWz/AcrFgYz6DRms=;
	b=nrkzsYyCliW+lEBCJ3DvxOztTlj2Ha0SUl0ZFlhpU3BQtRVyivbRdNdrKZzDhlOb+Q
	VTK4eXM7rhfgDs/i5le3AkRGMsYNC3p4HtKv5bebSog/wiMxryCOYPLsHD9H9/RZzqbX
	5zyPoqSQCLeUlTKvtq4/On7LZDGnPWkhat4IXpIZFDqG7s+plIGWWVsLp3cjDIFFvfAt
	rW/W0zlrs/cqc7VVy+jnxhAAx8hTTYRSfQ+OiiWwVFSnRN6pqc4a55LCoNw5EBiz4wEx
	cPfaxoQ+E3oUgzZh4muylAoGei2uPjk0i2lGBuoMWwF0T8oYHnfJN4WwF6THiDIvUcAo
	QyKw==
X-Gm-Message-State: AJcUukelKT+zB6BGrgZPKaJuKvnAYgPips/q2+mlHJzjOJjuwqFNZKGb
	q6Wf5tdLu8/pA7VEIJL2BAc=
X-Google-Smtp-Source: ALg8bN78WgYJDUfx8sZgrgeXesiGxeGb+jF7bkPassph9cKr/oX3dfc4vdL5gHBqbwgmB+mBDh4N3A==
X-Received: by 2002:a63:3507:: with SMTP id c7mr6039708pga.315.1546725902920; 
	Sat, 05 Jan 2019 14:05:02 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:901b:2e65:60ef:e7e9])
	by smtp.gmail.com with ESMTPSA id
	a4sm71163931pgv.70.2019.01.05.14.05.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Jan 2019 14:05:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Sat,  5 Jan 2019 14:05:01 -0800
Message-Id: <1546725901-3285-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [v2][PATCH] nettle: update to 3.4.1
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
X-List-Received-Date: Sat, 05 Jan 2019 22:05:02 -0000

Bug fix only release

Include:

  CVE-2018-16868 gnutls: Bleichenbacher-like side channel leakage in
  PKCS#1 1.5 verification and padding oracle verification

  CVE-2018-16869 nettle: Leaky data conversion exposing a manager oracle

For full details see:
http://lists.lysator.liu.se/pipermail/nettle-bugs/2018/007369.html

[V2]
Add -std=c99 to cflags

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../Add-target-to-only-build-tests-not-run-them.patch                | 0
 .../check-header-files-of-openssl-only-if-enable_.patch              | 0
 .../nettle/{nettle-3.4 => nettle-3.4.1}/dlopen-test.patch            | 0
 meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/run-ptest   | 0
 meta/recipes-support/nettle/{nettle_3.4.bb => nettle_3.4.1.bb}       | 5 +++--
 5 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/Add-target-to-only-build-tests-not-run-them.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/check-header-files-of-openssl-only-if-enable_.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/dlopen-test.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/run-ptest (100%)
 rename meta/recipes-support/nettle/{nettle_3.4.bb => nettle_3.4.1.bb} (90%)

diff --git a/meta/recipes-support/nettle/nettle-3.4/Add-target-to-only-build-tests-not-run-them.patch b/meta/recipes-support/nettle/nettle-3.4.1/Add-target-to-only-build-tests-not-run-them.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.4/Add-target-to-only-build-tests-not-run-them.patch
rename to meta/recipes-support/nettle/nettle-3.4.1/Add-target-to-only-build-tests-not-run-them.patch
diff --git a/meta/recipes-support/nettle/nettle-3.4/check-header-files-of-openssl-only-if-enable_.patch b/meta/recipes-support/nettle/nettle-3.4.1/check-header-files-of-openssl-only-if-enable_.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.4/check-header-files-of-openssl-only-if-enable_.patch
rename to meta/recipes-support/nettle/nettle-3.4.1/check-header-files-of-openssl-only-if-enable_.patch
diff --git a/meta/recipes-support/nettle/nettle-3.4/dlopen-test.patch b/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.4/dlopen-test.patch
rename to meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
diff --git a/meta/recipes-support/nettle/nettle-3.4/run-ptest b/meta/recipes-support/nettle/nettle-3.4.1/run-ptest
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.4/run-ptest
rename to meta/recipes-support/nettle/nettle-3.4.1/run-ptest
diff --git a/meta/recipes-support/nettle/nettle_3.4.bb b/meta/recipes-support/nettle/nettle_3.4.1.bb
similarity index 90%
rename from meta/recipes-support/nettle/nettle_3.4.bb
rename to meta/recipes-support/nettle/nettle_3.4.1.bb
index ca8450e..dd49c30 100644
--- a/meta/recipes-support/nettle/nettle_3.4.bb
+++ b/meta/recipes-support/nettle/nettle_3.4.1.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-target = "\
             file://dlopen-test.patch \
             "
 
-SRC_URI[md5sum] = "dc0f13028264992f58e67b4e8915f53d"
-SRC_URI[sha256sum] = "ae7a42df026550b85daca8389b6a60ba6313b0567f374392e54918588a411e94"
+SRC_URI[md5sum] = "9bdebb0e2f638d3b9d91f7fc264b70c1"
+SRC_URI[sha256sum] = "f941cf1535cd5d1819be5ccae5babef01f6db611f9b5a777bae9c7604b8a92ad"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -30,6 +30,7 @@ inherit autotools ptest multilib_header
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
 EXTRA_OECONF = "--disable-openssl"
+CFLAGS_append = " -std=c99"
 
 do_compile_ptest() {
         oe_runmake buildtest
-- 
2.7.4


