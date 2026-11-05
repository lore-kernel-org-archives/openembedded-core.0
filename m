Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36829.1793891832273793890
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 07:17:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=hn1mocet;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=DpuMLLWV;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 800217A012F
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 10:17:11 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 05 Nov 2026 10:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793891830;
	 x=1793978230; bh=KmA/7PUnZdigRKHvSt4dgyVsxV+phmyZ5gazxoBJhyg=; b=
	hn1mocetj+XTI3/8bO9mtv74ZHqNh0u3X7pxBa4U8hg3uF1oqbXSiQyl+gg3Kb+/
	bBLVNRwGws5hvw8dR4N2PGLZ5xephHMVzbTqcrmtjDJuWmpHuOEcR2Ndz3kdZCdB
	H+gmae0AyNGNsEXnHQz8hu+/jAtN/fu/QVt1poZJ7aI4RDgUQQ8OotGnXBuLLJTO
	rLdU1B0oivllo2SD0EoqzqfYYblaverMUwBsGC3ZsEpZ6+Lktvhba6Fgc+v6VVjH
	LfVwsCrVyT+dABalPDZuxr2Vav2AD8qTchfQbAd4IXObwp3P4DaTuCLCLaiStF9b
	jr36yM29CKAFWrQQlErMjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793891830; x=
	1793978230; bh=KmA/7PUnZdigRKHvSt4dgyVsxV+phmyZ5gazxoBJhyg=; b=D
	puMLLWV9aiTqo8DXqbKQWQBWCCdIOhp1sHEvgMKtRvVUJw+cFzBRyGi+NLBtxCAz
	dfkDzKI7yGoVC2sg4EWFO2x0Bhhb9WP+WmadTbNIUTKIVJYhaLquU8LZ+7coAOjX
	3GMGq8ISjO++PSnFueST5ePhSvr10jBVfi/m6ir0IMzvl0mubLswIXCVOfyL3LBq
	tNKkiSqhedt9MgB+W1MZCRRjWhkiHz483ImSWHtpLdVVCBu9n7fbNzo0TgXxoMlA
	7u7J4CvtSOqcgUUzrXncKljIGCawrqAeIsARf83l+Adl1JAGdOg0uIvq2RadRzPc
	4oqiGMZ5O0kaSAXNg7fXQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793891830; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:DheVjj5X9n3KzazueCwaLaJfuGSNsTr7lFfEPfMVmb4TOb4
	O1+D2YFl1r23XnDgRzFOkW/jQ91UTDCV1rT7X8PfZPd5nayM95Wmw6dyawEK12iB
	K+Xu++pK/dkzTRZmJxoDabE9jkCfNOT12en0qvSwDh705AEoAPVReFa3Sa59bnL3
	b3HQZOTCPbs+CV+a5ga5eeNrLZgRStD368Thn7kifgA4UNo5gA5hcKaO68i9b6ci
	5gRhi90dpEjnyvr2szJAo2QdW/Ju6ueUYdzvxGKDBtnbT4Rm/tI4HrIcr5zllZUj
	vwWu0iL1spBmCT2pBqFuKekIVSSLX3QBly+lNWQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:8YFkR3jzkm9L+fXouyQirPTo5+fLYmGS46J7+y4KvD4=:KmA/7PUnZdigRKHvSt4dgyVsxV+phmyZ5gazxoBJhyg=;
X-ME-Sender: <xms:9p3saqOaRT5nkUzdN58BxDwyV3KKNj0b-t2pTxEOjXUEeO0f2EYGFA>
    <xme:9p3saqdzdnojJWTKTHKqI78EtiGT6glPOYfsnOFZ5PYTzbSalwhQRmnNQEiRA1lIW
    7pWrm74bQ_XFXA2dtE-BO3dhe994r-6OFU1ZXPDyXoKg8e7K-vAUh8>
