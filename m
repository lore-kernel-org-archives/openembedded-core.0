Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4367C7E447
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 08:19:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Ccw507ZNz8G
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 09:19:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573633157;
	bh=LDUOrTPSf18HelEQeyvxYAKOpa7JeTcAsBaK9ayF73k=;
	h=From:To:Subject:Date:From;
	b=gSwuhe/6NbVfjjH5MLAPZagqNgV7awyfA0AE+mVt01MSumM+guKDstaPk7iOLdwah
	bsuskWkRWs4Id3o/wOKSAuSUcmZicDbqKM/QQ4qVeMEK9W36EedY7izWOghViH5oW9
	dawUl0jm2XLY+B+YZ8p2LDKCDaaxlbCRPFW081eruS9VkfYhOPZG+GX5Km9z4Wef2M
	nrZ9+AAA1sDPAFXqchB2BYiYZI/3AdRwPuyN5RNblZQP9EqX4q4gKBrxQtT+wBrcRD
	6GL/OwkifJk96nDlqwdRWefcmogFdXDkKW0StBKneCz4HdIjOWWNj6wh8s+NoXrdj3
	cXEXy2SZW7uqi1n5kQivbOcm0FUFDjdVm0uqiuig2aTuOwrZO6DySjsGUfyd4tteLQ
	+jZqG8kcf4gmraBImDMW0V3Dvq2xD+Ml1rOKUjz9pMFCLGzmldvn2cI+a5SyIfADH6
	/WHlrARaAI82lC3aFvD0cDRtTH7hDGeRRqrm7j7fOaVawIN5WBVKoZ7yikujM3NITS
	v8z0nyT/0zov4inQVpmuxtejFmUJ59ffEg3YMBAoOG4lRB6NljW7n1g6TFai+8FoK/
	OxH4T1y+qsry8tnSN4YlK7wt8PhXFsIblqhZcv7+P4B7cyjfnpg11C/wYJSoL7qtZ3
	nt/Ea5AztwJ5er73t/mcqsUc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 10:19:14 +0200
Message-Id: <20191113081914.28778-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] bind: Whitelist CVE-2019-6470
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Nov 2019 08:19:21 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-connectivity/bind/bind_9.11.5-P4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
index 3e2412dfa4..0a52a66144 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
@@ -37,6 +37,9 @@ UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
 UPSTREAM_CHECK_REGEX = "(?P<pver>9.(11|16|20|24|28)(\.\d+)+(-P\d+)*)/"
 
+# Affects: Builds of dhcpd versions prior to version 4.4.1 when using BIND versions 9.11.2 or later
+CVE_CHECK_WHITELIST += "CVE-2019-6470"
+
 inherit autotools update-rc.d systemd useradd pkgconfig multilib_script
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/bind9-config ${PN}:${bindir}/isc-config.sh"
-- 
2.17.1


