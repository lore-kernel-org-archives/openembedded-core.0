Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13776.1794906475906496137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 01:07:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=JADv7G6p;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=pux/ubPP;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F136C14000E2
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 04:07:54 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 17 Nov 2026 04:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794906474;
	 x=1794992874; bh=Xxustp+cVNPs0Rlcw/CZJLbj2yZwCbv/Gf+QU9bFO+A=; b=
	JADv7G6p87+9gDE8yt6G+pScaae79c17i8yhdW9kQKMIhadZie2F6e5dLLecgW2v
	vhhbtkntSE5/F+TfqV6T9cTf+WCIp/+jDLUwtAcJHf6iwPwJqoK3h4jvkhv9kSn1
	GINyOPBV2xZrXekg9kZrdPJgA3rOWKtjF1V11IH8FoRocweFrClJ6MgGUZXqVa66
	jjo0+3pINcjTbXLuyDkKT+8JKjae3Q9wReBBe2E+Y4wB0wwa2CO15gh98UtL4xBq
	li84NL4z4FKYMHtQ4Rc1Xk5vlC33zLdF9jijnXSUREju3hNNTs3OUNAb6WpwbaGR
	Q5Z5EH+DJfKWKr2/LKaDog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794906474; x=
	1794992874; bh=Xxustp+cVNPs0Rlcw/CZJLbj2yZwCbv/Gf+QU9bFO+A=; b=p
	ux/ubPPn94Otz/Zm7slnofjnyYwh26bqvgYlp3B9/ktCgqTO7vGkOvKoLRaUrL6j
	yBMwCmwXf0NmgmQ+lImaXpNLz7jEILs2vd8rEjLjRT5qrPY/T13JZbt4T2WJ/5ds
	GX3uHZcN01wmQlrk+GJBGBYPzHQndlDYO4DtVvQkOkj9lXrEuD4L5PvISg2WcjeU
	9UEsUoOLSYyvYDAo5ISA5b/CVI/XXbg8Ne24KdSOLyFJPSfBWVo0U+WuAKGMm7z0
	xG6rQWjqvsou0okZOrGb3H1yDjB/aY9fjBJPzAzYd4JijTJTJLxbIzpJoCUC9Yme
	v35Fitzq0QOxbtCvLodfQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794906474; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:ImX8d9A9ugfwHlA55Y0FmOQpQ6lrinrXPbyTXZG4kv0dQC8
	wTgq0lpS6QaN/XyO2TyzTayf2hRS87Cw627x7gLxqkpZhvPNuTK723QTcAZMDEvA
	MgkwayCxZ9NOhp3Gsi3lUcDaJoJszvWYmsv9ka2oUOYgjPKhHnwHnFzEp6yEa3oU
	uhRkPCHEiwcKzH25I+sRm+86TBLXTYOSYXhr+m/gwFxCpU2Houkz1ykVJ5txYph1
	50t8yDu4lCj7rVy/mvJXJeAkrlgqWFNPzrbwDqMxHT0cHKekmtZJqu6TrLIdn2RZ
	nO71til8r6RZorYMF47GbG0HpNqDDxbNbcnnA/A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:7EFPMkW3KcrwvW6XXTPzXHrE0XMJ28c60UH4Nr/RFXw=:Xxustp+cVNPs0Rlcw/CZJLbj2yZwCbv/Gf+QU9bFO+A=;
X-ME-Sender: <xms:ahn8aodhNAp316rKvMyBeBk0jq-BWYyu7XCEPggzUYW1EFLaq5YshA>
    <xme:ahn8ahrIMhRy5qbt3iqB4SWVvSVJ3lwRqNiqozAKF2mAKEXgVh2eP1hfG5j5sUeE-
    VwU7IdqFiFNiBTTxoT1rUpiqHchH3MfWNH0PtHCk7Jv0-DtIqBEwnNT>
