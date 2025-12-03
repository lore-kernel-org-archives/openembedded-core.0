Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB1ED12D63
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 13:54:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15686.1764770060656018416
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 05:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=QZaAqOf/;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YwdakNOfyBBOoYP1sYXT1suo6WLE6j+SGYn+dsn2m6I=; b=QZaAqOf/h+8ef9W3JeRWQnVagZ
	a66EiX8AGaAlZdkW4Neq4i7yOICKoNSMOIe3i2hgzJsPnPeApHghVYQfpPoOwHvnJOqFQaUFzTNPh
	55h+AZ+QywostpdopinpZjY8OEmHIRZGpfYSMSv/jMWz2p9+t6y3gDxzy9Ma4gZANlKJEu8qQH1LC
	UX2NqRodz1NKjYWJytsq7QKiThM4H6ZqmTEoC+Q0rlB7NfyADAANGmbLxdiiEve/3ClHflydLGNwn
	iJPBFWTrRtIc5HNF2qU/QB/cRkWvdZDwaUsI5SpUeCAm+yl08FSIYmCkU8Y6iHN75HsWvQxRSCBRb
	pNEsLWGQ==;
Received: from [147.129.179.166] (port=45212 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vQnJB-0000000CxRS-1egp
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Dec 2025 08:54:19 -0500
Date: Wed, 3 Dec 2025 08:55:36 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: why would a ptest-enabled recipe have RDEPENDS include
 "ptest-runner"?
Message-ID: <10f454b1-e85a-81e9-d5e9-9720cdc3d427@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 13:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227225


  currently writing a ptest tutorial/presentation (maybe i'll offer to
give a tutorial at next year's virtual summit), and ran across this
oddity in OE's cpio recipe:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/cpio/cpio_2.15.bb#n72

  RDEPENDS:${PN}-ptest += "ptest-runner coreutils"

why would that variable for *any* recipe specify a run-time dependency
on ptest-runner? that seems odd.

rday

