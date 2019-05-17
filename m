Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id E2F737DF4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:12 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 198so7761031wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o3sCKKtz/+t6iFJ0IQIAF8v2yMK+HvFMk/qzF74oiFA=;
	b=qUr9cwD4mVVhWzaK/4G06AXC2Ic8luDdFehIe/dJkeaWn0UlIudeqUmK/JLnfHbnqi
	lghz/bOXFtbPCYx+xS4XVNdJ8Ml5/3eXbbAhMr6LVAlN+Ck+sNUG5LzAiwkP8b13dtlF
	nOo5dNrTRkSFyKW6INe8nFbUsX7exwRWsxqenweoZJqeB6sAteNYOssnqQ+QpSKD+cm/
	kz/rhcCXTn6myBb4YmfWEgE3jrgSZoKddVpWhDgo3b/02Ewszj5LmmlX2z3fpzUoXMzo
	t8OefTsa8MBm6VREFHYVrgklD9D5n3eNk27/sZXrv1v4qCC2b7+qxMH2EGoHOSZQMoGS
	nSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=o3sCKKtz/+t6iFJ0IQIAF8v2yMK+HvFMk/qzF74oiFA=;
	b=t6b9sUWuzcK7jC4yrVGqa4/pU1aQqQyBlJxRz9keYyi8TGKw0HMOS3xDyflB+DNQ/v
	ujtEyJ9Vn+ta3mZ/aBhD2/a1KU4bE6d7vFRYq2tUFiL8P5U81agpw4J8cVWW0m1gSMss
	B3EiSoTLb9m0fKTlaha8vTKD+6HTbpBHppNre8t9KWabE3O8IrCS2S6pw4AFDz13p/Hv
	VhCKNhicx77cABDZPGPoMNXBtd3H5smTewhYZ73bX83IG+1I1SQtSzKfdsBuRwu15mON
	FRJEbH0acnexRobrv11Am4X9k74UXJPQryxmutWVZKfltHBtTrK/dHrktAtP6rPI9SjT
	NMVg==
X-Gm-Message-State: APjAAAUtdDy+/piByjrgC7UOHVnGkoelDse894QhxUZSmUZS8PQ2+cKJ
	vJGSxm+k+5XLDDuy7gb9rhmQdBfe
X-Google-Smtp-Source: APXvYqybPwTnzC6y8VPZWuxSuK/d0UHr84eNbg0T6pWLW/GAEJ6Hry+NOzr/dByOMjFI+3fMtcPaGQ==
X-Received: by 2002:a1c:20c9:: with SMTP id g192mr31876831wmg.76.1558116733432;
	Fri, 17 May 2019 11:12:13 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:31 +0200
Message-Id: <20190517181151.44001-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 17/37] libpcre2: upgrade 10.32 -> 10.33
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
X-List-Received-Date: Fri, 17 May 2019 18:12:13 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{libpcre2_10.32.bb => libpcre2_10.33.bb}  | 46 +++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.32.bb => libpcre2_10.33.bb} (61%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.32.bb b/meta/recipes-support/libpcre/libpcre2_10.33.bb
similarity index 61%
rename from meta/recipes-support/libpcre/libpcre2_10.32.bb
rename to meta/recipes-support/libpcre/libpcre2_10.33.bb
index 3a0aa53029f..604f81a8f33 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.32.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.33.bb
@@ -1,3 +1,43 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENCE
+# +++ LICENCE
+# @@ -26,7 +26,7 @@
+#  University of Cambridge Computing Service,
+#  Cambridge, England.
+#  
+# -Copyright (c) 1997-2018 University of Cambridge
+# +Copyright (c) 1997-2019 University of Cambridge
+#  All rights reserved.
+#  
+#  
+# @@ -37,7 +37,7 @@
+#  Email local part: hzmester
+#  Email domain:     freemail.hu
+#  
+# -Copyright(c) 2010-2018 Zoltan Herczeg
+# +Copyright(c) 2010-2019 Zoltan Herczeg
+#  All rights reserved.
+#  
+#  
+# @@ -48,7 +48,7 @@
+#  Email local part: hzmester
+#  Email domain:     freemail.hu
+#  
+# -Copyright(c) 2009-2018 Zoltan Herczeg
+# +Copyright(c) 2009-2019 Zoltan Herczeg
+#  All rights reserved.
+#  
+#  
+# 
+#
+
 DESCRIPTION = "There are two major versions of the PCRE library. The \
 newest version is PCRE2, which is a re-working of the original PCRE \
 library to provide an entirely new API. The original, very widely \
@@ -8,14 +48,14 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
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


