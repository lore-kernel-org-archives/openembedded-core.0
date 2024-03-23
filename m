Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92491C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 16:09:19 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by mx.groups.io with SMTP id smtpd.web10.11837.1711210156730000648
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 09:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=eVe8fk1L;
 spf=pass (domain: protonmail.com, ip: 185.70.43.22, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1711210154; x=1711469354;
	bh=fmPgQMA6gXdcsZemQDXKYqUI0yF8P+f0sGVxw+lPy9c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eVe8fk1L/+aFxN3PdgzC3zGx8DK0GYuQtgh7Nrc+53iVKPFauqZqRXy99PkFpo6k7
	 iqJCe3jtWPRH2nY6txGQuEqLQuZvNeuHnax8KRDXnOGzs5oz8yi45XC02kBHa/FjG3
	 OhQuCdnl8pgTLVFp2F9VeLD822GG7ZppeFcHgOjyGOaCV5FSiMGfbHvmPJrr0iSJlJ
	 7D5k0z5eTCnAk5b+hpot4oxDpq6zKisRHrE1bzdYOG1kiKVmDipJmAADxF0wHhKXN6
	 44Ixmzoz1njUZzFWncX12Za9BjgA+V+/KrrRZm/rhNDsnLkogZoJgg7iNbdM995Ygr
	 qB4RBsl3LHG8A==
Date: Sat, 23 Mar 2024 16:09:06 +0000
To: Ross Burton <Ross.Burton@arm.com>
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, "rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>
Subject: Re: [OE-core] [PATCH v2] python3-pytest: add CVE_PRODUCT
Message-ID: <rnubbhuqvwq7v7fr7gkh3qspleyjkqwic4mejwaapeymujmf6a@54ax6xhjtn6a>
In-Reply-To: <4DA87E3A-7D0B-46A7-B937-E5E91072ABB2@arm.com>
References: <20240320160910.231632-1-emil.kronborg@protonmail.com> <4DA87E3A-7D0B-46A7-B937-E5E91072ABB2@arm.com>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 16:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197457

On Thu, Mar 21, 2024 at 17:10 +0000, Ross Burton wrote:
> I can only find two CVEs with the CPE pytest:py and either of them are ac=
tually related to the pytest package:
>=20
> https://nvd.nist.gov/vuln/detail/CVE-2020-29651
> https://nvd.nist.gov/vuln/detail/CVE-2022-42969
>=20
> These issues relate to https://github.com/pytest-dev/py which is not pyte=
st.

You are right. This patch should not be pulled.

--=20
Emil Kronborg


