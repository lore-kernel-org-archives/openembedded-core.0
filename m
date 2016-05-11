Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8D283766A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:30 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id gh9so4054697pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=cOluG/PsQfhJnAG83mmEwJ3F4sjYdhJ+65ma+SXHq0Y=;
	b=daKE42QbaqgzsDno8+JbbUAxhq6cHkyHfCnc7YMiYBti6HkAlX3y2HCnh3itNEBQCt
	V467wP3kHv/dZIMizVmCPeRjFmHoAAn+mIePILP254hgHzt6zLwZO1oQ6chaGYVB++W0
	lBSUTY8ARSdYHhg/NBLDcO/sl/1sjmFu1XpYiUxVepF06kIeikken7Iua50DGz3Sj4CO
	+f0+H1bNhUMgeKjb3zVoZfD0IqM3y2GNA/gsT8khI6PbeLJo3FAwU6NfVIzGpmvtCSO1
	AsM+iudmD8/pBgquHiO5Wyvj2zt3xBcTWYibuoSxsOjeFYzM+aAnBMDnx61QerUFDyxn
	U13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=cOluG/PsQfhJnAG83mmEwJ3F4sjYdhJ+65ma+SXHq0Y=;
	b=cANEH+oWmFXB3ekXEz1B7vRB+dd4EwRe1pPtQlNcE4zWVF70tMrsxLY8QUgGJXPLb6
	/8Dn6FvfawuUETOOkQEn1g+YxivFQP3IxVYN4hsg9Xm/1mmB0ZUXLM5tprakPgdqINhN
	E+ajOzwFyQcHs4gf24jW+CS+XUUNMV6FGr0mMXPxTjET7z3rs+Es8USmTngc6MT5DTmA
	+hFZiQ9mHMZcr/gq6hKt/0zN6+6Y/7RII16B2f6WUj0e8i5dCXW0RJcM1z0bOB+LPbsT
	fXwmeVIh3AAE+ECy6VWpy6MQQQFVnImllc9QKxnebYKf5NbqDdn6fRTIIDjwKGJE+WTJ
	KFSw==
X-Gm-Message-State: AOPr4FWc9a1UhUaYYNuGkErWxbE8YbzRRqL22UNngn1xcBqUYmG+uZsCiAQ6MyakyglYRQ==
X-Received: by 10.66.145.35 with SMTP id sr3mr6759522pab.82.1462988191206;
	Wed, 11 May 2016 10:36:31 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:44 -0700
Message-Id: <3a1b7688b9e49fa50e5c5cca9b0dbc356c7c924b.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 41/42] mpfr: Upgrade to 3.1.4
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
X-List-Received-Date: Wed, 11 May 2016 17:36:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/mpfr/{mpfr-3.1.3 => mpfr}/long-long-thumb.patch | 0
 meta/recipes-support/mpfr/{mpfr_3.1.3.bb => mpfr_3.1.4.bb}           | 5 ++---
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/mpfr/{mpfr-3.1.3 => mpfr}/long-long-thumb.patch (100%)
 rename meta/recipes-support/mpfr/{mpfr_3.1.3.bb => mpfr_3.1.4.bb} (75%)

diff --git a/meta/recipes-support/mpfr/mpfr-3.1.3/long-long-thumb.patch b/meta/recipes-support/mpfr/mpfr/long-long-thumb.patch
similarity index 100%
rename from meta/recipes-support/mpfr/mpfr-3.1.3/long-long-thumb.patch
rename to meta/recipes-support/mpfr/mpfr/long-long-thumb.patch
diff --git a/meta/recipes-support/mpfr/mpfr_3.1.3.bb b/meta/recipes-support/mpfr/mpfr_3.1.4.bb
similarity index 75%
rename from meta/recipes-support/mpfr/mpfr_3.1.3.bb
rename to meta/recipes-support/mpfr/mpfr_3.1.4.bb
index ee8a238..230a862 100644
--- a/meta/recipes-support/mpfr/mpfr_3.1.3.bb
+++ b/meta/recipes-support/mpfr/mpfr_3.1.4.bb
@@ -8,9 +8,8 @@ DEPENDS = "gmp"
 SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz \
            file://long-long-thumb.patch \
            "
-
-SRC_URI[md5sum] = "6969398cd2fbc56a6af570b5273c56a9"
-SRC_URI[sha256sum] = "6835a08bd992c8257641791e9a6a2b35b02336c8de26d0a8577953747e514a16"
+SRC_URI[md5sum] = "064b2c18185038e404a401b830d59be8"
+SRC_URI[sha256sum] = "761413b16d749c53e2bfd2b1dfaa3b027b0e793e404b90b5fbaeef60af6517f5"
 
 UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
 
-- 
2.8.2


