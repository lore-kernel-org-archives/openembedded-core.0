Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA73C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 20:38:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1841.1666211875007562504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 13:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B6AC1424;
	Wed, 19 Oct 2022 13:38:00 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E24C63F792;
	Wed, 19 Oct 2022 13:37:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] externalsrc: move back to classes
Date: Wed, 19 Oct 2022 21:37:51 +0100
Message-Id: <20221019203751.2265757-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 20:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171980

The externalsrc class was moved to classes-recipe as part of oe-core
f5c1280, but it can be used in both recipe and global contexts so move
it back to classes/.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/{classes-recipe =3D> classes}/externalsrc.bbclass | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/{classes-recipe =3D> classes}/externalsrc.bbclass (100%)

diff --git a/meta/classes-recipe/externalsrc.bbclass b/meta/classes/exter=
nalsrc.bbclass
similarity index 100%
rename from meta/classes-recipe/externalsrc.bbclass
rename to meta/classes/externalsrc.bbclass
--=20
2.34.1


