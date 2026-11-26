Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15322.1795704519942266772
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 06:48:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=Hh4JD5q1;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=slcD/8WP;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 077A614002DC
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 09:48:39 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 26 Nov 2026 09:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795704518;
	 x=1795790918; bh=9xUcsTkH29ugdPBTA78iOMv1Z18FD9QLlKb7lT8r/pI=; b=
	Hh4JD5q1g7OTZDv+9tFkBax79x5lleAaLgFvGie+G/D1zHg0fAwWsHnQ+iBRIqJ9
	7DZleOjr8RnqGHg9LS/WxeRxMPs8JbpesfVI/X00H9Lms8+8xcJOkbObSqY50Ymw
	zl2yerUxxPOlxPoUScUit2Wdl6h3cfAMRkLUuGP5K/GehkpVKNZp/Yc1+mIzIht2
	0T09HWXkfQy8KdXjtHEZccZ/vfQp/lD64EC5ce/nr40mXSor33OC2YFuiy+Yq5rf
	LDNfp452TWVF+G+nkPdQXxWPhXdzv1/N3GqMfRYpHbujdg905vq4ZxIUjlaVVSWE
	GitgAj5bVSGpD9e/G1vX1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795704518; x=
	1795790918; bh=9xUcsTkH29ugdPBTA78iOMv1Z18FD9QLlKb7lT8r/pI=; b=s
	lcD/8WPiiavFOJdJMS13n4T0LS2/mHbXjq1aZdZUN7zX4zDhGVYruck9+Pimx7zI
	CTmV2HRSsryKB63vAUXrxRlvhsmjjMvZ4hHqj1OsnALOYwlgrARY8jZgRmU76nXU
	yA/p4RKZV570mrV68en1T/+ToXZ/l7jOUCBjREIxJQIldTSEQN5w9rCTFr3dE/tf
	vo4jXWLucyZ//SsNdu/h+Ekmc8KNPD76k6jLdjPL86CxFa0k2TOM0wjENzCDZBvR
	xKtUSH5K5mgp/MILAC6OMT3fTePQ5PEvlm9EAQYZmus3EHIZFVuld/tEJDVYQ3z2
	FmG2pyGE6qW06nzCldpLg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795704518; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:RVPCqea7YESRtJrlvd+JOZlBjOHl+/JGw/CnlmU9SLpEIHz
	t5LhyuzYrLoAVNYjg5SuoQMed7ZhS4VQgnabjjwXH9NzC5LmdFhnxFAU7fR3m49q
	njSY1KBJ4qN+7DZECMJmiTErJqf+rQJ7e9OM5m0iJORhZfHj90kuhhrnSX4OWqbC
	YYjD9UVVMt+DScbjcAf+nNrd2maZIYQdNoBwNDQp4MzyEioV1fjx76uABlbrN4kU
	zyhua4FP5tCrF522upecedqOf8+uXY+vGXL7D8UDdrkHW020A1dEUuhsktAEJIBB
	S7X1zGXi+7T8HrUQBNLv4JjtYdQiH4LpvEP3Hyg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:atWmLjC5rIrRhnT6zHzg6FB6xPnX2KVMnvGCy3O/LYc=:42RQHfbFljNQ/YFtwO0jnJ7qfxw+F22U1Dymml0vJXc=;
X-ME-Sender: <xms:xkYIa6LfXM5opkgHgSyVLFQXdXNYEk-a-ms1Iv5l9VqN0o0_ey_oow>
    <xme:xkYIa5Cq-w7Dq2ijMXjPQRl47hcdHWNryEbmyMMLLMW25s7cQ-7A6AB1tO7GuAB4q
    pdKiLugLgGQA2Oz6Cng7yZhJ2irj9Z2dW3YxZIrjMXvOrOhmzsr7sdH>
