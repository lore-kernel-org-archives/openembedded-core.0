Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13452.1795698661442109439
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 05:11:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=E3PkuYJ7;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=KrjlcKAg;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 660CFEC0AB4
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 08:11:00 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 26 Nov 2026 08:11:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795698660;
	 x=1795785060; bh=1C6SMQsSVb8pSUGpCxiuBrhV5wt3MTL/C5x/I23USMg=; b=
	E3PkuYJ7+82goZAmDX0jCC13n6rlGM2nDxyoIrFJN3pk/l5TeefISnutBvC7PEX/
	ZxmyH3N7fn/LcetT4EPsv8r9vGUy1MN4WGZHv3YRvvY359F6GciCxVrV2V9m57QO
	cSVdPbh6qHZfNZQD3EhkRWQKUxkAQkV/gQXb6hzmsrgTgE5W4o++YaandFipQGEs
	qk8Gk8+yF5dTVPeRZJ9fdkL5Y64EfcZXp1AWdv/3Y11foYjAu5VW4dlZgf9DsZ5+
	aYY1lL5RDFs4SuUFdINl5f0b03AFNZSqmlLVOvFYS3IP7Jntd67OgbPpOWYkQ9fD
	uKX8TwMJ85xU/Vdx3IxXMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795698660; x=1795785060; bh=1
	C6SMQsSVb8pSUGpCxiuBrhV5wt3MTL/C5x/I23USMg=; b=KrjlcKAgiiNxV4W3n
	H0vABaveZ2/odwd4uhNIMQ7PYtaX2S9dORJSvOTQG4xhMWj7xI78LlOtzHff/qgg
	7NF03L6pAw66DhWz19jEcFupMXhu8YG+G0iv9dVkcvzww2qSNxFS/rDKC/1dakWY
	0foVt1MP2FcSO0lrsoF0DuLDNiQGvqwjPGkA8Rij5qIAGmkyM65pb4aU0qSNyRUA
	Eo53eL/duAunDGAzl6yCWxYLCH4Dn8TxQiRvRvjssiaGHwF0fAJY8/LU8u+R+U18
	jqgiTePfyvpSWxul0EMk0XVJ5Ej39zIMyLbPLA9tZXHLfwCr9RGG6F2CIPTLJbm2
	TYjGg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795698660; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:oxdKKlsJhq2EYqIavDw2UCPufvtwxMYYNTJjFx0BkxdnSeR
	+NkjN5Qp9laN4ZaLcs43kdubKe/baNbOAzhXFTIZFMOpEeGYeqWNCLHCcXtAw3x8
	xgbaRao6Hjr/6mNLsp0UlUPY+Tto4kxjCrCdxOuv4Bp8VYH/h/ZkaD/k/mPjNNV6
	uz8kimDTbZ5WlMl3x8GOWG4PxnBq69RxLAbgeTqyW3/1f/DBEt4qUOlUbya4YPSQ
	tMJ4jm1raBLv90I0f53ueguCyb+avIUh5vkslGd+dR720XHEEM8v8r85qoMeD5gw
	mcEtWz2P/6PkP+yRDWufN5z6gMW49Vhv+ScyjGQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:AZo4htfeorhdp/WF8hhf/oL8zrov786dOrlKDyUYIFk=:/3CBjnoHdJGBQhJiNEmJnPQQCMNoyw5wmtyP7qKYhdw=;
X-ME-Sender: <xms:5C8IawAAGuavCkaSAac66MkDnX37iCRet73KT4VLxnREUtqW1x8OBQ>
    <xme:5C8Ia4ifpS3El30MfHDU6WjSTUGqRif187-uLnMW3hjF9IhJMO_ycouepzftKNAnv
    zP7P9OkeUMnLR3lZUgqQ5KgrhzlhEw01hxTaa3SRGtNJy2w590YZsdo>
