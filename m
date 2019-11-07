Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 687927F362
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 23:58:34 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id x4so4378549wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 15:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AFd/OAgzu6LucOK5tTNjGQXRuPM/2+cT66bFlnxPcn0=;
	b=GOCmJeNOWaX0d4/V8VdMyBWEXaKsW/zX9Ny28YvA4+EQagSeKqwc5zNsheWyJMkNLY
	sG9nTY2vtbFlEOBQQ3TSzFVWO3HcVSXmKRVLHXpcYZ60btOxo4owNbsBGNNAhBBOyzGR
	llfCBcxD7mLd81RXN5pdyXGLm9Gg8IZcuKI/05saku36dR7CcaBUzl5P8IIEwurRhH2y
	is4zPvZL6NhHtXz7krTh27g1VMYmW0f0ReSt++3Ro+pV8iM/VpvnUwGqEH7d6q2LvbOz
	Z9uWKG1EoiGa1iz8wkfbuBL32WCSVBqUUH+JbcebjiLoZ62dWvVOnPCKWFH5vXoirATy
	nsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AFd/OAgzu6LucOK5tTNjGQXRuPM/2+cT66bFlnxPcn0=;
	b=PESN0ztwlA2xFzNNatwqRO7BVlTTW4+8/+WEZh8av3jD6WbAXKiDyUDo5SQhF52FKt
	Bdy1IQO/yPc7BLdFQixHvyBafyB2bYAlIVHBfW+BpVFhQjGj6t0dUgqJFXsPQtnRiSG9
	Om9ZImr1VNTs1/8kSLTzrCCRR/iwID6+7ARRxwrasAPxsvuFiDI9FJsanvIojD4INxoa
	fA1IPRkGG3mdQaTkti/iF2uSw/3iaJ0lTO6Gfg0Sm5srEVwFUMZBmLCX0KEQg8ggHxfy
	rTSqvowog68gwEl6P+6a0FB+GeEc0IMKIf7Ut9bnROL583r5LNSYEBubXGf0CCXLtO0h
	TOWQ==
X-Gm-Message-State: APjAAAVUHbO41D96fNyLUrK1RJq6g1QGnQFv9Y7l3c2DSPwr1GJLwJ5Q
	Yz7ei00Sk1aejqoy+YojQA/SYY7vNYU=
X-Google-Smtp-Source: APXvYqxfcQict/mTteQsKi1GKiZT491wMULNxIvGA27xT96ESV8fBtpmg4ObQS2rhXnfnqS6vlE+Kw==
X-Received: by 2002:a7b:c747:: with SMTP id w7mr5806748wmk.62.1573171115165;
	Thu, 07 Nov 2019 15:58:35 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f13sm3702821wrq.96.2019.11.07.15.58.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 15:58:34 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 23:58:26 +0000
Message-Id: <20191107235830.26644-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/5] libsoup: update patch upstream status
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
X-List-Received-Date: Thu, 07 Nov 2019 23:58:35 -0000
Content-Transfer-Encoding: 8bit

This has been merged to master now, so mark as a backport.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...01-Do-not-enforce-no-introspection-when-cross-building.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch
index cd6de853e5a..d534457e72c 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch
+++ b/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 14:21:06 +0100
 Subject: [PATCH] Do not enforce no-introspection when cross-building
 
-Upstream-Status: Pending
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/commit/7ef5ec60c33e254bcd915936bea3f04ba0fe2273]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Signed-off-by: Alistair Francis <alistair@alistair23.me>
 ---
-- 
2.20.1


