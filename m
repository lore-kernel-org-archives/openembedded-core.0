Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6335.1792608382630935823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 11:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pengutronix.de header.s=20260414 header.b=KbtxJdaX;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: m.felsch@pengutronix.de)
Received: from dude06.red.stw.pengutronix.de (dude06.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::5c])
	(Authenticated sender: relay-from-dude06.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 227BE2018A0;
	Wed, 21 Oct 2026 20:46:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792608380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0hOW4OkJnanix5o9+GRM5cfbOhD0r11mqmiGAQUGniQ=;
	b=KbtxJdaXdYCf+fZz+fgzTsEgi4zACTvMPKHBtYFDTkSTLlM3iTWDJ1TlXCVIIWl4ZMi8uS
	anc5K/QbputTrrbTaC2gwdxfRtEfMj/tSPzoxN/hLW6ddswKnaD2kHSWBNqaCvUwYxPYHu
	1WdHaVH0ZAS3hgP2LykA4drgzHl1pgoy1U3X22DLj099VQDUlqvMHav8jbOK4mRLCIlZGf
	MVxiUYilt/sP1wAGfi43Jd/nHWgooY/WwamOAfK3uUDl37ZZuoe+Z3tqq82jIMBu1i5ytJ
	52LtSYhEK8RzFGiDZ8V66rV671rmAK+LeUtYA9lzEZUFmFmtzYv28Y4AAxRrQg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792608380; a=rsa-sha256;
	cv=none;
	b=GhlJozmx7ykyI09YCD8A8EB+AmpGfrw9Iwv4MyY7zjto3rAiwv1NCAhlEbCbvBZ1FAdbhU
	oq9j7PoVHo24msUImwAhSQnuxMQkhml3lGUwKU8bJhxILFdHqSX76CIeZXERDMuY+WH1N6
	RJS4tJ8SwHu32uYHk6jxQLA9M35VFJ230Yuikbc+m9nR5smVvTe2jDtZwVXltHbj6A94oU
	YWVwPDa3p8ObLnzz3n4KAi8BH9bm4h/aTPUQL96gpvgipUCZHAuNPb36WmU1KBRdVfwEdv
	wo/aJdwsBdb4zYqJx1/uXBFiskFd1K6VL5x/WGTA2T0//FNVrVL6pPYzN7N9eg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude06.red.stw.pengutronix.de smtp.mailfrom=m.felsch@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792608380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0hOW4OkJnanix5o9+GRM5cfbOhD0r11mqmiGAQUGniQ=;
	b=GZkXnh0zCbIWkJIv1J+liGHsq+/Wfu1a0D7JttcO2Q2X5QH2ZXVsQv+1Y5LegleuAoZtX/
	/Wm/tWdyN0u6pkkjS/FbdoLDK+XZb5WPkLE58XSqCiWcxepN0EBzo21qm6k8njDB0ugeVC
	dUXyUwpQGynKTpROaPfHGcagQhQm70z+XeZW9FOLHw85EKbGM05QMvtSg9zkmWvn7FwqMm
	hvd6kHLWlqQS2kQCKcwu1w7m7f7mJqHDmf+lNJwVoDZUANyAlrvTakRSdNuPXjyFo1u8YU
	lmKDboAD+ptnQB61CDMekKPUSTLadYgUDF8h75q8xJo6Z7VRUbK99OePkrzCTA==
Received: from dude06.red.stw.pengutronix.de (localhost [IPv6:::1])
	by dude06.red.stw.pengutronix.de (Postfix) with ESMTP id 0A0CB6407C8;
	Wed, 21 Oct 2026 20:46:20 +0200 (CEST)
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/2] Add support for multi Cargo.lock files
Date: Wed, 21 Oct 2026 20:46:15 +0200
Message-Id: <20261021-mfe-multi-cargo-lock-files-v1-0-d3510d4ad963@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHcI2WoC/yXMQQrCMBAF0KuUWTvQCVaoVxEXMf7U0bSRTCtC6
 d2Nunybt5KhKIyOzUoFLzXNU4XsGgo3Pw1gvVaTa91BWic8RvC4pFk5+DJkTjk8OGqC8V5i7+G
 ddH1HNXgWRH3/8tP5b1sud4T5O9K2fQCcMgIOfgAAAA==
X-Change-ID: 20261021-mfe-multi-cargo-lock-files-41f9aea21595
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 18:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248405

Hi,

this small series adds the support to reference multiple Cargo.lock
files which is handy once a recipe want to rebuild the std-crate for
minimized special purpose builds.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Marco Felsch (2):
      classes/cargo-update-recipe-crates: fix unreachable Cargo.lock check
      classes/cargo-update-recipe-crates: support multiple Cargo.lock search directories

 .../cargo-update-recipe-crates.bbclass             | 57 ++++++++++++++--------
 1 file changed, 37 insertions(+), 20 deletions(-)
---
base-commit: 99c96202a2c9aea84f5ceb267a8c63c0cff58b1e
change-id: 20261021-mfe-multi-cargo-lock-files-41f9aea21595

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>

