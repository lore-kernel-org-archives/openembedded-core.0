Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2A08B7318E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 20:23:12 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id f189so212158204oig.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=WuyOwo/oK+80gEuZi6qlx2KGL/tZ0nnpx87Zbsi2oOI=;
	b=RHTdaHQWGRNn81v/GWiAvgEU5tqTNsvTNkaW4rcsrfvTq0pz2kN7aC+FktaIGQix6s
	RWSmpJm/7o+GoHhtzOE1b18SiKyfDwMMboIeij64EMQRhv6ZRmRGUth3wivqu5f1Ov3b
	OvHcp5Op829geAxzPWpN2pZ4oRMxpLvXDIhci6eFQ92XOWbkWYdQqmWNGvU5uJ2L/srq
	eixltyV5CYuy4K1zPwfmxaDborcLJqMfg/pSNDio7CVFIU6fXxVdZvserKYXYQInXyCV
	LEyurLhM7uTsk23DrwBo3b2CRPYf07cDpLUQrGUspeHLo1znqkNM+oiZcJYQhanbtlua
	7Rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=WuyOwo/oK+80gEuZi6qlx2KGL/tZ0nnpx87Zbsi2oOI=;
	b=gY14151FEwze2C6n7JUJGQqLjceDRcEWoHqrL+Z6Q5ZMfCdCjkhF4BSnQuQr8qYv3t
	+mX2mSJxRm+w9jDSbCpuKAhaBkpSTtGJVdpXRc28yDYAVZ7iTJmpjjHlQnv3spfSo7L2
	0D236OFFhsRImkDpAgvILrIRDYWZIVdfqRVM6H+wUEil23lg6EtPnhJzJpYya6oAFtVj
	rF39kEZVUs/Mah8B2kDvRa4QFGdp8XcWmOjym2JuV5VoSnx6YZyGJELyTU79zLulxoO7
	V6rfkjKWX8Z7rNbSESx1yy1c+q8vRqambyCEmUSt/X7SBeXnLudh4F6Jf4gAju4teok5
	Rh9A==
X-Gm-Message-State: AEkoouvv+8NJ6d9P5FV7Sp1NbpLDFjPDz9MQ/4h8OLH6yMEP2rfOkdh+7q+uNwTqTZow6fxE98HeQ/7dpy2kcQ==
X-Received: by 10.157.55.163 with SMTP id x32mr19599114otb.158.1471983792946; 
	Tue, 23 Aug 2016 13:23:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.20.3 with HTTP; Tue, 23 Aug 2016 13:22:52 -0700 (PDT)
In-Reply-To: <1471979514-8900-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471979514-8900-1-git-send-email-fabio.berton@ossystems.com.br>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 23 Aug 2016 13:22:52 -0700
X-Google-Sender-Auth: BS6eoKQhmG2BeHuXPCNNq3tynvA
Message-ID: <CABcZANkwznHXK+OQ4Dj=8mOQEUcNRjgvV4qmurMm7ti=tzd7VA@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python-3.5-manifest: Add argparse module
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Aug 2016 20:23:13 -0000
Content-Type: multipart/alternative; boundary=001a114095e81804f0053ac2ef65

--001a114095e81804f0053ac2ef65
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 23, 2016 at 12:11 PM, Fabio Berton <
fabio.berton@ossystems.com.br> wrote:

> Adding argparse module from Python's standard library. This allow use
> argparse without installing all python-misc modules.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>

Shouldn't python3-misc also rdepends on python3-argparse, not just python3
rdepending on argparse, for compatibility, and python3-argparse might also
need RREPLACES += "python3-misc", if you want to be able to install
argparse before misc gets upgraded, and could see problematic binary
package upgrades depending on upgrade order.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a114095e81804f0053ac2ef65
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Aug 23, 2016 at 12:11 PM, Fabio Berton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berton@o=
ssystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":2ir" class=3D"a3s aXjCH m156b8d2767db68be">Adding argparse module =
from Python&#39;s standard library. This allow use<br>
argparse without installing all python-misc modules.<br>
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.co=
m.br">fabio.berton@ossystems.com.br</a><wbr>&gt;</div></blockquote></div><b=
r>Shouldn&#39;t python3-misc also rdepends on python3-argparse, not just py=
thon3 rdepending on argparse, for compatibility, and python3-argparse might=
 also need RREPLACES +=3D &quot;python3-misc&quot;, if you want to be able =
to install argparse before misc gets upgraded, and could see problematic bi=
nary package upgrades depending on upgrade order.<br>-- <br><div class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature">Christopher Larson<br>cl=
arson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>=
Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a114095e81804f0053ac2ef65--
