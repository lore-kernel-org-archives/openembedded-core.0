Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84A7C4450E
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 10:31:30 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9359.1784196187721121703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 03:03:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=UmTnoKqJ;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: alexander.stein@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=7MiOYd7zNOd0KyplSrB2JxHM87+fyb/+85x1h3RCoHs=; b=UmTnoKqJ+epzsbJ7LcnGL0j1v/
	gSrtO/GmelwvqkA/knIeSw/GCYKux8RF3zVPQfnq5WcUralbQU8FHqRFB1hpsnW0rV4glOrVszwLV
	/spQUG83qhpKiaBSrrvn9H09w4s+tOpYb3/Jab7ld2LEqwrifBGiFJt3/0YNWI4Lp4PUvlakENfvh
	vN1nJflemYuNnNo2F40uAVd7FlTaln12WS5ADpVZXxVcYJs6KA2Fzxa8XfupvHfj7+ULI+/2xecpf
	4OpaO6ugco6lhtLXvgHCF/61HjBbFzzqgdOkBzE9lHzAloXA412c6hLIc59jFcVFztOc/GsmVUIa+
	y35JYlPA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wkIvp-00013s-23;
	Thu, 16 Jul 2026 12:03:05 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wkIvo-000Acm-35;
	Thu, 16 Jul 2026 12:03:05 +0200
From: "Alexander Stein" <alexander.stein@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/1] tcmode-default: Also set PREFERRED_VERSION for nativesdk-rust
Date: Thu, 16 Jul 2026 12:02:44 +0200
Message-ID: <20260716100246.3596678-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/28062/Thu Jul 16 08:25:13 2026)
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 10:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241079

This version also needs to match.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 meta/conf/distro/include/tcmode-default.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index d378e301f2..7442b2c451 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -44,4 +44,5 @@ PREFERRED_VERSION_libstd-rs ?= "${RUSTVERSION}"
 PREFERRED_VERSION_rust ?= "${RUSTVERSION}"
 PREFERRED_VERSION_rust-cross-${TARGET_ARCH} ?= "${RUSTVERSION}"
 PREFERRED_VERSION_rust-native ?= "${RUSTVERSION}"
+PREFERRED_VERSION_nativesdk-rust ?= "${RUSTVERSION}"
 
-- 
2.54.0


