Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2402.1793956887527167478
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 01:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=j5gxkTVk;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=5K+phE5K;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id D42601D00167
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 04:21:26 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 06 Nov 2026 04:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793956886;
	 x=1794043286; bh=bp7IJajWf2CCQysM3Sb33r//A6YuzpFALbmt/yCvbsI=; b=
	j5gxkTVkOFXmLUc+lGpgf4Vl4QRQ1txhBsIlKCUi7qQBhi4pDnedd59c7tjGuOLe
	Bbt6OzXf7jgyScusw8oN/YkBA7q0jDDpzZKSky/iRAIyqBOewrO43+WF5JkOwWAo
	glLrR2leoD5JBJ2PAwAMDsrHyT4LAIxaa0daUqu80xNDAN1CB3hiF58cq2DPnUxP
	+cKIhUT4ljuCu4dxIv8csuy8t99tBTH9bZAKt2nGlzwiJvhx5eQC3CSfTecqJASu
	kmSb1rCrzndzwMkxxvoOQA/D0SVf9o48f+w0f4f2Xo0Dw8Lp6EjXn9EFaRd3pchp
	F0ExbCogAqJeQ/ZobfDvCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793956886; x=
	1794043286; bh=bp7IJajWf2CCQysM3Sb33r//A6YuzpFALbmt/yCvbsI=; b=5
	K+phE5KeXTNrH7dGlIKbpjPh9NPc+shq1M6p3MCm4T07GJqbp8fQ/wu6WG9n9zFv
	bArLKDaVFj34ZV6iywddAznbXVdkyOZos7vjI4SnToWvBUHaAqlF27+TGdo9dOzN
	B3TqmKUJTLkJeE70Y2bV12j9VSWkxBj+dzniOkcsf3osl58DM+HQ+qnAFpVFL/Rd
	wzxhhNbeZuW1g25F+0zfioj4sJ9dDuihCFe3HatocLOorjyJRsn/qrZLww20US1I
	xPzVfUudD1G1mJtmZMgH4CT/YDo7oRr87fztnmlQqOGDl6MLVrkSTNs4divXMd2B
	ADRfcI7sDro872poI5Lag==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793956886; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:nKVCxbENkHioPSxdcbjYmUHHdhlpNuOg/Ech7z15VGmdbnp
	RZygzRNL6tXRVFnjWUpATKtkiahG//UIfT3A3B7lAjPdbo4mM8p8b5TAKWtOzgir
	dWxoJxqGtGxJ3a5iWx3B1a0btx1d7UG0U3wF4h+BFqFHf+utYwhKZmCj4OZrnYVn
	toWBAry6zwdzuXsDco+Sy8mW+3R4Uk5F65lyWEQH43DbJLsfeZoYldB9qxArUW9y
	cT8sXTBwCqHN5j2wfwoG7x7I4Q0cfQhFouDV9XshsIEuem5PnNpS+KSCMavYeRgh
	LRYycVsUTZQ0IfN4cK7oUFM35yrMZvu7kYZTk7g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:xLv5yBvgwPfEDfYpLkiMfudmSBg4Vz6Y1zjInQD53UI=:bp7IJajWf2CCQysM3Sb33r//A6YuzpFALbmt/yCvbsI=;
X-ME-Sender: <xms:FZztakTlsvSnOxnQ292t1-GYLMaXELkocIBe3T8hEV_IlUOd3C6KQg>
    <xme:FZztaox2BaDVBsqqz9SfjHwkAyyHnnVQ84BnzStcRTOIO2mNKgz3kHR617hE4bnSb
    uBS8Qb6RMWX7wAnd9LkV5Z5F53EMB4d8PZ_qyshMwLG0wLBr5JOMgjh>
