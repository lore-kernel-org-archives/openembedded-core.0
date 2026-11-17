Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14317.1794909656722367191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 02:00:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=pnqLKvKF;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=e50AXB+k;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 977DA1400113
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 05:00:55 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 17 Nov 2026 05:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794909655;
	 x=1794996055; bh=c385G1jZXy3TpZWT20OT6KXSwfvjJIiFMZpwXJf2oeg=; b=
	pnqLKvKFn6iH72Wi4/PMavT6gRXSsqqS1POp5ZURLLAr+F1S0f77WYZAGeTJKX08
	07e8w3PYQwzBJYDrtZum+iI2QlP7P0PFDB3cigLMmewtvTWyX5R3Y+nJXmi8g5Xd
	mI5eVlHclHGke8g9fA9aA4xVb5EPxc8QJDDUF8YYS1n5gZcAzla5rAChQKb7tzDu
	Zgo1T3HfxlkFyOt3N/vtpTGOwp4QNUlmQsVBCbvV9PjxW1xfFES2cEijsAFQowx3
	2X9aksd1Xrq0lcFoAxKc/6X5p87CI9U7j/NmBuCz6UOOTJYw17xRBY09n9MwqfNe
	ggjwHAGD7ej5B1TKfPOUsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794909655; x=1794996055; bh=c
	385G1jZXy3TpZWT20OT6KXSwfvjJIiFMZpwXJf2oeg=; b=e50AXB+kuI9v5OKZY
	LCplWiRjSU+FDvbnjwufUvxpB2PUEa+hEfF9G+4Wi0OFv39YcwNzYRpOI5sE7jyZ
	Z4i08YskDkChJaXL/3zk11XHMR5FBZQUlr6x+Zk7OJjac9npZXNyAVthtgmk1EOo
	SIYq2n8W++5TTpD0xbW5gwixAI7cnLOcdVJ6bXihA1an0mnMevXtjNaylyFRsYt1
	wAEY4KkA8p6K/E7XtYEoiyE1mzt71ZIyhggo4GNJKS5bM/N7JYuYvmFpPjfoT4gT
	FxbyZmuWoXc8FfuT6XT07ET7zoRh5KztpJFcbSBlmeeEf00ZcmoDPTKk8IwDsYWP
	JcwrA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794909655; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:TaSEdRDnVjyHhfXQrynt7qmesH1RRINvGcpqgccnrN3kAjc
	xHYNSnG0SdABBCwn+tuT7NTZwVBlbTCIQuPqxw7HcYINzVrfZYOnMv7J8CKYpDsh
	BdnKmzPJiSpyhHIgaf7zgU9AI/V6mjBDXQWjHvwdIEf1D8NsEp0FgGjxJttWxs8p
	/ycuagunQnSyQkQOS76UYAY+SeJ8wp9wrLUFuAfnyDGUKw3+T49ZUX9PDjFOugKZ
	j3PXiLdvQcDaFIBFnVHuc7yN1432Usosio8lblIWBvp2rrTPqJTt0G0hCKeo2KIX
	8mlx0P6jnYwcq88qUJd1vuHWXSHYLxqxCVkSZqw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:PC8eojjr9yMzEXMfAMNazSFBO/9N3DTRxYzwh0ij//Q=:iUbAz86221PNrHVbk+Is3b3cVE9OL4Z/GAxVay14y8M=;
X-ME-Sender: <xms:1yX8atnGyJZ1cpriRyhkTOoTl4DHM1JkxXbkFwxVOIGnlNq53SbD0A>
    <xme:1yX8au0_w-y9T7wPNNLUYUaf8NFSEhLYOFYGQa7jT04J7RkiBwhH5Mwo7vWxQzJ1k
    mJ89PdutAHZAKjlvwz7DCf8uIZ8RZNx9FVxEe6tepd1_vQB_M_rwFU>
