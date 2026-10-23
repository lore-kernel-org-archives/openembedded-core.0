Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5142.1792755965104400703
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 04:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=ImGMVoIN;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=DYo2XR5y;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id DDF31EC01A3
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 07:46:03 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 23 Oct 2026 07:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792755963;
	 x=1792842363; bh=adnFF7Pfw8rvhydSMjxO0Nv4kOSmP6ybrbppQBVRscM=; b=
	ImGMVoINBP/uocszFpNaSBS5kRObVKzaQSgRuZtLfWujRzGb0zs33hS0NrEek7s/
	4Uz//V6r5fBEhVS1fx/Gx0tBLc1kez1XYyYv1Ws+yD0ODgwr75uEw+pPNTzc2ubZ
	QxGN9PGFp1fcvcHXM88/ilUqxpds36QJM90eBGEG04KLIEt8koNQPpyfDLh0STIH
	d4Bz1GIdZ4GtedFCph0p/p/Bq+p5JezYMhCPJeufabi6GTjZxfUO8PtunkCi2jA3
	gOz3iPfhViK9WLo6E79liH7O78H2O9UrOkvBCxLsNqqK/1L+21WT8CWZqJ02bhA0
	gnbCnt+j1p9lJaVmuk3uTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792755963; x=1792842363; bh=a
	dnFF7Pfw8rvhydSMjxO0Nv4kOSmP6ybrbppQBVRscM=; b=DYo2XR5yHc2xG61R/
	WO2eLl2UTnumZHc1PyYWICYSY2DL8j13dKGmGBLUvcC+v70aN1rsqh6+ajBB7lqQ
	Wzi5X5Z9WLEipiMJwWMP0zMW22HdZljGzo3/3eGArdqwg6eBJDLfpHkYaXgzPQW7
	mZ55tHTNY2Tmik8qVgnJLZCFgCwJRfXmV6iPuB9PHzeSeU5rsa9W9tEyTYVErm3F
	gtBE+VrMcAA0vXMnuX0k/eRnkaUNpkG9i6z6dM/BUOqraQeVTtsVuLIIgb+cwupB
	7wZ96yBIeSJsmx/RAqJ4xbevSWOaXQ0nqKHEqt/In9lAf4i0UgGSECGwjxM6DmBx
	GWwxA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792755963; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:bi4hTfS3gyCfCEWsDt9wVgBbQHH2iJzHsXY8ezir45wE3fh
	YL52RCK4CR0VGqlsEm3CQBiLQn5HtixReCFflJQMy0Lf3Xo6zmrQ6ofOH51hIBD7
	UTxrjgy+B6+xpZ2QkBS6s0eCrxBQEwfgXh9ClRKnVYcMDoQfL1jsrl3yunjLKm/z
	wzXoYlMzQanhJbPzLvgBR7iZ0voctNzWBStCbIpLTVXXA9q3DhG58zGsQ8lWQD/B
	E/d22eucOK0LXzYSDX5Sd3ltlNFY1Bw1foqgMs24AgjEAsfXbaeYsRlsNQxbn7ln
	oOXOWuIjMNV5NMvdFEWFYbLOintbCIPxJTOJscA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:sN0njMoeHqo15XGx4AGJsFgSRgLtvj6jt9r1tJlWMNw=:adnFF7Pfw8rvhydSMjxO0Nv4kOSmP6ybrbppQBVRscM=;
X-ME-Sender: <xms:-0jbavM4XpV81RZ4eAyIAgj7BQGcxSYJdYZxOWr9WZLchf4t0rzzVw>
    <xme:-0jbav8w4FJAarfCkTNDjKc-9w3aVP803oUBsKHwxSBSo9cAnKULPYZy7UPKosGSS
    AyXHrr8hcW_oGNpmqB8f629KZLGpzh9RzUP_-quMRT1p1GhPS0e6FeJ>
