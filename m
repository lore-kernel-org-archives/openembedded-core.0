Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E70C433F5
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:24:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10769.1653405845970083034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 08:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF36B23A;
	Tue, 24 May 2022 08:24:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81B3D3F70D;
	Tue, 24 May 2022 08:24:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/9] lzo: Add further info to a patch
Date: Tue, 24 May 2022 16:23:53 +0100
Message-Id: <20220524152401.1663317-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 15:24:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166071

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add some further info to the patch based on upsream changes. Given the la=
st release
in 2017 and glaring issues on at least armv5, it does raise the question =
on whether
we should drop this. There are probably better compression tools now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lzo/0001-Use-memcpy-instead-of-reinventing-it.patch    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-rein=
venting-it.patch b/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-o=
f-reinventing-it.patch
index db3a70e8031..4e6ca4132b5 100644
--- a/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing=
-it.patch
+++ b/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing=
-it.patch
@@ -10,6 +10,13 @@ Change suggested by Julian Taylor.
=20
 Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D757037
=20
+RP: Patch is still in debian as of 20220524 in a revised form:
+https://sources.debian.org/patches/lzo2/2.10-2/
+https://sources.debian.org/patches/lzo2/2.10-2/0001-Conditionally-replac=
e-reinvention-of-memcpy-with-cal.patch/
+
+We likely need this in OE to prevent against unaligned accesses
+on systems such as armv5.
+
 Upstream-Status: Pending
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 ---
--=20
2.25.1


