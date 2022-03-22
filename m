Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2375C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 10:30:55 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.8134.1647945054636661231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 03:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cSSOVhIx;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647945052; i=@fujitsu.com;
	bh=ZE78uClCaErMp4EF69100U0w6YInS5u9tQDvswRst7w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cSSOVhIxZC3MhRPQBL+QgojUuS8LaEHCj3lmEPQe0DzuXZsMGqR1zblr2d6J9yYv7
	 zflcEXAQtO5Zvt9qG9guW5iwbq5Q/MfL42X2J0IewdVhvcCHupfiEpbgJ6bYWKq8CN
	 3UkbipUHigaKASW2vbd/Rm+2OhHvsyrKGEjgeJOxAnloyw03+BtNF8nyZ+QW67Q2PS
	 nU7xYdMhMsgNVqtfNf+cFRW3Ix3U3n5lH1bFIu1zruZzxNzuVX3fpAaDnEVq1wXSv2
	 nKLAly50BbZ0w6Mal9DYIVOPQ03WD8Ugdsm4CXPl6DZmdyvCysYglFVRFK4gnqMnDg
	 aIYe8aTrk6cBA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8ORqBuz1DL
  JYN4uaYs7P9+xW9ybv4DNgcnj3MYVjB4dv68zBjBFsWbmJeVXJLBmLDv7hLVgCWfFoSUrGBsY
  b3J0MXJxCAlsYZRYs3YJI4SzgEni7NydUM4eRol7M1+xdjFycrAJqElMv3UDyObgEBHQk7j6T
  xQkzCwgL7F80x82EFtYwEvi8J6TjCA2i4CqxIPGQ8wgNq+Ao8SDzx/AbAkBBYkpD99DxQUlTs
  58wgIxR0Li4IsXUDWKErMvN7NA2BUSs2a1MUHYahJXz21insDIPwtJ+ywk7QsYmVYxWiYVZaZ
  nlOQmZuboGhoY6Boamuoa6xpa6CVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxi
  BIZpSjGz0A7G9X0/9Q4xSnIwKYnyvmm1TBLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwXt0MVBOs
  Cg1PbUiLTMHGDMwaQkOHiUR3oxuoDRvcUFibnFmOkTqFKOilDhv2hKghABIIqM0D64NFqeXGG
  WlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzrgKZwpOZVwI3/RXQYiagxfqsZiCLSxIRUlINTNw
  X/7x+/El8RaBe1kRVC9+bfYtsqnRK1qVvnc58T76uxfukcpIKy7pdWxZt+XR9ZUHtfk3FxWpb
  1Lg+3nvzsnuq1vSJe1vCuYvOLr+XvXNXw75lzdUNpeqhe0Rn2/6SsBPmNdo78/ZPe6uM6v4Yo
  Yd9/Tz5Ke/q4z8/Ppzexnv50p29J84k/eI++sdArpvx4EVGmd/fC8MMrtrfMVN6kpS6zL+bd/
  Mf3akFjBNZmU//emZ2u3fepc1uGVpvbqWGHbE50/x9D1/MlJ9LciNLH2x3fvkxeP+Zz+KtJhP
  2vs/c4XRYZs9KVobVe56++1zFZ7LyuEPhydPHbt3MVeGfxvuUpS05XbXp7bslOvFNCRVKLMUZ
  iYZazEXFiQDCRcH6TgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-587.messagelabs.com!1647945052!263101!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30733 invoked from network); 22 Mar 2022 10:30:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 10:30:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C3ACB100192;
	Tue, 22 Mar 2022 10:30:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9F8C0100185;
	Tue, 22 Mar 2022 10:30:51 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 10:30:37 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>
Subject: [OE-core] [PATCH] gsettings-desktop-schemas: upgrade 41.0 -> 42.0
Date: Tue, 22 Mar 2022 18:30:25 +0800
Message-ID: <1647945028-5097-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 10:30:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163537

From: Upgrade Helper <uh@not.set>

---
 ...esktop-schemas_41.0.bb => gsettings-desktop-schemas_42.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_41.0.bb => gsettings-desktop-schemas_42.0.bb} (85%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_41.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb
similarity index 85%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_41.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb
index 280e3c8b50..b8ae15c229 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_41.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb
@@ -13,4 +13,4 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext
 
-SRC_URI[archive.sha256sum] = "77289972e596d044583f0c056306d8f1dbd8adcf912910a50da0a663e65332ed"
+SRC_URI[archive.sha256sum] = "6686335a9ed623f7ae2276fefa50a410d4e71d4231880824714070cb317323d2"
-- 
2.25.1


