Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA11CC6B3E
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:18:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7169.1775204305586558525
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 01:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zFq2gmpk;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A81251A3125
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Apr 2026 08:18:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77DED603C1
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Apr 2026 08:18:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2CE010450F5D;
	Fri,  3 Apr 2026 10:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775204303; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Nus/hAIJJef5AV9Y56TMIYLU020gqWxLkkxRePrvb1A=;
	b=zFq2gmpkElgHo8/umZBu532fxSswDUInVKABPJ2j3+UEUIPgoct/o4PO7gVvmR40mPIcGI
	hZ+xkFb+/xwMgiw7qe7NOTxRA2ipHaybLVJm734CYSv4FhXWvnDXN8KYo23X7FHuctJmsd
	wJL0zbZxS9KSqXMaLzZXG41Gjyb07mkjRJEEb2jO00GzBKzrvR2DJGubaIVYRoMfhFVzNX
	Fn2WSh3vsBxCu84cZFz0mn5G+wqDSIzkEeA5N3oVzQROk2aBBbx6zohRtWNlfJUCSX+DYU
	VDClSEG0RttkSio2SZRxI0SwuxtMbYind0L8KyDXolYIlAlM1TOUaEoaAoNrBA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 03 Apr 2026 10:18:00 +0200
Subject: [PATCH] ptest-packagelists.inc: add missing whitespace for :append
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-fix-whitespace-append-v1-1-b04e4e78087f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWTsQL4j1VcRFEo91ukhDxl5Af
 Hdju/zgnH8nRRIoDcVOCW9ReYaMqizIrzbcwTJnU23qzrSm4UW+/Fllg0brwTZGhJk7197Q99X
 iG0f5GxPy8Ncdp7/15R7w2xWj4zgBOrv+DnkAAAA=
X-Change-ID: 20260403-fix-whitespace-append-6b49e881fc3b
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kBx+gK01Y0Qqpr1ujR9+dKvvtX+625Myi311MUtO9Zg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpz3fOq5OJ2STrITVdsmsmcJardG787BXebRyk0
 aOKsuhIIACJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCac93zgAKCRDRgEFAKaOo
 NjLKD/9eHEZ7JAp0VLAYVRr75aWMD0fJkbTxKKlu53nSrTBxP07HF1LWR92GDeS1P2x9vlk0KAS
 ji/fAQB8n4QfWB2IhRxRArc496NLM0/yGzeoNT7R1ZsOFrGCjIJDdyt6o9Sab0vzNJYTtEnpO7d
 VbTti9gKTYnbz2gXg2FJ7d/vomEq/aC1lLrROXwunhGd2I4ErhUxEjJVaDNnun0IZXEVjD6XJ+q
 iz94yhxn86B1V4PF2g4jpeFCnQ05lHUMf3RN/QdYOpvDH1eeJC2IYxlCvLbN4sd+1T8SRi4ty+E
 MYJ7j2pX4CDBpaBLshtoE+1E6UYI1/tZdv4o62II7wvjyDXHbbTsXZgWmtP4Jz5Z8xcBHddEThw
 fbyh6y2U6WBELnOAQ2Q/3MTO8HBVjx4jsN1aCRe6J1t8XJCgK844mHJLm6eE5kdCOe4O7KOnuZZ
 k8ujFYl165o2sKVlPORXdnKKeQXafWpy/9uiba/h177DfqcW2loxlGiegFiQYhgteO4M55+zndp
 XZe4Y2yKwFs4iwI4zm1h2lL5sRTD0Ap5EhQX2AJEYrHSlk2pgnBm9GQhQ5UCa02w+DQfzQb8GuY
 zLxslKVp5KFw45uFj7QATv+S9OvDKUSTpz2RvXqoC4MxgjXu5e/yxxx40EIRwjW+Gn2dID+7zve
 /U9hV9CPtZtnoSA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 08:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234562

Noticed while reviewing the log, let's fix those before they create
unexpected problems in the future.

Fixes: 388cd4770e04 ("ptest-packagelists: Exclude ptests from musl which are known to fail")
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 31fd5ae7ce6..11a894accf2 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -160,11 +160,11 @@ PTESTS_PROBLEMS:append:riscv64 = " tcl tcl8 python3-cffi strace lttng-tools pyth
 # These tests don't yet pass for musl qemuarm64
 PTESTS_SLOW:remove:libc-musl:qemuarm64 = "strace perl gnutls glib-2.0"
 PTESTS_FAST:remove:libc-musl:qemuarm64 = "libarchive"
-PTESTS_PROBLEMS:append:libc-musl:qemuarm64 = "strace perl gnutls glib-2.0 libarchive"
+PTESTS_PROBLEMS:append:libc-musl:qemuarm64 = " strace perl gnutls glib-2.0 libarchive"
 # These tests don't yet pass for musl qemux86-64
 PTESTS_SLOW:remove:libc-musl:qemux86-64 = "perl gnutls"
 PTESTS_FAST:remove:libc-musl:qemux86-64 = "libarchive"
-PTESTS_PROBLEMS:append:libc-musl:qemux86-64 = "perl gnutls libarchive"
+PTESTS_PROBLEMS:append:libc-musl:qemux86-64 = " perl gnutls libarchive"
 
 #    ruby \ # Timeout
 #    rt-tests \ # Needs to be checked whether it runs at all

---
base-commit: c56990178b31b893fbf695eaf6b67de501e9d2e9
change-id: 20260403-fix-whitespace-append-6b49e881fc3b