X-ME-Received: <xmr:ahn8am6X3HFgT2zZhMB8js9GOVxL4OgAzt_uuVKLgxw-tsNv65wedx2K0qZ_ClA16Vv9_hCAxcP_4xMStGFgM7hLmcZT>
X-ME-Proxy-Cause: dmFkZTGYbA3iAHFKndxzJtV5AtdoXqkEHjr6CwgnDH26fwlLFAzM1UoJWqg1IJ8xZQFs+D
    sYzcI+CFGzIf73EFR9X9wDgM70xZ6SCFqY3ItQwdNOPTPTCjuk5p3FhcssrTzWYNr9kNVa
    zzpuVIIHkh7R6Nhtr2Ngr/Pgj6xVSsl2UvUpZ3+94N0gN8G2OcYE/ke4BPieN2eQtT2ixe
    g+VnAltkwABTDhPOpKXbUpfoZ1WLPSqtc8G+Goo3hSESfZF/UeY8z3+D/TA+aBKHi9TTnn
    0ejGwwb12fwr7Kz/vZ4cimFu0RFfZstO6tOQQ/zl0mnEQjFfC8aUYxSMQ9gw86PVFbJ9D/
    z501ThMyBZqEMvmnrlyTGXOzuQ/4F/WksP6LItyYo+iezz8gFwdImlmC/aRGDzB6mGDMoG
    NLgTJfzvJe99NdXFZSgYqMJM8dcJQ96cwzRjXedjtqK4+eKtj+NfOTKHiLwRxQ8KC3farL
    QCpWfLIIszQXyc3AW0Aw1jGYw1XFXauSf/j5UTyyANwMe+N62BD/pVN2WDjcou05AAuqBv
    L8C1H344QU7CUB2Dgu8qQEiktjTX1YAOUwd+1EhDDeFZBM0IaymKgSEy4JTHBYq8nFofqO
    XnupS3u79t9ez1muMZ+JLj14DNcbHpsGEPa0jDXGy7K2XEn7Jzl9WZvGpztg
X-ME-Proxy: <xmx:ahn8anrRK5F7Po4bELvBWTTkFbB4xzPcTRrORbYwOq0BM4TnuobqsQ>
    <xmx:ahn8aohItYBQW1RL_BnFCKexXvEjxXqYjpzLrbt7-59YinoCE6NvJw>
    <xmx:ahn8ahKTS4Q1FUYvQ2wqWBjc0BhWUlonPYCJs_FD_ClwVAdMkgDWgw>
    <xmx:ahn8aoDUutgpiOCuVUQWmRWfAImgyHGCET0yMl-Ni5CMf2plI_Tt6Q>
    <xmx:ahn8apmvu55I7z1g2Wd0ooIUCN0cTW8lNQm0nELgOoOGV4lH1ctr2n5u>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 04:07:54 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 09:07:53 +0000
Message-Id: <DMXD8QI18JYE.139J07RM2331Y@pbarker.dev>
Cc: <Ross.Burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] consolekit: Upgrade to ConsoleKit2 2.0.0
From: "Paul Barker" <paul@pbarker.dev>
To: "Khem Raj" <raj.khem@gmail.com>
X-Mailer: aerc 0.22.0
References: <CAMKF1soWija+eU3x0oK34cdankotbZbz+Z056eDKeyq2TzqG6g@mail.gmail.com> <20261116184219.361983-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261116184219.361983-1-khem.raj@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 09:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250414

On Mon Nov 16, 2026 at 6:42 PM GMT, Khem Raj wrote:
> ping. Is there any concern about this change?

I think we just need to confirm whether all recipes which have a
dependency on consolekit are compatible with its v2.0.0 release. IIRC
there were a number of backwards-incompatible changes.

We may have to carry separate `consolekit` and `consolekit2` recipes if
there are recipes which aren't ready for consolekit v2.0.0.

This is still in the queue as no-one has yet had the time to go and look
in to that. Sorry Khem!

Best regards,

--=20
Paul Barker

