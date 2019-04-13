Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id EA2157D3EC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 19:22:14 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id d55so10398095ede.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 12:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XxpjzuTM01fRKajjmHGXF7D+wjFzbz9CRr755acQG98=;
	b=KoPc65akmLft21mvZ+5CNPk4ZZaFrcyal1/y7aSogS7O5hIK2FxPhNUO4VlluY5b63
	lYNhsndpmRcTXhQczwx39paxdgsUxD93GYYA7v+nPCv/7/ugUFwwHYKqiO86j459aCiC
	Wce1WwZH84AUjeGKsm9WThq8VjBkTC3qg7Gyhy5v3blGRjylC+Eb0BnG+WahiVvdoDa7
	oj3aNyYE6KVA8UJAnBFXaitLyxiXf12dIdk7pMiQSwDl4mPLT28L9n7k2egELiDoVOXx
	xFiLlWg+EQ0ReZpgudzyKZ3UCjADA/g5bYZ6eTYMnianjynH9TxpR1ueqCQzoAQyJqyc
	6ADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XxpjzuTM01fRKajjmHGXF7D+wjFzbz9CRr755acQG98=;
	b=Ez/YzsMvWIDJG9VpWCXm/tbW/YbHd6nbTWdFOzSwtO3LR6kRWWVEbzDum6j+llBuz2
	Bjvbt0NF2cp2Ze3VlOBkV0jj2wE3v6znvHHgC6RQLlPryUpoBi3y10ixBXPJVvK+N51c
	WU6/H0kBLA4egMgNy4D6D+3TzwNaLFI9ZIAjTU4p1W/MBPD4NvJmQ0fldAUzC2h7UVZQ
	63hA5qgctVVid4fvdbMiioExSj012/n4LNEiK0d3sdgip/z+whyQ0hfkqJRYtmlnOZ/q
	fNI/tUCcgBORGn4JKZ+S713ZboKDogmnGsM7n9CTuzXaIxUdO7LwUPeqseNjNWnABgGr
	UElQ==
X-Gm-Message-State: APjAAAXSqX+LZ/LW0gjEak3r/BqRjkOsYICGE3JysnFEu7+Rpq5zWYtz
	Iyu8gGuqZlVUquze/FBCQs6BPLEw
X-Google-Smtp-Source: APXvYqy99zMO9CuHOJ2gZnzsOTlR8731X7WoBxUDIlqarhVq5HKJYV/UrVOZSFpVMdQCGu2BvSbS5Q==
X-Received: by 2002:a17:906:1b03:: with SMTP id
	o3mr26457097ejg.201.1555183334353; 
	Sat, 13 Apr 2019 12:22:14 -0700 (PDT)
Received: from 16c67e32fcd5.fritz.box
	(ip5b413250.dynamic.kabel-deutschland.de. [91.65.50.80])
	by smtp.gmail.com with ESMTPSA id
	p24sm2751821edm.43.2019.04.13.12.22.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 13 Apr 2019 12:22:13 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Apr 2019 19:21:10 +0000
Message-Id: <1555183270-338-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: ][PATCH] iptables: upgrade 1.6.2 -> 1.8.2
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
X-List-Received-Date: Sat, 13 Apr 2019 19:22:15 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

To enable security flash, get the build error. To fix this,
0003-extensions-format-security-fixes-in-libipt_icmp.patch is required.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 ...ions-format-security-fixes-in-libipt_icmp.patch | 61 ++++++++++++++++++++++
 .../{iptables_1.6.2.bb => iptables_1.8.2.bb}       |  5 +-
 2 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/iptables/iptables/0003-extensions-format-security-fixes-in-libipt_icmp.patch
 rename meta/recipes-extended/iptables/{iptables_1.6.2.bb => iptables_1.8.2.bb} (91%)

