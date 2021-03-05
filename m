Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.12918.1614955640467390964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vgzPwGGP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id z7so1520690plk.7
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gP1Ex0RBSjVZ5Gv/1AMKqqsg257AX/xw4VgOF3agdxE=;
        b=vgzPwGGP2q1OAsHlMMQYxc/UQ5lKoO9ubzScBqg6UHO0WgNTZq+PP5vYz93QdEU3i/
         yU69bAasXrhBcToQjLZ9/Vk+ePBQHK3KR7Xzekpimg3jKyXluiXi2HZOIwIf1g3FpHwy
         lA9uLlVmLqIyZS3yfs2b6b0lMe90/ahNJcv+kyyAVevjSD7VMnQynUf5Z9DUz/FTL537
         D/nhVd2Fa148jCSvc0p17AEd1EfztyuaoZkG++YQGn+HkRKwooNTNk3dm1ZVJ3ioSTMo
         GF71ZHC8Ay0o6eGZ5BVgpr898UHDcGazDzKGTSDBG/MWz+7y5+slsmvChgNWXD4sgUkq
         cQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gP1Ex0RBSjVZ5Gv/1AMKqqsg257AX/xw4VgOF3agdxE=;
        b=gWLeGBK/qvumCo0SztKoebl5bj5W9GEpumc+N8usHcxn5jznkObPik3B1g2ezyDr6j
         /eP2YpZMg9mPdmzDfn86M10SzJ1n+RngqyIXukLO0qOwYCkKA6uS5T4v+d2Ytecbd5EW
         Grbcu9xlOvTLL03NU71WrAEKf+PHDt7UeoModrztxJ5PbUgPFhSeFG5Yh5iBX5EXTOdf
         K2Y2Io8neWPwLqnlFmMWpe9rVKiT7Lq0/pGDJ0Xb4V+KeY8Gx2dmEbEU1D614hkhWmnx
         OY4msXz7x1Vjd2GuJVr4b9UqIjO2VWr6OUmsb8XLYN5M5NxNjilmwgZBdA1ni0s9wNcO
         FD3A==
X-Gm-Message-State: AOAM531BV0/8h4E0iZ57EA5z4MfJB5S94W0wieb4vx/Di/tuwIk3jwnm
	eNVHWFGuO1silrLBWbR0x88TE/r5FLDlTl5i
X-Google-Smtp-Source: ABdhPJx0tFl0kSc6ET+3vqH8cDN8vfDibXgKUIFwQl/ung2xouG1LH3iJT0zHyadYeFH1lWJBZ3xIg==
X-Received: by 2002:a17:902:509:b029:e5:9944:f763 with SMTP id 9-20020a1709020509b02900e59944f763mr9268805plf.35.1614955639343;
        Fri, 05 Mar 2021 06:47:19 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.47.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:47:18 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/27] screen: fix CVE-2021-26937
Date: Fri,  5 Mar 2021 04:46:13 -1000
Message-Id: <1927fb88bf484fe90b37367c3c63db2b88185bcc.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Scott Murray <scott.murray@konsulko.com>

Apply patch from Debian to fix CVE-2021-26937.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d688cc8672b1830ba10966492ab3f8a12d32e17)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../screen/screen/CVE-2021-26937.patch        | 68 +++++++++++++++++++
 meta/recipes-extended/screen/screen_4.8.0.bb  |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2021-26937.patch

diff --git a/meta/recipes-extended/screen/screen/CVE-2021-26937.patch b/meta/recipes-extended/screen/screen/CVE-2021-26937.patch
new file mode 100644
index 0000000000..983b35c1b0
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/CVE-2021-26937.patch
@@ -0,0 +1,68 @@
+Description: [CVE-2021-26937] Fix out of bounds array access
+Author: Michael Schröder <mls@suse.de>
+Bug-Debian: https://bugs.debian.org/982435
+Bug: https://savannah.gnu.org/bugs/?60030
+Bug: https://lists.gnu.org/archive/html/screen-devel/2021-02/msg00000.html
+Bug-OSS-Security: https://www.openwall.com/lists/oss-security/2021/02/09/3
+Origin: https://lists.gnu.org/archive/html/screen-devel/2021-02/msg00010.html
+
+CVE: CVE-2021-26937
+Upstream-Status: Pending
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
+--- a/encoding.c
++++ b/encoding.c
+@@ -43,7 +43,7 @@
+ # ifdef UTF8
+ static int   recode_char __P((int, int, int));
+ static int   recode_char_to_encoding __P((int, int));
+-static void  comb_tofront __P((int, int));
++static void  comb_tofront __P((int));
+ #  ifdef DW_CHARS
+ static int   recode_char_dw __P((int, int *, int, int));
+ static int   recode_char_dw_to_encoding __P((int, int *, int));
+@@ -1263,6 +1263,8 @@
+     {0x30000, 0x3FFFD},
+   };
+ 
++  if (c >= 0xdf00 && c <= 0xdfff)
++    return 1;          /* dw combining sequence */
+   return ((bisearch(c, wide, sizeof(wide) / sizeof(struct interval) - 1)) ||
+           (cjkwidth &&
+            bisearch(c, ambiguous,
+@@ -1330,11 +1332,12 @@
+ }
+ 
+ static void
+-comb_tofront(root, i)
+-int root, i;
++comb_tofront(i)
++int i;
+ {
+   for (;;)
+     {
++      int root = i >= 0x700 ? 0x801 : 0x800;
+       debug1("bring to front: %x\n", i);
+       combchars[combchars[i]->prev]->next = combchars[i]->next;
+       combchars[combchars[i]->next]->prev = combchars[i]->prev;
+@@ -1396,9 +1399,9 @@
+     {
+       /* full, recycle old entry */
+       if (c1 >= 0xd800 && c1 < 0xe000)
+-        comb_tofront(root, c1 - 0xd800);
++        comb_tofront(c1 - 0xd800);
+       i = combchars[root]->prev;
+-      if (c1 == i + 0xd800)
++      if (i == 0x800 || i == 0x801 || c1 == i + 0xd800)
+ 	{
+ 	  /* completely full, can't recycle */
+ 	  debug("utf8_handle_comp: completely full!\n");
+@@ -1422,7 +1425,7 @@
+   mc->font  = (i >> 8) + 0xd8;
+   mc->fontx = 0;
+   debug3("combinig char %x %x -> %x\n", c1, c, i + 0xd800);
+-  comb_tofront(root, i);
++  comb_tofront(i);
+ }
+ 
+ #else /* !UTF8 */
diff --git a/meta/recipes-extended/screen/screen_4.8.0.bb b/meta/recipes-extended/screen/screen_4.8.0.bb
index 4772eb6c7a..fe640c262b 100644
--- a/meta/recipes-extended/screen/screen_4.8.0.bb
+++ b/meta/recipes-extended/screen/screen_4.8.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0002-comm.h-now-depends-on-term.h.patch \
            file://0001-fix-for-multijob-build.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
+           file://CVE-2021-26937.patch \
           "
 
 SRC_URI[md5sum] = "d276213d3acd10339cd37848b8c4ab1e"
-- 
2.25.1

