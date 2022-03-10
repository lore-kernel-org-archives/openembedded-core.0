Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73800C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 11:40:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8500.1646912439496496467
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 03:40:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F41E016A3
	for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 03:40:38 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3E873F7D8
	for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 03:40:38 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] flit_core: remove redundant python3-pip-native DEPENDS
Date: Thu, 10 Mar 2022 11:40:35 +0000
Message-Id: <20220310114035.2226442-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310114035.2226442-1-ross.burton@arm.com>
References: <20220310114035.2226442-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 11:40:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163015

PIP is not needed by this class directly, but is used by
pip_install_wheel which already depends on python3-pip-native.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/flit_core.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/flit_core.bbclass b/meta/classes/flit_core.bbcl=
ass
index 7b578967a9..ce162bb75b 100644
--- a/meta/classes/flit_core.bbclass
+++ b/meta/classes/flit_core.bbclass
@@ -1,6 +1,6 @@
 inherit pip_install_wheel python3native python3-dir setuptools3-base
=20
-DEPENDS +=3D "python3 python3-flit-core-native python3-pip-native"
+DEPENDS +=3D "python3 python3-flit-core-native"
=20
 flit_core_do_configure () {
     :
--=20
2.25.1


