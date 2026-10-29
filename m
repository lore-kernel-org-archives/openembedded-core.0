Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10088.1793275129249121408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 04:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=QkmQGzmO;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=HU7QpOLv;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 5497E1D000F1
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 07:58:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 29 Oct 2026 07:58:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793275128;
	 x=1793361528; bh=P2xhqUIeUIYggm5+KqhjBcIgrCuqvL0jC7tpqBH8bLU=; b=
	QkmQGzmOr/9DsbiAHtY8TpDprbbATfNlOPRgRe/QwyGrh2I+e4L0EDjo2UOwzyQV
	8Vd+qp40tIiVBv1NIeosU3iz509s4yASQJQprlfzSoNnQ5kzh/Q1ZoHr3L1PPO+u
	MEaRCtzrJiw1xmU0I/PAB6pt8MXa1suWHNekvxQgjSB3vLLnUK64KI9cpBPGxjTN
	rwePoQXn6JrJMZhSrTZEGosUWKlJoOd0dVOE0sDIuDpUb2znztShFJzSO4EGcTwi
	VxhYe0YLGROld/tIJCFT8upWgtSphXpzkXQO12uueq6koTpRcq0oQg3PnASbXrN8
	wwALMDe/8O5IW+SMuxsDcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793275128; x=
	1793361528; bh=P2xhqUIeUIYggm5+KqhjBcIgrCuqvL0jC7tpqBH8bLU=; b=H
	U7QpOLv9wdxn4kOCfg+wQEFz/X18nhJnggQRdRGsm6qtT4TmeCIq/A4QnL3Gijgc
	L9DSHLH0uYHAxsaearhoH3KPbg2SN94jJ5a9hfpfug+/6fQapitgAfFi6cGaw20w
	18jMPekVbWqblT4sp2Bbod+oDOveNKomKXfAdOMW/8ffL7d42VJy1XhxPKXt67a+
	qcXm1P/MosioL2NTeGUaMmkx4tXVckEVtqX4UmactTnJjGbhwFng0bRzDK6CsfMc
	9XisUpc1gA3YRb9ePQxF4N8IKcmPxwLLbS6vSh5b0ffCsIMpXPg4SV7oH0HuvXUX
	2UyVN86rOCWPblPgdLruA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793275128; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:AsjjIOrVu+LQVbQN4VsBkAOTWgMzXhcpkGBe/XnB8ZQbxfz
	JJ2WPh0OOtae3WR82yQGhEWHkypVJumMf8D30HTugm/FxnY4mlhc+0uUXqp62c6f
	bLKtq5Q5IwL+UZgziziJ566Ah8N4ybl4h4f6m1ouIr/AENCbhmkEDUlVzOX0Lg5U
	uAOjuAwSFVelJhBVsQctXVwWtlJmdjTjUm2DGahQ5itaiYFLAI1hoYLAqpkSKnZp
	A7MAPRpk6D1a9q7xi5f513JXn7SLYPBTuF0/kiYpTACfSJmkUiZYLOZwyg/KgrDL
	tYnCDuKbO9nJHiApt8DdN7fhtZQQevZ8UIYJ+rg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:RU3czPBYHV3vLDOstVBx2sO9yp0+C3XTZ0laaSZF4eg=:5pHXngeqV8bDWcdyKyG6SWR032Diu/zQqOOKWyNyupk=;
X-ME-Sender: <xms:9zTjarLaNNgWQRPw5Ke12KlzoajVs3RMCK-Y3Dm_0heFRwxEcefT1A>
    <xme:9zTjalKpqFuVpgtH4H09VL1RLrg6xELzuOWlLqqNLTeaMwJ9v40A9mdKpxhDWHnA1
    lXdCQ4zrwMXP3YsRIBM2YyStU63d4B9RxVsql4_89QkJQuVvoNGvtxMXQ>
