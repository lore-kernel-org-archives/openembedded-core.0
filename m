Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6995.1794234298221227944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 06:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=MmSMb8rm;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=KqHFvMta;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6326E140015A
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Nov 2026 09:24:57 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 09 Nov 2026 09:24:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794234297;
	 x=1794320697; bh=7tcmB9f22UaByWxwjCKWTOsNGRuj1lkdK/vnDg/on0I=; b=
	MmSMb8rmGP6tVxOKRtphJOfdchwFywe3HqNKqabl6TgkLr3zQm3MrjeIXtEtI8YK
	qFtdUFUWSWIkApg275jWpcLpBuDyWB0JDKxJ8H1tJB022TRacO7fQ0RYIFIkgiFC
	gAop31hoJmbaMZmMU3z64Y4ZVT/ZsDR0N8DNhxaE3zVQ/CYq++AtRqFPeiaau9C3
	v+ph6lIBoD2nyJUO0QcEFI6XZmXC9jdUFmwnl9//WDqkUGp9IPppEmeVth10did4
	56++Simf3zk/5TpiED1lZNVOgX7OhY6QHuS4O2aYsWE8cXATQjQ3vO6zjNyDR20T
	+q5Zw5bFrYr3RMcvJZpvBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794234297; x=
	1794320697; bh=7tcmB9f22UaByWxwjCKWTOsNGRuj1lkdK/vnDg/on0I=; b=K
	qHFvMtaHo3IqVP3ZHJYP+Shgfw00psdPpQUOCrFt9VZYmzL70ixBvPdL487IfkHV
	ngH4JGamPriEANkA+3N5vbPq4R/dsn/ONGnf7vuT2U71xJNZaYjd3imaOoTmafNx
	knU4P/iZMWPA/5g+g0ovImxSQpM8vZJxElIa6EUNxDxK9q3iYDuK1mbZMIBo+pE/
	ObXqyHy52URffPHOM+Z6SwtVzRaNETL9xCN/3W9+tBIaN1YPKJfbd7mKijDNMD8j
	3zdYs8qFZuKXwe3nXmRewHDQ7xH1MXkasHU33+COd1sOqkiaaHweZkjEUU7pXw7r
	GqrDd19JRPEp9wWTaYmpQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794234297; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:oVEId8PIuuPObkcfrBN1BC3N2rSDDySUQBCFrbx7sU7rFm6
	RloiUKl3AOtyeT0gfXOPAfsTy1gVmrQmBZOUzNaQpBxz1Y6msptxg1tXNUEDkHlF
	vmA5iT4gaM/a+IlUlPV5q9SMjPknBotOKc7umdVN4/gTcITaUSlyKofgShJjPVbb
	JPOzpc+BGVyGvCNHOdks/a3PsjwkPmczqCVMSLpWxIPRkqLKt2xr1N/WOd1o/qi0
	uQICWxn8ceK/Pau/BKfrpHfnwi6nPqqIi4fVxjkpatoK8PQ/eA3WEEQvgQ5GZ6ka
	ViezvO7aDtFHm+4FybdtWM24+HPyvyHHG/LDuAA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:2SBIhL0XnB89MHkJxJLm9ZMvT1JRK0CSCEAbD3Hqr4E=:7tcmB9f22UaByWxwjCKWTOsNGRuj1lkdK/vnDg/on0I=;
X-ME-Sender: <xms:udfxaiyU1oe9WvZJwPxG7jUKO2XC7M_VX7yv4B7hL5NKp3M5nr4Vhw>
    <xme:udfxapvsoq67SbaMY_lk_t9UMdESrwwSpssskqb_-A_oojPJi7Ithgg34So5UVjmq
    ZVQOVh2tXNuLFzoWIHfFDGvzW-I62T6upo3OAlAMM8DEjRpaOy8z-p1>
