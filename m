Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6C1C67861
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 11:20:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.56847.1749468001986436866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 04:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4B9214BF
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jun 2025 04:19:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4212D3F59E
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jun 2025 04:20:01 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 14/16] tcf-agent: put version in recipe filename
Date: Mon,  9 Jun 2025 12:19:46 +0100
Message-ID: <20250609111948.2282441-14-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609111948.2282441-1-ross.burton@arm.com>
References: <20250609111948.2282441-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 11:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218283

A recipe that fetches from git but is otherwise a released version
should not be using _git.bb recipe names.

Put the version in the filename and drop the explicit PV.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../tcf-agent/{tcf-agent_git.bb =3D> tcf-agent_1.8.0.bb}           | 1 -
 1 file changed, 1 deletion(-)
 rename meta/recipes-devtools/tcf-agent/{tcf-agent_git.bb =3D> tcf-agent_=
1.8.0.bb} (99%)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/reci=
pes-devtools/tcf-agent/tcf-agent_1.8.0.bb
similarity index 99%
rename from meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
rename to meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb
index 235936288ba..b02fcb9cad1 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb
@@ -7,7 +7,6 @@ LICENSE =3D "EPL-1.0 | BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://edl-v10.html;md5=3D522a390a83dc186513f05005=
43ad3679"
=20
 SRCREV =3D "1f11747e83ebf4f53e8d17f430136f92ec378709"
-PV =3D "1.8.0+git"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
 SRC_URI =3D "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=
=3Dhttps;branch=3Dmaster \
--=20
2.43.0


