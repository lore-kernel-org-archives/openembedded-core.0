Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11269.1795082585864202083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 02:03:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=j1TH9r3f;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=jYqu8s7c;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 99B9E1400155
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 05:03:04 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 19 Nov 2026 05:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795082584;
	 x=1795168984; bh=si+Jvoz6d3fX2vD1kM4PvnZ0DYPXJOdyLTTj0O7Z7PY=; b=
	j1TH9r3fsZyOXgXqt92Ly/H3jQSKjMzFWtZUux6FZKUWzh0tIOrKrGJXnq0SfKKt
	TjC8AZ06kZYVeHNIyGs5ZkAoJgSwO7+uC0MX3TulAa7a1P+klZPdgX8EoT4RYibI
	0Ov91d80Ah/OGysNha1L3bQnUpzFQruPxmZ55YWt8oqATazLL95gAAsytYXd3y8y
	eLB5/hNB4UwPR71USIZqUw81zaTEuKGnTuBREulALfny006mfKYqohEoQYT7ng2E
	Nq4ZdCFDKpK1dAcXC3C8axY6ZO9bHlDtIdLRuIgZMRQMpFKtDyTgDV8J1AkBltw+
	Dozmy/Xeth5hNYNp0P3AuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795082584; x=
	1795168984; bh=si+Jvoz6d3fX2vD1kM4PvnZ0DYPXJOdyLTTj0O7Z7PY=; b=j
	Yqu8s7cycjyiXoj6q7PG2/n9ojStutx0qEtXOTy6ykx7IyE8Qb83SWWowJC0AQz1
	BwaztbfXAAvEn23JF0k8n9MpDTAuj4TB8d5NKNaik22+wIUHo/cBjBxCX+jMERSL
	H0odpyWFsPxpufOT4qUIZulA8fzaPuRZk22xhs9a3xuzq9eB5uPnjtkxm8pl0JbO
	vVZDHvu+LWmBryRnroqpPUpQtjcRZZpAOFNftOv9fl499UJf/ZRDsG3CF4K272g3
	7w5OJVYqYr5DSgN/mfjMhd2qoMqJxR7GoyzHPRIocj3PxP/N/Loag+KMx/YHRwCE
	D6UWNzfdKozyD/iUfQlcg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795082584; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:oK3YJc2frQ/ljZ3ZK+gLP6AgKltUkzygeE6BeGlimMwFqSr
	+jFskHXKEbtnoLodWrOU6vSCmvBq5l1P0quFHOEVOWbUwtFpQJ0ItGBAcCH8bQlI
	+rNFFxpqhHCRgFgQaoMEJ1VvPoSZw52dhlE+Lm+g+Fqb/Kp+isF51viMID34pYGd
	S4+XXs02YKq+LE8cJW4rKzwoMiRFygNK/2G/Uyd07bXMzPJHxxjwsqL9k59pK6JR
	KPOEUyYE54xS7DZ1+6gWVNiPFUtqpji4fAV7dvZUFSZ9m3REeQYvrSwXDPUQ2eQ1
	GP07Lmu+fkGsuge398yJH/12mSxDIfOoo/CecsA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:L+lCmSOppOcUIcAMe5Q8xjnqngkHdTl1ZET1fnXOl4s=:12YDoB21BxiYIoCI4+aUZDvX28qktr9CwPueH+fAfcQ=;
X-ME-Sender: <xms:WMn-ahqeX9dcNAjAjhzhlXuVTGdGNT3cOM2m7zYXuOjb3K52xJB3Yw>
    <xme:WMn-al6xh-b1kZGLlkS3zcYrnHwhz0a1lS4yxSbiap43zroZxwAiVQePwMXjwVFXT
    qVGe6JnA9Tnk5Lh_jZGAUfd1iMud9N0aHyjB0mrDPOg-U20kCqkpM35>
