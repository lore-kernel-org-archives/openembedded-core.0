Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5872.1795181412263564542
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=VWeQ+dGI;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=WWUbaawv;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7F2AB7A02DD
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 08:30:11 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 20 Nov 2026 08:30:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795181411;
	 x=1795267811; bh=Hzi5248WQ7FXM45QFqOFlk2wf19q79jQ42LP55AH9bE=; b=
	VWeQ+dGI1drKMWjT/8/eZJOhWbGlU8kQQ2wcAMaM3yq+/5nUSmZ4Wv39Dey7g4oh
	ImX2+ebFmMxvf8bNqelrYgrubgOIDudEIWiLFaDyD6bx+7UgQWEkX0+novEpFfxr
	uYsbEQILSpEeSOuRlli2dXCVJwB3YcFPPbmxWx6v3fIdldey8P8DQUWkI48RqZAA
	+lmpfVajNzGnb8mirBT1KA560t3TqaoI0bLLYD9prTdPTbD4AJEZgsmRwMTfXvA3
	8j+upcThQWH+9Bo2h0It1dS4gw0lrJoe3hodSg9QGidp6vnRMojcXdgTkmgOiZsy
	ku2CbRxcwdvANWqRvxGbRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795181411; x=1795267811; bh=H
	zi5248WQ7FXM45QFqOFlk2wf19q79jQ42LP55AH9bE=; b=WWUbaawvg/vvLrOU/
	sGghfD/f2X0yPzfIS/wbY3013o5AJD89I8Vs/Ca3qj0hiT+oZkdySpmpudbMb4ea
	ic+bx7/KUNWNe9TquzJ8gGThz3XoMOSqu0qIFYejNhfELJUx6bjzSKXm9sumXBVk
	Fo95KF32s/TUdRadIdNQlkCqAQeVH+pFhgJEOK//vLHB4IFJnBq++4nKoh8/51bd
	ZHDnpWgzWhohtrD0As3j81nelAPm+DOdD7aaIafwyvz2yIQtT2VuoixpA+4ug/3b
	FKcM12qxkDBcQJB56XosZEWbHCA+Be5uiZovYi5b5N0pHc1wQGZm6mh3LbmFdfNo
	aGvBA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795181411; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:ZYDupquXcTfFeGV4oRZYlzsPL4KxeVvRsk+JIx+MGVyjenW
	f4HNJF7LYJ8K0d+UfuG4cfa0XXNFqUWuVw2SRRp6+CMqrCFIT5yuIl7YIHVlGgpR
	wIM+SG30Yi5H9wFvRJ2lhIDHw39JL01qREtOpmJWi9jT0tvglbcZ4SY+8nuU+QAR
	sWjjVAcTsAGYJ0r5s/Y3T6CTy2UXbK/4gRSW3FIj0Sh9EZ4Xs9ZwzKNoxYenGaUC
	+eKuRHavOr0vbJaE5wX9HmBqi2bMAVvQpbtSG4qMytdyEtLTnpIeBA16YNzlMgph
	+Rno1lw8jXBRwzCD8HUSf10oTd5QmeTFGinYqiw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:GCjYurY1E9WsMucaH2GKcJFXvkIpvtFXseAUCQMqVwg=:EhpDUKrPtrVHJNDY4GumSN8UuHU+Iaf35DTwvv+bOPA=;
X-ME-Sender: <xms:Y0sAa9klN9Fqq2R6Vx1BbDFpsKzif-zeuyx8zI8ZYAxMHdOG0ala_Q>
    <xme:Y0sAa-2yG4ts6hLTtX5d_GdX7ak0HUJd-5nDPnqQ1PjNI_VWEtwUc1qCGv9lfXqrc
    iFk9IUyvcOxhGbxUHMP9YE0p6W0pPM9mQ7VcIUfKQnZTaSzkieo5kA5>
