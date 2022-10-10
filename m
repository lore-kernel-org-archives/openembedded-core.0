Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4B4C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:43:33 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.4010.1665391409468161454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=C/3eYfcD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391407; i=@fujitsu.com;
	bh=jnwLvCIdBAaoEN7jbuE22dkLL41FHhZV0e2eU+fscqI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=C/3eYfcDI25qLA7X9i591TLgpXel/+abCP7b1Fq30AZRnKotkHs0uz6wzQf9g1QpQ
	 uNQFe4HCOUti0eGvQEoPfeC7lz+Tfp9QXqLr/9pmD/g75fnJMoDdv8eYEMMueb+ejj
	 k30IhUpz197Xo73cXyVmVxeYHUzsnLNAQLsOMJ3xrftoiCbmWulI1S1ABl15A32Z+y
	 UFQf5WUeKypskoir7kstGFsLMAaVbQr/YATwhX5N3vv4UI4jNlI81+1+aHTeSZvdHB
	 Zy40PcxkFPuoBhdmo5YYc+uJlAwh3euHDNbKau9LotolB/UgpyJJtZSkrQ2ES+vlq3
	 8Um65MFgPVqSw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8MxSVfvtnO
  ywestJhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b+2QdZC77xVExpXM7SwDiBu4uRi0NI4DGj
  xIrui6wQzjUmiSO7lgA5nEDOHkaJ7avTQGw2ATWJ6bduAMU5OEQE9CSu/hMFCTMLqEi8+N3DD
  mILC1hK7Nv3jx2khEVAVaL3ijtImFfAUeLi1ylsILaEgILElIfvmSHighInZz5hgRgjIXHwxQ
  tmiBpFidmXm1kg7AqJWbPamCBsNYmr5zYxT2Dkn4WkfRaS9gWMTKsYLZOKMtMzSnITM3N0DQ0
  MdA0NTXWNdQ0t9BKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS9PJSSzYxAsMxpZhZaAfj
  +r6feocYJTmYlER5DQ45JwvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4H1yAygnWJSanlqRlpkDj
  A2YtAQHj5II74OLQGne4oLE3OLMdIjUKUZdjplf2w4wC7Hk5eelSonz1t0CKhIAKcoozYMbAY
  vTS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEef/fBJrCk5lXArfpFdARTEBHnLzqBHJESSJ
  CSqqBqWDHghtVYYdXZds+0a5gn/9w7ysxs6bouULn9izQqps2/eitsHXa888c1FXoFF8d0CJ3
  W8Q9g12cM1qUWYmrU3OWwa9rwlx6HodbyniOqUbI9YUWXzu1geFbjSzrmhr2v9wza0WzrG3tz
  Y9drbB9HC0V/E+1aFGDa9xPztUTBC/78jSxTNCO9XqdPfHw8q9OytOVWkuOWC+et6Zg3572u+
  2mbdM/ST3QP2La9COWUzx2Ds+rDR7nruxzyNhQ/uD3hEVFS/SXiVe4HEzZ6771NNt0QfcvjGm
  SlyQY4l/8ODrJ7JLNE15+n1euK99JirkdOtQiqLtB1b7ASWHD5b66iKNfDOOl0n4IlfCkiM1V
  YinOSDTUYi4qTgQARAvcck4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-591.messagelabs.com!1665391406!300497!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18684 invoked from network); 10 Oct 2022 08:43:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:43:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7917F1000F5
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:43:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 699B0100078
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:43:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:43:24 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dbus: upgrade 1.14.0 -> 1.14.4
Date: Mon, 10 Oct 2022 16:43:09 +0800
Message-ID: <1665391393-8101-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 08:43:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171563

License-Update: D-Bus changed to dbus.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/dbus/{dbus_1.14.0.bb => dbus_1.14.4.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-core/dbus/{dbus_1.14.0.bb => dbus_1.14.4.bb} (96%)

diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.4.bb
similarity index 96%
rename from meta/recipes-core/dbus/dbus_1.14.0.bb
rename to meta/recipes-core/dbus/dbus_1.14.4.bb
index 0046b9fda2..cf7f830f16 100644
--- a/meta/recipes-core/dbus/dbus_1.14.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.4.bb
@@ -6,8 +6,9 @@ SECTION = "base"
 inherit autotools pkgconfig gettext upstream-version-is-even ptest-gnome
 
 LICENSE = "AFL-2.1 | GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
-                    file://dbus/dbus.h;beginline=6;endline=20;md5=866739837ccd835350af94dccd6457d8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6423dcd74d7be9715b0db247fd889da3 \
+                    file://dbus/dbus.h;beginline=6;endline=20;md5=866739837ccd835350af94dccd6457d8 \
+                    "
 
 SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://run-ptest \
@@ -15,7 +16,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://dbus-1.init \
 "
 
-SRC_URI[sha256sum] = "ccd7cce37596e0a19558fd6648d1272ab43f011d80c8635aea8fd0bad58aebd4"
+SRC_URI[sha256sum] = "7c0f9b8e5ec0ff2479383e62c0084a3a29af99edf1514e9f659b81b30d4e353e"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
-- 
2.25.1


