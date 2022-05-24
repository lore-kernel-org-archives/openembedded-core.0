Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E0AC4321E
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:24:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.10702.1653405850971830050
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 08:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B2B0ED1;
	Tue, 24 May 2022 08:24:10 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EABAD3F70D;
	Tue, 24 May 2022 08:24:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 8/9] packagegroup-self-hosted: remove lzo
Date: Tue, 24 May 2022 16:24:00 +0100
Message-Id: <20220524152401.1663317-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220524152401.1663317-1-ross.burton@arm.com>
References: <20220524152401.1663317-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 15:24:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166078

lzo isn't needed to build, so it doesn't need to be in the self-hosted
packagegroup.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb =
b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 9523aadd153..772b86b39a3 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -129,7 +129,6 @@ RDEPENDS:packagegroup-self-hosted-extended =3D "\
     libusb1 \
     libxml2 \
     lsof \
-    lzo \
     man \
     man-pages \
     mdadm \
--=20
2.25.1


