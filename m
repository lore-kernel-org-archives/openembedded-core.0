Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F267C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 08:29:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.8747.1644308954502710789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 00:29:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=i8O2JjMN;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644308952; i=@fujitsu.com;
	bh=om3VsejwFmF5vmmgvPm+rcBQwMljQhSkVdj7XmfcBVs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=i8O2JjMNKSokj8p8+uNvF0hHCPS931Ysqw/in8Blt8Km/bdGem0+JK4osxy01lbub
	 mGwFqhKF+COJeyiha36P3L5/CaaFAVMxkJeIAwbCK2EaZ5eMCWignOs+8mw8pIp1TS
	 Sv8KnpmfM3IeBcJ2Y6QCE79rrTNBAVqPfCUEvB3V1UEupnECB4eidtTSRFpRvJSfL1
	 V/JvI9eq//lSqNCOnOwqCeL0Nw6+XLZN6KJRK2eg63Yxu/uLKEDToEmmtPCb7w0tyn
	 +6Rz4+6wgmQ7hQk+D8U7C6vEdkhOdpyatxvZjFdkrMOGu1rz9V6qCt4L2qtuxwyKaM
	 jk59j215NlzRg==
Received: from [100.115.33.130] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id BF/DE-29321-8D922026;
 Tue, 08 Feb 2022 08:29:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8ORqHtDkyn
  JYMVdbos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPlno3sBWeUKhYencXawPhepouRi0NI4DGj
  ROv566wQznkmie/3JjJCOMcZJb4ensvWxcjJwSagJjH91g2gKg4OEQE9iav/REHCzAIqEi9+9
  7CD2MIClhKP2+aDlbMAxX9fPQxm8wo4Suw/dZURxJYQUJCY8vA9M4jNKeAksfX7FRYQWwio5t
  OZFcwQ9YISJ2c+YYGYryrRfeQpE4QtL9G8dTYzxBxFidmXm1kg7AqJWbPamCBsNYmr5zYxT2A
  UmoVk1Cwko2YhGbWAkXkVo1VSUWZ6RkluYmaOrqGBga6hoamusbmuoaVeYpVuol5qqW55anGJ
  rpFeYnmxXmpxsV5xZW5yTopeXmrJJkZg0KcUqwrvYOxY+VPvEKMkB5OSKG+SKlOSEF9SfkplR
  mJxRnxRaU5q8SFGGQ4OJQneM+JAOcGi1PTUirTMHGAEwqQlOHiURHi/aQCleYsLEnOLM9MhUq
  cYFaXEeSeAJARAEhmleXBtsKi/xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9xzIFJ7MvBK
  46a+AFjMBLf666F8i0OKSRISUVAOT2b61wQ2hAYcbswNUjxhEPcp9p7c2ZWd0xK+ZoeK2GyUE
  Lr8KPWjVenwx9w3WGhNb+217p8vdnf5Wr4J9SfLZ13z+q51DTx3I/Zhl9VWQ9drMKzuCPmte2
  C8suURPQ37HhbK0/HcP5xo/yN3xQkjtQ8h99QN7H779+V807dXD4pKtCzScHC71qb85kmCtO8
  Pd6n8SU47mD6++DUWvgh1ars3cpn4puv4h5wOllz8jLxhZbeQ8wXm+tbNeh5Hz5N2yeoZl+e+
  nTfGPX+Jb6LeX0VnU4dKtI2t3bD9Uc/Hweheuqc8vnRCP1D5eMkU4PHO6mtPvR70ze9+lvzGd
  meZufmPlnHMJK4RvTbn1/1FnjBJLcUaioRZzUXEiALCdU4Z1AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1644308952!1557!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7794 invoked from network); 8 Feb 2022 08:29:12 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 08:29:12 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C5ED910019C
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:29:11 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B9F3210018E
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:29:11 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 08:28:52 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] screen: upgrade 4.8.0 -> 4.9.0
Date: Tue, 8 Feb 2022 16:28:42 +0800
Message-ID: <1644308922-5558-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644308922-5558-1-git-send-email-wangmy@fujitsu.com>
References: <1644308922-5558-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 08:29:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161484

