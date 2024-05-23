Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071C8C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 12:56:11 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by mx.groups.io with SMTP id smtpd.web10.14639.1716468966921349542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 05:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=VtedGxbp;
 spf=pass (domain: protonmail.com, ip: 185.70.43.16, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1716468965; x=1716728165;
	bh=BXGnIIRsi2b6gNVwX2lh4O+8mmTEU9+ElSRnHXgbu1I=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VtedGxbpkiLsQbLTT2rZGyCYus80HKvsGcUOCOAwEYMC4JpFwylb16JhRLHeBuibB
	 nRJvkkIG3BYfXcP+19DnxlAPNSzRkhX5oIbXFcgnIrwIq8tFj1d/26QR6xnEoTX4BO
	 2upxbuGSJJ1/Y+xpHhf/PHtpDAGHbvOhA5f462K7S5RHrI5IXfxFtKL4N3Waydrf1U
	 z7oXRyQPQtKr3GzaCIX69l5kymsNAYEawMFSnjsmfGIXNXmevUFaYEkR4p5EAwZU+S
	 rnzBV7kGCKy/bbNRRq63gO1q7gC+YE86qLiY3wxq5X5nAB0eJHpTjv5tfQFiK2UvXP
	 UDngkwTcMJVrA==
Date: Thu, 23 May 2024 12:56:00 +0000
To: openembedded-core@lists.openembedded.org
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: rasmus.villemoes@prevas.dk
Subject: [PATCH] insane.bbclass: remove leftover variables and comment
Message-ID: <20240523125556.46020-1-emil.kronborg@protonmail.com>
Feedback-ID: 20949900:user:proton
X-Pm-Message-ID: 4790bb1e0f02a0443a86dd031477a3a50e9a97a9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 12:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199792

The code that used these variable and the comment was introduced in
commit b44d32ef41ef ("insane.bbclass: Portions of code were not running,
fix this and sync with OE.dev. Also add tests for bad sysroot rpaths in
binaries"). Later, in commit 17dae13fabe2 ("insane.bbclass: Fix ELF
bitsize comparison"), some of that code was removed again, but not the
variables and the comment.

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
---
 meta/classes-global/insane.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 99736830b9a8..8bbecd3c2d17 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -840,10 +840,6 @@ def prepopulate_objdump_p(elf, d):
=20
 # Walk over all files in a directory and call func
 def package_qa_walk(warnfuncs, errorfuncs, package, d):
-    #if this will throw an exception, then fix the dict above
-    target_os   =3D d.getVar('HOST_OS')
-    target_arch =3D d.getVar('HOST_ARCH')
-
     warnings =3D {}
     errors =3D {}
     elves =3D {}

base-commit: 50f78cb9de68cd4317f34321dfdb06d72ce5d3c6
--=20
2.45.1



