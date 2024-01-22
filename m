Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B7EC47DD9
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 16:19:02 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.78536.1705940339965064026
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 08:19:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=Gr4pr/bu;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id B4EA1240103
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 17:18:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1705940337; bh=ZdQCh/1FbBU10EFUkiwANMxoW3G6aO5nd8Za2f6gi5I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=Gr4pr/buK9t4uZXk1AgEumSbqSePFyU55OqM5wKmHtHET2QgX08U1Iz+oAKneant+
	 L6OZdmjjb2gD/UwBRoVCBI2l19Fx3SeRwNy1likhi0l4TZeSbCgisqItz8M9Sq54lZ
	 EIusfoCtKUiT4fhCn1GJbj6sKKRHI/R0dsLkkAXojaYFZ9pVH5vQd7xRz9Ht4ryhMJ
	 tGKi9og8p/RQZ53Wnk6mdtOcY9O6cLDA6H9fSwcFcbjOUaps2RJ4Sb7/RP3kHVxJEv
	 0qP5rnw0cVC4SJwrQj4HH+lwfKgdVDVLjpQr+s7UzN20BzY0W+SQ1LgtfJtsYkjzjx
	 NMdK/+ah4toAw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TJb4w4X2tz9rxK;
	Mon, 22 Jan 2024 17:18:56 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH v2] gcc: Upgidate status of CVE-2023-4039
Date: Mon, 22 Jan 2024 16:18:42 +0000
Message-Id: <20240122161842.8557-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 16:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194182

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

This is fixed via a patch added in gcc-13.2.inc already, but still
reported e.g. for libgcc as it is not defining an own source but use the
shared gcc-source.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-devtools/gcc/libgcc-initial_13.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb b/meta/reci=
pes-devtools/gcc/libgcc-initial_13.2.bb
index a259082b47..fd66692185 100644
--- a/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb
+++ b/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb
@@ -3,3 +3,5 @@ require libgcc-initial.inc
=20
 # Building with thumb enabled on armv6t fails
 ARM_INSTRUCTION_SET:armv6 =3D "arm"
+
+CVE_STATUS[CVE-2023-4039] =3D "fixed-version: Fixed via CVE-2023-4039.pa=
tch in gcc-13-2.inc which is added via require here"
--=20
2.39.2


