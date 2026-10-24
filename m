Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2793.1792831672156849745
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 01:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=JzGkEDGG;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=UY5IVnMt;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 32E4C1400098
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 04:47:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 24 Oct 2026 04:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792831671;
	 x=1792918071; bh=tfeghvW37RVtTd2rYoXEatKA0LbpgeKoP1pvKmedZxE=; b=
	JzGkEDGGINCQJBw7kflh3xpSdSkDd/5KBfIkKJ15AJo7YZ9s9TrSdefSKdQLsV+K
	WcvqTMdLT8wt0e9mMg8u+2UvkHONI0a54cy/XedKSTrJN1ZsoAOyWADzlfy7DHZp
	brnuBgkMWWbM6tgZKeYRG1uMEcf128No71Bnb9Z0xn2GFoFDt1jwvSBL8iZTim8D
	YXKid6BLHk0PhelnniTQCirPLhzHpeyEtcwl7XiRCgf4tHc4tKlTJDMAUluY4NND
	+1IFSH5ZSL8vQua8fubOn2avH/ZEX7Yco/IBga1I6vSre2lhALEEhbQoBCEuvYzd
	yd3euCtAnjEcgqJz5hOnVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792831671; x=1792918071; bh=t
	feghvW37RVtTd2rYoXEatKA0LbpgeKoP1pvKmedZxE=; b=UY5IVnMt2nK0twumh
	yLPblF7vpD9912fOBQL5Y15eo/C7kOvTImQYMGrJYxgI24ptJmSLGKE5HF/w9sDH
	IRzukdtGmTMKxqdEfDtUMU8qSQh03JW4s6Zn4hdurjK9uXZNJDDJAY4ftWVID98s
	zUmF0jSfolCT9jMglS1yYpA6KbWjfJjy3ynwAbrp8pHb22OZMH1yx7jolg/7JHBV
	Hstjux+TtRlMynvB+txfZt0twFG2Dw8cFoAmxmH40ZicHjFtJDZB3hd4erlSWKCh
	FTvdfKVt0jQpYAFqHnimC+FP7S8kij7UecwnxNovZ2r0tyRRrO+qPlx0F00oGd08
	AdCIg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792831671; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:IHgmwaDUc+WSY3S6V/JwLzjIont+eKqGDDzqXvKccpyuY+U
	fxkeE4YZTZ3aZrw1E3FjSSgaXMNDFkv1HApHBeni4GfJiqsUq2zO3bJwO2Wh4YcA
	Qn7rnagmDnPkMd1iO6QzN+0zGkB3Uh16tdL48Y4Kp17MDohJpAqaNoTUPI+B7Ho0
	odc9R3bfM/rzfF96LW4s3sbR8AdSXqzoju8z2ZwWlfMm8EFkpeSHGWdUeRY4puJB
	U26cE/iE/TJtzs+tQnZVpk9dIk1c53bDN8L9Zkdr1pxWhsK7WaOC8ufxPryZCtLs
	SEN3x32hHcM+updP90ANouS4xuMVUKnNULKB9BQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:fW0rn+eVgfXuKziJM6EeHVSLYMeNdmKDhfbVMe0lDnY=:tfeghvW37RVtTd2rYoXEatKA0LbpgeKoP1pvKmedZxE=;
X-ME-Sender: <xms:t3Dcaq1JI9KFAaR6mz0hEoXzSge9hwico11KxGKkjDQUf7cF2cYMvQ>
    <xme:t3DcajFsR_fTctUuOUfWQ6NQ3eKSnR21FJ9qpTZdxF2Nv7__TJ1i2EB_LQQ-buW4f
    lRdKS8hiqjgzebeSsYkv8xntSf1TYxkASDxnAETq9xHIfwGYFwsW_T9>
