Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A056C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 19:42:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2557.1646682159686214262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 11:42:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EDD21570
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:42:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0B773F7F5
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:42:38 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] python3-pip: remove obsolete and confusing comment
Date: Mon,  7 Mar 2022 19:42:34 +0000
Message-Id: <20220307194236.3837684-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307194236.3837684-1-ross.burton@arm.com>
References: <20220307194236.3837684-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 19:42:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162861

This comment is very obsolete.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pip_22.0.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/re=
cipes-devtools/python/python3-pip_22.0.3.bb
index 7eb9fb69ba..8d6dfcede7 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -45,7 +45,6 @@ EOF
 }
=20
 do_install:append() {
-    # Install as pip3 and leave pip2 as default
     if [ -e ${D}/${bindir}/pip ]; then
         rm ${D}/${bindir}/pip
     fi
--=20
2.25.1


