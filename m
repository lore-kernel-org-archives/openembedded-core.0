Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F099EC433F5
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 12:44:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.31343.1643633050564651043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 04:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70E50D6E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 04:44:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EC393F774
	for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 04:44:08 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: upgrade to patch 4269
Date: Mon, 31 Jan 2022 12:44:07 +0000
Message-Id: <20220131124407.2851005-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 12:44:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161124

Upgrade to the latest patch release to fix the following CVEs:

- CVE-2022-0261
- CVE-2022-0318
- CVE-2022-0319

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index 3a5eca41114..f044be504b6 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
            file://racefix.patch \
            "
=20
-PV .=3D ".4118"
-SRCREV =3D "0023f82a76cf43a12b41e71f97a2e860d0444e1b"
+PV .=3D ".4269"
+SRCREV =3D "48a604845e33399893d6bf293e71bcd2a412800d"
=20
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN =3D "1"
--=20
2.25.1


