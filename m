Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830ECD3B7F3
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 14:50:52 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9622.1765205445320985028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 06:50:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=rUi9Yzt3;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wlPUAyrAc8iG608F8tDVDy9KOw5+SebVwhBiy8y7k6c=; b=rUi9Yzt3h/qcCtLgUJkZdIWSSZ
	tx/ENXiw9662dMOQrzbKw103bFOUecptwpAzy/lxVuaGZHpUsQn2tmlNDnWEpjceg2+9MclwCf+nV
	OcFPQ9F2q+RYkEEnj81Kdk5MsiLtmaTEl3uVnGvtjeCyrdtPdjI2R/eXDcBubDYIT9BxXJzbluMlQ
	PQuXda7yFgndB38uhUumyoCCZoxHUWmyTifIHkd+djDgOHQwjVlkVsfBvosGtjhJuAK05wwA/CKxi
	opIJgat3R1pfCLJ4eco12/dxA7yF7MLz0GzYavKC7VSUF5TXj3XYeSwspjetqMhPA4CT8jJTEmooV
	4uUEpeUg==;
Received: from [147.129.179.166] (port=55474 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vScZX-0000000Ci4z-35k2
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Dec 2025 09:50:43 -0500
Date: Mon, 8 Dec 2025 09:52:11 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Some nitpicky pedantry about ptest usage coming shortly
Message-ID: <7ba35379-0570-b7bb-d7ad-b4b26833dc32@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 14:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227396


  As part of my upcoming tutorial on ptest, I want to pick on some of
the oddities and inevitable obsolete ptest-related cruft in some
recipes so that I can ensure that my tutorial is accurate and up to
date, and here's why.

  Obviously, there's obsolete stuff in many OE recipes, but most of
that doesn't hurt anything -- a lot of it is caused by recipes doing
things that were necessary once upon a time, but as class files were
updated and extended, some of that stuff was now duplicated in two
places. Again, it just means that some operations were being done a
second time harmlessly and unnecessarily. So does that matter?

  Well, sort of, since as the docs and the source are not always in
sync, there is this adage that, when in doubt, RTFS ... which is
typically good advice, unless the source includes some of the
superfluous obsolete content, which has the potential to mislead the
reader as to what it should look like.

  Which is why I will be asking picky questions about ptest, just to
make sure I can explain what one not only *should* do, but what one
should *not* do, even if one sees it being used in current recipes.

rday