X-ME-Received: <xmr:Y0sAaxQTUcqzCqNePvKzWOwH8_soC2VWkr4yGVpx6W-9kBhZ_OY5xmeWn9WJ3k2zq6rT_7tatDIIZpmqGO-PPCrzpr2u>
X-ME-Proxy-Cause: dmFkZTF8oEoWjMSyLK3Gw+7Qfi1h6bqd8hapvdJZqWjxzIhsDydEgWlfFaQiE4BKeEoO/S
    MyWziURaLiAukLVKJvLkhLvcCFjE7TEcfGx4g9l/w7VAiJdDg7teQlwXVbo0ayZlFu0nBO
    Ov3nvgie45DdVG/zLip++NUBJI16LJ9cguKCEas0tTRZXB9HlFkBqCmQ4vmo7C+TJiaiCG
    ilRkROIUVJNxOVvUk4B63fU5lb12wPmqj9AfvPQ9YzftVh2Lk3IbsvVOUAsdLNK/weNoAd
    /B0RTRunKc4iUEfDLhwFfZVwi2tuDM0QsW+CnuAwhsk3GZ/4yjRawKj8EId8RKitT2/rpt
    Lf//67jFAzKhuAuRyBN/G+6KlsiY2JDPmSOM+nIS9O4YxvAz0gwjOY4AZCeJU/Rlt3mrcW
    38DTphy5R16FpojrlExB4MexsidPo/MiBYbVqaX2de9xq5Qje54yWtabwox9qAnMLXpFQy
    +gLsODZey5m6ZgDOPYAu/nIp/45cmmaWM2QLpYvWUXH+wHVniryJCWHH4+bAb04gU/jTSO
    nurVuqk/U6QtkHq5yISRtx0XQQyYHkAPab8GSNStJyq4X0xV/JW2s/oF42bP4r3yWmu+lm
    5los2s5vSzBvV91FyXpaRNqXPxiOgwek0btXkTl1lD04mEGbktypxc6m2dXA
X-ME-Proxy: <xmx:Y0sAa4tg8xFW3A5zD97wVs9CMP5Tr8pEv_NG_k-xY_RIJ2rG47_h4Q>
    <xmx:Y0sAa-Z6R8HzgkTq3-jidbnx7ufC2HKa--G6oLNT4CxAAb38WDLr4g>
    <xmx:Y0sAa1vjeeGwWPfkrL4EKcKv_zmMK8Be18_QyQ6A2LzsoqWRaCKl6w>
    <xmx:Y0sAa4FCouD2eajOjldHJnnFmpWoaytIiQOT1esw4ZjEb8MHK_nmww>
    <xmx:Y0sAa1_yvc-kxShWoHuMYZF50F-bovH773xz4qoGJ4VeAvcmaJZQmzli>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 08:30:10 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 13:30:08 +0000
Message-Id: <DN02P6581AAC.6W4V8B9MA0N0@pbarker.dev>
Subject: Re: [PATCH v3 1/3] archiver.bbclass: archive shallow git sources
 which have no clone
From: "Paul Barker" <paul@pbarker.dev>
To: <ecordonnier@snap.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20261117122457.435864-1-ecordonnier@snap.com>
 <20261117122457.435864-2-ecordonnier@snap.com>
In-Reply-To: <20261117122457.435864-2-ecordonnier@snap.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250791

On Tue Nov 17, 2026 at 12:24 PM GMT, ecordonnier wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> In the original mode, do_ar_original archives a source if the fetcher's
> localpath is a file, or a directory (which is unpacked and tarred). For g=
it,
> localpath was the clone in DL_DIR/git2, which a shallow fetch (BB_GIT_SHA=
LLOW)
> does not create when it uses the gitshallow tarball: since bitbake commit
> 457288b2f ("fetch2/git: Add support for fast initial shallow fetch") this=
 is
> what a shallow fetch does by default, and it also happens when the shallo=
w
> tarball is fetched from a mirror. The source was then silently skipped an=
d not
> archived at all.
>
> The git fetcher now returns the shallow tarball as localpath in this case=
.
> Copying it would make the archive differ depending on how the source was
> fetched, so unpack git sources like a clone, which uses the shallow tarba=
ll.
>
> AI-Generated: Claude Sonnet 5.5
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/classes/archiver.bbclass            |  9 ++++-
>  meta/lib/oeqa/selftest/cases/archiver.py | 48 ++++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
> index 0400d6e373..d1a8dadec7 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -204,10 +204,15 @@ python do_ar_original() {
>      fetch =3D bb.fetch.Fetch(urls, ld)
>      tarball_suffix =3D {}
>      for url in fetch.urls:
> +        ud =3D fetch.ud[url]
> +        is_git =3D isinstance(ud.method, bb.fetch.git.Git)

Hi Etienne,

These changes are definitely moving in the right direction, but I don't
think they're quite ready to merge yet.

Here we are still special casing particular fetchers, which we shouldn't
need to do.

I think we just need two cases:

1) If the path returned by localpath() is a file, copy it.

2) Otherwise, call fetch.unpack() into a tmpdir, regardless of whether
   the path returned by localpath() exists or not. Raise an error if the
   tmpdir is still empty after the unpack.

Best regards,

--=20
Paul Barker

