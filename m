Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB3E7CB4F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 20:22:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z7so699123wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 12:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=isW1t4Pf6zq7srTmvdEw4OsqLqXjyfVazNN+mk0TK6c=;
	b=hp8xYtFLeFUeJ5n29+r/3UNDmq1xAxOJJOf8xvBWEtk2r3NEdhlm21n76VCQ8vmSrP
	juZKF5gnwDbPDP4xSJ+rA6QZlFeExNxtUt5dP4oZWK/IPLFKmgI/juDyfW08Awoi0ghz
	PTpwIZ9+w9FANoG/+wWK2b7P+aVxMvtpkO+Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=isW1t4Pf6zq7srTmvdEw4OsqLqXjyfVazNN+mk0TK6c=;
	b=Jc9x9u/rlmK/S9j2O4uhJIuml2dpwQFFugmWwOXVKseEdvJ9od8etNG9KjT000zfrz
	NMNjhYj6nwmRvC4FlLzgw6OLgItFxt2F0s4npAYqI19GWWa7M7/eMqgJMiOIgNVFHd3G
	2idWrFAvvhCUIcgVHw5LfiSQ7wnyK+VfbwOgKrWML7NfoEjLCIl0dAp3jEFNGGCHN2Um
	8wTwdortIjHv0NRrlmGVPHuvz7i2+ZCOGF+hZW7x2niGeWrW+CumCrk/ZMxlJ+raU/ID
	oL7Y04b88JHmt0nQUOSaGEzJ0gwgJokWqbD/xGcw8PPNUnBME8lV40zOvfbX8EUM4HYZ
	1h1A==
X-Gm-Message-State: APjAAAXMNeIns7DYcpVKQFAo2REyWi7vzozyM77ppH1mgUennsOBJxGx
	Pa1yKb/pJzbqR6cBSwf+lSK1QA==
X-Google-Smtp-Source: APXvYqxn+ogC/mPsZlfGOZKHRuAxdrSj7N+zrpvnqtEd3ADW7O8NgIGDgw/xl5s2glFYTjkSFLeewA==
X-Received: by 2002:a5d:4392:: with SMTP id i18mr6425923wrq.199.1575490943310; 
	Wed, 04 Dec 2019 12:22:23 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c17sm9322327wrr.87.2019.12.04.12.22.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Dec 2019 12:22:22 -0800 (PST)
Message-ID: <da22a596541e5c77ada413de5b90898c6f180fe8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 04 Dec 2019 20:22:21 +0000
In-Reply-To: <CAMKF1srBqMDRHTDr9uKg4VLwNnFqPrnOwcv7S=8EfzvHDBZxuQ@mail.gmail.com>
References: <20191204193254.2418208-1-raj.khem@gmail.com>
	<ea686615755dd811edab17648e6b5ac2377bf1af.camel@linuxfoundation.org>
	<CAMKF1sp29T-e0=5BBoX_=ZtUEs7fh3qAU9P__dXQH6NxCL+6hw@mail.gmail.com>
	<6cada1f180fe4bad594d71033573ff9fba3a30e9.camel@linuxfoundation.org>
	<CAMKF1srBqMDRHTDr9uKg4VLwNnFqPrnOwcv7S=8EfzvHDBZxuQ@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: Use PCRE for hardlink
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
X-List-Received-Date: Wed, 04 Dec 2019 20:22:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-12-04 at 12:21 -0800, Khem Raj wrote:
> On Wed, Dec 4, 2019 at 12:18 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2019-12-04 at 12:12 -0800, Khem Raj wrote:
> > > On Wed, Dec 4, 2019 at 12:00 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Wed, 2019-12-04 at 11:32 -0800, Khem Raj wrote:
> > > > > Use PCRE, this enables using posix extended Regexps on
> > > > > cmdline
> > > > > 
> > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > ---
> > > > >  meta/recipes-core/util-linux/util-linux.inc | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/meta/recipes-core/util-linux/util-linux.inc
> > > > > b/meta/recipes-core/util-linux/util-linux.inc
> > > > > index 1fa82363b1..8f867aa9b4 100644
> > > > > --- a/meta/recipes-core/util-linux/util-linux.inc
> > > > > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > > > > @@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "
> > > > > file://README.licensing;md5=972a134f1e14b2b060e365df2fab0099
> > > > > 
> > > > >  #gtk-doc is not enabled as it requires xmlto which requires
> > > > > util-
> > > > > linux
> > > > >  inherit autotools gettext manpages pkgconfig systemd update-
> > > > > alternatives python3-dir bash-completion ptest
> > > > > -DEPENDS = "libcap-ng ncurses virtual/crypt zlib"
> > > > > +DEPENDS = "libcap-ng ncurses virtual/crypt zlib libpcre2"
> > > > > 
> > > > >  MAJOR_VERSION =
> > > > > "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
> > > > >  SRC_URI =
> > > > > "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${B
> > > > > P}.t
> > > > > ar.x
> > > > > z \
> > > > 
> > > > Given it works today without that, shouldn't it be a
> > > > PACKAGECONFIG?
> > > 
> > > its default with other main linux distros. I thought since what
> > > we
> > > were doing was not
> > > default, I did not see a need for packageconfig. I can certain do
> > > a
> > > v2 with packageconfig and enabling it by default, is that better
> > > ?
> > 
> > We're embedded so we're supposed to expose this kind of config and
> > tend
> > to the more minimal ;-)
> 
> I was more looking into native and nativesdk variants where this
> could be more important.

Sure, but your patch changes the target version too...

Cheers,

Richard


