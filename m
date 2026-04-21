Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153BBF89240
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:35 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20470.1776765449302436805
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BBiUULJ+;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765449; x=1808301449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+at9JwDw6nh34CXKRplckuRNIF/MPuUeovq3ZRXbDjk=;
  b=BBiUULJ+DBxjXhDqKfxEzIgSMCM6akzatXZ0xwsNIoRfN+4xixrO3vI5
   pI7rV6wGKcFCdaTSul+L8qSpGP4GtPTNltV6PgA+uV2toiuxdF6C0QLVC
   f1qTNPQKw72aDXQq3p775IlF1JPMuzhjtMSMurlr/XEL3sGo3wiTfEE0C
   9/RfFe+S4NAQfOpofPBMCgrIeQjYlpDiajA4gZugCqzQ9zM+jMljjGmyE
   dGT0lRTwDpqTsnRfiJIAd+ThLZUODQeBiMz2iA+V0+L3pUqM+77xdZ6aU
   z7nvI33oc9w09wufHCM5MszgcxSIaLuHXdvGnW38kKI3NWeAZ9fxMT2bz
   w==;
X-CSE-ConnectionGUID: fHj+/WsoSMylVSzhvLE70w==
X-CSE-MsgGUID: 0qsmAYbLSVG8xMc72Ytccg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="225157931"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="225157931"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:57:27 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CDF0042A338
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:27 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 70E3D10003B9
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id E8BC414000E6;
	Tue, 21 Apr 2026 09:57:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 47/49] vala: upgrade 0.56.18 -> 0.56.19
Date: Tue, 21 Apr 2026 17:55:57 +0800
Message-ID: <20260421095559.1856-47-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235655

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog
============
 * Various improvements and bug fixes:
  - codegen: Minor refactoring of TypeRegisterFunction and its subclasses
  - codegen: Use G_TYPE_FLAG_NONE when targetting glib >= 2.74
  - codegen: Use g_once_init_{enter,leave}_pointer when targetting glib >= 2.80
  - codegen: Propagate default_value_on_error from parent struct
  - codegen: Return default_value_on_error on precondition failures
  - gdbus: Avoid unused variables in method call and properties getter/setter
  - gdbus: Allow GLib.VariantDict for a{sv}
  - gdbus: Do not provide unintended read/write access to properties
  - parser: Fix statement error recovery
  - vala: Use reference-transfer as needed when transforming
    conditional-expression
  - girwriter: Don't use instance-parameter inside function elements
  - girwriter: Add the doc:format argument in the .gir file
  - libvaladoc: Do not error-out on doc:format
  - libvaladoc: Add compat layer for gvRenderData to cope with API break

 * Bindings:
  - glib-2.0: allow FileUtils.open_tmp's first argument to be null
  - posix: add UTIME_{NOW,OMIT} constants for utimensat
  - gsl: Deprecate gsl_linalg_cholesky_decomp in favour of
    gsl_linalg_cholesky_decomp1
  - libxml-2.0: Add more fields to ParserCtxt
  - gobject-2.0: Set default_value{,_on_error} for GType
  - glib-2.0: Fix *.add_once () callbacks
  - gobject-2.0: Fix return type
  - gobject-2.0: Add Type.to_string ()
  - gstreamer-1.0: Fix ownership of Caps.full*() parameters
  - glib-2.0: fix a typo in a parameter name
  - gtk4: Update to 4.21.6+83716767
  - gtk4: Make all Gsk.RenderNode and Gsk.Renderer shadow their parent type
  - gtk4: Fix CursorGetTextureCallback declaration

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/vala/{vala_0.56.18.bb => vala_0.56.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.56.18.bb => vala_0.56.19.bb} (96%)

diff --git a/meta/recipes-devtools/vala/vala_0.56.18.bb b/meta/recipes-devtools/vala/vala_0.56.19.bb
similarity index 96%
rename from meta/recipes-devtools/vala/vala_0.56.18.bb
rename to meta/recipes-devtools/vala/vala_0.56.19.bb
index 16e5d2b7c8..ae31c2f991 100644
--- a/meta/recipes-devtools/vala/vala_0.56.18.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.19.bb
@@ -20,7 +20,7 @@ GNOMEBASEBUILDCLASS = "autotools"
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "f2affe7d40ab63db8e7b9ecc3f6bdc9c2fc7e3134c84ff2d795f482fe926a382"
+SRC_URI[archive.sha256sum] = "5ad7cbbfcc0de61b403d6797c9ef60455bfbebd8e162aec33b5b0b097adfb9d5"
 
 SHRT_VER = "${@gnome_verdir("${PV}")}"
 
-- 
2.43.0


