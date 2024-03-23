Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE330C54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 16:06:49 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by mx.groups.io with SMTP id smtpd.web11.11921.1711210004247657688
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 09:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=EkgAyIlI;
 spf=pass (domain: protonmail.com, ip: 185.70.43.16, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1711210002; x=1711469202;
	bh=UKOh9dnJlTKHGQZDZH+ESpevkUXb56YrkzlgwoC4MPk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=EkgAyIlIqvNAcwETSxo9jW/UNrV1ARXon8NXEZByuYvCQ+SnOeX7qhQsqQZiLeelR
	 GBo/lKq0WXD8iQ1XK/c9j5szCmb/RapqfisQpMXH23dklUTtUHzJksvJ1M1ULW76J9
	 DSlNI7+2pNYfDR+jpONmRAT8KJzw1ZjUe4Gsp0tmYmSer02tMB+HNIMP7qgZdXbumG
	 8pG+L+D38LgWRXU7eMEFpNdNCvzEj/TnvJ0jLfh9Rp1tHbUu8cxgdavaQ3O2sEL3dg
	 eMsMdVc6/u8+QM7fkBuLLxFM77AgTQs2nmT3vw/chq2mcF7oMfT4N0w47OoaNh00ds
	 BOvnYUsuCz/Ew==
Date: Sat, 23 Mar 2024 16:06:34 +0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: openembedded-core@lists.openembedded.org, rasmus.villemoes@prevas.dk
Subject: Re: [OE-core] [PATCH v2] python3-pytest: add CVE_PRODUCT
Message-ID: <6hdqm4boyww4vbn6bc5qyp7wt4mpb4vqczagqiae6zocdrajvu@fd3t75wy35sf>
In-Reply-To: <e84b352028020f21749dc07088c22c2d1d10bd38.camel@linuxfoundation.org>
References: <20240320160910.231632-1-emil.kronborg@protonmail.com> <e84b352028020f21749dc07088c22c2d1d10bd38.camel@linuxfoundation.org>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 16:06:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197456

On Thu, Mar 21, 2024 at 12:13 +0000, Richard Purdie wrote:
> I worry this is a misfiled CPE rather than general statement that
> they'd always use this for pytest CVEs. We might want to talk to them
> about tweaking it to be consistent? I'm certainly unsure about taking
> this patch as it might mask future issues?

I made a mistake. This CPE belongs to the py project by pytest [1]. The
vendor name being http://pytest.org tricked me. Searching for pytest in
the NIST NVD database yields a single CPE: pytest:py, so I think it is
fine to keep it as is, even though a CPE might appear as pytest:pytest
instead of python:pytest.

[1]: https://github.com/pytest-dev/py

--=20
Emil Kronborg


