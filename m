Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 511776C0E5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 01:19:22 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id m15so1352279qtq.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 18:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+1Um+w0KrQX3th64PhltOOfdmhlUtjVsr0Fig7wLbJ4=;
	b=DdrvzKuOm/mFY2+dRawYOsK8o4SgQ63SD9D/tl7MLq+IkKqiSIpED2CNhQHcx70rGO
	ksgMErcOdbU4nvUYKOmBWCDKpUN4Mef0PXEFKEz61HwRqHQddRqqL3w/Xa9OUWBY4Mh1
	m/wXZUGXUR1ksJntMaBsJasDHJa5yqLdcwRuXlNi5Uxp47QF4rTfpHMJPcw/QVSWcwTx
	DFK55wDn9Qg5Twn92cyJp9e8Q/W1GO5tz2R/gDaGE4iRyQfk0jMRNpJNeP0T92FDoUBU
	IHezWLIWUdc39IJYC0fcZA9Au/ELFVPJ83ZMfLjBU/Uu942YJ1+x0vIYqUetxe0fA0L1
	TwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+1Um+w0KrQX3th64PhltOOfdmhlUtjVsr0Fig7wLbJ4=;
	b=niJyOrOAaE3la3lsckqF1BCMeBih0Sjjrr4IoCPhgIBqqnejhvt/6o4FLbnDVdS80z
	K5LQqg27RXGxrLeiG+cAwerxotp6uvY01lPzXAbppSJ111wKNJD+n4yUpBF5HtDys6DZ
	FeMIixPDm9+oyaSvidcVXOQWtLat0kWWs/OFucZiNi90TBVHyIdR370vmrouxV50Fg4c
	rB9VUD9svxUec7mLrO2ODeQ1SPHSX47LZIclORI81e+ybhUB5ZxvebU6W0HKtYNsNR8P
	sABVEmRa9LXOh/HEefmYlCSGZTAPyKrk8+PNP4nMzym9EhsIIysmm/79A4E5Dc4SB76i
	ViKw==
X-Gm-Message-State: APjAAAU1caKDEq5ugpH6W5tAAgFqYwLkuz/iMcjsVMhRF6/BYYO+uZ0L
	Dom0oTjBzd8Bz10niqaSBcvxi0auDw7iPfQ0JU05Bv+B
X-Google-Smtp-Source: APXvYqwnwB0dis2cb2e4knwcSaZLA28Lnklg47Me+xPdPw1h4MmzkmOzQgcjeGpz9wj305ITCTrlBZRJ1gNj1WhDn0Y=
X-Received: by 2002:ac8:4442:: with SMTP id m2mr7208117qtn.80.1570065562740;
	Wed, 02 Oct 2019 18:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190930213721.3320280-1-raj.khem@gmail.com>
	<279cb31b6c743596e9c7b19e613575f51a3b534c.camel@linuxfoundation.org>
In-Reply-To: <279cb31b6c743596e9c7b19e613575f51a3b534c.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Oct 2019 18:18:54 -0700
Message-ID: <CAMKF1sqSbmqw+pdA-Oes88z48KgYmdNiiqQEm=-oTeNtyDJ=WA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] layer.conf: Add xserver-nodm-init to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Thu, 03 Oct 2019 01:19:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 2, 2019 at 6:21 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2019-09-30 at 14:37 -0700, Khem Raj wrote:
> > Found signature differences when same machine is used as a copy
> > see
> >
> > ERROR: xscreensaver different signature for task
> > do_package_write_ipk.sigdata between qemux86copy and qemux86
> > Hash for dependent task x11-common/xserver-nodm-
> > init_3.0.bb:do_packagedata changed from
> > de0944d4fcaeed0efdb143a18cc406bd043469ae291de1704a999bc878a7691c to
> > ba7bdaf35860ba5bf5a5f4ce06379a77c88eb9806e09a1fc5373933888a46507
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/layer.conf | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> > index 27893b633e..a13c8dc9b2 100644
> > --- a/meta/conf/layer.conf
> > +++ b/meta/conf/layer.conf
> > @@ -44,6 +44,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> >    opkg-utils \
> >    gstreamer1.0-meta-base \
> >    ca-certificates \
> > +  xserver-nodm-init \
> >  "
> >
> >  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>
> This seems odd, why is xscreensaver depending on xserver-nodm-init?
>

yeah indeed, please drop this one. Its better to fix the dependency

> Cheers,
>
> Richard
>

