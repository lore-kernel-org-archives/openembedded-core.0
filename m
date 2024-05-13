Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540BBC25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 12:03:39 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by mx.groups.io with SMTP id smtpd.web10.58222.1715601816242982132
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 05:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=xBG2d6mC;
 spf=pass (domain: protonmail.com, ip: 185.70.43.22, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1715601814; x=1715861014;
	bh=enRUQ1U+hMkFrQyG/OV3K8TuYs8s1VpAlfZnWlC0BTA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=xBG2d6mCkEpDsSlkGsouTzelXSkKsTSI1QxruDUjreo0810FnqWBee3MQH4/YpOnf
	 jT9r7AADKibKMiEVTw3cNEZD7Hm1OMg7nU6p74NC+dllLMrA8RPSzTABTmE++x6yq0
	 +uGrWr2ujeBX5PS7sG/bHijqK7TFjjuyjJXIjI8fQuQSJ0bW01Dwud5VVqufeiUQ4n
	 D+w00POVoE3h2OScaF/ZNYNj8+q3Ocuujrh9/f8FgSNJO5PJLeSfeRIMPqhG3m+vYG
	 Z0ZAk56un8fY79VODDsMl6RdXe193489q4+1ODjAWkKbgtQp6MK1/fx9DIrvPPHE+I
	 dlRnZ+e1nZ1Ew==
Date: Mon, 13 May 2024 12:03:26 +0000
To: openembedded-core@lists.openembedded.org
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: rasmus.villemoes@prevas.dk
Subject: [PATCH] gtk+3: add gtk+ to CVE_PRODUCT
Message-ID: <20240513120320.73922-1-emil.kronborg@protonmail.com>
Feedback-ID: 20949900:user:proton
X-Pm-Message-ID: 045db136e76b4c084919c9290a90cc2c6edde62d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 12:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199231

While the plus in GTK+ was dropped in GTK4 and onwards [1], it is still
necessary for GTK3. This is also reflected upstream where two versions
exist: http://ftp.gnome.org/pub/gnome/sources/gtk+ and
http://ftp.gnome.org/pub/gnome/sources/gtk.

[1]: https://mail.gnome.org/archives/gtk-devel-list/2019-February/msg00000.=
html

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
---
 meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.41.bb
index 17e90c59f0e0..350181330707 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb
@@ -14,4 +14,4 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0=
d91eb439ebec522ec2 \
                     file://gdk/gdk.h;endline=3D25;md5=3Dc920ce39dc88c6f06d=
3e7c50e08086f2 \
                     file://tests/testgtk.c;endline=3D25;md5=3Dcb732daee1d8=
2af7a2bf953cf3cf26f1"
=20
-CVE_PRODUCT =3D "gnome:gtk"
+CVE_PRODUCT =3D "gnome:gtk gtk:gtk\+"

base-commit: 3400945ac94c37f335b1e500bdd91e6187ed20b1
--=20
2.45.0



