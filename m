Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6E6C36016
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:20:50 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.50800.1743084830438415876
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 07:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adriaan.schmidt@siemens.com header.s=fm2 header.b=S+5L3CPW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-526363-20250327141301d8e0c2351e7ba2f8f9-skyn0_@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250327141301d8e0c2351e7ba2f8f9
        for <openembedded-core@lists.openembedded.org>;
        Thu, 27 Mar 2025 15:13:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adriaan.schmidt@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=G2gNTahZx0a/cVTlCeSbIbFuZHWYoMraBSLly8nLzzU=;
 b=S+5L3CPWt8tXdFMOj3hDa8nJgLryiOzz1/zrS9Nxm28S1oMKWRKGlyM4m2JxLvqBDmNDb3
 AU/BgUu6tztM/MbSVf3Ex35bShAk3GnoNPljXq8xI/F6XQ6RDkfoc1oFTrDeU99kbXHQJivm
 wrbUeaZhtUOOZ6xyxbqzPwHZr9ysP3EMTT2G2OPTxJYmp2R+tu201T9dbO44zTqTcIqgUESq
 SRs9yghnOFKTQqBTLw2+83EgFPkVhoXFpQDQ6tyaA8+7fsRsKk56GPUWRqYDdx45xYcAzeBU
 0FN7owvFABOg4qlh+/Gb41A3j6IXzFe/YTLeRkVa9iZt3hd8j0XWSx0Q==;
From: "Adriaan Schmidt" <adriaan.schmidt@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adriaan Schmidt <adriaan.schmidt@siemens.com>
Subject: [PATCH 1/1] libunwind: update 1.6.2 -> 1.8.1
Date: Thu, 27 Mar 2025 15:12:58 +0100
Message-Id: <20250327141258.2690906-1-adriaan.schmidt@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-526363:519-21489:flowmailer
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213749

Releases >1.6.2 are not hosted on the savannah server, so changing download location to github.

Signed-off-by: Adriaan Schmidt <adriaan.schmidt@siemens.com>
---
 .../libunwind/{libunwind_1.6.2.bb => libunwind_1.8.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libunwind/{libunwind_1.6.2.bb => libunwind_1.8.1.bb} (92%)

diff --git a/meta/recipes-support/libunwind/libunwind_1.6.2.bb b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
similarity index 92%
rename from meta/recipes-support/libunwind/libunwind_1.6.2.bb
rename to meta/recipes-support/libunwind/libunwind_1.8.1.bb
index b2e7ec7719..faf056762f 100644
--- a/meta/recipes-support/libunwind/libunwind_1.6.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
@@ -6,14 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d80c8ed4062b8339b715f90fa68cc9f"
 DEPENDS += "libatomic-ops"
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV}.tar.gz \
+SRC_URI = "https://github.com/libunwind/libunwind/releases/download/v${PV}/libunwind-${PV}.tar.gz \
            file://mips-byte-order.patch \
            file://mips-coredump-register.patch \
            file://0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
            file://0001-src-Gtrace-remove-unguarded-print-calls.patch \
            "
 
-SRC_URI[sha256sum] = "4a6aec666991fb45d0889c44aede8ad6eb108071c3554fcdff671f9c94794976"
+SRC_URI[sha256sum] = "ddf0e32dd5fafe5283198d37e4bf9decf7ba1770b6e7e006c33e6df79e6a6157"
 
 inherit autotools multilib_header
 
-- 
2.39.2


