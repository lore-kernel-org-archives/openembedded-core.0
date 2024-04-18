Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874ABC4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 07:11:51 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by mx.groups.io with SMTP id smtpd.web11.7182.1713424303443594295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 00:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=O8HEd0D2;
 spf=pass (domain: protonmail.com, ip: 185.70.43.22, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1713424301; x=1713683501;
	bh=LNiG3IgJPeIJK2OcPX+rJDUw4a8xAtbbNoScF8VNHS8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=O8HEd0D2FFUFBlpWMtHpV1Fhq/EjmXkVUd5zO+xgyTJrDuwc3DOA3WCnsnaaXTWeQ
	 bAKc2zl7jmxYrYZLeEPRPDykqlXlw9QbxOeRp/qM3i2dIjF2ni4pf5kIF+ZjtLL1no
	 B3rzC6wyImdQpgfMQ0M1xtFoUgvSlxxdp+kiKzzq2oGP/dZ9yYE4oHeYj+pxbWsPTP
	 gXAkWqAuyAgJmtqXUFlrHg4n5TZyI+FqX0I3JSpIydhIGibWrB/StSSj3rTGdWOWms
	 cnL8zj4YNKVZwHCrJgttahFoTNjRUuN8dk8dWbIlArLhVqvqMdWhD1+4OotRY7RfKv
	 61WOM47Bvtfuw==
Date: Thu, 18 Apr 2024 07:11:33 +0000
To: Ross Burton <ross.burton@arm.com>
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, "rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>
Subject: Re: [OE-core] [PATCH] at-spi2-core: set CVE_PRODUCT
Message-ID: <mkiv4gk252vepmo7tlj7nwfxhbykz7yi5hlmpmgwf2jcufwghk@rnm6hykmwmnm>
In-Reply-To: <A027C9CE-BAAB-4B81-9A17-B8B95E1837CB@arm.com>
References: <20240417142100.56518-1-emil.kronborg@protonmail.com> <A027C9CE-BAAB-4B81-9A17-B8B95E1837CB@arm.com>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 07:11:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198501

On Wed, Apr 17, 2024 at 15:49 +0000, Ross Burton wrote:
> Don=E2=80=99t you mean +=3D?  We care about issues against at-spi2-core t=
oo, surely.
>=20
> Ross

I was unable to find any (previous) CVEs for at-spi2-core, but I think
you are right. Also, at-spi2-atk was merged into at-spi2-core last year
[1], so matching both should be correct. I will send a v2 with this fix
and a commit message as well, so the patchtest bot becomes happy.

[1]: https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/78

--=20
Emil Kronborg


