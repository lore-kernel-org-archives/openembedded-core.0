Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B606C77B7D
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 01:10:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8432.1684199455716325710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 18:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2FFC040BE6
	for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 01:10:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3xOuX34_1lk
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2023 01:10:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 219BE40C2A
	for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 01:10:54 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6FAE51638C7;
	Mon, 15 May 2023 21:10:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 1/2] grep: upgrade 3.10 -> 3.11
Date: Tue, 16 May 2023 01:10:43 +0000
Message-Id: <20230516011044.4462-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 01:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181397

This is to announce grep-3.11, a stable release.

This release makes PCRE patterns like [\d] work again, at the expense of
reverting to the behavior of grep 3.8, in that patterns like \w and \b go
back to using ASCII rather than Unicode interpretations.  However, if you
build grep using pcre2 newer than 10.42, then \w and \b do work properly.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-extended/grep/{grep_3.10.bb =3D> grep_3.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/grep/{grep_3.10.bb =3D> grep_3.11.bb} (94%)

diff --git a/meta/recipes-extended/grep/grep_3.10.bb b/meta/recipes-exten=
ded/grep/grep_3.11.bb
similarity index 94%
rename from meta/recipes-extended/grep/grep_3.10.bb
rename to meta/recipes-extended/grep/grep_3.11.bb
index 33fd64d27e..cb3105de04 100644
--- a/meta/recipes-extended/grep/grep_3.10.bb
+++ b/meta/recipes-extended/grep/grep_3.11.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af=
26da5dc08a4e440464"
=20
 SRC_URI =3D "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "24efa5b595fb5a7100879b51b8868a0bb87a71c183d02c4c=
602633b88af6855b"
+SRC_URI[sha256sum] =3D "1db2aedde89d0dea42b16d9528f894c8d15dae4e190b59ae=
cc78f5a951276eab"
=20
 inherit autotools gettext texinfo pkgconfig
=20
--=20
2.25.1


