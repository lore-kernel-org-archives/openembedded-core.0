Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49236C47422
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 19:19:55 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.54681.1705864787918373401
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 11:19:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=j7Ix8mOo;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 01D08240027
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 20:19:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1705864786; bh=4IdAJfO9nmay/8uAlM6RheVmFs+mKgF0dtK5UnfxMOo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=j7Ix8mOo+V36pgT7TgL3QTDQZrmLE5hEzfeVV6dvZspCPOISYjdOqptdq7Js77QLK
	 wPJ+Mi0top0JfLu7yLyqdOwZ0nalq29Sm6IjrDW1rZf5y1CVeQ6EnCLNOqHo2SDsvr
	 N/3s25eKI82bQe+2LJK+n5E4nBeEG09K9kBxuf8nSyn6h96POqg8gyy9m5z5aigW2K
	 6G2YXY1RtrK7cLWciZtinF1+qvSQ9I4TLZMaQunbvKZII3ShEcOseG4aSQ9v/0bGMz
	 g3efw5iRFXfOs+nr3OdIVeoNrDN0VhKqgvaHB3rgBjn67sWsi6zyiCJ7NDU4FzBulR
	 Q2B0kpB5i7HRg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TJ38118Rlz9rxG;
	Sun, 21 Jan 2024 20:19:44 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] libgcc-initial: Update status of CVE-2023-4039
Date: Sun, 21 Jan 2024 19:19:35 +0000
Message-Id: <20240121191935.738504-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 19:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194101

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

This is fixed via a patch added in gcc-13.2.inc already.

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


