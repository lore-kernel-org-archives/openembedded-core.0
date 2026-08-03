Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B129C55822
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 22:03:00 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4236.1785794573281833994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 15:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=M82r5mzS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260803220251f6e92baeaf00020711-aw5kg2@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260803220251f6e92baeaf00020711
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 00:02:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=n9UeH510KsufpwALH8d0ITttcixxpPAuG1v0Zj61Eak=;
 b=M82r5mzS43QCyQPCvTbd0+csKgKEbX+vBaSTk5HOlxtjtq8XQAiegmNp++lthQh1w3888y
 7D6gqVzQ6piKUCkbcoSDAujR8I5gRvMAeoMI/TRhja9KQBtEVzOPrtEK0W7GTpqenFGLiXwA
 A7/34+SkCQstT6vZ1pXa5JdwoCC5rAd+09zEh2XC5ID7Ddqh5ZHZiYgFaW8TBMLzg0ZNQARN
 gFbuwV06YMbPPEW5/lE2Qqj519IS49TJKVwqCJu6UWzKo6rw7l5tR307QfhVQHcmS4plIFYm
 JcuWgJ+L8Y/bBVs9fTw0rY1sQDgCYwSfzyPuhDDqDf37rsIJaeD4KPXA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 08/15] python3-pyasn1: upgrade 0.6.2 -> 0.6.3
Date: Tue,  4 Aug 2026 00:01:48 +0200
Message-ID: <20260803220157.1520377-8-peter.marko@siemens.com>
In-Reply-To: <20260803220157.1520377-1-peter.marko@siemens.com>
References: <20260803220157.1520377-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 22:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242664

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- CVE-2026-30922 (GHSA-jr27-m4p2-rc6r): Added nesting depth limit to ASN.1
  decoder to prevent stack overflow from deeply nested structures
- Fixed OverflowError from oversized BER length field
- Fixed DeprecationWarning stacklevel for deprecated attributes
- Fixed asDateTime incorrect fractional seconds parsing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(From OE-Core rev: a82592f0a7d104f617f206fe0b9bcaf7f9df3efc)

Release notes:
* https://github.com/pyasn1/pyasn1/blob/main/CHANGES.rst#revision-063-released-16-03-2026
* CVE-2026-30922 (GHSA-jr27-m4p2-rc6r): Added nesting depth limit to
  ASN.1 decoder to prevent stack overflow from deeply nested structures
  (thanks for reporting, romanticpragmatism)
* Fixed OverflowError from oversized BER length field
* Fixed DeprecationWarning stacklevel for deprecated attributes
* Fixed asDateTime incorrect fractional seconds parsing

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python/{python3-pyasn1_0.6.2.bb => python3-pyasn1_0.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.2.bb => python3-pyasn1_0.6.3.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
index b44e877447..60b38c57c5 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "9b59a2b25ba7e4f8197db7686c09fb33e658b98339fadb826e9512629017833b"
+SRC_URI[sha256sum] = "697a8ecd6d98891189184ca1fa05d1bb00e2f84b5977c481452050549c8a72cf"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

