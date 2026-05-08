Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B88ECD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 15:10:37 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.583.1778253030277934565
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 08:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=kUr8I/Xl;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=an1qpVDoKToYTtIqcduvXLXinYdKego7xN4zQ+hhCnI=; b=kUr8I/Xln2aN+pNzdshyiyat7c
	goqzNeXAQpfD6TmmIY/2BvB9vxa6hF03FHJAU411Kb4TSpHU0PwBsfh69plFnWPyYpDdsZQHCfJ3S
	sTohifAumNrDY98/15jWq6r6NUEDXgL3hHo0W8R3uYon1bzzpkpqJe5qoSiOPTtG6A/Um8AK/5Xum
	csysoAzQoRNPKKiY8ip3La5Cyb5REm6tsL4Y1XrvJADtyquPwA8IeOmWZHEUSitP98nrq6laD6su3
	w4oHv1b7fX8z1SyDrLDZJkrqJ5iD/DLXKv3bAJn8PwKrY00+97PgJUhUcM+hxbbmLd6CMrkT+zKUA
	3DRTy/yA==;
Received: from [147.129.179.166] (port=57074 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wLMqQ-00000003ute-1Iun
	for openembedded-core@lists.openembedded.org;
	Fri, 08 May 2026 11:10:28 -0400
Date: Fri, 8 May 2026 11:13:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] features-check.bbclass: add reference to required
 TUNE_FEATURES
Message-ID: <ead0e35b-f5c3-f21b-b573-2fd7cf8f0f83@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 15:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236727


While commit a8ef7339ecb9eee909224e7cf23ccd48ef105d93 added the
string 'TUNE' to add support for checking required TUNE_FEATURES,
the comment was not adjusted appropriately.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/classes-recipe/features_check.bbclass b/meta/classes-recipe/features_check.bbclass
index 46d8243cb6..d69cfb8309 100644
--- a/meta/classes-recipe/features_check.bbclass
+++ b/meta/classes-recipe/features_check.bbclass
@@ -1,6 +1,6 @@
 # Allow checking of required and conflicting features
 #
-# xxx = [DISTRO,MACHINE,COMBINED,IMAGE]
+# xxx = [DISTRO,MACHINE,COMBINED,IMAGE,TUNE]
 #
 # ANY_OF_xxx_FEATURES:        ensure at least one item on this list is included
 #                             in xxx_FEATURES.

