Return-Path: <jacob.kroon@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6D0DA6C466
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 15:50:28 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id p197so1645027itp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 07:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JDFqQduL1dNfpzB983AhQutOeQT8jKX5qWy6RhgzKjQ=;
	b=KEKKlLpby93HS7LQd+oBUdWJqdsURUsgWSd/wTPwxWKxxdQAi4PZOhtsvZG5Itp7YM
	NQUxQR0/4NAEP+eXk52U7xa1qpEfFHRVUrMUCcj/sYJb+PBdxA7plEzBlnS+SyjCo9T4
	ClMn8NDwLn2C0K8Z1ScVhooBhmYJNeo6G4NfStsawc2FGcR1YpIxU3SsBO2mY36/r6jZ
	MZqSvpTsA0IZXbPGPdDvue1InRkUeuyxhTgLj316V5gidlVrw29fSpCX2mGqnENf8Gns
	eWmaLsyOTA8SzENbUT4YZNtzHya5N4NrNqpLOsEexiYQfnloZz0MfnzemgU98ntIXqcf
	AaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JDFqQduL1dNfpzB983AhQutOeQT8jKX5qWy6RhgzKjQ=;
	b=eqP9DExOdIyEVM+CNmuSNPGMMCzsV+PHfnGHyXoEpSyrxCHeyLR2sOJ0wtluPAaHfe
	RkybQbhB76ISqwSCBApusLxkIvL4+KCe9pXvSzZ1J/+l9DnxToMl0TVZ03ASLbFZT57m
	Eb7MipwoHxO3RRLxiPWwQaBG67rJxoOHj4v9gJg0XmnHq4o/dzGO4bcCkjoIoNIsTtLZ
	u3Tyyb43dUGgpmZ5E4j+nKhfYqMpmK+V8vykx45YJAkUouQtIQMwm/TeNGLVy59Ob5Ib
	A12ZYp+Q3W0JhVz9X50nLtNQAzPIYLMnv3skP2xj8+ODkeQOtdJOi6GopLVORUkS2uGB
	AmAA==
X-Gm-Message-State: AA+aEWZ4N8u5ZanMPXC4DoWCcP+cuZWaq5x3Cd7KWbo0eb1m4Bf2Vh8e
	HaIkQPooWq2Ti7PL4qO/QVs4bn7CzsAPlHOiZUY=
X-Google-Smtp-Source: AFSGD/UgxKx1Vrj445TUuKcJ656339V7mBdGtwS9BUdwxpizloGhdEethaHfZnuilgD+8ZHc4Y2oYktmgNAO+xDE/zA=
X-Received: by 2002:a02:a990:: with SMTP id q16mr42861743jam.132.1546876229342;
	Mon, 07 Jan 2019 07:50:29 -0800 (PST)
MIME-Version: 1.0
References: <20190106181350.25386-1-jacob.kroon@gmail.com>
	<20190106181350.25386-2-jacob.kroon@gmail.com>
	<7561c555f243ddaaa45bdd28eed97394c35d67e5.camel@andred.net>
	<CAPbeDC=vBTFU6G+CjKUwe_CjhqHqyN6mKxU3t+cr+aw+Wu+5DA@mail.gmail.com>
	<51ef24c85d664b08aa7a26d4537df4b02026bd54.camel@linuxfoundation.org>
In-Reply-To: <51ef24c85d664b08aa7a26d4537df4b02026bd54.camel@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Mon, 7 Jan 2019 16:50:18 +0100
Message-ID: <CAPbeDCniz5=m-mhS+q6O8VJe4xRJscrDnj89ChiAWwBqDs_8og@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 2/2] buildhistory: support generating md5sum of files
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
X-List-Received-Date: Mon, 07 Jan 2019 15:50:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Mon, Jan 7, 2019 at 3:31 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2019-01-07 at 10:38 +0100, Jacob Kroon wrote:
> > On Mon, Jan 7, 2019 at 12:09 AM Andr=C3=A9 Draszik <git@andred.net> wro=
te:
> > > I don't know what the intended use-case of the md5 files is, but
> > > could
> > > sha256 or similar maybe be more appropriate?
> >
> > I thought it would be a good idea to store some sort of checksum of
> > files in the
> > buildhistory when doing reproducible builds, so that it is easier to
> > detect
> > when a rebuild produces changed files, but perhaps there is some way
> > to do
> > this already that I am missing ?
> >
> > But I have no real motivation for choosing md5, other than that I
> > assumed it would be less
> > cpu intensive than sha256, and the fact I'm not too worried about
> > collisions.
>
> I used to lean that way as well however there is a fair bit of
> negativity associated with *any* use of md5 so I'm tempted to say use
> sha256 as we don't know how these checksums may be used in the future.

Ok.

> I'd note there is some overlap here with the sstate hash equivalency
> work where we build a hash representing a tasks complete output. Can
> you reuse any of the functions there?

I'll look into it, I realize it would of course be nice if we only
needed to calculate the checksums once.

Thanks for the feedback,
Jacob

> Cheers,
>
> Richard
>

