Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 75FC87E371
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 13:50:50 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t1so1426152pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 06:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wyGADTYT5MBdWHcEKyNs8PWUMh2yCEZZT3Bln3Lyaw4=;
	b=ihfBOhSlsqkmlia9JVGS0esnT0DCH7Cz/yAI+i1d5s+Z32i8Oy0x8GwlgujbusCqb2
	icmgd2pA95P2ynIVbDbwRGJYxxkBhA9LWwxbSWEYOarLjD33BW7qH0INUUhAS6zh15eK
	+OkdMU/Zv+WSpwFBtZ1AwkDTf1JFVo6Pqh5L3bIa9SAIZX3wXQvLOhdNCMJhLcWqO5Od
	xpbKsrKFTVZc1CTDqjxsq3Bc7b1HOSYeQtjT/UpPls58KsiPElrZX+40IysqzU4HNocz
	qZHb5HDlJ5ZQvnfnshA9A4nSaXtWpxCZZPlyaEeylGKPTYc+42cG5CuGMKd3Xwv1MGCd
	EdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wyGADTYT5MBdWHcEKyNs8PWUMh2yCEZZT3Bln3Lyaw4=;
	b=LzoiJ0SkIH5UdtPtTXuCIQIIGtiM1MIfqQzCXIEWOha472zjmSRQ5LFs7Efb72nvXp
	2PjSV5Swjg1E/W7VVuzm29m6JPLPqwT5oWzRE5X1DK64vgtZrv9408w1zFhs2VH2hc+d
	N3Vj+FXyhycv5ZWsNnzz7EeXgRtNqA4QhM6tR0p0R8eaHiCray3L+jldbXfObXG7nB73
	tH7EundRcvdl2GLQR67wNvBbRDdZBJ6o/ZdIsfrE57xSrudYEbHBoYuXqx5to0HpF6DI
	hLZ3rp3Xi/vMUS1SeKIvX/rF8+wM8toMvvsvnVXdCzjElcx6ZpmyTnsosr7RUre6Em6C
	6tzQ==
X-Gm-Message-State: APjAAAU2szWybkmJBlz7M0Vhz6ANePObUOAFpKq8Yvsnp52NEbRb5fFQ
	GEWO3J6TBFtNk9A5ui9T3Ohs6Rgo
X-Google-Smtp-Source: APXvYqyfhs6FYngsBH4NUfXFaGshV8ZgDmPG37PF1sjk5VaCcRUaKlPad1vhRoK56wKaVTZmlTHtng==
X-Received: by 2002:a17:90a:26cf:: with SMTP id
	m73mr3157657pje.90.1559137846778; 
	Wed, 29 May 2019 06:50:46 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id r7sm5976891pjb.8.2019.05.29.06.50.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 May 2019 06:50:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 06:50:35 -0700
Message-Id: <1559137838-8972-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
References: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 6/9] nettle: update to 3.4.1
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
X-List-Received-Date: Wed, 29 May 2019 13:50:50 -0000

Source: Openembedded.org
MR: 98314, 98315
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-support/nettle?h=warrior&id=8ac8fa8ee10c59a081d368a5429e0eced8dd5d3c
ChangeID: 657aa277fb284b66e8d349cbc3424f10208652c3
Description:

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
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