X-ME-Received: <xmr:t3DcaggNEuSMNtopKCKWherbsJQHRa-Nyb4EU6h9FwoOIRpM6yDQRe2gLn0WB5pnMPAIQl_6f70JnTwZOaXEM40u5mi4EvxU3GiyFn4>
X-ME-Proxy-Cause: dmFkZTFGnXVnEdP8XE3q/J8YhMSORRyrdxmeBzQs2ECFq9vU2nesxIbXkQjdClZZQLSidd
    IAn9vJu4uIOYAMw3xsH/CCVKvIdAf4AKFXopqwUoftWHwpzHZKZ0pI009WFBO+wkZSx3rK
    do88GNvJNkv+jGP1fTLaZGRfXXrgo/NDxYgTSexPfODrO+B8o2Gm+zEjdHl8SJmGA+4nqG
    53x3DDuq8qBJKRAFuEvCSD8HG4E2ORwSE6tGu8YVCmLufWrpOA2ZvEZG3k8VK/84HVFzTs
    3+ydHFkhzLk3Ui2j/Qx9TtTb71I9p/OnSic/fvspXYlN5jHTfxiRFoqp7jD1PsL89GvKMc
    oqN/tJq2I3MbM7Y5DB0A5iPekQVTjDkzopUu7NWuXGCyVx/kUHdniT+arm323678zs2mGi
    B1OtVLCDt6ca+B43xtlR9Mf2oMzdrXq1lmLT2I8sJKtdU9EmUxXEg/r/K0nFcH7yfdG/dr
    5loPeMq9Dyq9yrpXkayQmKSgw3CjUrAVuAgiDHE9w7OKpTb7nxHp006pf4zF44jyfYYG4n
    M8ied0ISrIE4IyJ3F6yYCUGbzSrhSjU54MAEihsCqKd6+Z7TZnZpJ1Uq2fWpR6YQJUplZK
    ujegrFCnCN7a+9LPLBYKh96bXwp6Umpl09q/EZjP1V81uVbXvv7YoBOOrOmg
X-ME-Proxy: <xmx:t3Dcam8Fn27i7rxKOM5gub9ct5O7oBszqJGLCCfJDfgY-7Z4HdObfQ>
    <xmx:t3DcavqHsSZkkNq43NR-cJcADZx2A8j7Kp8bcBA1f9Xzx__DiqCBYA>
    <xmx:t3Dcat9s0b0qKu0JPcdyKcHnulkMzcEmEsB1mDCtafxjs_zvRnimgQ>
    <xmx:t3DcarVnJJVUM2GTjbb8cOVXvj1jVGHdflqaUsFFeM3vsL5ESV8X8g>
    <xmx:t3DcahaNq7rU5ckFTD9Ve64CmMCCYrK7hBiOYiSrIdxYVIFTywQgfIIi>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 Oct 2026 04:47:50 -0400 (EDT)
Message-ID: <338ca9bacb931c03c9701c43e3f50f0642019958.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH scarthgap 00/19] Disable compromised CA
 certificates
From: Paul Barker <paul@pbarker.dev>
To: Jeroen Hofstee <oe@myspectrum.nl>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 24 Oct 2026 09:47:49 +0100
In-Reply-To: <8968080d-ebc1-40f4-a2ff-9ce05b67ceea@myspectrum.nl>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
	 <18E1415384CA8ABA.3062525@lists.openembedded.org>
	 <8968080d-ebc1-40f4-a2ff-9ce05b67ceea@myspectrum.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 08:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248585

On Fri, 2026-10-23 at 23:10 +0200, Jeroen Hofstee wrote:
> Hello Paul, sorry again,
>=20
> pip has the same problem,=20
> https://github.com/victronenergy/openembedded-core/commit/867c6f1f48bf8be=
c3a6b394dcde26f97ba1413a7

Hi Jeroen,

It goes much further than this! If you want the full horror then look at
the NixOS tracking issue [1]. They identified 883 packages in their
collection which embed a copy of the CA certificate store. We probably
have less than that, certainly in OE-core, but getting this fixed fully
is going to take time.

For python3-pip blacksail is on v26.2.1, and v26.2.2 is just a fix for
this single security issue we can cherry-pick that to blacksail easily.
For wrynose & scarthgap though we need a targeted backport patch. What
you have in your victronenergy fork of OE-core looks right - please
could you submit that to the list for wrynose & scarthgap?

[1]: https://github.com/NixOS/nixpkgs/issues/576475

Best regards,

--=20
Paul Barker

