Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7916978ED5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 17:20:09 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id u12-v6so8481480wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 10:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Oo3le3hqpBm5zA6FvQ0z97z3y9b6dyREXuszKA+Kw7w=;
	b=NnUWJgixjCLlBexKpi4/mx26vjQvUsLDiLeV3nlIVmi1G589n4qCupoWL1nEQAq01m
	RphXhxnSlY7DrJElBhzkaBbU+bDHtZ5p6aFQXW+bSkR0pxZ7tnhqR8cMTg2aq+F9gafy
	QIPssKgWtR8/DViJblRG1hObl4G9UCOObk7+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Oo3le3hqpBm5zA6FvQ0z97z3y9b6dyREXuszKA+Kw7w=;
	b=RZZP3idXBVwJsUjDFmvKGwROBpWjHRSlT98JY1YzFvCktLDt/0mQnFNNa2Q5Qq1Bai
	7hon8LAFnmXDx/dLFDLBt3d7NvcyOUJlwRwSNQg55h8m+sStEneUZwBrcGsD0LRcbM21
	iA833bmFegwo+i7wGu6PLcEKQ+p68/5cgIIu1+1f5l/fTELXZVbj8IWKmeavuZiHNySY
	QKRLx+Q/xOr9Ss8WvEIEhyA+13T5RnW9mlM3Y0OSgDYHHMf7KiBB2i1iBmMzTJQFqOF3
	hZTK/bIJ1csz7azfMxqra1azFyIqvto/EaiWYc7EKVpw3Yg84MoKHxxRS+8+i/fPcl3h
	B1OA==
X-Gm-Message-State: APzg51DeuPiUESQxh6r0YMufzwZn42oCvf8CEQBDPCFN+XQP2H4o1jw7
	S5pHKeJi5MkdZTRYlT4tAH5gSQ==
X-Google-Smtp-Source: ANB0VdZ73axoAssQZbo0wXH5dQngdPGOu7gXJHvuJpeEwyt2docK+fNvLTR9CufM36yk76DRyz7QaA==
X-Received: by 2002:adf:a41c:: with SMTP id
	d28-v6mr26512915wra.121.1536168010314; 
	Wed, 05 Sep 2018 10:20:10 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w15-v6sm3748521wrs.8.2018.09.05.10.20.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Sep 2018 10:20:09 -0700 (PDT)
Message-ID: <bebe6365ee43a2a3a586073bc5eadabbd6fa0c80.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 05 Sep 2018 18:20:08 +0100
In-Reply-To: <CAJ86T=Wam53MwCr-=NCkLNEbbKOEfwjB0Z3Pbkf+Q+BVEZhpyg@mail.gmail.com>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
	<20180905165227.29435-2-richard.purdie@linuxfoundation.org>
	<CAJ86T=Wam53MwCr-=NCkLNEbbKOEfwjB0Z3Pbkf+Q+BVEZhpyg@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] os-release: fix to install in the expected location
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
X-List-Received-Date: Wed, 05 Sep 2018 17:20:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-09-05 at 10:16 -0700, Andre McCurdy wrote:
> On Wed, Sep 5, 2018 at 9:52 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > From: Joshua Lock <joshua.g.lock@intel.com>
> > 
> > os-release (5) recommends that the os-release file be installed in
> > /usr/lib/os-release and that /etc/os-release be a relative symlink
> > to it.
> > 
> > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-core/os-release/os-release.bb | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/recipes-core/os-release/os-release.bb
> > b/meta/recipes-core/os-release/os-release.bb
> > index f9887047561..dae5748ba7a 100644
> > --- a/meta/recipes-core/os-release/os-release.bb
> > +++ b/meta/recipes-core/os-release/os-release.bb
> > @@ -1,7 +1,7 @@
> >  inherit allarch
> > 
> >  SUMMARY = "Operating system identification"
> > -DESCRIPTION = "The /etc/os-release file contains operating system
> > identification data."
> > +DESCRIPTION = "The /usr/lib/os-release file contains operating
> > system identification data."
> >  LICENSE = "MIT"
> >  INHIBIT_DEFAULT_DEPS = "1"
> > 
> > @@ -42,6 +42,9 @@ python do_compile () {
> >  do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
> > 
> >  do_install () {
> > -    install -d ${D}${sysconfdir}
> > -    install -m 0644 os-release ${D}${sysconfdir}/
> > +    install -d ${D}${libdir} ${D}${sysconfdir}
> > +    install -m 0644 os-release ${D}${libdir}/
> > +    lnr ${D}${libdir}/os-release ${D}${sysconfdir}/os-relea
> 
> Typo.
> 
> Please add the rm too when you fix that.

Too late, was already spotted and fixed. I'm not adding the rm since
we're not going through all the do_installs adding rm statements in for
things, I am totally against doing that.

Cheers,

Richard

