Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9862DCCA47B
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:19:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.28375.1657545549297169264
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 06:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 512CA176B;
	Mon, 11 Jul 2022 06:19:09 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 738863F70D;
	Mon, 11 Jul 2022 06:19:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] vim: upgrade to 9.0.0021
Date: Mon, 11 Jul 2022 14:19:05 +0100
Message-Id: <20220711131905.3536120-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220711131905.3536120-1-ross.burton@arm.com>
References: <20220711131905.3536120-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 13:19:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167870

This fixes the following CVEs:
- CVE-2022-2257
- CVE-2022-2264
- CVE-2022-2284
- CVE-2022-2285
- CVE-2022-2286
- CVE-2022-2287

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index b85f34d6c8e..7e2c624bc11 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
            file://racefix.patch \
            "
=20
-PV .=3D ".0005"
-SRCREV =3D "040674129f3382822eeb7b590380efa5228124a8"
+PV .=3D ".0021"
+SRCREV =3D "5e59ea54c0c37c2f84770f068d95280069828774"
=20
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN =3D "1"
--=20
2.34.1


