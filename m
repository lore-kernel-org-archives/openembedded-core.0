Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4734C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 04:20:18 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.20729.1656562811298897585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 21:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=Uvm8l1gE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656562809; i=@fujitsu.com;
	bh=lY3lPhOes8TOHhAYB4wyauuf9stkLzGumkRNni6LwJs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=Uvm8l1gEfVWxHbdiTitoMj+sFCMNL7fhitZHNy09yJbRB1FbjcLLNw6rk83k+EDJi
	 6tkL+PhYHDmBk+gJ88TtLiKVBfKS+PEZXVDjP+kVbNbk7xnp8SX6ZnDn6HRQVId9Xu
	 1ZGtTJL652VX+cHc9da3kAXurzv4XZblUartaVj48C8f2Xn4AQVoMXmvfQ4XW2XWK7
	 DHsBqppefnY6JvJjbPz+3HF6ROf71yrHh7eNJZeSmDiP0Z039rVg+lji5JvR7iRfBH
	 IcyUlMEGU6E4soKOAGQ6GnsxwqomK2jLE0pnU54FCy1jUgahplBgA/03ftMtEiilsE
	 RrX893ts+Y1Bg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBIsWRWlGSWpSXmKPExsViZ8MxSbdSZW+
  SweaJbBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bbz5XsBbOFKo7cn8LewNgl0MXIxSEk8JhR
  4tDKyWxdjJxAzjUmiRVzFCDsPYwSt/dHgNhsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3D
  zuILSxgLbGsDWIMi4CqxNe5z1lBbF4BJ4m/f+aCxSUEFCSmPHzPDGJzCjhLPL01mx1ilZPE5Y
  mvGSHqBSVOznzCAjFfU6J1+292CFteonnrbGaIOYoSsy83s0DYFRIzZmyDmq8mcfXcJuYJjEK
  zkIyahWTULCSjFjAyr2K0SirKTM8oyU3MzNE1NDDQNTQ01TXWNbS01Eus0k3USy3VLU8tLtE1
  1EssL9ZLLS7WK67MTc5J0ctLLdnECAz4lGLm4zsYp/T91DvEKMnBpCTKa8i+N0mILyk/pTIjs
  Tgjvqg0J7X4EKMMB4eSBO9xJaCcYFFqempFWmYOMPpg0hIcPEoivKEgad7igsTc4sx0iNQpRk
  uOqbP/7WfmWA4mZ35tO8AsxJKXn5cqJc5boQzUIADSkFGaBzcOliAuMcpKCfMyMjAwCPEUpBb
  lZpagyr9iFOdgVBLm1QZZy5OZVwK39RXQQUxAB+2ctgfkoJJEhJRUA9NysZ6fbN6HuXyPqtcX
  fX4/P/LM/Y0cvtpRm9O3OR/u3MKwYvaWC453Hsz9d3qx0hN2LT3bPcdXFbIcbL+tFHHjxb3Fq
  1TaNp2KtveZIrLFe6VD9sRvscG3H22/Y64ymdvS/zlHz7KuyMwVBk5N7hffmC4KyJb6denrhH
  dlTdy1Pz2nZ8Qkr38tO3PdhgO6pew3w+axTXvPYL5YdcXPQo6q52vc0qRa3USmuupNXtMa/2p
  2WcaX0Iu36yLt72il+JsdSOW8qmW2WbGiIzei8vvb89ZB5b530n/Oce/ZE7hlQffdGO97E071
  y3Q8K1CtNfsvbvpi2uYXG917FP+nVZj0Lppma2ToOUNr3fvrhnpKLMUZiYZazEXFiQATAbE2i
  wMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-587.messagelabs.com!1656562808!82849!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 320 invoked from network); 30 Jun 2022 04:20:09 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 04:20:09 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A6B9C1000C0
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:20:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9A572100078
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:20:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 05:20:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] harfbuzz: upgrade 4.3.0 -> 4.4.0
Date: Thu, 30 Jun 2022 12:19:33 +0800
Message-ID: <1656562773-11393-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656562773-11393-1-git-send-email-wangmy@fujitsu.com>
References: <1656562773-11393-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 04:20:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167395

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Caching of variable fonts shaping, in particular when using HarfBuzz=E2=80=99s own
  font loading functions (ot). Bringing performance of variable shaping in par
  with non-variable fonts shaping.
- Caching of format 2 =E2=80=9CContextual Substitution=E2=80=9D and =E2=80=9CChained Contexts
  Substitution=E2=80=9D lookups. Resulting in up to 20% speedup of lookup-heavy fonts
  like Gulzar or Noto Nastaliq Urdu.
- Improved ANSI output from hb-view.
- Support for shaping legacy, pre-OpenType, Windows 3.1-era, Arabic fonts
  that relied on a fixed PUA encoding.
- Sinhala script is now shaped by the USE shaper instead of =E2=80=9Cindic=E2=80=9D one.
- Thai shaper improvements.
- hb-ot-name API supports approximate BCP-47 language matching, for example
  asking for =E2=80=9Cen_US=E2=80=9D in a font that has only =E2=80=9Cen=E2=80=9D names will return them.
- Optimized TrueType glyph shape loading.
- Fix subsetting of HarfBuzz faces created via hb_face_create_for_tables().
- Add 32 bit var store support to the subsetter.
- New API
 +HB_BUFFER_FLAG_DEFINED
 +HB_BUFFER_SERIALIZE_FLAG_DEFINED
 +hb_font_changed()
 +hb_font_get_serial()
 +hb_ft_hb_font_changed()
 +hb_set_hash()
 +hb_map_copy()
 +hb_map_hash()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_4.3.0.bb =3D> harfbuzz_4.4.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_4.3.0.bb =3D> harfbuzz_4.4.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.3.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_4.3.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_4.4.0.bb
index 909b8c57d9..007e278464 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.3.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.0.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX =3D "harfbuzz-(=3FP<pver>\d+(\.\d+)+).tar"
 
 SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "a49628f4c4c8e6d8df95ef44935a93446cf2e46366915b0e3ca30df21fffb530"
+SRC_URI[sha256sum] =3D "02035eddb9d84112834abd1654ce0e177d14f41fd8ce0c29d5b4376888890790"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.25.1


