Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D835DC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 07:58:58 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web08.4668.1665475124886856067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 00:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=cU8UJxxK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665475123; i=@fujitsu.com;
	bh=DvlOx91Gq328BihR7irYCk2SR5WbD5JiUFURx1YjeiQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=cU8UJxxK5Nk4o0G7lSRGbGZaqgBqErjVj5BZaRHiV0BICIeBhuEEYY0izfuG1vsZ7
	 dIGklmkfCaDFExmB7cA3dhaNIWlhwd3aCpbT7QQhMkfz4nI448BoLFEHDzP5aR8/3V
	 eKfkfYwghXcvlZriAN8DaqnpNh1unQ0/zDCQH5CyRfpV9+B9ToPl3+TS1IIEvqNZ6c
	 3XZv+9XOES5HWQQ0ohidXUeNctscMjpwvYySvPkLDdGlPkGG6nhCqYfoJFUwPsEHc7
	 k8/mOW4H9sXrCUxexPA7dcEfwZU3WgSILsWx7b27g2apKv38i87rB1kxkR+XDl2/rd
	 Bp1u59j55zCgA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPIsWRWlGSWpSXmKPExsViZ8ORpGuk5Jp
  s8LHJ1OLOz3fsDowe5zauYAxgjGLNzEvKr0hgzWjc0M1c8Fay4m9vO3MD4z6xLkYuDiGBB4wS
  V2Y3MUM4l5kkZj7fA+XsYZS49K+fqYuRk4NNQE1i+q0brF2MHBwiAnoSV/+JgoSZBVQkXvzuY
  QexhQWsJfbNuc8CYrMIqEpsal0LFucVcJJoOLkTzJYQUJCY8vA9M4jNKeAscfpNO1hcCKimY9
  81Zoh6QYmTM5+wQMzXlGjd/psdwpaXaN46mxlijqLE7MvNLBB2hcSsWW1MELaaxNVzm5gnMAr
  NQjJqFpJRs5CMWsDIvIrRMqkoMz2jJDcxM0fX0MBA19DQVNdY18JML7FKN1EvtVS3PLW4RNdQ
  L7G8WC+1uFivuDI3OSdFLy+1ZBMjMORTipnDdjD+6f2pd4hRkoNJSZT36nOXZCG+pPyUyozE4
  oz4otKc1OJDjDIcHEoSvMflXZOFBItS01Mr0jJzgPEHk5bg4FES4e2RAkrzFhck5hZnpkOkTj
  Hac1y9cmUvM8fU2f/2M3MsB5Mzv7YdYBZiycvPS5US55VVBGoTAGnLKM2DGwpLF5cYZaWEeRk
  ZGBiEeApSi3IzS1DlXzGKczAqCfPmyQFN4cnMK4Hb/QroLCags05edQI5qyQRISXVwKTxbd7h
  WO07+10clZnec+i88nhWy8x2xP/KwkmS5UvVbiven7PwyCSx6T7sz892bnxx0E9D8uXWo2xnF
  xc9Wl/xLeO4kr+Kc6TU+/Ry79NbGyf8Kc502rS2jvWBw9lFvqFHF7O5a90J2HLKq0uaWa/t4b
  ZPrx62MNn+YFxr7KmsMtFU9ZdB46vuT893XNkxc2fF1XPi7zfU+ldVfGBOMgv7+jZN+pitqGd
  eqMqCRP5lu/6Vu5uJPF02sXFhZ835thUvf+nM0zcLfFG17dvr7NVJsvUpmc+mrq62f/VGNtR8
  +r1jUx7o6fpNjevadvbBjlLWD4IHEkWY/pk13y6pCQppW1PbI37HTLXlfbaBzgUlluKMREMt5
  qLiRAD1vWZlkgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-585.messagelabs.com!1665475122!90091!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31029 invoked from network); 11 Oct 2022 07:58:42 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 07:58:42 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 78ADC1AC
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 08:58:42 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 6D9CC1AB
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 08:58:42 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 08:58:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] harfbuzz: upgrade 5.1.0 -> 5.3.0
Date: Tue, 11 Oct 2022 15:58:12 +0800
Message-ID: <1665475094-16329-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665475094-16329-1-git-send-email-wangmy@fujitsu.com>
References: <1665475094-16329-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 07:58:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171597

0001-fix-signedness-of-char-in-tests.patch
removed since it's included in new version.

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 Don=E2=80=99t add glyphs from dropped MATH or COLR tables to the subset glyphs.
 Map rlig to appropriate AAT feature selectors.
 Update USE data files to latest version.
 Check CBDT extents first before outline tables, to help with fonts that also include an empty glyf table.
 More work towards variable font instancing in the subsetter.
 Subsetter repacker improvements.
 New API:
  +hb_ot_layout_lookup_get_optical_bound()
  +hb_face_builder_sort_tables()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...0001-fix-signedness-of-char-in-tests.patch | 27 -------------------
 .../{harfbuzz_5.1.0.bb =3D> harfbuzz_5.3.0.bb}  |  6 ++---
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-fix-signedness-of-char-in-tests.patch
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_5.1.0.bb =3D> harfbuzz_5.3.0.bb} (91%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-fix-signedness-of-char-in-tests.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-fix-signedness-of-char-in-tests.patch
deleted file mode 100644
index 029ca2bfff..0000000000
--- a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-fix-signedness-of-char-in-tests.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 1bd3884bc0544ffbb6545ed2391f0932bb8d7d91 Mon Sep 17 00:00:00 2001
-From: psykose <alice@ayaya.dev>
-Date: Mon, 1 Aug 2022 07:45:25 +0000
-Subject: [PATCH] fix signedness of char in tests
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/test-repacker.cc | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/test-repacker.cc b/src/test-repacker.cc
-index 053c0c6..1b7e1f0 100644
---- a/src/test-repacker.cc
-+++ b/src/test-repacker.cc
-@@ -112,9 +112,9 @@ static void start_lookup (int8_t type,
-                           hb_serialize_context_t* c)
- {
-   char lookup[] =3D {
--    0, type, // type
-+    0, (char)type, // type
-     0, 0, // flag
--    0, num_subtables, // num subtables
-+    0, (char)num_subtables, // num subtables
-   };
- 
-   start_object (lookup, 6, c);
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.0.bb
similarity index 91%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_5.3.0.bb
index 4905e8e2ad..1c21610fb5 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.0.bb
@@ -8,10 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6ee0f16281694fb6aa689cca1e0fb3da \
                     file://src/hb-ucd.cc;beginline=3D1;endline=3D15;md5=3D29d4dcb6410429195df67efe3382d8bc \
                     "
 
-SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
-           file://0001-fix-signedness-of-char-in-tests.patch \
-           "
-SRC_URI[sha256sum] =3D "2edb95db668781aaa8d60959d21be2ff80085f31b12053cdd660d9a50ce84f05"
+SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "a05e19e3f52da24ed071522f0fddf872157d7d25e869cfd156cd6f1e81c42152"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
-- 
2.25.1


