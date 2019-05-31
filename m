Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1382B7E33A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 13:44:20 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c6so3069274wml.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ztFrTeadnqXDzUGDEJaxLidxAjq6s8/zX262NDm+Tz0=;
	b=iJVxAkVt1P+cFSUhx9Fh1T0jqr11D3Y6OXGnpt8ZxwIkWrsMG22D4/spKlnOGkw+Tk
	oDvQ69njUX/AQzQNsTt99GA/S4O0ZYGns4gvGsgUU8S33ftNvC92z3662EQNgw2nLKFe
	1LYzNBj5IAfbFUNOMU0wE6uD09vI8U44lkIOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ztFrTeadnqXDzUGDEJaxLidxAjq6s8/zX262NDm+Tz0=;
	b=odWdrWOsA5aIIryyCM+MnvoeiQtnQCCtPP3VeaWVNjvjjM+gIf/ppr0WnXmIZ0iktE
	AD0odUppNMrL/EbDjDveotcV0/+iT3dePFH+h51rjihJTlf0nAP/Nxe/8aEMwd5agSdU
	qXXXswaH76FFHEuV7Qu9+LR6rXhAAnSOPknSpD90Tq8dJchUubQ1chyodLZBB7dXXe2j
	qvDY3GXue0F64W84DK9GD9UNIl82L8mF0zsDKAeXfDJ2cvAGttn8FGO2rEkqwUVAT8ml
	hgC7joDoO2xOwXi+NAd3j4YefHfN3r1dO9X/n5CSQEU83AD/3vkU/0yMfjfrQXXp2Mer
	jCeg==
X-Gm-Message-State: APjAAAVIUqbySq7M3kwZ8k0mZzdsCK+8bJ7L1KmHZO0UDo/qG3annYnn
	9ZLQF+bCQrBhcfR898lf+2tJrg==
X-Google-Smtp-Source: APXvYqwxdzDFCm3+Sai/gA6/CdSxbk5ncKylee122Hhx6t7OUgKAAUS0NwwHzoK3e+xNWW+hbIqxTQ==
X-Received: by 2002:a1c:80c1:: with SMTP id b184mr5429648wmd.24.1559310261701; 
	Fri, 31 May 2019 06:44:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l18sm12839673wrh.54.2019.05.31.06.44.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 06:44:20 -0700 (PDT)
Message-ID: <a4415ea8c5f78e8b08f9361041ecb7ef34f44e2d.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Tom Rini <trini@konsulko.com>
Date: Fri, 31 May 2019 14:44:19 +0100
In-Reply-To: <20190530155753.GS20781@bill-the-cat>
References: <321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
	<d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
	<20190529212556.GO20781@bill-the-cat>
	<4571b3c03fb83ee01492dd1891e410becb72b0e5.camel@linuxfoundation.org>
	<20190529221726.GA16075@localhost>
	<20190529222920.GP20781@bill-the-cat>
	<20190529230203.GB16075@localhost>
	<aba82f4358b0479419ccc3412b83c052dce57bf4.camel@linuxfoundation.org>
	<ed68ff2b-e29e-54eb-f477-5026e45795dc@gmail.com>
	<9934d166bdb464e18d20ccb64f88fcebac019a07.camel@linuxfoundation.org>
	<20190530155753.GS20781@bill-the-cat>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Fri, 31 May 2019 13:44:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-30 at 11:57 -0400, Tom Rini wrote:
> On Thu, May 30, 2019 at 02:55:35PM +0100, 
> richard.purdie@linuxfoundation.org wrote:
> > On Thu, 2019-05-30 at 06:32 -0700, akuster808 wrote:
> > > On 5/30/19 1:13 AM, richard.purdie@linuxfoundation.org wrote:
> > > > On Thu, 2019-05-30 at 02:02 +0300, Adrian Bunk wrote:
> > > So.. Can we have a bz and xz version built until thud is in
> > > community
> > > supported and update Warrior to use xz ?
> > 
> > I think thud and warrior will work fine if we backport just the
> > upgrade
> > and the change to uninative.bbclass?
> > 
> > I really don't want to try and do both.
> 
> To be honest, I'd really like to see thud/warrior keep the bz2 and
> master switch.  Changing underlying host dependencies especially ones
> that we hit on in special early threads seems like a bad idea.  I've
> been doing too many "fun" things in containers of late, and CROPS
> might be fine but bare Ubuntu containers aren't and this would be a
> very funky error to diagnose.  Given we've released I think we need
> to err on the side of consistency.

Whilst we could in theory start hacking around the infrastructure to
put dual tarballs in place, I'd really prefer not to be doing that for
uninative releases for the next 1-2 years.

xz appears to be documented as a host dependency even if it isn't in
HOSTTOOLS and isn't very obscure.

I can see both sides of this :/.

Cheers,

Richard


