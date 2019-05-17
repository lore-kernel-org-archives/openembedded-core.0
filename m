Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5CF7DEB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:49:06 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c5so8128716wrs.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ntnH6HRrI58R33shnjIOAvsxT2Aq6OWPuRZ6iT0MLNQ=;
	b=DBpqVWXvYEKV0+O+3J6Shyl7ygreBW5YCAPT3ZTHSosTKWiyHPMkaY7WKRMiVPEg+6
	yXkDYCF4kuPUR9cT1OrGWVHfWhn+5Rf29VuQQvxlLimUNpBNZe7wp8Oug4igho1NAUnv
	2k3q56HbQrQJSY/H5yiJQFB0XQ4i2Y0HUl+BzcjW7fst8fJyXlt9oBVc4k488ZERG5ik
	6uQ9mZD+chGxeHe6bTaZWZkuOXeEyzP9B375kWVgj6UBLiR8SIQar0XImtFD9XYkKt07
	+g7xV/jFvhmy4lm9yGIiIIBQXAiLF3OUeIw5z5UCaHb4vALWNbm828matzNbcvi4RtzB
	dgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ntnH6HRrI58R33shnjIOAvsxT2Aq6OWPuRZ6iT0MLNQ=;
	b=pDTpF10aWhfq9X+6y9G8bWtlFWGUKa581Fzje1QkXQeapWyrWgt1wveszAKo9nbZ+I
	SnFZDJ1ORRbPlSmXLT0efEw7+5M4324mXyG89aOqtl7ZyeDuazH5pT/OiJ3J3inh6itM
	tdCj5Wv2u99Qg+XEWNuQ4hfCGFnHxLBvfHzPTdr86LI4RvrdQw0p7vAMiL+E7gq6pjeI
	edF6Gp5Lm4Prm/00+ei2NpPHkDNK33fHvvZZtaHdsdGUmwrl8DbHlmYvxs8Qsxtp4HMB
	xOC+rc8wsXs1uoFwp7sgOoLcF3Pp9KN2Ak0tFtXAON1TKYRXZibI8HReJ6UVPbX1B8ze
	rJ0A==
X-Gm-Message-State: APjAAAWQNAEKI4BzEarCfqJHYPBdensuhCW3Zes3b/eS1Ho5efA22C+S
	TOx5WLyWB7DDL5kPJ5SjfxKBjFac
X-Google-Smtp-Source: APXvYqwb71/E4aRo/aFKoIh4Cxp3xJIoXALECAqzHm6x72I/MSR/hvzx087r/ijVT7iHau5vERU37g==
X-Received: by 2002:adf:94a5:: with SMTP id 34mr35461408wrr.275.1558118946779; 
	Fri, 17 May 2019 11:49:06 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	x187sm11640887wmb.33.2019.05.17.11.49.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:49:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:48:59 +0200
Message-Id: <20190517184859.3632-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libpcre2: upgrade 10.32 -> 10.33
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
X-List-Received-Date: Fri, 17 May 2019 18:49:06 -0000

License-update: copyright years

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libpcre/{libpcre2_10.32.bb => libpcre2_10.33.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.32.bb => libpcre2_10.33.bb} (90%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.32.bb b/meta/recipes-support/libpcre/libpcre2_10.33.bb
similarity index 90%
rename from meta/recipes-support/libpcre/libpcre2_10.32.bb
rename to meta/recipes-support/libpcre/libpcre2_10.33.bb
index 3a0aa53029f..50b26753b4f 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.32.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.33.bb
@@ -8,14 +8,14 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=cf66d307bf03bae65d413eb7a8e603a0"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b1588d3bb4cb0e1f5a597d908f8c5b37"
 
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
 "
 
-SRC_URI[md5sum] = "8a096287153fb994970df3570e90fcb5"
-SRC_URI[sha256sum] = "f29e89cc5de813f45786580101aaee3984a65818631d4ddbda7b32f699b87c2e"
+SRC_URI[md5sum] = "80b355f2dce909a2e2424f5c79eddb44"
+SRC_URI[sha256sum] = "35514dff0ccdf02b55bd2e9fa586a1b9d01f62332c3356e379eabb75f789d8aa"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.17.1