CVE-2021-26937.patch
removed since it is included in 4.9.0

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Hardstatus option for used encoding (escape string '%e')
* OpenBSD uses native openpty() from its utils.h
* Fixes:
  - fix combining char handling that could lead to a segfault
  - CVE-2021-26937: possible denial of service via a crafted UTF-8 character sequence (bug #60030)
  - make screen exit code be 0 when checking --help
  - session names limit is 80 symbols (bug #61534)
  - option -X ignores specified user in multiuser env (bug #37437)
  - a lot of reformations/fixes/cleanups (man page and source code)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../screen/screen/CVE-2021-26937.patch        | 68 -------------------
 .../{screen_4.8.0.bb =3D> screen_4.9.0.bb}      |  4 +-
 2 files changed, 1 insertion(+), 71 deletions(-)
 delete mode 100644 meta/recipes-extended/screen/screen/CVE-2021-26937.patch
 rename meta/recipes-extended/screen/{screen_4.8.0.bb =3D> screen_4.9.0.bb} (91%)

diff --git a/meta/recipes-extended/screen/screen/CVE-2021-26937.patch b/meta/recipes-extended/screen/screen/CVE-2021-26937.patch
deleted file mode 100644
index 983b35c1b0..0000000000
--- a/meta/recipes-extended/screen/screen/CVE-2021-26937.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Description: [CVE-2021-26937] Fix out of bounds array access
-Author: Michael Schr=C3=B6der <mls@suse.de>
-Bug-Debian: https://bugs.debian.org/982435
-Bug: https://savannah.gnu.org/bugs/=3F60030
-Bug: https://lists.gnu.org/archive/html/screen-devel/2021-02/msg00000.html
-Bug-OSS-Security: https://www.openwall.com/lists/oss-security/2021/02/09/3
-Origin: https://lists.gnu.org/archive/html/screen-devel/2021-02/msg00010.html
-
-CVE: CVE-2021-26937
-Upstream-Status: Pending
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
-
---- a/encoding.c
-+++ b/encoding.c
-@@ -43,7 +43,7 @@
- # ifdef UTF8
- static int   recode_char __P((int, int, int));
- static int   recode_char_to_encoding __P((int, int));
--static void  comb_tofront __P((int, int));
-+static void  comb_tofront __P((int));
- #  ifdef DW_CHARS
- static int   recode_char_dw __P((int, int *, int, int));
- static int   recode_char_dw_to_encoding __P((int, int *, int));
-@@ -1263,6 +1263,8 @@
-     {0x30000, 0x3FFFD},
-   };
- 
-+  if (c >=3D 0xdf00 && c <=3D 0xdfff)
-+    return 1;          /* dw combining sequence */
-   return ((bisearch(c, wide, sizeof(wide) / sizeof(struct interval) - 1)) ||
-           (cjkwidth &&
-            bisearch(c, ambiguous,
-@@ -1330,11 +1332,12 @@
- }
- 
- static void
--comb_tofront(root, i)
--int root, i;
-+comb_tofront(i)
-+int i;
- {
-   for (;;)
-     {
-+      int root =3D i >=3D 0x700 =3F 0x801 : 0x800;
-       debug1("bring to front: %x\n", i);
-       combchars[combchars[i]->prev]->next =3D combchars[i]->next;
-       combchars[combchars[i]->next]->prev =3D combchars[i]->prev;
-@@ -1396,9 +1399,9 @@
-     {
-       /* full, recycle old entry */
-       if (c1 >=3D 0xd800 && c1 < 0xe000)
--        comb_tofront(root, c1 - 0xd800);
-+        comb_tofront(c1 - 0xd800);
-       i =3D combchars[root]->prev;
--      if (c1 =3D=3D i + 0xd800)
-+      if (i =3D=3D 0x800 || i =3D=3D 0x801 || c1 =3D=3D i + 0xd800)
- 	{
- 	  /* completely full, can't recycle */
- 	  debug("utf8_handle_comp: completely full!\n");
-@@ -1422,7 +1425,7 @@
-   mc->font  =3D (i >> 8) + 0xd8;
-   mc->fontx =3D 0;
-   debug3("combinig char %x %x -> %x\n", c1, c, i + 0xd800);
--  comb_tofront(root, i);
-+  comb_tofront(i);
- }
- 
- #else /* !UTF8 */
diff --git a/meta/recipes-extended/screen/screen_4.8.0.bb b/meta/recipes-extended/screen/screen_4.9.0.bb
similarity index 91%
rename from meta/recipes-extended/screen/screen_4.8.0.bb
rename to meta/recipes-extended/screen/screen_4.9.0.bb
index 6d307d5abc..1ed0961630 100644
--- a/meta/recipes-extended/screen/screen_4.8.0.bb
+++ b/meta/recipes-extended/screen/screen_4.9.0.bb
@@ -21,11 +21,9 @@ SRC_URI =3D "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0002-comm.h-now-depends-on-term.h.patch \
            file://0001-fix-for-multijob-build.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
-           file://CVE-2021-26937.patch \
           "
 
-SRC_URI[md5sum] =3D "d276213d3acd10339cd37848b8c4ab1e"
-SRC_URI[sha256sum] =3D "6e11b13d8489925fde25dfb0935bf6ed71f9eb47eff233a181e078fde5655aa1"
+SRC_URI[sha256sum] =3D "f9335281bb4d1538ed078df78a20c2f39d3af9a4e91c57d084271e0289c730f4"
 
 inherit autotools texinfo
 
-- 
2.25.1


