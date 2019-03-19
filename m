Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3557C6FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 00:10:38 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id j132so11594100oib.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 17:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=pey635CduRiIAiADIwsExw1FW1tCOnXBHcMz+i4Jlok=;
	b=R74RBvVyEG+Dg0zBDBlIJQlnk1RRqg/45Dd+PlP0791Xyk0i+FBPYVpYnx918FiOOk
	AfXye97l0VSeZBdgh4j2mwFhyo/AB/bxdGYbN7XHKQ005rjph5bIr0JiT9PYjFQFyT+x
	VSp0g93YOu9i7GFbRxFkdrMuQUibVqf2flPbxDA8acUNjVtGw9+IjrSnLdLj8IiKOjRs
	eh7FpgRx6oAeeriEZf/g0JZ8BJz/hYFpRl0g+fGM9N+cbPZtHO6nnBF2C7hQbnGLB3j1
	3IedzjyNqHCR96staCiMi+ROx6tLR/Wv3p5fQlGjy5veTlJyhFZsfqS/UR43rbSjUQf7
	RLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=pey635CduRiIAiADIwsExw1FW1tCOnXBHcMz+i4Jlok=;
	b=MmbgZdCrMwmu/PkF5WUn42IDsAgcO98z1yhUWxJEj/hwyjj+17t2Mqx8eJXFhmb0Hj
	Q2jwWtdoXUiQ5JExOkUCD1sTuluCuyy50zb13x6uwhCgcf0F2Amaf8oT3S3oRbJ94iHy
	dWSz9q+nr8QcPr3Ko+D55TBhtfA8Di6GM3pTfrxmgNipslNthahB6VjkED7rNZwV9b0z
	tbHATFmCP9+eCpU6/DlpxBs7HWjZ9/KyD10I1I6nTJ4Oj9RYbigcOBCghO0O+tqRB1zF
	LE1gRZ/iJrg3B0hx6yWtjGpd41+UfmhS6WQ+E1msdZPXhZPHI78dip03d8bZRV9NpyKv
	7u1w==
X-Gm-Message-State: APjAAAVnA7mCp2a/kSWqvxUuWnMCOLgMWeMIsppSBiA2uklF08Npnyid
	4ljeBX/bWFORdAHVj8fUTJmd0Me3Xaxt5g==
X-Google-Smtp-Source: APXvYqylcxAEqdd/0SIcvKpRdVpUC6Fa9kSfsTL870eeXiR0olMKrTlhBCafYH3UbsfagoSFLJUF9g==
X-Received: by 2002:aca:ef85:: with SMTP id n127mr167485oih.80.1552954238918; 
	Mon, 18 Mar 2019 17:10:38 -0700 (PDT)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com.
	[209.85.167.179])
	by smtp.gmail.com with ESMTPSA id i9sm4457366otl.43.2019.03.18.17.10.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 17:10:38 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f179.google.com with SMTP id b4so14583071oif.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 17:10:37 -0700 (PDT)
X-Received: by 2002:aca:c7d6:: with SMTP id x205mr124416oif.153.1552954237159; 
	Mon, 18 Mar 2019 17:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190318133618.4022-1-otavio@ossystems.com.br>
	<e9d01fa735d068ea16da35db9cf303841b67b909.camel@linuxfoundation.org>
	<CAJ86T=U0NLArgbpFWt_FooB0H9sTYxyqC345ZMftFDXezJfV9Q@mail.gmail.com>
	<5ebe88235599c79c6f125e327bf321f9e3c30700.camel@linuxfoundation.org>
In-Reply-To: <5ebe88235599c79c6f125e327bf321f9e3c30700.camel@linuxfoundation.org>
Date: Mon, 18 Mar 2019 21:10:21 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpdZiN+_6OEMAJO7yHoF9fn9KiY2o3zqVptdfG9uzF2jQ@mail.gmail.com>
Message-ID: <CAP9ODKpdZiN+_6OEMAJO7yHoF9fn9KiY2o3zqVptdfG9uzF2jQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] openssl: Use the c_rehash shell re-implementation for target
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
X-List-Received-Date: Tue, 19 Mar 2019 00:10:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 18, 2019 at 8:56 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2019-03-18 at 16:52 -0700, Andre McCurdy wrote:
> > On Mon, Mar 18, 2019 at 4:35 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > I went to have a look at how this upstream C utility was going and
> > > found that they've moved to github issues and there is no such
> > > issue
> > > open.
> >
> > It's already been implemented and is present in openssl 1.1.0:
> >
> >   https://www.openssl.org/docs/man1.1.0/man1/rehash.html
>
> Great, it felt like I was missing something!
>
> Otavio: Why do we need c_rehash on target at all, can we use rehash?

Likely, I am checking what would take to rework it all to use it. Will
reply soon...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