X-ME-Received: <xmr:1yX8ahQcVuNfakr5dmkQDgnkWYEvvr1QWnxIR0ypmHINPdpDzQsynfflTuvJpPHOVque-fAYE848Pai-pm20NzunyJat>
X-ME-Proxy-Cause: dmFkZTGH8LfbkaK/xhe6/3px/571sJxmHwWzMzhkOb7+ezbHp0HCPIxxJp2BHRuEzRNp8O
    e0oUJDtSruNBuTLN1xMJPvZbbBceLwA047uScEDyiv69TbeyoKpqC7AXuYWhjjku490Wan
    ns2S+uvedyG3kdRUYV09k4FjaCiSid/IP/mJ+hKjfqazne8oIPMzbXfYU+Z8dq/T6KWrro
    qxN5DCUDx+6WES2wZHv+OPTuywtsPzW3nOuvezl54n5LU8N5SCZn/W6CRVmySkbEAr26yO
    8ldf0vnpZnqdFxr2bOZwEmo9k9pd4e79ogW7Idu6rflwpXQ7LLj8KdQw0l32ItvPOwOcCB
    jkg/+wqvGjrBTHw/p9V6gSUQPDmz9m0bnLQ3QGpbwJOrQO3phIxAZeTiA9w99u+D8vodKb
    HuBoVGMyVi7+3MoNO2zxYp2WF2tu/AmGgJ3bC+R6MWKSBlRnIYXnmIO9qjH1ehEdae4t9i
    jc7hBv3AaitJZGpCns8n23xOxXdq0s/Aq0Z1gstV0W11dE+cYFGEK9gmfHl1nRLLT6RMj8
    lpy2bc5t4S/liK29r6y05EL+HJUCiibqGbxjhS7aOaKb0+65cH5kJpJt5ulRxBL5FA4Img
    GEvKv6RUsZcr1YQ1zV0XwYueb19NrU6Uw6HtmRPiH2TgcvQTjKY1TeLVKS5Q
X-ME-Proxy: <xmx:1yX8aos1Los6uP3vtg_jfbt1hIWhFT1tyrwU0yVVxyOrW35W3s_J8Q>
    <xmx:1yX8auYrspaUTc6f-eXf0YPqfdddzZKSAZv4juHbuySITFYfhIYblw>
    <xmx:1yX8altA7caGugCTDhuPKifbatVMtXCLCG35znzClPek3j0UspXHGQ>
    <xmx:1yX8aoHbTvTRlt6vKPDYBfPcqC24C2rKF_aQGajzbXk6-01BceDwkg>
    <xmx:1yX8ajVa9gC6SJdpx_vT4uz3MkNWm1SENu8U5Mkmn2SNoX1KtPRfYJfN>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 05:00:55 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 10:00:53 +0000
Message-Id: <DMXEDBPVHWXK.3PLBST96AJJVE@pbarker.dev>
Subject: Re: [OE-core][master][PATCH 1/3] busybox: fix CVE-2026-38752
From: "Paul Barker" <paul@pbarker.dev>
To: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20261105073452.890881-1-dkelaiya@cisco.com>
In-Reply-To: <20261105073452.890881-1-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250418

On Thu Nov 5, 2026 at 7:34 AM GMT, Darsh Kelaiya -X (dkelaiya - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix shown in [1].
> The advisory identifying the fix is referenced in [2].
>
> [1] https://lists.busybox.net/pipermail/busybox/2026-June/092351.html
> [2] https://nvd.nist.gov/vuln/detail/cve-2026-38752
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>

Hi Darsh,

The patches here have been submitted to busybox but have not received
any upstream review. Can you point to any evidence that these are good,
e.g. other distros taking these patches?

TBH I wonder how this is even a CVE issue. As busybox isn't a CNA, and
their patch review process is known to be slow, it's very easy for
someone to just file nonsense CVE reports.

    A stack overflow in the evaluate() function (editors/awk.c) of
    BusyBox commit 371fe9 allows attackers to cause a Denial of Service
    (DoS) via supplying a crafted AWK script.

If you can supply your own AWK script, you could just run:

    BEGIN { while (1) print "looping..." }

Or some other misbehaviour. Bug, yes. Security bug? I don't see how.

Please step back and do some analysis, I don't think trying to play
whack-a-mole on every CVE report is sustainable.

Best regards,

--=20
Paul Barker