X-ME-Received: <xmr:-0jbar7s1jZMPQlSy-fxm5X3fd1juaGU_RtbR5VDmcTR4OkjPKHf3vw0hkhRXNjrKvPIs1qQKYG2gYaXJ3WSOz-9EoOGaXZ-t8hs_OMfHIA6>
X-ME-Proxy-Cause: dmFkZTE6hiqtcrlbB8L3p/Hk5qjSANLEGGiZomCQXQOjQGaJhTcJu5ZQHtqCOgCa+a9WqI
    RNsrIluX3wWibIY3VqVvyaI/AfLRUgIPdVbqBmf1taDJYO0FbZaI7HxfO51OQtxrHXmmEz
    XRoSS9G+kNKrMvxTIKL2mSPIDbvZXwpuGmlOgvAJEI/aIMMycyRMpObCo6Pp2fc+gkImtk
    oELBSaHHv14z6ooiVLIp28q9XyqcQDHrpp2wLePXrJc5KsU5RF/qQbxnPm1qjUauAUON0c
    LqRV8DRXgzM8uU0Grnx03vJH/vde7nmtcd9TQJxrYwPKk0aiExcoVrASNopi9olEtAXtW5
    ufXpjmYrmT9gGCals/AsAN2hDuQCQ31Vio1cvkeiivn61VMzOf9QuFX0k7Dz9Rvjm/5crV
    dFcnXrvfOsZYsRS8FrNYZGSoeb1MbZ/UhCB4lIwS7Kh4fPAuwDk4UnkXtpO/lEAlGi5z4T
    axTG32ArEqoACT85IWp7eh/Vc4ZNYuh1D46nJ7HP1zIAJ28E0/m/p+rRnKEdpom3zOgWie
    QNVJbfAD+OgXmo4n9flPNg4lrs0WRrVrLH2Udaz6yO/iI1pqwBB5IEm6hbPiAR2utRtQ6m
    rL8I2jst0e8A1Z8EphNkBGqJ0toMWxcoQP32BpUcRpE8Mfry1GbQM46nssGg
X-ME-Proxy: <xmx:-0jbau3JN524f_-6XLrXyBFt46YpU8vwtnf3o0fhy3y6hAJuE0zfIg>
    <xmx:-0jbaqBlbqacLCRvlvv_zfQfLUHIBZBUuF-JZHR6ZmsPUyqmwS79wA>
    <xmx:-0jbao3wZhnvf5FjtjS-wLwb9ShoLtmV5VAgpfezymJRQjepaTXcKA>
    <xmx:-0jbasvMgzB1T6QUju6QffIBkApKVTxQtvR54ioYJxVBR4CRbFDFgA>
    <xmx:-0jbanmvhjkeRGBaRoI9UKo6Iy1yeV-PEqXzC0v2hRmNuiXJOTN6-SIf>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Oct 2026 07:46:03 -0400 (EDT)
Message-ID: <f0cc7dde364501904c7169106da3148df5d97fb3.camel@pbarker.dev>
Subject: Re: [blacksail][PATCH] ca-certificates: Disable compromised CA
 certificates
From: Paul Barker <paul@pbarker.dev>
To: Ayoub Zaki <ayoub.zaki@embetrix.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 23 Oct 2026 12:46:02 +0100
In-Reply-To: <20261023113614.178667-1-ayoub.zaki@embetrix.com>
References: <20261023113614.178667-1-ayoub.zaki@embetrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 11:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248549

On Fri, 2026-10-23 at 13:36 +0200, Ayoub Zaki wrote:
> From: Paul Barker <paul@pbarker.dev>
>=20
> Backported a patch to address the eMudhra Intermediate CA Compromise
> disclosed at https://emudhra.we-have-a-problem.com. As this is a
> certificate authority compromise rather than a software flaw it doesn't
> have a CVE number, but this should be treated like a CVE fix.
>=20
> This is a backport rather than a version bump as Debian did a
> "non-maintainer upload" 20260816+nmu1 instead of a typical new version
> release.
>=20
> (cherry picked from commit c5098a7074996258e448bc6cf3d4fb1a708f7a42)
>=20
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>

Hi,

Backports have already been sent and are currently under test to see if
we can fast-track them in to the stable branches:

- https://lore.kernel.org/openembedded-core/20261023-certs-blacksail-v1-0-6=
c7ed969eafa@pbarker.dev/T/
- https://lore.kernel.org/openembedded-core/20261023-certs-wrynose-v1-0-83d=
d2facdbd3@pbarker.dev/T/
- https://lore.kernel.org/openembedded-core/20261023-certs-scarthgap-v1-0-0=
ba436174193@pbarker.dev/T/#t

Nevertheless, thanks for the contribution!

Best regards,

--=20
Paul Barker

