Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64F8CCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:27:44 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.31207.1654518455852727827
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=Htma1dYP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518453; i=@fujitsu.com;
	bh=4kL4IIf2EdpFLXGjllTrW4m9DLIPZsgJAq31RemLTDY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=Htma1dYPnHFtriC28QlBW0Dn4sq60X2puGKS7lpVDQEqCoBD2ipD/P8GQSTR4TGiu
	 Jp2LUIYMDx98FyK/e8PJN8YxsGnmea9ylwOEsAXC6cOD0xHLm2WmMf/TQsO5idFtVZ
	 UzVEuysO4Lo5xVOYwxtyJDqCT0Urpd0ipZqryR1N/hSX/hjsmcMudmaOYJgqv2UWtF
	 IZji4Eqo/UVzzyUv9eB/3BLb+uLWg1C967kyjCly1f+JUlIzadXWE1JQ0bpBKrf28l
	 x8P2dOWk3+MyEkltTexle1sN6suis4vFlBuBXKt7x8mffybIFOUmlQdPEA50xKlnOB
	 c1bPP1klkPjlw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRWlGSWpSXmKPExsViZ8ORpLv109w
  kgyXdUhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8anl+sZC2YLVfQcnMrawHiav4uRi0NI4CGj
  xJRvt1khnLNMEvcaG9kgnN2MErsb5zB3MXJysAmoSUy/dQOoioNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAmcTDE/NZQGwWoPicg1PAWnkFHCUu/eoHi0sIKEhMefgeLM4p4CTxed1VVhBbCKimad
  JVJoh6QYmTM5+wQMzXlGjd/psdwpaXaN46mxlijqLE7MvNUDMrJGbM2MYGYatJXD23iXkCo9A
  sJKNmIRk1C8moBYzMqxhtkooy0zNKchMzc3QNDQx0DQ1NgbSxroWJXmKVbqJeaqluXn5RSYau
  oV5iebFeanGxXnFlbnJOil5easkmRmDgpxSnh+xgPLPvl94hRkkOJiVRXvtrc5OE+JLyUyozE
  osz4otKc1KLDzHKcHAoSfDWfQDKCRalpqdWpGXmAKMQJi3BwaMkwmv9DijNW1yQmFucmQ6ROs
  WoyzHza9sBZiGWvPy8VClx3uMgMwRAijJK8+BGwBLCJUZZKWFeRgYGBiGegtSi3MwSVPlXjOI
  cjErCvA9ApvBk5pXAbXoFdAQT0BE+D+aAHFGSiJCSamCSbT30ZtoBYcW50oc/Tu/3LzgS5mph
  0O0aZO0dLXWA8+Uhgc2HzjZ/OxK1bKlGef2bKs1nASvj5ksWtYr9lJ/7dH/Vtx9v+CtO2B/N+
  x3Oa5b9ONf2X2LjnIMdvNZLqp6+X7ZCj++LkUJP6QLxb6wCKvGfBPfeYTvPd2qJ96odcjLvOu
  cdPr/y5NSujKDgF+FTwq1keG6FSSoff71M0edu8TmLPI8JVT/5eXasqXs58eGjYv01ZmUSUx/
  Lihm0r/Z5anN61SsGXfugJ6t4p9Zsk1rJxfBgnvscu61MbxJvMaz9wbVH/0xyqlXUdIn1FQ9i
  84y0z8/f55A9rWbtoeKFr1wvhn7gtzXamVk4fckHJZbijERDLeai4kQA15fOroMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-745.messagelabs.com!1654518453!629146!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24090 invoked from network); 6 Jun 2022 12:27:33 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-16.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:27:33 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D48EB8B65
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:27:32 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B5D028B7D
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:27:32 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:27:28 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] kbd: upgrade 2.4.0 -> 2.5.0
Date: Mon, 6 Jun 2022 20:27:11 +0800
Message-ID: <1654518434-9263-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654518434-9263-1-git-send-email-wangmy@fujitsu.com>
References: <1654518434-9263-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:27:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166622

License-Update: Remove extra spaces.

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D
libkfont:
---------
    Make libkfont public library.
    Add kfont_free().
    Initialize kfont_context->options.
    =D0=A2ake the verbose parameter into account when logging messages.

libkeymap:
---------
    Better error message on unsupported unicode value.

setvtrgb:
--------
    Add hexadecimal file support.

keymaps:
-------
    fa.map: drop high codepoint character that chokes loadkeys.
    i386/neo/3l.map: Add 3l keymap.
    i386/neo: use Delete instead of Backspace.
    i386/qwerty/ie.map: Add Irish keyboard map.
    i386/qwerty/it.map: Add braces to IT keyboard map.
    pine/en.map: Keymap for PinePhone keyboard.
    pt-latin1.map: Add Euro at Portuguese keyboards.

docs:
------
    Fix typos.

po:
-------
    Update translations (from translationproject.org).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/kbd/{kbd_2.4.0.bb =3D> kbd_2.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/kbd/{kbd_2.4.0.bb =3D> kbd_2.5.0.bb} (90%)

diff --git a/meta/recipes-core/kbd/kbd_2.4.0.bb b/meta/recipes-core/kbd/kbd_2.5.0.bb
similarity index 90%
rename from meta/recipes-core/kbd/kbd_2.4.0.bb
rename to meta/recipes-core/kbd/kbd_2.5.0.bb
index 4b23f1a89d..c0317a5d84 100644
--- a/meta/recipes-core/kbd/kbd_2.4.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.kbd-project.org/"
 DESCRIPTION =3D "The kbd project contains tools for managing Linux console (Linux console, virtual terminals, keyboard, etc.) =E2=80=93 mainly, what they do is loading console fonts and keyboard maps."
 # everything minus console-fonts is GPL-2.0-or-later
 LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D892f569a555ba9c07a568a7c0c4fa63a"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit autotools gettext pkgconfig
 
@@ -16,7 +16,7 @@ RCONFLICTS:${PN} =3D "console-tools"
 SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            "
 
-SRC_URI[sha256sum] =3D "55f0740458cfd3a84e775e50d7e8b92dc01846db1edad8e2411ccc293ece9b9f"
+SRC_URI[sha256sum] =3D "ad95964a4dede55f9239dd63b455fa4498cf3db3a0075ccd1d65a9f0e622a0fd"
 
 PACKAGECONFIG =3F=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                   "
-- 
2.25.1