X-ME-Received: <xmr:9zTjahW60PZx6i2FyXAJkoq7nyWdHB0MILF98N80oNlXKbXgNlAq0uWO2J8g6IY7xm8iL2PgOoSVG5lf0_7vcSY9yKi7HuALhCC-RYs>
X-ME-Proxy-Cause: dmFkZTFdtr2pHA8TGLg3NqxzwKsP7d+jQYPAPAYzOdoPMio7YuRKdNiNlB/NBWsbQFOti9
    6LdcC/Eyb1CQoxS7hQJcdzS6mMcYTFA+vYzric2FVKCJ4KTWPffekRBZ9G00Rg3q075o0q
    hXCvBh7o/Iq62lyPYVzFIjbo4h6Oh9ws+opD/RgPAHJ/c+813oFb8NltKGHlrk8s9yK5Ot
    ogEgtDAQIgcZlaFlfdolOfCaAszbc42e2VWWCqzASSXYt3Cx2dWSlan0i1DJNNfN3jZZWi
    vEHTtv4v3AuQ6FZcUXjfxiSEMH1nDy7ZjY8uo01PCdWH1GUKVGdNwP6+ij0FVeFvsYkFAA
    QIFl8Ib53CEcf8cFl4C5+Yb9Tcm6PVXfmVy3nqDg31RPKNM68pxEaRHIWmf4v4CK2vDu/h
    T9mzk3IkCxU2nVKuLkSzNQrhRMkDA0WIl37d3GQ7SJuluZtT75aDqtoY9e6UYxX0OmC9v+
    w2CXR6/AUwz23zcGbVfLnlUBOHsmUxq20EQjHf65G/iDU/Sr0JGAjPXzOwGtTIxk8n+VpQ
    8o7ru4FNs9yWKvrwyvMjJf8dTNulvsB0J69s4pfNqSp5Sw5m2js3P8P25xbufAYSumShGP
    7K2ncf8xVPa8rKt+9vjAeC+aSXrLd35kC8zSJr4K49QIIdqherW1zDzNWipA
X-ME-Proxy: <xmx:9zTjavhhRIegRXQX1fxhmDnouCSVjp29nxenuqxAPL5ZzK5BOnGP2A>
    <xmx:9zTjak8EiVLRuMAB4lAObvv-KXDhLddUip-4iztWks93xD8aE0PIcw>
    <xmx:9zTjahC7oVaMZ-vVbs-RS7lAZWtZwMP84z3ydo5QoMhiRpwJUm391w>
    <xmx:9zTjapK4QV9ikkxSQVNW74-QsDmYIBpvfuLvM058P8oH1sUOxW00pg>
    <xmx:-DTjakTST1HNeApWSwVgeLXFEmUq8B2krU25WCrlzhu1A7Oht8lEZNV4>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Oct 2026 07:58:47 -0400 (EDT)
Message-ID: <9e99ff870ecd38d4cd7f22f0cb8f2e01b3c89199.camel@pbarker.dev>
Subject: Re: [PATCH 2/5] uki.bbclass: use f-string for kernel-not-found
 error message
From: Paul Barker <paul@pbarker.dev>
To: Maxin John <maxin.john@gehealthcare.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 29 Oct 2026 11:58:46 +0000
In-Reply-To: <auMzVOVVpRskKkDP@cad3020129e1>
References: <20261027081221.13-1-maxin.john@gehealthcare.com>
	 <20261027081221.13-2-maxin.john@gehealthcare.com>
	 <d367c259a241a33364960b8401e25e6e6ad465e8.camel@pbarker.dev>
	 <auMzVOVVpRskKkDP@cad3020129e1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 11:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248941

On Thu, 2026-10-29 at 13:51 +0200, Maxin John wrote:
> Hi Paul,
>=20
> On Thu, Oct 29, 2026 at 11:30:54AM +0000, Paul Barker wrote:
> > CAUTION: This email originated from outside of GE HealthCare. Only open=
 links or attachments if you trust the sender. Report suspicious emails usi=
ng Outlook???s ???Report??? button.
> >=20
> > On Tue, 2026-10-27 at 10:12 +0200, Maxin John wrote:
> > > The message was an f-string without placeholders combined with
> > > '%'-formatting. Use a single f-string referencing the kernel variable=
.
> > >=20
> > > Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
> > > ---
> > >  meta/classes-recipe/uki.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uk=
i.bbclass
> > > index 566eab1eaa..cfb930e93d 100644
> > > --- a/meta/classes-recipe/uki.bbclass
> > > +++ b/meta/classes-recipe/uki.bbclass
> > > @@ -138,7 +138,7 @@ python do_uki() {
> > >      if kernel_filename:
> > >          kernel =3D "%s/%s" % (deploy_dir_image, kernel_filename)
> > >          if not os.path.exists(kernel):
> > > -            bb.fatal(f"ERROR: cannot find %s" % (kernel))
> > > +            bb.fatal(f"ERROR: cannot find {kernel}")
> >=20
> > Could we drop the f-string prefix instead? String formatting with '%' i=
s
> > used more often here.
>=20
> Sure, I will send a v2.

Thanks! We just need a v2 for this single patch, the rest of the series
has been accepted.

Best regards,

--=20
Paul Barker