X-ME-Received: <xmr:xkYIazCSNzymOT37Va0mUyIc9FZZpauD9TnYWoQG2yjgiz2cEy5Ka7T7_Kb5mz_RbaYtPmeQ3j-LhowBwc6JZwmM1O9E>
X-ME-Proxy-Cause: dmFkZTFUj0PNzIBZxmhROHm/0+lwD8u1MACL9fQpeWnj7nP3kd6me04H5yeCDFJGNxi8Mx
    FQENI+AUw+2b9b/abzAMm7E4zAyMGwzE6TlNlAmQiUZKuutGqIdjcPQarWgvWWLN9eN+0F
    86hSyF6361cjhAjdn4jwGWm8dR7At8/ffqrceVCUWr8Z5MOhk01FGDgJ+882pKDbMGnDw7
    VzA5gBWdCnu118svaeG3cIreij9Bl9t+aXuo4dOkEVYx5+HVpmFBXHwPnVrDqqiht0++zX
    +K2+XEg/X6lkSkrA1NBlmliaVNDlcZYI5Tj8kkRg8/J/nrYNHLkwYmLCY6PH6lYfjWsUsY
    meXLCKOqPVA/QdQicBCmPIZhE+TxJ977DFxn7TPwQwkDdLelI6Td1mVb4/mpLIi18Kr0qk
    N7iin1Zf3oI2PjcCYde+1RiA3SBQZLh0bFHPgtvkADG2XqXgQ8yDIa1gkx1Tu8C2X3fViE
    PuV642wYBfDEGkZVlpgAuRhqS0KhQi6toeVFCNBQ99Te993MKUJrYQbQWfQ5jPXc3larZ2
    C9koLJyFzPDC70A0ZMtk+gZcYBZ8WEprDJ68H0MweNZdFFLy8n+dHwgNWrKi3Mb1LM3lOx
    pMoZFk7L7DdsLTXN+g6DjjrbEMNEIN/4WdcRgAw03KwLMuzH1aCV31+LuqPA
X-ME-Proxy: <xmx:xkYIa7CI4XoLaaLPsmRigCQvT7gF37ZBoYzztRvPz_QZWmH-T4t9fg>
    <xmx:xkYIa-oPK8qsstQPfZJ-5gDbyxZ16xZ5ZAQp_xM-5JuGzD5m6T6dJw>
    <xmx:xkYIa1lcVmAZQRTPkrOhY0Yt9OS1qfl8aIgJrnwkhmGFMje2G9vP0Q>
    <xmx:xkYIa-yPAkK_TrRxZBBmYGmMfj_3UCjmz1sBHl1ZkY2v_qSAjrjhAw>
    <xmx:xkYIa2folmu7xhrWVrQvjczg6rqqsi7UIpejP_TxOgphfj9nQzUZ22td>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Nov 2026 09:48:38 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 14:48:36 +0000
Message-Id: <DN584IMPJ2I4.1H8SGQSEPJQRA@pbarker.dev>
Cc: "Chris Laplante" <chris.laplante@agilent.com>, "Peter Kjellerstedt"
 <peter.kjellerstedt@axis.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] oeqa/selftest: clear SANITY_TESTED_DISTROS instead of
 failing
From: "Paul Barker" <paul@pbarker.dev>
To: "Babanpreet Singh" <bbnpreetsingh@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20261114185520.6-1-bbnpreetsingh@gmail.com>
In-Reply-To: <20261114185520.6-1-bbnpreetsingh@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 14:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251310

On Sat Nov 14, 2026 at 6:55 PM GMT, Babanpreet Singh wrote:
> oe-selftest refuses to run when SANITY_TESTED_DISTROS is set, and
> poky.conf sets it:
>
>   Please unset SANITY_TESTED_DISTROS in order to run oe-selftest
>
> Clear it in the test build directory with :forcevariable, so a value
> set through an override goes too, and drop the check.
>
> [YOCTO #11933]

Hi,

We discussed this during the patch review call. This is a minimal fix
for the specific error message seen when SANITY_TESTED_DISTROS is set
when running oe-selftest, but it's not a complete fix for the issues we
have with oe-selftest repeatability.

Ideally, oe-selftest should construct a new build environment from
scratch and copy in only the specific configuration that it needs from
the users existing conf directory. Implementing that is probably
non-trivial as it requires understanding the selftest framework and
figuring out what the tests actually need in different contexts. There
are also open questions to resolve such as whether the user's site.conf
file should be used as-is, even if we're dropping most of what's in
their local.conf file.

That is obviously a bigger set of changes and needs discussion. In the
meantime we'd rather not take this patch as it would just mask actual
problems.

Apologies!

Best regards,

--=20
Paul Barker