X-ME-Received: <xmr:WMn-agfVDAPbVZVMAuM1qe_mG9f3EXTOqaU3XZssOdrXNsMAsWR82L96eUCklVOwCNC2qknDfk41jKX574IHsuO65NSp>
X-ME-Proxy-Cause: dmFkZTEw9df5sxAukSfrHSF/elZ96OO3zSAwuVVIvLsBVSivhnB+LBj/2E4nER5QBTJp4N
    h55el+41rLR+8D/mT65ItZtTylFNHAE/0HUrpfG24raxko4hB3yRpypm0UjFwg4guoNkPr
    pZPJamzcgAk3ZS4me+ktqPbPYeaU4CH3YkFNHu2Qh2jcTtgCpbvhtpT1EqXtlM4X4b5C/C
    coO3+2kJQnjhuN/p6lT676vUVkUf/q+gq7m8R9Hs4s9mok3C0U0XT0PWZh/EFoZKFZKrIC
    urJWMckvQlQno/CKzPXo3oHHtvMF+D8yZcVkwNZx20F0CbMRcsAivwCrxOubwDqFDSLvSU
    cnkyg2ke0z03Rzbm7oZC8F82c8nSLHRHxbxa1VbHHrybbR4wgteY9N44MLfUdW/BHanTjF
    o8ClZotPeglE+Yzjqhu8lFNSxf+GoTuqXDKDiFfojBrCmpAvlEeLjt1EXCuHY1oZJKZa0v
    bOI/5iOJmdxkJCCOA6zCg+AEwNplCmeNNMTR+xTZD/swdTP/zHoeKO06Jx8JrxJD9MJNN1
    yk5ll5zrmzyxeDbolSD2yMIN571F5JkT9rqq+FGzQum+bOL//r/hNY5Ue39oFkNc3NKvzo
    j4+lZmgVdMq3TUSjDcaLMaojkJCyJs1FJeH4KVx3eFFQGskINGJhRqP9WkxA
X-ME-Proxy: <xmx:WMn-ai5s_tb6DKNIUfJMrvVYtxXi7llWEgtEBUuikuxBttiko8n73Q>
    <xmx:WMn-avs3ogWiLfTXPH1NgBo4o6fQcAOfAlVcE8IYjwQtlsOoKFh6dw>
    <xmx:WMn-aqi3DrydgFFj_fODwTau9c9b3kJ06gs6clg7jdw19OAt7wMPNg>
    <xmx:WMn-aip-_70egflFVHAhoEOx6q4QK5eEiJkfW9cfLt-QV8Xkla57wg>
    <xmx:WMn-apKnw06BelqApobaFcCqmbE6DsEzK69X-6EOO12WI1LYypRQyZNl>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Nov 2026 05:03:03 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 10:03:02 +0000
Message-Id: <DMZ3O22TVVFQ.155PGZ293VQJO@pbarker.dev>
From: "Paul Barker" <paul@pbarker.dev>
To: "Stefano Tondo" <stondo@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Cc: "Joshua Watt" <JPEWhacker@gmail.com>, "Alexander Kanavin"
 <alex.kanavin@gmail.com>, "Stefan Herbrechtsmeier"
 <stefan.herbrechtsmeier@weidmueller.com>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>, <stefano.tondo.ext@siemens.com>
Subject: Re: [PATCH v2 4/4] oeqa/selftest: spdx: Test crate identity, scope
 and output PURLs
X-Mailer: aerc 0.22.0
References: <20261118234425.3681880-1-stondo@gmail.com>
 <20261118234425.3681880-5-stondo@gmail.com>
In-Reply-To: <20261118234425.3681880-5-stondo@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 10:03:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250657

On Wed Nov 18, 2026 at 11:44 PM GMT, Stefano Tondo wrote:
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> python3-bcrypt fetches 42 crates. The new tests check three things:
>
> - Each crate download has its name, version and PURL.
> - Each crate download has a lifecycle scope, or an annotation that it
>   is not built.
> - The output package gets the PURLs of the runtime crates only.
>
> The tests name only crates that do not change on recipe upgrades.
> blowfish is the cipher of bcrypt. Only the pyo3 proc-macros use syn,
> at build time. The other checks do not use crate names.

Hi Stefano,

A couple of quick questions about this test case.

Does it use a fixed version of the python3-bcrypt recipe or just
whatever version is currently in OE-Core?

If it tracks the version used in OE-Core, is it likely to start failing
when python3-bcrypt adds or removes dependencies in the future?

Best regards,

--=20
Paul Barker

