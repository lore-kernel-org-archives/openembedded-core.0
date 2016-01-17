Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 897FA76FF5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:43 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id 65so142175154pff.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rT3NftStptyFlyszCy45uLKKozJC/WrzM6e6OEZQDDw=;
	b=KIqAK2uIME/Rr+bW3EGz9GlZrx5Bw/3nUMuFNzDy3syu7jDglbkODj4v46udpZKlQp
	WXAhbHrtkCUkIeeZa+DtQK/WKgrkLgba8bshUOc2DomMdTxdakCcmBo5xIpLeE0WmHnQ
	DwQLbK+I6jt/otJnEIEaxqBCRH26oPFiMOWYDmi4GiDWHAik1hitUgDZF+lb/N9gNUpN
	EHt10/GQQYaUrNICvoHsTqur1a7dtPPzFunIc0kzh7996jaD7GP3c221B8+G+rltfc1n
	4ADEqFzaKymoxmwRP8oU8NZAyiXU2APV5g7L+sKlXB7m7mEvZeA2BdB8oqqmweSN2oFm
	eFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rT3NftStptyFlyszCy45uLKKozJC/WrzM6e6OEZQDDw=;
	b=VX3bbS2bZMSSHhxnyioyqFnbljTFMoxTVy9prhEXYlmOgQdqzP4/6a7EsnREpBv2Vr
	HkvGlacb+pYbkwrryCWmrwL/0qpe4OuK+WPO/5d8KwHlOQQyKPJwEP2y2KXGTx2c7E1Q
	ZoEbR0l2ukvXhAtSr8LYX1Uv3ksYxwbnwpKbrD8KsdX8cCxJ+k6EVnrnrx8YuFQq/9dq
	n3tZvTcDE62oQFDex0x+3Ze47xplUNtTpfjpw3vLSZC2lKgceZrNWN63NTbVDxJvYEzD
	CANc/MYNRb8AW2JmM6bB4meTlY1lrUfJ4LkIieNxOAHNzDB/U3PlFKOfQP0nhaNNcfLV
	kp4g==
X-Gm-Message-State: ALoCoQnfUQJQvZ1Cg5FhQkIPTaCOJGfMFp1/8meEX/5zQZTMilkUiohMpH5SooQL9LAD8pU5hPenMu4G3CjBJtNtkpl/EohjpQ==
X-Received: by 10.98.42.74 with SMTP id q71mr28197495pfq.18.1453030664620;
	Sun, 17 Jan 2016 03:37:44 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:22 -0800
Message-Id: <25db8e9d0e30d8b88926743f0b001b0bd9470ca3.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 49/73] systemd: Skip parsing on musl based targets
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:44 -0000

systemd on musl doesn't yet work even though we have patches to make it
compile it fails to run, therefore lets skip building it for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_228.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
index 0c6fbde..16737f9 100644
--- a/meta/recipes-core/systemd/systemd_228.bb
+++ b/meta/recipes-core/systemd/systemd_228.bb
@@ -447,4 +447,8 @@ pkg_prerm_udev-hwdb () {
 python () {
     if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
         raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
+
+    import re
+    if re.match('.*musl*', d.getVar('TARGET_OS', True)) != None:
+        raise bb.parse.SkipPackage("Not _yet_ supported on musl based targets")
 }
-- 
2.7.0


