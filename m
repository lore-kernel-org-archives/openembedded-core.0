Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9AECD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 17:56:42 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48383.1781891794594131465
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 10:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=MVLYzxgZ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HznHZFsT7vgOEW8dHp0gmk/UwxuXfTPGEBWUTsb2cJQ=; b=MVLYzxgZpRftacXZxfhkEK+fb+
	qD1MlJJNYBYbcOE1pIZ6TIzeWGG2Tks4mdJxDeoDEsU7220dCRWEp+DlVeN9Yg5wRBLnDMjBn7CgX
	RLZRl5xSIjXRkv4IIfl1w3R3ZeF52331E8odJtPLgLOCnUs7te57tmNfuRT2U4N065/iBysNKAx+N
	fjhn9kwnb0PI+/LJIraU0U3RpaC5gCrjknmCEMOxivtuuQdSGMo1eLTrJB1ThAmYsyfkt1+7d3tU4
	0FowhDYigSzHavt7sTqj4p5pnf5bo50NGY+d1bQb6WiTevA+fjKbqa5z9cTIdUyV4y8+uQbAPRgw8
	BCTGaV0g==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:51344 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wadSB-00000003N2k-12Uz
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Jun 2026 13:56:33 -0400
Date: Fri, 19 Jun 2026 13:56:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] packagegroup-core-base-utils.bb: delete superfluous
 "PACKAGE_ARCH" line
Message-ID: <85fc1ba4-3b4f-8a5c-d5ac-2675255c0620@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 17:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239183


Given that this assignment:

  PACKAGE_ARCH = "${MACHINE_ARCH}"

is immediately before the line:

  inherit packagegroup

it's pointless to also have it afterwards.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
index b17cba4a78..4bf8007afe 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
@@ -11,8 +11,6 @@ inherit packagegroup

 VIRTUAL-RUNTIME_vim ?= "vim-tiny"

-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 RDEPENDS:${PN} = "\
     base-passwd \
     bash \

