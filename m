Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B43C43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 03:25:21 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.7191.1656473115291302416
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 20:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=hRwFJZBT;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656473113; i=@fujitsu.com;
	bh=JnDQyxPDHjT/D43oEt3AXrI52/qBTL31qJ9502VMYRg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=hRwFJZBTYtjj37TRxwylCSmUZMlN2XMzEljA9Ei7M7NwF2ncKcym02oF4IHNXcd2Q
	 UFCYIJib6OcbB8EL5PnCPLWG07iguA59jqH79E8X+VoXP0fL3a1SeykFOjcm3+RKET
	 DeW5bHxZZ/C/KQ7MGSFqWa4l/kKTQejYsa17rVTdSoUfsvk5YNwzTJdttZYOZBwbFH
	 maiGaJUjjWV6kwxt+Kq5cQGmBfbeEV3qXMxX7UEXbpo55JFdgtev2VEUm0jr5yoSAX
	 OXPkLjlthTt6CSUuijjjH0QsOpgQeXIlut33fv447qdghPnZWkhlVfZnOzffKQPV2H
	 //E8vGq/VoZ1w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEIsWRWlGSWpSXmKPExsViZ8MxSVfy2O4
  kg4uTOS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxrT6YyFpzmqrg4/zhbA+MBzi5GLg4hgceM
  EpOfb2PtYuQEcq4xSSw/qAeR2MMocfD/JDaQBJuAmsT0WzeAijg4RAT0JK7+EwUJMwuoSLz43
  cMOYgsLOEm0PdsENodFQFVi9qxTzCA2r4CjxKmNU1lAbAkBBYkpD98zg4zhBKrvahCHWOsosf
  rWcyaIckGJkzOfsECM15Ro3f6bHcKWl2jeOpsZYoyixOzLzVAjKyRmzNjGBmGrSVw9t4l5AqP
  QLCSjZiEZNQvJqAWMzKsYrZKKMtMzSnITM3N0DQ0MdA0NTXWNjXXNTfQSq3QT9VJLdctTi0t0
  jfQSy4v1UouL9Yorc5NzUvTyUks2MQIDPqVY0WsH46sVP/UOMUpyMCmJ8jpO250kxJeUn1KZk
  VicEV9UmpNafIhRhoNDSYI38ghQTrAoNT21Ii0zBxh9MGkJDh4lEd4ikDRvcUFibnFmOkTqFK
  Mxx7Ll1/Yyc8z82naAWYglLz8vVUqcdwJIqQBIaUZpHtwgWFK4xCgrJczLyMDAIMRTkFqUm1m
  CKv+KUZyDUUmYl/cw0BSezLwSuH2vgE5hAjrFb+IOkFNKEhFSUg1Mc+UnZvxQl+cQ3HBS6KLe
  wslx2rzZDxZ52Wt++zchcG3S87WPjtyudjq5rt7zmn98mXD0EclKWeWZz5fbuPoXmO8Muy2SE
  jVvtl9KvoALE5e367bAt4HcXz1PZHA+j+nN2Wb81szm9R9Ju6Jr89a4XFm6PKycqTv4kK9Ab6
  bW8YNSNcz3u2Z7r5PZulNH5a5MpbrnkQTuo46zWvZdz72y38eYY6/N+9MtHf7H8vq8jnz9Hv8
  v+cFDd8Wt8jf/Hu9+cMRvRaT1sdldNmE8Rbv6n3Z1na/h3WD7TiVRZd+Mvmu6b7e9Fi3va51h
  enPvgXl9gV/l2Zbcmpp+yavG8advueLq7nmRXE4PTK+z1e5XYinOSDTUYi4qTgQA0Gdu+4UDA
  AA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-571.messagelabs.com!1656473112!73101!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15966 invoked from network); 29 Jun 2022 03:25:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Jun 2022 03:25:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CA94F1000C2
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 04:25:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BDE5E1000E9
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 04:25:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 29 Jun 2022 04:25:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-babel: upgrade 2.10.1 -> 2.10.3
Date: Wed, 29 Jun 2022 11:24:04 +0800
Message-ID: <1656473046-4187-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656473046-4187-1-git-send-email-wangmy@fujitsu.com>
References: <1656473046-4187-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 03:25:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167361

Changelog
=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Fallback count=3D=E2=80=9Dother=E2=80=9D format in format_currency() (#872)

    Fix get_period_id() with dayPeriodRule across 0:00 (#871)

    Add support for b and B period symbols in time format (#869)

    chore(docs/typo): Fixes a minor typo in a function comment (#864)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-babel_2.10.1.bb =3D> python3-babel_2.10.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-babel_2.10.1.bb =3D> python3-babel_2.10.3.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.10.1.bb b/meta/recipes-devtools/python/python3-babel_2.10.3.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-babel_2.10.1.bb
rename to meta/recipes-devtools/python/python3-babel_2.10.3.bb
index d06eb2bf5c..7420bfc917 100644
--- a/meta/recipes-devtools/python/python3-babel_2.10.1.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.10.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://babel.edgewall.org/"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1b3f4650099e6d6a73e5a7fc8774ff18"
 
-SRC_URI[sha256sum] =3D "98aeaca086133efb3e1e2aad0396987490c8425929ddbcfe0550184fdc54cd13"
+SRC_URI[sha256sum] =3D "7614553711ee97490f732126dc077f8d0ae084ebc6a96e23db1482afabdb2c51"
 
 PYPI_PACKAGE =3D "Babel"
 
-- 
2.25.1


