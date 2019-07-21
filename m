Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8F3F97EE16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:34 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id i189so16129964pfg.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=i9A6RUbeHqED5lyBs1vAj2pf4izOS3Je3QrlVMcF2JU=;
	b=q4NLqHgm1m003U0Z9bk0xAj/q8h/H+bm5IJDLDd62ilEL3Z86/zLf7qIR9rrvCw0NH
	PO9wnEPPAcbxDOUN2SyNKyHB2WLBR/c4vb7fwh1exR+N885FmYUYUnh84bmyW0mn5x7e
	q+dUWBlPq5C4hHEvmLjt0FvprwZTM1hTQKAhJF52KlT30QZ/cCpdjWHmveUzW6subQKH
	tb5yy/Ylnjt4TbZWsCZu8T0Ws1fmLqYRcFgyNS8+QSWkeiIDTpz1PF3jkWJ9rHwPC95+
	4iXZw6+J19WuHeAgRxm2p5XsHOA7rejcRs2wkuTXMUAiY5o5XRI4hMAECFQAx4opxq+p
	IpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=i9A6RUbeHqED5lyBs1vAj2pf4izOS3Je3QrlVMcF2JU=;
	b=GYjfT5bVlzLqkq37UMe2uEljB70x1BwOP/sc6mXZ8nXFRJ23sdNSO4lR86ZmdNObj2
	qC5vXd+H1+30XjVVWNVAZnDa+MXRO6fJdYuBBboql6fb0qySkAbi4MPQaGA2uHTOrqf0
	Ec6Y15v1QaHfSAJPvyd+TE0I6GLx8LLWxFy83+N+eRlDQ8ggKd/I12V3+pbLtHFQb4MW
	XFKX/I5fC8HfViWCMEW5sLTD/1THtI3HbD67qPWJmoXT6DPw2kD6kHGYXfqNoFGbnS4O
	vkQkABC0LWtS3M+Fbw2+NIklRAM+6Sp1BnEhOsLnhnpcbKLe0wNw1A8fXdQHRUCQ1eKY
	Vxpg==
X-Gm-Message-State: APjAAAUFCRtDVNTMTCKodHvjS2KvqRJtOSi8ZxvygfsHfIzP0g/Uvqp+
	nSXaJ4BCNisHUX95FYjEpTnbyy8f
X-Google-Smtp-Source: APXvYqxG1utzlu/dx8v2dXz38ZVUeIQB6gCCtRWeg0qnGTYMNak8GxSHHzVwjIORBj/CIwxon9CACQ==
X-Received: by 2002:a63:4823:: with SMTP id v35mr39416605pga.138.1563719135247;
	Sun, 21 Jul 2019 07:25:35 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:00 -0700
Message-Id: <8b5e68afc9767d8b6b966503e9353cadafae9bfb.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 11/30] cairo: fix CVE-2018-19876 CVE-2019-6461 CVE-2019-6462
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:34 -0000

From: Ross Burton <ross.burton@intel.com>

Source: OpenEmbedded.org
MR: 97538, 97543
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/cairo?h=warrior&id=078e4d5c2114d942806cd0d5ad501805a011e841
ChangeID: fa8bdd44ad8613bb0679a1f6d9d670c3b47a0677
Description:

CVE-2018-19876 is a backport from upstream.

CVE-2019-6461 and CVE-2019-6462 are patches taken from Clear Linux.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Dropped CVE-2018-19876, not affected]
Issue was introduced in 1.15.8 by:
commit 721b7ea0a785afaa04b6da63f970c3c57666fdfe

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-graphics/cairo/cairo/CVE-2019-6461.patch | 19 +++++++++++++++++++
 .../recipes-graphics/cairo/cairo/CVE-2019-6462.patch | 20 ++++++++++++++++++++
 meta/recipes-graphics/cairo/cairo_1.14.12.bb         |  2 ++
 3 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch

diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
new file mode 100644
index 0000000..5232cf7
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
@@ -0,0 +1,19 @@
+There is a potential infinite-loop in function _arc_error_normalized().
+
+CVE: CVE-2019-6461
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+index 390397bae..f9249dbeb 100644
+--- a/src/cairo-arc.c
++++ b/src/cairo-arc.c
+@@ -99,7 +99,7 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
+     do {
+ 	angle = M_PI / i++;
+ 	error = _arc_error_normalized (angle);
+-    } while (error > tolerance);
++    } while (error > tolerance && error > __DBL_EPSILON__);
+ 
+     return angle;
+ }
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
new file mode 100644
index 0000000..4e4598c
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
@@ -0,0 +1,20 @@
+There is an assertion in function _cairo_arc_in_direction().
+
+CVE: CVE-2019-6462
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+index 390397bae..1bde774a4 100644
+--- a/src/cairo-arc.c
++++ b/src/cairo-arc.c
+@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t	  *cr,
+     if (cairo_status (cr))
+         return;
+ 
+-    assert (angle_max >= angle_min);
++    if (angle_max < angle_min)
++       return;
+ 
+     if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
+ 	angle_max = fmod (angle_max - angle_min, 2 * M_PI);
diff --git a/meta/recipes-graphics/cairo/cairo_1.14.12.bb b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
index 18b9479..08026c4 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.12.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
@@ -25,6 +25,8 @@ DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \ 
            file://0001-cairo-Fix-CVE-2017-9814.patch \
+           file://CVE-2019-6461.patch \
+           file://CVE-2019-6462.patch \
           "
 
 SRC_URI[md5sum] = "9f0db9dbfca0966be8acd682e636d165"
-- 
2.7.4


