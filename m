Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7EA7E228
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 18:38:44 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id m3so6798100wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 11:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=DIl8BjeixBGic9/xrAh4hWN3twZ7ZzFwoPcpafjuaO0=;
	b=exeHv++28xygBTbgddpFNCRqks6G8ThmZn1ntCzlIJeNbgm7xH6+jaXD7DTWC9cfRU
	bWG71eNqrIyPctzvOz1nUjNoROgmO8ls0195SXIiPKUWNerle/gQrkQUXRDUTzA8k27d
	x8icI29O5/O+3HwJTlF5/78g9NJhm772+O37c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=DIl8BjeixBGic9/xrAh4hWN3twZ7ZzFwoPcpafjuaO0=;
	b=ftWYB4IUz0IIcW6A69QVau7/mEfDwwqLKTlHp+/OE+kmb4QsEtyAbYrYMo/Hi2Mz4X
	k+3CYW36qSRZF1z+XymK9dRYV1Gja96uigBZ/Tf/En3r/AruDPg54VqQhkMpdNBOkLzi
	xLFZU6wPTUVaiomwDzD2g/Q2I1xJ42FmN9iHnRL//BFElh3T9P0fhvGG0ThA3Lpa0Ri/
	bVhcROt7ZiGxNTIPoX7/7T1fJ8BY53yUnuiII4cekVofOEC05U0dfoO/rnKIRSMVfMVc
	15iB/goSNwWgAFYbMdhrP9lKdHy3ofDqmqqlNTAicByBu9LxVpL6b6OlrCrFNHxu8L2b
	ISgw==
X-Gm-Message-State: APjAAAUuZVLgggVVxmyLgU5muFCh3Omad3W4NfXjhTuT2T+pxL+5gwF1
	rde3YiH4ZY8neO0KVXikOehcxg==
X-Google-Smtp-Source: APXvYqz3VivbmPaBW8LDMzr3ESbAK6BKXQq4wHiKA+SE0h1UfhaY8uLhrDJJmeTras5BrMemjmdjrw==
X-Received: by 2002:a5d:4104:: with SMTP id l4mr34842878wrp.302.1558463925798; 
	Tue, 21 May 2019 11:38:45 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w18sm18203842wru.15.2019.05.21.11.38.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 21 May 2019 11:38:45 -0700 (PDT)
Message-ID: <b182fad0b95201771a7c01ab2d71aaba73810399.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Date: Tue, 21 May 2019 19:38:43 +0100
In-Reply-To: <CALbNGRQjahbkMzBmqFG4QQE4moF-qTFJrDDMzBVUnXBCTwGFMA@mail.gmail.com>
References: <20190521090032.14859-1-schnitzeltony@gmail.com>
	<20190521090032.14859-2-schnitzeltony@gmail.com>
	<03af571c3019042cff91f2703b15edb139661144.camel@linuxfoundation.org>
	<CALbNGRQjahbkMzBmqFG4QQE4moF-qTFJrDDMzBVUnXBCTwGFMA@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python-six: put python2/3 variant together
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
X-List-Received-Date: Tue, 21 May 2019 18:38:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-05-21 at 20:00 +0200, Andreas Müller wrote:
> On Tue, May 21, 2019 at 6:41 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2019-05-21 at 11:00 +0200, Andreas Müller wrote:
> > > Upcoming 60.2.3 mozjs (meta-oe) requires python(2)-six-native for
> > > its
> > > configuration. Currently python(2)-six lives in meta-python and
> > > it
> > > could be
> > > moved to mozjs's home meta-oe but that would be just further
> > > clutter.
> > > 
> > > Once applied here patch to meta-python will be send.
> > > 
> > > Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> > > ---
> > >  meta/recipes-devtools/python/python-six_1.12.0.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >  create mode 100644 meta/recipes-devtools/python/python-
> > > six_1.12.0.bb
> > > 
> > > diff --git a/meta/recipes-devtools/python/python-six_1.12.0.bb
> > > b/meta/recipes-devtools/python/python-six_1.12.0.bb
> > > new file mode 100644
> > > index 0000000000..9075745d74
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/python/python-six_1.12.0.bb
> > > @@ -0,0 +1,2 @@
> > > +inherit pypi setuptools
> > > +require python-six.inc
> > 
> > Can it not use python3? Python2 is rapidly running out of time at
> > this
> > point and I'd not expect new dependencies on python2 to be
> > appearing...
> > 
> > Cheers,
> > 
> No sorry mozjs uses old crap in their configurations scripts nobody
> else does (python which) and ask for python2 explicitly.

I've been giving this a bit more thought and its our intent to try and
remove python2 from OE-Core entirely so adding py2 modules back seems
like a backwards step.

I think this will therefore need to go to one of the other layers,
painful as that might be from an include perspective.

Upstream are only going to keep py2 compatibility to the end of the
year, if that so the recipes will have to fork sooner or later anyway.

Cheers,

Richard