X-ME-Received: <xmr:5C8IaxMTgnLIyhpDzpeheqa9ZefCA7AXkOSj24gJsl1M7RsXKkUxNI4_vzSm4255vxkBA5LR6W21nPLxRtSioBehJK7F>
X-ME-Proxy-Cause: dmFkZTEnKhvdztdy9/D6OD7fAWHtSPPKDiUAeJdfGEYPxq9+FxZCoRumvJ48XYoVO7YTKp
    pN2KkJPL3Ip5urIfmxQoB1j2axrYroyI3vlld7xYrvZXS1byZaG0sbTPoXMPRhRMLSwW4M
    5v7kRu935xruL5Er/I7dbSI5v+U1NsnqGX6VP9/vHKOdfaXb1Jb3o4YvR75rXTAgjCTdMa
    W9dNj6J/uH+QrlaZFDPRU1vfe60Kx5xOqiCUf2tIiF5kD2u/9KgoiZV1qnaaTSZtQwXcXU
    YqjaeWFlM7uze+8H02KivGGSQwCpYJg1al1hipghkFgjsdsEC7TJJ3UvvPCQHkGEei3BZT
    LeAOWTwyix+QOFJyLxoEFrRM55xHmtH2tGCBqd0yzaov9DnB624kMvX060yP5XQl6xkbBs
    HW4/T9ROTJNSNlxp9i7fK4Ol2uUHEAy/iei5wZeH87q8MYYiCpfRSa9j0kBtoh87c1RbKw
    RgzoB/eh8fQEKIl0+imZzS042RYUPgskESWK7LLA8cW/FKMgMNTDqe5Xx/FGVIsGSg4sD2
    QNDM5lYbkhslgqWT++e+4BHLW2GDPfImgekJWTvdns9HWDgsjuu2wqA2auPTbui6KqU/W4
    HU0BhvUmqkSuItvQhjHToAsLrDdotyT6SEnzyKzlj6W6oYSVRLDVpvU17mEA
X-ME-Proxy: <xmx:5C8Iax5649WO6qea3oqkM7BUuqZAGD64ssAjqXbj94MRd6qRBLqvKw>
    <xmx:5C8Ia31wAPPn1rdP-BrZaskTQSGN-_h-IpoTa8V2dyKG5vi2tmX0Fg>
    <xmx:5C8Ia6YeFJPCnqdYtR3v2qSMklwcE6pVvZsQz7xdzP27GyleCK4i3g>
    <xmx:5C8Ia3DjtsOnfD44EF9Z6Dy6BscI7WkH-zbBFh4mcKaSG1SU14OUfQ>
    <xmx:5C8Ia4bLTKPVQaXK5KgSZ6wFUOagQ6PCTJjPJvyWpS9xRp44WVux9A72>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Nov 2026 08:10:59 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 13:10:58 +0000
Message-Id: <DN561RGMU8LL.30LI4VXRH7MOV@pbarker.dev>
Subject: Re: [OE-core][PATCH 1/6 v2] hyperfine: add recipe
From: "Paul Barker" <paul@pbarker.dev>
To: "Trevor Gamblin" <tgamblin@baylibre.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20261125160821.3028875-1-tgamblin@baylibre.com>
 <20261125160821.3028875-2-tgamblin@baylibre.com>
In-Reply-To: <20261125160821.3028875-2-tgamblin@baylibre.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 13:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251296

On Wed Nov 25, 2026 at 4:08 PM GMT, Trevor Gamblin wrote:
> hyperfine is a command-line tool for benchmarking commands across
> multiple runs, written in Rust. It supports configuring the number of
> runs, enabling 'warmups', parameterizing runs, and more, with reasonable
> defaults (e.g.  running at least 10 passes of a command when the
> '--runs' argument is not given).
>
> More info at:
>
> https://github.com/sharkdp/hyperfine

Hi Trevor,

Hyperfine is incredibly useful during development, but probably isn't
going to be shipped in most production images. Nothing else in OE-core
depends on it, and it's unlikely that anything else will depend on it in
the future as we typically disable benchmarking tests in ptests.

I think this recipe is probably better suited for meta-oe, unless I'm
missing the reason for including it in OE-core.

Best regards,

--=20
Paul Barker

