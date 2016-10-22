Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 119A571B69
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 22:39:39 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d199so4093578wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 15:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=201u8k7qluDUyF+oXu0U7+ZDeh4rO+cBt82uEtVsBAE=;
	b=OZoFutlWtQSzyHP2Rj3rEnq/whWvsgk+/cTdlSj7bm3r8z2uz4PhAdWUMsTT9U7SRu
	iYrzOmsvjTn2WTZgL8miBP5JOUb4R1mXa6zy8+Aenpil3b9Se5rSSBRk5TSAttxM/IED
	pv/roSOjs7V7lxOYZCI3PuLeFeDGQ0Qde/SsuWqSGfkRLF6Kh4yIxdmm4YLHU6CtAk9i
	pVDqT97+ptN1QrocooX6tXV1OkMRy9hrqKhzb+n/+ibcXqPK0dJP3wNFJcuAvdV4SKr1
	9ePNDyN4EK/7FVU6Dc4Ns4B8H2WQUzS/Jb+XP7+uyzckogVdodSXn7gv/jN5KtAj4Yqg
	xYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=201u8k7qluDUyF+oXu0U7+ZDeh4rO+cBt82uEtVsBAE=;
	b=XyOQgF5unWZsx7tyu4E0NRs09q7fQt9CIhPATvxF6A2NCMocsdshhKp4XjNDYyvL3p
	har0IpMnRV+Tjtofg/UaJ0iladvVvtGej610byMbwWvc/bFzwRyO1m3Gmo4tS+BATnex
	ugqkGgbTsHr1GhK8GMt7esBbSQhuYSJzTLfMsqepqkbI/d7GDIv6A5WzxeBiuqKlDg0L
	uF5UfEt/FWiE9ypS1bQnTwGbNOGWMiFqhztde1MBP6O7csWWlluGjNRFX+P3Pejg+FEF
	SSOgxIYcM2BGl1suXfMQVEB9LDEGvslC6UKFE/35GZzgYDeCUBG0yLMr2MEx8w7XZUY1
	R81A==
X-Gm-Message-State: ABUngvdp20u67HRffh2jIee6aliqWKWF1oDhCPTL1XM8aQBbMwGN8mLMeER3l/KPKdys4w==
X-Received: by 10.194.127.161 with SMTP id nh1mr5653434wjb.61.1477175980865;
	Sat, 22 Oct 2016 15:39:40 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3D96.dip0.t-ipconnect.de.
	[91.10.61.150]) by smtp.googlemail.com with ESMTPSA id
	e2sm10507509wjw.14.2016.10.22.15.39.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Oct 2016 15:39:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2016 00:39:09 +0200
Message-Id: <1477175949-6903-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1477175949-6903-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477175949-6903-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] taglib: update to 1.11
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
X-List-Received-Date: Sat, 22 Oct 2016 22:39:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

without relocation option -fPIC depending packages failed with many error like:

| <..>/arm-angstrom-linux-gnueabi/6.2.0/ld: error: <..>/usr/lib/libtag.a(modfilebase.cpp.o): requires unsupported dynamic reloc R_ARM_THM_MOVW_ABS_NC; recompile with -fPIC

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-support/taglib/{taglib_1.9.1.bb => taglib_1.11.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/taglib/{taglib_1.9.1.bb => taglib_1.11.bb} (86%)

diff --git a/meta/recipes-support/taglib/taglib_1.9.1.bb b/meta/recipes-support/taglib/taglib_1.11.bb
similarity index 86%
rename from meta/recipes-support/taglib/taglib_1.9.1.bb
rename to meta/recipes-support/taglib/taglib_1.11.bb
index d125308..e48f36d 100644
--- a/meta/recipes-support/taglib/taglib_1.9.1.bb
+++ b/meta/recipes-support/taglib/taglib_1.11.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "zlib"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "0d35df96822bbd564c5504cb3c2e4d86"
-SRC_URI[sha256sum] = "72d371cd1419a87ae200447a53bff2be219283071e80fd12337928cc967dc71a"
+SRC_URI[md5sum] = "be39fa2054df40664cb557126ad7cf7c"
+SRC_URI[sha256sum] = "ed4cabb3d970ff9a30b2620071c2b054c4347f44fc63546dbe06f97980ece288"
 
 UPSTREAM_CHECK_URI = "http://github.com/taglib/taglib/releases/"
 
@@ -30,3 +30,4 @@ do_configure_prepend () {
 	sed -i -e "s/atomic.hpp/atomic-not-exist.hpp/" ${S}/ConfigureChecks.cmake ${S}/taglib/toolkit/trefcounter.cpp
 }
 
+CXXFLAGS += "-fPIC"
-- 
2.5.5


