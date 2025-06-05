Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46298C5B552
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:35:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10966.1749137721335580291
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83EA51688
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 08:35:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A93A43F5A1
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 08:35:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/16] tcf-agent: put version in recipe filename
Date: Thu,  5 Jun 2025 16:35:06 +0100
Message-ID: <20250605153508.961682-14-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605153508.961682-1-ross.burton@arm.com>
References: <20250605153508.961682-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 15:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218050

A recipe that fetches from git but is otherwise a released version
should not be using _git.bb recipe names.

Put the version in the filename, drop the explicit PV, and set the tag
name in the SRC_URI to verify the SHA.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../tcf-agent/{tcf-agent_git.bb =3D> tcf-agent_1.8.0.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/tcf-agent/{tcf-agent_git.bb =3D> tcf-agent_=
1.8.0.bb} (98%)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/reci=
pes-devtools/tcf-agent/tcf-agent_1.8.0.bb
similarity index 98%
rename from meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
rename to meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb
index 235936288ba..2dcba1a1d31 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb
@@ -7,10 +7,9 @@ LICENSE =3D "EPL-1.0 | BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://edl-v10.html;md5=3D522a390a83dc186513f05005=
43ad3679"
=20
 SRCREV =3D "1f11747e83ebf4f53e8d17f430136f92ec378709"
-PV =3D "1.8.0+git"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI =3D "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=
=3Dhttps;branch=3Dmaster \
+SRC_URI =3D "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=
=3Dhttps;branch=3Dmaster;tag=3D${PV} \
            file://ldflags.patch \
            file://tcf-agent.init \
            file://tcf-agent.service \
--=20
2.43.0


