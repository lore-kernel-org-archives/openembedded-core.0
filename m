Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2122C4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 16:23:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13305.1647361428616082709
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 09:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F6EF1474
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 09:23:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D33803F766
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 09:23:47 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto: remove redundant devupstream assignments
Date: Tue, 15 Mar 2022 16:23:45 +0000
Message-Id: <20220315162345.613041-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315162345.613041-1-ross.burton@arm.com>
References: <20220315162345.613041-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 16:23:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163307

These are set by devupstream, so they don't need to be set in the recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes=
-kernel/linux/linux-yocto_5.15.bb
index 9a147023e8..6965df13bb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -30,7 +30,6 @@ SRCREV_meta ?=3D "ea948a0983d7b7820814e5bce4eda3079201b=
d95"
 # meta SRCREV as the linux-yocto-standard builds. Select your version us=
ing the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND =3D "devupstream:target"
-DEFAULT_PREFERENCE:class-devupstream =3D "-1"
 SRCREV_machine:class-devupstream ?=3D "8993e6067f263765fd26edabf3e3012e3=
ec4d81e"
 PN:class-devupstream =3D "linux-yocto-upstream"
 KBRANCH:class-devupstream =3D "v5.15/base"
--=20
2.25.1


