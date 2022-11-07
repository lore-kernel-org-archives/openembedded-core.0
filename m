Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D80C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 12:38:01 +0000 (UTC)
Received: from smtp-out.onbox.hu (smtp-out.onbox.hu [46.107.16.235])
 by mx.groups.io with SMTP id smtpd.web08.2716.1667824672022014879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 04:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@freemail.hu header.s=20181004 header.b=OdOcPP+8;
 spf=pass (domain: freemail.hu, ip: 46.107.16.235, mailfrom: egyszeregy@freemail.hu)
Received: from localhost.localdomain (catv-178-48-208-198.catv.fixed.vodafone.hu [178.48.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.onbox.hu (Postfix) with ESMTPSA id 4N5W3K4tk7z9Xv;
	Mon,  7 Nov 2022 13:37:49 +0100 (CET)
From: egyszeregy@freemail.hu
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Benjamin=20Sz=C5=91ke?= <egyszeregy@freemail.hu>
Subject: [master][PATCH v2 2/2] image_types: Set .7z extension for 7-Zip conversion command
Date: Mon,  7 Nov 2022 13:37:33 +0100
Message-Id: <20221107123733.912-2-egyszeregy@freemail.hu>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20221107123733.912-1-egyszeregy@freemail.hu>
References: <20221107123733.912-1-egyszeregy@freemail.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdegudculddtuddrgedvuddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucggtfgfnhhsuhgsshgtrhhisggvpdcuhfftgffgofetkffnnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepvghghihsiigvrhgvghihsehfrhgvvghmrghilhdrhhhunecuggftrfgrthhtvghrnhepveeifffgudeileeukedvkeffgfeiudejueetleetvdevjeeikeeiueeuhfelvdehnecukfhppedujeekrdegkedrvddtkedrudelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhinhgvthepudejkedrgeekrddvtdekrdduleekpdhmrghilhhfrhhomhepvghghihsiigvrhgvghihsehfrhgvvghmrghilhdrhhhupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1667824669;
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 12:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172838

	s=20181004; d=freemail.hu;

	h=From:To:Cc:Subject:Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;

	l=666; bh=okipRjAsLt/gRy2A6q/lcxg6ztIVro0gzrU1Q3UX7lM=;

	b=OdOcPP+8x0PqdYPB0jCiuEiAdOyGkAraGNaGHbERYjGY38mUGQPcqIC8TmBv4yt6

	LW30dqJZZQgC0aVBO9EGpGv1cGwTK+G9TyvCKDqOI0mpAzch1+tIzEWtcb/LnnG11Rd

	LwXLHtgxm2sO+sRoy6StBGR8sEb+NxUsgzuBG0PHVXfgtdZ7IbQe5OM53nuHMnWEltd

	lrkZ5MoQfaHF1vx3L1QdbuNSWdo0xFzMvjlNxk4ONBmMLgLMg2sqIrtmNHSQhHhP3Lh

	Qh9+W4mSb9ai2ZIiK1pYdKU8tBOWyVKcT9Oe2whspZdqNPLAyWD2Jk1EHO/jhpulG4a

	MyHaAzuaew==
Content-Transfer-Encoding: quoted-printable

From: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>

Signed-off-by: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>
---
 meta/classes-recipe/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recip=
e/image_types.bbclass
index f70c71b9d4..ae00728a74 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -61,7 +61,7 @@ ZIP_COMPRESSION_LEVEL ?=3D "-9"
=20
 7ZIP_COMPRESSION_LEVEL ?=3D "9"
 7ZIP_COMPRESSION_METHOD ?=3D "BZip2"
-7ZIP_EXTENSION ?=3D "zip"
+7ZIP_EXTENSION ?=3D "7z"
=20
 ZSTD_COMPRESSION_LEVEL ?=3D "-3"
=20
--=20
2.38.1.windows.1