X-ME-Received: <xmr:FZztam1Pzyn13bQ4Aa40VbnNTdKanWkfHI5mhJvb3SihIUYD26Bnect3QUU7MqWiE5GD7Zos2r_c-fmZbpuyAqQK0Qqi>
X-ME-Proxy-Cause: dmFkZTEQmJR43jbqa0Wc12uRigMEgqfRrpsnJIXpnyKfe72VBSXzEIJPxxumQ+c9af44JL
    O3mp8EX7Zpa87XL5qiMFaEJY4QrvSwq84K6MqVffblv4F5JJZegYib3h900Wu5qNsjJEhG
    N/pgePeRWHvTQVbOiicCtbMRWW1mOeuLj55Ajg0XUu5oImi37JfAOGVa5USmfFPUjrnoIF
    ARm2vfNrOkJA8QmUzAFogN6Bg5XcbCgRKUAJna4a3p5ClejOj5kZ1w2B51XI8rfvyRlNDZ
    4yX41hDnDkP+TgVdOWpVPe525+Cle2/mskq4KcBufmwt6XK3VyWJLu4EbkVEw+RiJA7ooI
    4BXyOivE1lDWHrAlN9ugHrjJtw6hTqnSS/S1G+sEPY8rQUZxURghvDTEesA31eHDskbrDy
    c/Molj83eDXx/4kif9foQxDPeNRY7lQpVdqPXKOPdbvl2PUg16ecwsE6k4q2NLxoRlFMHW
    yQojBF2gWPWKYRC+kZMO9NBuBj3dMJwb7oZnHPBeVGWxiGYXTOncTxyqJGehOnmh06QAmR
    Qu4fcuij4dn0Z5xZd5RPDGpYscpVjVN4REgP6MVRkWl8Ib8QceE2KVh+jJN3Ma+X55yTG4
    9pMujMS4WEhmcH4yu95D88xR0gune16s50c4YF8Mhcb8jNtMtwkdu0/PEaZA
X-ME-Proxy: <xmx:FZztam7NPKaAVnTeyIfinICWMk70q--GdqKkvxhXVQ16jxl6g4AC8g>
    <xmx:FZztapWBHdvyJgTcBoJtlN7XBjGP_lluLzEHqOjmOEFa8eX2kVvcVw>
    <xmx:FZztalBY7scxetQWseMZQ5DHyFeQZ1dk0kuwPXHDQvMgmuBsoqeDxA>
    <xmx:FZztao6NfpUd0obMi3Jd-GwN0dKg4GbS3dKQpHASgmicIz1nowz62g>
    <xmx:FpztasCioyIDeeH61vJpY_VQ2RurPkm6EVUNhLPjL5useYlAB4GDyNJg>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Nov 2026 04:21:25 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 09:21:23 +0000
Message-Id: <DMO0N33RMCHP.JKXW47OTMMNB@pbarker.dev>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "Marko, Peter"
 <peter.marko@siemens.com>
Subject: Re: [PATCH v2 2/2] zlib: ignore CVE-2026-76844
From: "Paul Barker" <paul@pbarker.dev>
To: "Prasanth Ramesh" <ragaprasanth@gmail.com>, "paul@pbarker.dev"
 <paul@pbarker.dev>
X-Mailer: aerc 0.22.0
References: <20261106011324.626292-1-ragaprasanth@gmail.com>
 <20261106011324.626292-2-ragaprasanth@gmail.com>
 <AS8PR10MB50735550B026B9C13DAB259DFD762@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM> <CAG7eodHrvRHJj8P5MGmAxm99Umxb12qeVDaRkggFOdw+sTfjNg@mail.gmail.com> <CAG7eodHPk6FYtFE7-M35ymXqH40RpYEHkdoUbkcgpNKaSdYC0g@mail.gmail.com>
In-Reply-To: <CAG7eodHPk6FYtFE7-M35ymXqH40RpYEHkdoUbkcgpNKaSdYC0g@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249627

On Fri Nov 6, 2026 at 8:28 AM GMT, Prasanth Ramesh wrote:
> Hi Paul,
>
> are you ok with dropping 2/2?

Hi Prasanth,

https://app.opencve.io/cve/CVE-2026-76844 still shows this as a zlib
CVE, but unaffected after v1.3.2. So yes, this can probably be dropped.
Hopefully the upstream data will get fixed soon.

Best regards,

--=20
Paul Barker

