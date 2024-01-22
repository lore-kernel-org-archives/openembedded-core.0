Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E166C47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 16:41:52 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.79298.1705941703190668784
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 08:41:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=IvRibqFG;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 772D9240106
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 17:41:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1705941701; bh=DvWg9sqNWWxxV6xg+iOF+WDqNDA9wJTipx2vnKyXcxY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=IvRibqFGSXetQdMsiPSnWUCXJZjwOmPGpduWI7tBOTqWbS3MHgP2aBr3CHr6qRF5o
	 wDX3MLn50/ALPjIXX5jseymldRqvuZwFStkZil0z0dCYm3XKrTTBAs2hgIINsbBe6m
	 KqTdwpmEma8GnSSg6RYuv/3o4pQEb1t6j39Uh/Itz1YDExpRSmpdNgQgj/YbrsJ2rK
	 m7gAiKfVD8TRk5kT0p5rYax2NQCfND3qaHfzpumCFsJs4FaZvP9OOpdtFBT2k5CUMK
	 8SVd48yhMF+/K47yLn5b0Ye6u8zAFuUksPB3UvQ35fhpBbWTYnK1peirUmve+NZmbS
	 hX5SALwHHABIQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TJbb83gwPz9rxN;
	Mon, 22 Jan 2024 17:41:40 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH v3] gcc: Update status of CVE-2023-4039
Date: Mon, 22 Jan 2024 16:41:32 +0000
Message-Id: <20240122164132.10450-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 16:41:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194185

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

This is fixed via a patch added in gcc-13.2.inc already, but still
reported e.g. for libgcc as it is not defining an own source but use the
shared gcc-source.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-devtools/gcc/gcc-13.2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-13.2.inc
index 359db1e278..32fddd11c2 100644
--- a/meta/recipes-devtools/gcc/gcc-13.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
@@ -115,3 +115,4 @@ EXTRA_OECONF_PATHS =3D "\
 "
=20
 CVE_STATUS[CVE-2021-37322] =3D "cpe-incorrect: Is a binutils 2.26 issue,=
 not gcc"
+CVE_STATUS[CVE-2023-4039] =3D "fixed-version: Fixed via CVE-2023-4039.pa=
tch included here. Set the status explictly to deal with all recipes that=
 share the gcc-source"
--=20
2.39.2


