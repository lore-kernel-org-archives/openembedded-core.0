Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7B325770DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 18:32:46 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id e32so116245047qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 10:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=RHfsHUnK6G65l9kTtEeAB2Tz9uo+5qREBWrD/1BXKtc=;
	b=ZvAquAlB0lI3is5OpZn+iAvcAWlaCM3L2vdrQAesCKam9X8h0+4R55fml3jRpzgH7w
	fYTLIBbNWn6XvcwfS3xUQeVPBBE9iXz41W45dAFD+OxdJKKregnMfZH1DrDrJZlL4+oS
	TkoSOJ5s+wsW72AwU7UCNK8H2qkLWO16JTJD15cHbqj3hssRIK5wRfLelSVEYFAhRqO3
	hsbUK3pXmdVHs3NT1ey2LSK/C65/Vy35m4n4DN6XcuhHDcMO+/7hBs/S4+XNQxoiK8iL
	mDUtSVTU6l+rf/Jzz7BL47unfhdUosP/RMV2+prKXw6WzPNIV+AVVlHqVD5YwDeiiSM2
	I+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=RHfsHUnK6G65l9kTtEeAB2Tz9uo+5qREBWrD/1BXKtc=;
	b=gCuLSSQ2p6vp/UpMKYBY9nFmXwB0Rotbo+rDVU0zGgGwdGxhixdKLdOeuluUzoIITG
	dwj5q/gS95dzdpv/n5QdDtYsD8RwMdBtOSzcjxZbyrD+5IPd1xT/bZEIUOz+5peYZD5K
	MLA2loWItsQJzq5MloY/yqhOaFjaP2xR+qoYX/GeqIU0fDUXm3t0MstPLOqBf0LzspDk
	KwBthzV95bTRteF3k2S+oba6Jr+UUygZlNGywX5d8PCBGaH4wiRygW8pOAYHYI94BLiz
	LUzmP1ajoAYjlWC9TcTomjNIxSGGY/AfdEfG3AzwJX4kcmDWx1zCwWHNPiQBCeLp3V/F
	XcPg==
X-Gm-Message-State: AG10YORcGDScHdFXyEvXcDFX4f7Pg9/5Y60F3/Jw8+8ruVNYHGxpUUPG9CWm1C3QeTt8Tw==
X-Received: by 10.140.86.85 with SMTP id o79mr22663909qgd.3.1453746767173;
	Mon, 25 Jan 2016 10:32:47 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id h99sm9201586qge.7.2016.01.25.10.32.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 10:32:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:32:25 +0000
Message-Id: <98de762616beab7a5865d0db4cc1a310f3580b7a.1453746280.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
References: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453746280.git.raj.khem@gmail.com>
References: <cover.1453746280.git.raj.khem@gmail.com>
Subject: [PATCH 09/11] fts: Correct LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 25 Jan 2016 18:32:48 -0000

It was using wrong keyword and let it point to section of header file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/fts/fts.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/fts/fts.bb b/meta/recipes-core/fts/fts.bb
index 2539e5d..c301720 100644
--- a/meta/recipes-core/fts/fts.bb
+++ b/meta/recipes-core/fts/fts.bb
@@ -4,7 +4,7 @@
 DESCRIPTION = "keith bostic's POSIX file tree stream operations library"
 HOMEPAGE = "https://sites.google.com/a/bostic.com/keithbostic"
 LICENSE = "BSD-4-Clause"
-LIC_FILES_CHECKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-4-Clause;md5=624d9e67e8ac41a78f6b6c2c55a83a2b"
+LIC_FILES_CHKSUM = "file://fts.h;beginline=1;endline=36;md5=2532eddb3d1a21905723a4011ec4e085"
 SECTION = "libs"
 
 SRC_URI = "https://sites.google.com/a/bostic.com/keithbostic/files/fts.tar.gz \
-- 
2.7.0


