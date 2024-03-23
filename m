Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E718C54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 15:36:29 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by mx.groups.io with SMTP id smtpd.web10.11124.1711208184476822923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 08:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=W1ZzVXHJ;
 spf=pass (domain: protonmail.com, ip: 185.70.43.22, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1711208182; x=1711467382;
	bh=6h8In5QiWXKOEm+rgJEZHociT2tbTgx7L6CWT/JAxOc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=W1ZzVXHJ+07C6DAAxUdxPDg5+NHwmpghM2uFAOnfi91ZuAVyiiVZ2Jd53whr09+NY
	 v1io83jhjwWFWbzAZa+pykjzRdJ8mqhNGIv/UcE91xncxE8wpe6Kfhb7upoHmnyD+Q
	 P7Psh3LU2+1aw4cGtF/+uTX7EeYolfHvBX14XJOTJNJabHdbGiTH7d3ypSTdXQOELy
	 VdgPl2000K+Ze75S1T0Vms5MIJfoGxFLhQqpw3v9g96UnJvgNFjg3uGULbaiTERQy+
	 STPBn2GMqeOubk7OljxERHZeC9NZ58t8F+2yVDasBWqfHe7lUiqgwsbaDfWIcV7HGt
	 WpnnRtmkEhkCw==
Date: Sat, 23 Mar 2024 15:36:17 +0000
To: Ross Burton <Ross.Burton@arm.com>
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, "rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>
Subject: Re: [OE-core] [PATCH v2] file: add CVE_PRODUCT
Message-ID: <zzhwz4edznplv4uf7fgc3rvmgfp3fjuunbpz35plntmew3vejv@p5atzphv5pa4>
In-Reply-To: <2018B03D-33C8-444C-90A1-4C79C39B7010@arm.com>
References: <20240320160849.231211-1-emil.kronborg@protonmail.com> <2018B03D-33C8-444C-90A1-4C79C39B7010@arm.com>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 15:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197454

On Thu, Mar 21, 2024 at 17:15 +0000, Ross Burton wrote:
> There=E2=80=99s also file:file, for example https://nvd.nist.gov/vuln/det=
ail/CVE-2007-2799.

Hm, clicking on "Show Matching CPE(s)" gives no matches, which a search
also confirms. Searching for file_project:file yield results with
identical versioning to the file project [1], and the vendor website
also matches. My guess is that NIST changed the CPE name at some point,
but I am unsure if or how I can confirm that.

[1]: https://nvd.nist.gov/products/cpe/search/results?namingFormat=3D2.3&ke=
yword=3Dcpe%3A2.3%3Aa%3Afile_project%3Afile

--=20
Emil Kronborg