diff --git a/meta/recipes-extended/iptables/iptables/0003-extensions-format-security-fixes-in-libipt_icmp.patch b/meta/recipes-extended/iptables/iptables/0003-extensions-format-security-fixes-in-libipt_icmp.patch
new file mode 100644
index 0000000..0029661
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/0003-extensions-format-security-fixes-in-libipt_icmp.patch
@@ -0,0 +1,61 @@
+From 907e429d7548157016cd51aba4adc5d0c7d9f816 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Adam=20Go=C5=82=C4=99biowski?= <adamg@pld-linux.org>
+Date: Wed, 14 Nov 2018 07:35:28 +0100
+Subject: extensions: format-security fixes in libip[6]t_icmp
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 61d6c3834de3 ("xtables: add 'printf' attribute to xlate_add")
+introduced support for gcc feature to check format string against passed
+argument.  This commit adds missing bits to extenstions's libipt_icmp.c
+and libip6t_icmp6.c that were causing build to fail.
+
+Fixes: 61d6c3834de3 ("xtables: add 'printf' attribute to xlate_add")
+Signed-off-by: Adam Gołębiowski <adamg@pld-linux.org>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+
+Upstream-Status: Backporting
+---
+ extensions/libip6t_icmp6.c | 4 ++--
+ extensions/libipt_icmp.c   | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/extensions/libip6t_icmp6.c b/extensions/libip6t_icmp6.c
+index 45a71875..cc7bfaeb 100644
+--- a/extensions/libip6t_icmp6.c
++++ b/extensions/libip6t_icmp6.c
+@@ -230,7 +230,7 @@ static unsigned int type_xlate_print(struct xt_xlate *xl, unsigned int icmptype,
+ 	type_name = icmp6_type_xlate(icmptype);
+ 
+ 	if (type_name) {
+-		xt_xlate_add(xl, type_name);
++		xt_xlate_add(xl, "%s", type_name);
+ 	} else {
+ 		for (i = 0; i < ARRAY_SIZE(icmpv6_codes); ++i)
+ 			if (icmpv6_codes[i].type == icmptype &&
+@@ -239,7 +239,7 @@ static unsigned int type_xlate_print(struct xt_xlate *xl, unsigned int icmptype,
+ 				break;
+ 
+ 		if (i != ARRAY_SIZE(icmpv6_codes))
+-			xt_xlate_add(xl, icmpv6_codes[i].name);
++			xt_xlate_add(xl, "%s", icmpv6_codes[i].name);
+ 		else
+ 			return 0;
+ 	}
+diff --git a/extensions/libipt_icmp.c b/extensions/libipt_icmp.c
+index 54189976..e76257c5 100644
+--- a/extensions/libipt_icmp.c
++++ b/extensions/libipt_icmp.c
+@@ -236,7 +236,7 @@ static unsigned int type_xlate_print(struct xt_xlate *xl, unsigned int icmptype,
+ 			if (icmp_codes[i].type == icmptype &&
+ 			    icmp_codes[i].code_min == code_min &&
+ 			    icmp_codes[i].code_max == code_max) {
+-				xt_xlate_add(xl, icmp_codes[i].name);
++				xt_xlate_add(xl, "%s", icmp_codes[i].name);
+ 				return 1;
+ 			}
+ 	}
+-- 
+cgit v1.2.1
+
diff --git a/meta/recipes-extended/iptables/iptables_1.6.2.bb b/meta/recipes-extended/iptables/iptables_1.8.2.bb
similarity index 91%
rename from meta/recipes-extended/iptables/iptables_1.6.2.bb
rename to meta/recipes-extended/iptables/iptables_1.8.2.bb
index a57cac3..ad2c1a6 100644
--- a/meta/recipes-extended/iptables/iptables_1.6.2.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.2.bb
@@ -10,10 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263\
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
+           file://0003-extensions-format-security-fixes-in-libipt_icmp.patch  \
 "
 
-SRC_URI[md5sum] = "7d2b7847e4aa8832a18437b8a4c1873d"
-SRC_URI[sha256sum] = "55d02dfa46263343a401f297d44190f2a3e5113c8933946f094ed40237053733"
+SRC_URI[md5sum] = "944558e88ddcc3b9b0d9550070fa3599"
+SRC_URI[sha256sum] = "a3778b50ed1a3256f9ca975de82c2204e508001fc2471238c8c97f3d1c4c12af"
 
 inherit autotools pkgconfig
 
-- 
2.7.4


