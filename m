Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9174CA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 11:12:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8678.1790853124837084615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 04:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Gfq++Vfd;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EE02169E
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Oct 2026 04:12:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C2A43F86F
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Oct 2026 04:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790853124; bh=+6JRRYKEm+Ii6X9S+QuxmhV+5LXoub1LeNObedjRbA4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Gfq++VfdG2AzjyWT0glSspejZrIz5C9/T/3DZKnVLCe7bvQe8fXUsQAfLhDTpMYQw
	 hea4uIuCHmSrjheiDCyg+nvUtpkh4rUqGfFW4yko+CehIQYpukA9mU3rFuwefMtSR0
	 aMKZBVWxLaR5T5zXQiOH8o72RTUZ43AI/aFMxUdk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] python3-cryptography: remove pytz dependency
Date: Thu,  1 Oct 2026 12:11:58 +0100
Message-ID: <20261001111159.2987565-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001111159.2987565-1-ross.burton@arm.com>
References: <20261001111159.2987565-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 11:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247027

The dependency on pytz in the test suite was removed in v40.0.0[1].

[1] cryptography 550355b55 ("remove pytz test dependency (#8447)")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-cryptography.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/=
recipes-devtools/python/python3-cryptography.bb
index f2ac4e1b89f..edcdb5a75b1 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -54,7 +54,6 @@ RDEPENDS:${PN}-ptest +=3D " \
     python3-pytest \
     python3-unittest-automake-output \
     python3-pytest-subtests \
-    python3-pytz \
 "
=20
 inherit ptest
--=20
2.43.0


