Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F54CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 13:25:24 +0000 (UTC)
Received: from mailer8.gate185.sl.smtp.com (mailer8.gate185.sl.smtp.com [192.40.185.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7242.1778677910012644241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 06:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@centricular.com header.s=201701 header.b=ZLp6cVGu;
 dkim=pass header.i=@smtpsendemail.com header.s=smtpcustomer header.b=dyQ5oFkQ;
 spf=pass (domain: centricular.com, ip: 192.40.185.8, mailfrom: nirbheek@centricular.com)
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.200] (unknown [10.138.12.210])
	by mtl-mta01-out1 (Halon) with ESMTP
	id c9768c03-3763-4328-9a25-fd685212df18;
	Wed, 13 May 2026 13:11:49 +0000 (UTC)
Received: Received from 10.138.12.40 by Caffeine (s0-aws-app2-swarm-manager-5)
 with SMTP id 79437669-3dc4-4459-98ee-14828bc2c1db  for
 openembedded-core@lists.openembedded.org;
  Wed, 13 May 2026 13:11:11 +0000 (UTC)
Feedback-ID: 9075006:SMTPCOM
Received: from hermes.centricular.com (unknown [138.201.245.53])
	by s0-aws-app-mta-in-1 (Halon) with ESMTPSA
	id 79437669-3dc4-4459-98ee-14828bc2c1db;
	Wed, 13 May 2026 13:11:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5EA8F9CB0C;
	Wed, 13 May 2026 15:11:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centricular.com;
	s=201701; t=1778677868;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cTH0evZxJ08qQZrOSDMT3JwjU6zEq8o1l3aH0Zq3de8=;
	b=ZLp6cVGu2M69khF+hQ3cZszAehnWsBQggM5K17u+89g5GS9Aq4xSAzZ8VkzV/6jcDHwG+6
	RBjIpsdPIgKLJwdlhSwtf2o9gM/O/E31hcF3DaNpooWZUOuWvlJWhi1R/69TB+G2RhtieP
	PuKrzytmWbBzKYA0APWIccAMCo655G0tyc5tzH1RzmAVGa9k4dwXPumHSrdyWPhmjlyeJM
	XVJyopmCqp32K02DWmKtVfDsqQ0RUs/82E5kG0zxHMXgxNAV/F5iHWiHlRYNtFQnhzdYL3
	wylQZ58DIaAEsJrlEj/O8rKzkQgeJMn0sPzEH1pddAoZo+7P5qGkJupxWNk0Aw==
Message-ID: <aa1e4940d5cf8b60f404822679a601ddf6b7794e.camel@centricular.com>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-plugins-rs: add new package
From: Nirbheek Chauhan <nirbheek@centricular.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: tarun@centricular.com, openembedded-core@lists.openembedded.org,
	sebastian@centricular.com
Date: Wed, 13 May 2026 18:40:54 +0530
In-Reply-To: 
 <CANNYZj9CND_HxCwiWUyt1Boej19_5Nnm76NXhZ+NtazYD-Zukw@mail.gmail.com>
References: <20260511133450.50595-1-tarun@centricular.com>
	 <20260513071155.1215141-1-tarun@centricular.com>
	 <CANNYZj8sYaa=hGCCWViiOQojN9TjuroAPs7FHhVLCT=g+Ut1=w@mail.gmail.com>
	 <885d89d6d131a5b1649189936537154f290e1dc6.camel@centricular.com>
	 <CANNYZj8TutyAOc_Kz2+r02iDY8VQ_JaoGk5oHbrZSk5Er=UYBg@mail.gmail.com>
	 <f30852d76ecd85f3f437f508ccbbb2591f410353.camel@centricular.com>
	 <CANNYZj9CND_HxCwiWUyt1Boej19_5Nnm76NXhZ+NtazYD-Zukw@mail.gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-SMTPCOM-Sender-ID: 9075006
X-SMTPCOM-Tracking-Number: 79437669-3dc4-4459-98ee-14828bc2c1db
X-SMTPCOM-Message-ID: 892850dd-9fc7-40d8-beef-a084452e2242
X-SMTPCOM-Payload: 
 B3-r0ZtNZtx4K-_pIAiGfxzxO5jGGxEqlohyX_bHv8X-KX2cfSK-5ZRnQDQsmqNQE2qUHkFmtsC9UkPsjyMJG1CKZ7nPV8uxmlhIX_E9w4rd7OX2zIhOMI2v66ykgU4sABpAExqx0vAsqtWcPcLKNEksnZbG7cA1Coo8skjpNeFxDDoHrypCLgsuQ3a2Z8h6YzM4sOQV0bigYZbq4H0BAA==
List-Unsubscribe: 
 <mailto:abuse@abuse.smtp.com?subject=MailStop&body=892850dd-9fc7-40d8-beef-a084452e2242_9075006>,
 <https://api.smtp.com/v4/unsubscribe?mid=892850dd-9fc7-40d8-beef-a084452e2242&sid=9075006>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpsendemail.com;
 i=@smtpsendemail.com; q=dns/txt; s=smtpcustomer; t=1778677902;
 h=feedback-id : message-id : subject : from : to : cc : date :
 in-reply-to : references : content-type : content-transfer-encoding :
 mime-version : list-unsubscribe : list-unsubscribe-post : subject :
 from : to : cc : date;
 bh=cTH0evZxJ08qQZrOSDMT3JwjU6zEq8o1l3aH0Zq3de8=;
 b=dyQ5oFkQNKKUGJY8XxB15L+qURTtFzO+bR6pIbd+OWGo5fphf9hZ5qN1rkuWz1HpL4z8A
 0EHe6/TXCfs2I6nkkCvgLB6oXRx5IpOPshLLAtSAClbvt0N4dTZKJlwMuOo3xf9FPOJfDOK
 EKdZvd/3tNp2ZTpPChtZMqsDIW6Xjl6fgeeCeoa4QbKM3aIyZQ5I6dX09oPGfjS1fhNJUHy
 UAtb2sFH5btMR72XS9EvjYiusqdrwvBxbYKeo76J+u5sR0wRxoC//EKsPX5XbZIT+M/sv1g
 K0u8xID9HNVk/ri3teJtJ9aqAVi89lar2Fp71NFS9xn39R+NW9YWe6cOva1w==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 13:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236976

On Wed, 2026-05-13 at 14:15 +0200, Alexander Kanavin wrote:
> Are these copies listed in Cargo.toml of the plugins? If so, they
> shouldn't be manually specified in SRC_URI, instead they should be in
> the auto-generated gstreamer1.0-plugins-rs-crates.inc, and the build
> process should be able find and use them.

Yes, but only with the plugins published to crates.io. That's how
`cargo publish` works. Tarun is exploring whether to switch to that,
and split this recipe into separate recipes for each plugin.

> There are concerns over discovering and fixing a critical security
> issue in one of the components, when they are vendored into the
> source
> tree this way, all because the compiler team can't settle on an ABI.
> I'm sure you've seen that many times before. The issue is general to
> rust (or node.js or any number of similar approaches to dependency
> management) and not gstreamer-specific, but I still wanted to mention
> it. The problem is, when it happens, it's the integrators that have
> to
> deal with it, not the compiler writers and not the component writers.

Yeah this is a problem for projects that aren't written in Rust, and
this is why Debian ships its own source packages for all the crates,
and they would update / patch those crates independently of what
Cargo.lock says for a project. I don't think that infra exists in Yocto
right now.

Rust projects would just run `cargo audit` and that would recursively
update all crates to fix security vulnerabilities, but that breaks if
you're using Rust to create C libs.

Cheers,
Nirbheek

