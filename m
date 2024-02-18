Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A18C48BC4
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 18:43:24 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.23850.1708281795108374682
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 10:43:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=DByE7Y2d;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 42209240104
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 19:43:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708281793; bh=G/1GvQql2N8StuxMeju+QCyaBHv0BSGLDnsw60OQD5c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=DByE7Y2ddP/VswjIz8o6O2Kcbum8d3krwmw4MxZp1MbqLbSxtUaVe1LURi+inTzqN
	 Z7wK4gmXGBCXfvkEUiG2ZgCoyASGw+h4ZDBauLfepkyYsk4v9BO6uOpHT5wy/vobSO
	 5V3s1CqmzMnHPViQKu41q1q4rnZvkdjjDkMPnrLf3agD7c75vtZ/W3/RpCkHJ42uTb
	 AfZCdGnqtQPvkeZb+nuN14qhtbSw+MClyAinn323gaHCrFPpjhOApJHaQUtivbJ2Lr
	 wLugaSuwASVz6h/BNR1tRsvAkTA0JZ+Rhdz5gxcRyJKjtTE4+gvRvtua6UVprQ1297
	 gBb88MwUV17FA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TdF0w2wprz6tyZ;
	Sun, 18 Feb 2024 19:43:12 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH v2] qemu: Set CVE_STATUS for wrong CVEs
Date: Sun, 18 Feb 2024 18:42:59 +0000
Message-Id: <20240218184259.2930941-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 18:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195845

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

All are already fixed in 8.2.1, NVD was informed that cpes are wrong.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 5d953e5ef5..d16d5e76c8 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -68,6 +68,12 @@ CVE_STATUS[CVE-2023-0664] =3D "not-applicable-platform=
: Issue only applies on Wind
 # As per https://bugzilla.redhat.com/show_bug.cgi?id=3D2203387
 CVE_STATUS[CVE-2023-2680] =3D "not-applicable-platform: RHEL specific is=
sue."
=20
+CVE_STATUS[CVE-2023-3019] =3D "cpe-incorrect: Applies only against versi=
ons before 8.2.0"
+
+CVE_STATUS[CVE-2023-5088] =3D "cpe-incorrect: Applies only against versi=
on 8.2.0 and earlier"
+
+CVE_STATUS[CVE-2023-6693] =3D "cpe-incorrect: Applies only against versi=
on 8.2.0 and earlier"
+
 COMPATIBLE_HOST:mipsarchn32 =3D "null"
 COMPATIBLE_HOST:mipsarchn64 =3D "null"
 COMPATIBLE_HOST:riscv32 =3D "null"
--=20
2.39.2


