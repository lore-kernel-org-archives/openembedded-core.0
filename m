Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web12.1673.1619207834500519336
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 12:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=jBzFNi0L;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id AE6B13968
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 15:57:13 -0400 (EDT)
Received: from imap4 ([10.202.2.54])
  by compute3.internal (MEProxy); Fri, 23 Apr 2021 15:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm1; bh=lMrfr8ies02bOjjN28QI/4pPnWtba8C
	QirpYtDGNq0U=; b=jBzFNi0Llh/H/zVnc3GHpgKovAmutMXINKqoAfmbJheEH+I
	JGnXnOrK024SkPJzi2O+OGCZ/r2TmjAqAW3+9pRDUTaD7SouJBbnRmqn+pSBVhKk
	vzdsVXJZFwsusxNq/BAQg5FOaYdLvSx2d30eziho4fMvSXS49L4nrqbHhUYgtg2J
	FAgM9W8E659XiESb/16NVTYGNffJRhy65lPu1vqh5y9ZzxQR0XLbLpi7K+DaB1lM
	2MJkH1olNtBSOQ6epFjWy/yezjGuzki5rPIjLin6QFjktINBxxAjsxw0hqPUXSuQ
	xzfH/PCfcXPEpECkE3r4zrI97BwNQgwT5C5th2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lMrfr8
	ies02bOjjN28QI/4pPnWtba8CQirpYtDGNq0U=; b=VtHGnv32B8xsKqNahA8CCL
	iTwub8uh6rGnIldm6hbnBZ56SKdHK7oiqEnl4lBMd6C69TkZ5O6BvwKcdStn4YH9
	aC8lxe8qPaENj02hXstR1ksfADV4gsNTUJk+ufvKlF0JcUM7kodiTP9R5QDXlnus
	wKWJTRl3YRnDkApcflDyIRY1JkTqbZURdCjG7BPAoIvsZZSXzAIsKa5ca0MoGFua
	E9WNE2yi93BsteoUrZzHSsORA3wxeZoCjpDkn4W819VP9acwYDSZk2Ga3gsQdUlc
	vJowQP7fpfDeZuU4HDbogTKBg8vAi4Ono8jT9cncG0bp82YIFcJNJsRjZ6bB8kcA
	==
X-ME-Sender: <xms:mSaDYOPsly8rF0-DihzgMox5DMzGJ482AQbhRrvqZU57QlvOpaFJwg>
    <xme:mSaDYM_qvUVxp0W_25FqIRnKgRoOK5SJcRgUwpNGCSlcLj_5ak4QXmmxwCzn-lw0c
    1PxXu6CYhSrLHBCjKE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduvddgudegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesrg
    dtreerreerjeenucfhrhhomhepfdetnhgurhgvihcuifhhvghriigrnhdfuceorghnughr
    vghisehghhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeeufffhtdehudekff
    elhfdugffhleetudfghfejfeekvdfhgeetkeeuheevvefhueenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnh
    drtghomh
X-ME-Proxy: <xmx:mSaDYFRMB0Pmknq_jw1-dFkszIQRBtfjbwwr-KnnAWo2ziPfRKi1uA>
    <xmx:mSaDYOtjApNUk0opDvyhZLbZVFHcTCgbnyR8I7WHOMZyvNWuq1AlLA>
    <xmx:mSaDYGdxseA3Q_UImswYKVNt7QYmU9GzTbaLdcxj9Bka_8GWy8zodA>
    <xmx:mSaDYArx1UT768DsRAM5XFHtfTrMdoJzVgFgBqeKINTurT2HB3OqVw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 204681601A4; Fri, 23 Apr 2021 15:57:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <c69e0205-fdcd-4fea-8751-83c198446ba2@www.fastmail.com>
In-Reply-To: <20210418225310.1624909-1-raj.khem@gmail.com>
References: <20210418225310.1624909-1-raj.khem@gmail.com>
Date: Fri, 23 Apr 2021 20:56:38 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ca-certificates: Fix openssl runtime cert dependencies
Content-Type: multipart/alternative;
 boundary=eab799ac2f144dcfb04e1a92d2738a0b

--eab799ac2f144dcfb04e1a92d2738a0b
Content-Type: text/plain

On Sun, 18 Apr 2021, at 23:53, Khem Raj wrote:
> With commit dc778c70449ee5401b5a24ad18b22b88338c47c5, dependency was
> moved to openssl-bin which in itself was a fine change, but dropping
> dependency on openssl too should have been kept along, dropping this
> meant that openssl binary wont be able to validate secure connections as
> the CApath files wont be installed, which infact are required for
> openssl bins to work, following call e.g. fails
> 
> $ openssl s_client -connect google.com:443
> 
> ....
> New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384
> Server public key is 256 bit
> Secure Renegotiation IS NOT supported
> Compression: NONE
> Expansion: NONE
> No ALPN negotiated
> Early data was not sent
> Verify return code: 20 (unable to get local issuer certificate)
> ....
> 
> The local issuer certs are not found in default location
> /usr/lib/ssh-1.1/certs, this dir and its content is installed by openssl package
> therefore re-add the dependency on openssl

Good idea for a ptest. Change looks good to me.

--
Andrei

--eab799ac2f144dcfb04e1a92d2738a0b
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>On Sun, 18 Apr =
2021, at 23:53, Khem Raj wrote:<br></div><blockquote type=3D"cite" id=3D=
"qt" style=3D""><div>With commit dc778c70449ee5401b5a24ad18b22b88338c47c=
5, dependency was<br></div><div>moved to openssl-bin which in itself was=
 a fine change, but dropping<br></div><div>dependency on openssl too sho=
uld have been kept along, dropping this<br></div><div>meant that openssl=
 binary wont be able to validate secure connections as<br></div><div>the=
 CApath files wont be installed, which infact are required for<br></div>=
<div>openssl bins to work, following call e.g. fails<br></div><div><br><=
/div><div>$ openssl s_client -connect google.com:443<br></div><div><br><=
/div><div>....<br></div><div>New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA=
384<br></div><div>Server public key is 256 bit<br></div><div>Secure Rene=
gotiation IS NOT supported<br></div><div>Compression: NONE<br></div><div=
>Expansion: NONE<br></div><div>No ALPN negotiated<br></div><div>Early da=
ta was not sent<br></div><div>Verify return code: 20 (unable to get loca=
l issuer certificate)<br></div><div>....<br></div><div><br></div><div>Th=
e local issuer certs are not found in default location<br></div><div>/us=
r/lib/ssh-1.1/certs, this dir and its content is installed by openssl pa=
ckage<br></div><div>therefore re-add the dependency on openssl<br></div>=
</blockquote><div><br></div><div>Good idea for a ptest. Change looks goo=
d to me.<br></div><div><br></div><div>--<br></div><div>Andrei<br></div><=
/body></html>

--eab799ac2f144dcfb04e1a92d2738a0b--
