Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A030D37E33
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:34:15 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10274.1768397649917246999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:34:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wPudQ5Kl;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CA50B4E420D3;
	Wed, 14 Jan 2026 13:34:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0D076074A;
	Wed, 14 Jan 2026 13:34:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 556D310B681E2;
	Wed, 14 Jan 2026 14:34:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768397647; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oS+CjCvkkqUZFbpZ4VMVLzyfRIW4456yQNSxOzglx2I=;
	b=wPudQ5KlB/6HLTMb3xNXkcTMJR7XC/Fi5+bNnB6++ZtNKMCHbuX3vwVDVv2lfNj+BQzXxA
	G+Lzbs+fxV2jk6aFwWABa3/o/msMFmNDAlYflZXtwzCloRWNLnBPPh0uazBnh6z5QyYZEc
	g61MGrp0sl/0Z3nQZadQx1fRpbsa6d9Ik0G9YugYWd8Gx+fdPDjwiyxJnJS3/XGntbHnTl
	YNbgCF3muDbG9wdO0kvab/g3x0QOsy1cxXDnA7m/nccw2fwr1xnPDxUMqCNACPFIpaOYpI
	hQohPhRcNU+/hQmfLTRI/NjdsPJhyhyDNCASXJYjf8CPXQHJtdX07nDqIvfGSw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 14:34:05 +0100
Message-Id: <DFOCNB99ON3M.1501I9LD79WEW@bootlin.com>
Subject: Re: [OE-core] [PATCH v3] overlayfs: Fix the QA skip for ignored
 mounts
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <uvv.mail@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <05b0f313e8a3d069054657d2293393d3cd76bc49.camel@pbarker.dev>
 <20260113093218.348105-1-uvv.mail@gmail.com>
In-Reply-To: <20260113093218.348105-1-uvv.mail@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 13:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229330

Hi,

You have sent multiple versions of some patches (v3 for 1/4, v2 for the res=
t,
I think): it's not straightforward for maintainers to follow which patch ve=
rsion
to apply.

I also see Paul has made some comment about the naming order of the patch
titles.

Can you take Paul's comments into account, and can you please re-send the s=
eries
with the proper versions of the patches? All patches should have the same
version.

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