X-ME-Received: <xmr:udfxan0TwcxDzakpmPockUA1NE74rs2j4TJ8pULNoTQ8RVrjOs0mH2yskYNmeARhKbagWTK0agYvUw2cSc7XC_zMHJAr>
X-ME-Proxy-Cause: dmFkZTGnMKuIOnvGyQ7zWqcUYlDo43FWwsLI62VAc9pgleLQI1l+yLDIOLTLG5mYdUGrq+
    jBeEc4LD6VsoJXrE+RtCHEn+kQYMz1Q9w8XOtId2mfGKl8QkUunkxbObwX78PoEzrQZky/
    S9OTUZczRI+jDOdXkJSHy8ljTb1iebdRrU7mFoIPhgZUlI4edwVGEioeE+y1hGC958YcXQ
    f53pO4IqF7nNKFh7MIHcAE31R9odNlRTuTCqAF03mTba1bW7M+m9MTVFEbzru4O1YZOOvY
    CBzlgZMSOPGaOov5y+CQdUmf1ldgGjCiVM/nigR7Mr/Sc6sIQr7+VY/+Nd5dUg3k9B+HMA
    sutjtUMIwLbH4eybS9Wm7p52z2tz82YAxQhd3lW4Q607et1gNcHqWM/styr8QtDDe8oi37
    0vju7B/BlfcDl1sQx9glAOwg7mpBTxO7EAQlNQba2Omj8r0xqE1MkPhlsMQd4qrs7IHPY2
    UdlPFi8WFVOKQBkVaBSdkuNY3STGl9eSfkcY6Fvb5u0Ztl1w4vasoZcvETlT+DWKC91SwW
    gTYZK+dcHBITRBXsbQKOC8Cu7M3fZYHujQk7ln8uPLqnQiL/5pp3E8hydKiAU+yR8Geco1
    baW/5h2XTUjvKNKp2knGznNFEC/auak3M0YEBhWoeJBgCm2cUaOQPa74Gg6Q
X-ME-Proxy: <xmx:udfxas-AIB5ivm4hKmD-1I2sJ9cYozsW4V2u9NUCZe2ToWfGfYjxwQ>
    <xmx:udfxagNld-tNABY_rRMZ070_hhoXNYQLmazB0Y_Th5uinZirGL9bzA>
    <xmx:udfxaofe-8QAfFDGN1SzZcrg1j1fpTGk2RACnEwu00JRhmW3_7EK6A>
    <xmx:udfxanXGtJQ0QZtHtxfjPaC6XfkH3WAU7gMv7GmeHEWPUEBvJWrCvg>
    <xmx:udfxavxn7qDtPy_K6rscnVp_ZyhJG5ti-b9ayWWh8Zqky7GupVYsUOON>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Nov 2026 09:24:56 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 14:24:55 +0000
Message-Id: <DMQQZ4DQ48LP.1O3YZ9RX6JP8S@pbarker.dev>
Cc: "Paul Barker" <paul@pbarker.dev>, "Luciano Dittgen"
 <luciano.dittgen@ossystems.com.br>
Subject: Re: [PATCH v2 1/3] yocto-check-layer: Add --run-tests to select the
 tests to run
From: "Paul Barker" <paul@pbarker.dev>
To: "Otavio Salvador" <otavio@ossystems.com.br>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20261017225656.680168-1-otavio@ossystems.com.br>
 <20261019143924.1521981-1-otavio@ossystems.com.br>
 <20261019143924.1521981-2-otavio@ossystems.com.br>
In-Reply-To: <20261019143924.1521981-2-otavio@ossystems.com.br>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 14:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249849

On Mon Oct 19, 2026 at 3:39 PM BST, Otavio Salvador wrote:
> The common and distro tests ignore --machines, so a BSP layer checked in
> several runs, one per group of machines, repeats them in each. Add
> --run-tests, taking <module>[.<class>[.<name>]] as oe-test does, so the
> common tests can run once and only the BSP ones in the others. A name
> matching no test is an error rather than a run that checked nothing.
>
> Tested on meta-freescale with "--run-tests common distro" and
> "--run-tests bsp --machines imx8mm-ddr4-evk imx8mn-ddr4-evk".
>
> Suggested-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Hi Otavio,

Please could you respond to the questions I asked in discussion of the
v1 patch series [1]?

[1]: https://lore.kernel.org/openembedded-core/83b27a0e093d6e6df87ab2106b3a=
163064226f39.camel@pbarker.dev/

Best regards,

--=20
Paul Barker