X-ME-Received: <xmr:9p3sahUFYTXGQbMMbwqXfnaXZcWjo8tAZsXPNjOMKCuxS0IIELAAyQBBK8phBUfhdQlAF0Fsy4hV1Z4HRQHBOOa0GZmV>
X-ME-Proxy-Cause: dmFkZTFcLk3td59JY0OLHIQiOq4zRAWSBckXU77/tjz36Y7oE6xx/HqPON08Cx1UymrCVz
    JiYSwKyqGzlsAvSm1avA4f0snW85501HTDIEADVR0ib9PnBqnaCNTmIZIp30EQP47yZLnG
    5c1RUafdutMn1DP+GjJDykt/NyzzN42FEbvWVcgzc/Si4V5WRGdQqVp51c9cf4/IgU86Fo
    A/9ijlgmQVNBU4I13B5smzVvczmxzqtKYaOUyi1tk1rxE3qysORDTqZuGiiD++kJZWPY9l
    wsglaD5qIPkKloBsrQWaNZeJIvKuly2d0qZp92qkPjn37l1gbERmGV/o6KnEkMIvK2asJN
    y26WoZL45vtJUQFPOBmbTGb/2fNmaZjz+/huRIIPU/XMcjp9e/bPRwiELWELWS/KG6zIGt
    XbiHuEVwFKK+GzA9x3vuzd9ZZoO6+X2E2XtguDa9LTRu31520GpGk7J+yWIzJDwjZqlnwk
    BfCo+c5UVg4gptu+xwFNidzYA8jfIFXV0PGcuvYHHFzpp+Da7AfTNqpkKjpXrRmXBdSY8w
    e7s/Kw8J6InSqmoroDt6FtWmqoVZvw5g9hJ+LbP+aj8sx1/7zt69U5qHc9Exdarq9Go9Ss
    3g9I7VOasNpeDRx/Z3+yAdmy6W56IS0dHEa1rdnT9sb7s9cyBdbOEctEHZhg
X-ME-Proxy: <xmx:9p3saqhhOM7ZCKorJDyDtZFEhNJJGFGvLEySAy-wna6Nz6MXLBWlig>
    <xmx:9p3sao_M14KtoU18tFl3w-Yz7yH0ss10jmnTkuFwkGnFUecdd2qpOw>
    <xmx:9p3sakbU7yQXpDZgXPTkLPpNa3ZRzqX89DqQXQ7pltGv-8wqnVCnOQ>
    <xmx:9p3san2gH-DZa1EbwUCGRw2XJiROJIfnfvgrdY0pT5y39BaSQE1yUQ>
    <xmx:9p3sar4sEL7aHhDKNs_OV1zMqkkegxL739OECh7yN9q4N1UAD2W5a0Bw>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 10:17:09 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 15:17:08 +0000
Message-Id: <DMNDKX7R5FND.2I2DXKC6MRMXO@pbarker.dev>
Cc: "Prasanth R" <prasanth.r@lineo.co.jp>
Subject: Re: [OE-core] [PATCH] zlib: patch CVE-2026-85091 and CVE-2026-76844
From: "Paul Barker" <paul@pbarker.dev>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "Paul Barker"
 <paul@pbarker.dev>, "Prasanth R" <ragaprasanth@gmail.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20261030050531.720920-1-prasanth.r@lineo.co.jp>
 <DMNDA5FMY9UQ.1GQQ7M7RMMVH4@pbarker.dev>
 <AS8PR10MB50736C390B00B646F697DCB2FD772@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB50736C390B00B646F697DCB2FD772@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 15:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249564

>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Paul Barker
>> Sent: Thursday, November 5, 2026 4:03 PM
>> To: Prasanth R <ragaprasanth@gmail.com>; openembedded-
>> core@lists.openembedded.org
>> Cc: Prasanth R <prasanth.r@lineo.co.jp>
>> Subject: Re: [OE-core] [PATCH] zlib: patch CVE-2026-85091 and CVE-2026-
>> 76844
>>=20
>> On Fri Oct 30, 2026 at 5:05 AM GMT, Prasanth R wrote:
>> > From: Prasanth R <ragaprasanth@gmail.com>
>> >
>> > Backport the upstream fix. It covers both CVEs.
>> > CVE-2026-85091 & CVE-2026-76844
>>=20
>> Hi Prasanth,
>>=20
>> This troubled me as two CVE ids shouldn't really be pointing at a single
>> simple fix. So I looked into it some more...
>>=20
>> CVE-2026-76844 currently points at zlib in error [1], so this one should
>> be resolved by setting CVE_STATUS rather than by assigning two CVE ids
>> to the same patch. Please could you send a v2 for CVE-2026-85091, along
>> with a CVE_STATUS assignment for CVE-2026-76844?
>>=20
>> [1]: https://github.com/madler/zlib/issues/1330

On Thu Nov 5, 2026 at 3:08 PM GMT, Peter Marko wrote:
> Also note that for master, there is a new tag since yesterday.
> Patches are then only for the older releases.

Thanks for the update Peter.

In this case we just need the CVE_STATUS assignment for CVE-2026-76844,
as CVE-2026-85091 is fixed in zlib 1.4.

Best regards,

--=20
Paul Barker

