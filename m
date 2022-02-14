Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A96C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 14:28:49 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.34370.1644848927929061411
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 06:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Z12SHNNS;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644848926; i=@fujitsu.com;
	bh=8WcLeoEMspuJov3VaX+hFhwbnTAx9BjGgkdV7wzBMXA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Z12SHNNSAF4b2ows3Z+pfC7wJgP6XbSwcGyFFc7b9eRT3YXgQNFrKSMdauL0KhEae
	 jodl8qbB55kmoJaqD0RuYH+CUUJxZUixh5OpabtIsSReuImrGjpCL2nKyCybMz2pHj
	 inEOD2bg/yP39Q3r57j2bstpWCjj95pULPufd0BuyjpmtNR6BSPvmjixi6NztCZKsS
	 Ua/LAaSIdmcy5tf8GqeYOq9CvMkO0M9ZyvM7d0nmwsCOOWcAfZYmOJz/KUBw48ht0S
	 lzvLqb2+02kzZAX8+JR2z8BbfjL1OvqfuhfOrVPegSQgh1plPR06wYe9VEAYzoef9R
	 LzfPY+ZlH4Vdg==
Received: from [100.115.69.41] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 1F/A4-24566-E176A026; Mon, 14 Feb 2022 14:28:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MxSVc2nSv
  J4NJ3TYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePX0xlMBRP5Kp7ufMnawHiJp4uRi0NI4DGj
  xIn7x5khnPNMEouW3mCCcE4wSnTOngnkcHKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAtcTRPdtZQGwWAVWJ6TMfgMV5BRwlpm+6CTZGQkBBYsrD98wQcUGJkzOfsEDMkZA4+O
  IFM0SNosTsy80sEHaFxKxZbVC9ahJXz21insDIPwtJ+ywk7QsYmVYx2iUVZaZnlOQmZuboGho
  Y6BoamuqaWeoaWprqJVbpJuqlluomp+aVFCUCpfUSy4v1UouL9Yorc5NzUvTyUks2MQKDM6XY
  9fAOxt19P/UOMUpyMCmJ8nbbcyUJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDdkQKUEyxKTU+tS
  MvMAUYKTFqCg0dJhDc1FCjNW1yQmFucmQ6ROsWoKCXO+z4VKCEAksgozYNrg0XnJUZZKWFeRg
  YGBiGegtSi3MwSVPlXjOIcjErCvN9BpvBk5pXATX8FtJgJaHFaDxvI4pJEhJRUA5Oof1jECqm
  GlScW7nnNJXn6QSDTrOkNi1Z8W/H3uv189wl3Jz67OuHXoZnhG9b7BTb92+n6ty796FvOwui2
  yzGf7KXbJwfvPhvO2Brme0fxZJtvueJU+0I+Bo7ir4IBwkamegsvm+Vvl69hbrmhtbRc+YRy4
  rrF629WibmJxjwS/rrg3Ue7tivJJkIL5ji4d/fMPKr4SX5Fl9uc1084/6su4Nh83G/2uwenn+
  tc+35qs/7PBOW3YTdTP6unSUz82xGZrXyEV/XzcZ+A46UdoreOnlur1/HWb0lMpGHEvX0VBe7
  2uxVLP51rWD7JPjW+/zYfW/AOiSvpq+adeBI8a23epmxRu1OP1399sG/VlLviSizFGYmGWsxF
  xYkAJgZ1D0kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-532.messagelabs.com!1644848925!33097!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29609 invoked from network); 14 Feb 2022 14:28:45 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Feb 2022 14:28:45 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3CAE3100441
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 14:28:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3003C1000FD
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 14:28:45 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 14 Feb 2022 14:28:24 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] harfbuzz: upgrade 3.3.2 -> 3.4.0
Date: Mon, 14 Feb 2022 22:28:14 +0800
Message-ID: <1644848897-3369-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 14:28:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161709

Changelog:
=========
*Perform sanity checks on shaping results is now part of "harfbuzz" library
 and can be enabled by setting the buffer flag HB_BUFFER_FLAG_VERIFY.
*Arabic Mark Transient Reordering Algorithm have been updated to revision 6.
*ISO 15924 code for mathematical notation, 'Zmth', now maps to the OpenType
 'math' tag.
*It is now possible to get at once all math kerning values for a given glyph
 at a given corner.
*Fix locale_t portability issues on systems the typedef's it to a void pointer
*New API:
+HB_BUFFER_FLAG_VERIFY
+HB_OT_TAG_MATH_SCRIPT
+HB_SCRIPT_MATH
+hb_ot_math_kern_entry_t
+hb_ot_math_get_glyph_kernings

Deprecated API

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_3.3.2.bb => harfbuzz_3.4.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_3.3.2.bb => harfbuzz_3.4.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_3.3.2.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_3.3.2.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb
index 9eaa14c56f..e392aa3b33 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_3.3.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "1c13bca136c4f66658059853e2c1253f34c88f4b5c5aba6050aba7b5e0ce2503"
+SRC_URI[sha256sum] = "7158a87c4db82521fc506711f0c8864115f0292d95f7136c8812c11811cdf952"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.25.1


