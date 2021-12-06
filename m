Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8EEC433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:21:53 +0000 (UTC)
Received: from mail1.bemta34.sdw.messagelabs.com
 (mail1.bemta34.sdw.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.52735.1638804111975411572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bwtBokYL;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638804109; i=@fujitsu.com;
	bh=NCgnZfLWkxLFdyrk/ajDkEiTNWzb1Ye/+F2dLyfax7A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bwtBokYLSDfx+oqWBQExAOSNj72McM1PpA1VfJMT1YOBoKEI2IsE6QW4/Yg/I26pp
	 QqtEc26Q79lJ+kyukG3zwPiSU6ZSXfq0GNyRLQ+Gsj25veV8wGSWQCPqPBOeJFjXMq
	 J0KRjJ5ATqD5as688Il9i/qry2zwS57HOKGwdkOOGFYtq+HhbcHqA7g40F738cgSkB
	 /2WZwTK0rt5L9NmzQZNA1FkFOkt/rfm6l/75aH8Hsr+NnyUhSADmSwg6KbbrsDS4mu
	 xr+MV0T4x6BTCCpfuA77k2uqXOAjPJ++jE6OT0PQ+e3IQb7l2J33fBh7/FVvR4t7SI
	 IW9rnwz2lXqTA==
Received: from [100.115.34.229] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 21/B1-30357-D8A2EA16;
 Mon, 06 Dec 2021 15:21:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqNurtS7
  RYGMLi8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvFj3jr2guniFXOffWFvYDwu3MXIxSEk8JhR
  4vKvvawQznkmib/XjjJBOMcZJZofrGPuYuTkYBNQk5h+6wZQFQeHiICexNV/oiBhZgEViRe/e
  9hBbGEBS4ktF5exgtgsQPHP8y4xgti8Ao4S82Y9ZAGxJQQUJKY8fA82klPASeL79vNgvUJANb
  1nP7JB1AtKnJz5hAVivoTEwRcvmCF6FSVmX26GmlMhMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo1VSUWZ6RkluYmaOrqGBga6hoamusaWuoYleYpVuol5qqW55anGJrpFeYnmxXmpxsV5x
  ZW5yTopeXmrJJkZgEKcUq/PtYOy6/E3vEKMkB5OSKK+H2LpEIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8jRpAOcGi1PTUirTMHGBEwaQlOHiURHgPagKleYsLEnOLM9MhUqcYFaXEeZtBEgIgiY
  zSPLg2WBRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMOxtkCk9mXgnc9FdAi5mAFsf0rwZ
  ZXJKIkJJqYHL9rv9wquB9Rj4Njnipp8YLbvdv3jJB9MfZDibvysw1562D7NYnsKVzVMetK1Tp
  UChiN7wgYVm1eI6D1K/LuVGarxM2bDnUuqr6kuaTV3vb2o+6zrs+k92peGOvq9WPFccKOV9On
  /r6VZYKz4k3jUqedct23y9u7+J5/fL8j6hsM46MgtoNnTtvuu+I6BNL3F/4NTnmwpbfTwNkpW
  N9PE7rOzNuFi5vNtXf2Ly9w5D3c1nQfbGE19/eBTsGJFp+K9Kx8mO/e501SF9ARcHgYOBUV8Y
  js75yLqywNVB4HWqxPsVE8JNlrEGZvNvP6ie/7oTuZl2/xTiH8cxE2Y8uZZdW3I2oDKxPL5m6
  odFbiaU4I9FQi7moOBEA3dla+10DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1638804108!43341!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12956 invoked from network); 6 Dec 2021 15:21:49 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Dec 2021 15:21:49 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AC3921009F1
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 15:21:48 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9EDCD100242
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 15:21:48 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 6 Dec 2021 15:21:32 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] vala: upgrade 0.54.3 -> 0.54.4
Date: Mon, 6 Dec 2021 23:21:17 +0800
Message-ID: <1638804078-8183-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638804078-8183-1-git-send-email-wangmy@fujitsu.com>
References: <1638804078-8183-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:21:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159239

Changelog:
===========
 * Various improvements and bug fixes:
  - codegen:
    + Use CCodeConstant for member access of constant symbol
    + Emit constants without initializer list in defines section [#440]
    + Add and use CCodeConstantIdentifier for accessing constants
    + Check required length of enum type name for GType support
    + Add missing check while overriding virtual async interface methods [#852]
    + Drop inconsistent space for ObjectType parameters
    + Accept CCode.type attribute on parameters [#876]
    + Fix CCodeUnaryExpression.write() for PREFIX_INCREMENT/PREFIX_DECREMENT
  - vala:
    + Improve error message for invalid handler of dynamic signal
    + Using SignalHandler.disconnect() is required for dynamic signals
    + Check for unavailable value-type of variable initializer [#1253]
    + Add [Profile] as known attribute for methods
    + Report error on missing gio-2.0 package for async constructors
    + Fix signals with generic return
    + parser: Split out Parser.parse_switch_section_statement()
    + parser: Better handling of misplaced switch sections [#1246]
  - genie:
    + Amend text of indent and dedent for error messages [#497]
    + Accept INTERR token before type arguments when parsing type [#1245]
    + Properly handle plain "get" or "set" property accessors [#1248]
    + "exception" is the expected string for TokenType.ERRORDOMAIN
    + Accept accessibility/async modifiers on "construct" creation methods [#1235]
  - girparser: Accept "sealed" for transformed records and compact classes
  - gtkmodule: Improve error message for invalid signal element in ui-file
  - build: Add "test-update" which passed UPDATE_EXPECTED=1 to refresh c-expected
  - tests: Rename colliding test cases to avoid conflicts

 * Bindings:
  - alsa: Add more API and fix a few things
  - gnome-desktop-3.0: Some parameter fixes
  - gstreamer: Cherry-pick bindings fixes from 0.56
  - gstreamer-base-1.0: Some parameter fixes [#1255]
  - gtk4: Update to 4.5.0~cd9b7307
  - pango: Cherry-pick bindings fixes from 0.56

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/vala/{vala_0.54.3.bb => vala_0.54.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.54.3.bb => vala_0.54.4.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.54.3.bb b/meta/recipes-devtools/vala/vala_0.54.4.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.54.3.bb
rename to meta/recipes-devtools/vala/vala_0.54.4.bb
index d3390b2ea8..695f64e336 100644
--- a/meta/recipes-devtools/vala/vala_0.54.3.bb
+++ b/meta/recipes-devtools/vala/vala_0.54.4.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "ed1d5fe4cbc0cd2845d0de4f1ffefb15afb06892d230c7cca695781672e8fb60"
+SRC_URI[sha256sum] = "6051270a2fc30de023c88562566f2f6043e67beb4da4b799c14cdf12048eb40c"
-- 
2.25.1


