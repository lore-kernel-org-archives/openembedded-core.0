Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id BD7C8784FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 22:43:56 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id 35so3645103wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 14:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=snzLlhdYToFgcTYW2508Ba7S4gxM/BiE13pu072YX6U=;
	b=fOzbdOEDDnNVaECnTJO+Fda9yOdcTQSQW72udLhqvUE0VbFQM5u1C+4tSwE7lIN2rc
	sdk30gZE7IQTyjUiHEPla9gjZVTHMKm5e88e0LpwKxhN81HaeDr3AvrQeZIu7ODakXPs
	siUIGBcrHItT8kefd448eqnsZCZo7u+DuNn/uHjndPbyrzNRLDHNP7rrjjn1D0rpCCsj
	uni1lkrjWXH5FuWIaZND6uSR6hAa4n4aBLZsYb6ZjsmG/Bu4TieTxhGY9szq1MfUXtgF
	Xn8Q2KsGNCQD4PXvS9rcmCvAEouSiIbzt7Ddztw2TwyQdr0BSB8YTAWEctjCE/dXHKfq
	RjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=snzLlhdYToFgcTYW2508Ba7S4gxM/BiE13pu072YX6U=;
	b=h2hkZG+eRvdCEHxJK5hYvFvuyLi/lOxEh0HAR9ga9A9mTMrmHEyikm/JYfGR5PtvIq
	h4pOLgboljUm+FTAKoH8zDoJN7PVXfr7kFfo8CALbW8EMxweuuIwWRjmi+2AHw+bFuku
	RyOCH57hIWwPWSPHoNBAR0n8aFjIU+Z5Ge3LCoJOBRMqCqhoHeN6HQ3B50B/sJbjORQZ
	Kv13UsJpqfI8Zb0VT19jZe0rfc7ZFM42M6gqjrqoSEOCy03b7hxuWDDzGYo2jmxh22a7
	4FdofVxGgpz36YQFZsBnJhBmgvKKKby+V+OkR4wwiBwLnzwsjXhCBvdzdCzQqgEksLVu
	fovw==
X-Gm-Message-State: APf1xPDN3nO6QZ5ij6m8+HvHHzh08jdKrvaE1EBe4UVfFrKLwnDJ2RsK
	vUmbplxyyCI3gfQgWVEPQRubyA==
X-Google-Smtp-Source: AH8x2252ZTqPkBR4G04l12szMrkiC2qHfaMFg+f3s3q5t8hFzFnz80ncGZTtC6SVwOWjMFwZn9u71g==
X-Received: by 10.223.189.136 with SMTP id l8mr3729990wrh.58.1517957037348;
	Tue, 06 Feb 2018 14:43:57 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id j77sm843049wmf.37.2018.02.06.14.43.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 14:43:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Feb 2018 22:44:06 +0000
Message-Id: <20180206224406.10443-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <CA+chaQfE8Qtsc5LjNXXqhDaM-MS6tnpwAzi5_dEsHcU3B037Hw@mail.gmail.com>
References: <CA+chaQfE8Qtsc5LjNXXqhDaM-MS6tnpwAzi5_dEsHcU3B037Hw@mail.gmail.com>
Subject: [PATCH] iputils: add libidn dependency
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
X-List-Received-Date: Tue, 06 Feb 2018 22:43:57 -0000

* https://github.com/iputils/iputils/blob/master/RELNOTES.old
  mentiones that IDN was enabled by default in:
  [s20160308] and surprisingly the same in [s20150815]
  but there are no release notes for s20151218 version we were using until
  now, don't know how it really relates to [s20150815].

* https://github.com/iputils/iputils/commit/f3a461603ef4fb7512ade3bdb73fe1824e294547

* fails with:
  | In file included from ping_common.c:1:0:
  | ping.h:39:10: fatal error: idna.h: No such file or directory
  |  #include <idna.h>
  |           ^~~~~~~~

* Easiest way to reproduce this failure is to remove libidn from gnutls
  PACKAGECONFIG or to use gnutls which doesn't have libidn PACKAGECONFIG
  at all (like the one in meta-gplv2).

* First it leads to following QA issue:
  http://errors.yoctoproject.org/Errors/Build/53212/
  ERROR: iputils-s20161105-r0 do_package_qa: QA Issue: iputils-ping rdepends on libidn, but it isn't a build dependency, missing libidn in DEPENDS or PACKAGECONFIG? [build-deps]
  ERROR: iputils-s20161105-r0 do_package_qa: QA Issue: iputils-traceroute6 rdepends on libidn, but it isn't a build dependency, missing libidn in DEPENDS or PACKAGECONFIG? [build-deps]
  ERROR: iputils-s20161105-r0 do_package_qa: QA run found fatal errors.
  Please consider fixing them.
  ERROR: iputils-s20161105-r0 do_package_qa: Function failed:
  do_package_qa
  ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/iputils/s20161105-r0/temp/log.do_package_qa.7627
  ERROR: Task (/OE/build/oe-core/openembedded-core/meta/recipes-extended/iputils/iputils_s20161105.bb:do_package_qa) failed with exit code '1'

* But if you cleansstate iputils as well (after removing libidn from
  gnutls PACKAGECONFIG) to empty iputils RSS, then you get the error about
  missing idna.h:
  http://errors.yoctoproject.org/Errors/Build/53213/

* Adding the libidn dependency explicitly in iputils recipe fixes the
  issue.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/iputils/iputils_s20161105.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20161105.bb b/meta/recipes-extended/iputils/iputils_s20161105.bb
index ad7dbc4d4a..0acf2be5d3 100644
--- a/meta/recipes-extended/iputils/iputils_s20161105.bb
+++ b/meta/recipes-extended/iputils/iputils_s20161105.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://ping.c;beginline=1;endline=35;md5=f9ceb201733e9a6cf8f
                     file://arping.c;beginline=1;endline=11;md5=fe84301b5c2655c950f8b92a057fafa6 \
                     file://tftpd.c;beginline=1;endline=32;md5=28834bf8a91a5b8a92755dbee709ef96 "
 
-DEPENDS = "gnutls libcap libgcrypt"
+DEPENDS = "gnutls libcap libgcrypt libidn"
 
 SRC_URI = "git://github.com/iputils/iputils \
            file://0001-Fix-build-on-MUSL.patch \
-- 
2.15.1


