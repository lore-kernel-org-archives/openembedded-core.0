Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F89C5516F
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 19:10:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3458.1785525025220477511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 12:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=gzUgj71p;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2341C152B
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 12:10:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BAB3B3F66F
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 12:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785525024; bh=9kZFt3hPiQqRDK2PKUXcSBbUUMEo6XTQ4nQPZYs/Ph0=;
	h=From:To:Subject:Date:From;
	b=gzUgj71pl0BXDUZWh+4w6pvjsceEK7mrYhxdUaENUn02YT40igqqKRRSDhOdkviU5
	 QFiVo729Qq/YIWa7JN+2b/lB7Nlh2iIt7NW38ZJTwTLYUEzL+PbADxfUfCze2f6SOF
	 RV+YY4H+Elf7oAJfIOJxVzpykElQgY3tRF7b8i7g=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/rust-common: don't export rustlibdir
Date: Fri, 31 Jul 2026 20:10:19 +0100
Message-ID: <20260731191019.2141444-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 19:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242454

There appears to be no reason for this to be exported as it's only used
to set other variables, and does not appear in the rust source code.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/rust-common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recip=
e/rust-common.bbclass
index 6bc42016d17..a4278af83a0 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -8,7 +8,7 @@ inherit python3native
 inherit rust-target-config
=20
 # Common variables used by all Rust builds
-export rustlibdir =3D "${libdir}/rustlib/${RUST_HOST_SYS}/lib"
+rustlibdir =3D "${libdir}/rustlib/${RUST_HOST_SYS}/lib"
 FILES:${PN} +=3D "${rustlibdir}/*.so"
 FILES:${PN}-dev +=3D "${rustlibdir}/*.rlib ${rustlibdir}/*.rmeta"
 FILES:${PN}-dbg +=3D "${rustlibdir}/.debug"
--=20
2.43.0


