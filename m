Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 09C5F7E05D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 22:47:59 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id x15so109897wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 15:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=4/DA/THigmSXq9N81M+G/ulJIZfUE/JAQnFpZe5TYMA=;
	b=QHhbaC+G4WZN2u79ulqZReJOxfVZSeyrqi2JU2A0IUE+aXha69iK3VbYsw3FL/iwls
	NP5PsTtP/mKxGJNCtta3CdPwe7LwLaqJ6R5Na1fXoeGNCxcKiDrxs6lUcJVG6Rymvk/o
	CbnBrYi6mbAW4CyGGeegQn6HN6EakWJm6tnHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4/DA/THigmSXq9N81M+G/ulJIZfUE/JAQnFpZe5TYMA=;
	b=exDPbw8CV4Pjcv47IGew8LItUXuhsD9LiezUZkhbVmQIgeNTUd/3nO92vl+MYbG2Fl
	m65Lm1jrfKmTL7EihB+T0ZF662l2iigj0tjzu2jg/BREpd3oowtLm1Bpr/ona1IENrxx
	PSO4NgMmWasAWhsjvMKAAuN9k1q/tcr+/A6pb17Qv+Bc4m2nAvD/5780QUeSpnufm8yr
	rnC40gcuzm6TtsDD8LX/yc96JrMfxtmbcTZCd67jiNCj+nOnIw4YCKWOStzfrJj/djaO
	3LsMrtmnHSp1KekgjCSFewY7tyTHKmxVz5eorP5Hw/snsOMxxsLOgwsil4vl1qqXAi8S
	dAjg==
X-Gm-Message-State: APjAAAUVEi3ctdpgHRF9hd2mV2OXUJ7Chrr7TmyiV76Le5/6+viNS7nE
	YSnrZuBtxwUy3iMrS9TVpjXryHIq7Uc=
X-Google-Smtp-Source: APXvYqwSLOZPds25n79GlDqFe0zMwu1a8ItmD9FWqnmUZWA6sQ6UJtD8+X6wqgCmj1QwSs1DwM89Sw==
X-Received: by 2002:a7b:cb06:: with SMTP id u6mr1469238wmj.170.1559861280544; 
	Thu, 06 Jun 2019 15:48:00 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id o1sm136231wre.76.2019.06.06.15.47.59
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 06 Jun 2019 15:47:59 -0700 (PDT)
Message-ID: <82281ed3a96c1979d968db922cd54883091b0129.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Adrian Bunk <bunk@stusta.de>
Date: Thu, 06 Jun 2019 23:47:58 +0100
In-Reply-To: <20190606184410.GA5907@localhost>
References: <20190605184116.24297-1-bunk@stusta.de>
	<a71198580613e3ad0d8ce05717e56a27db9a5e21.camel@linuxfoundation.org>
	<20190606184410.GA5907@localhost>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Remove manual RDEPENDS from PN-ptest to PN package
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
X-List-Received-Date: Thu, 06 Jun 2019 22:48:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-06-06 at 21:44 +0300, Adrian Bunk wrote:
> On Wed, Jun 05, 2019 at 08:10:31PM +0100, Richard Purdie wrote:
> > On Wed, 2019-06-05 at 21:41 +0300, Adrian Bunk wrote:
> > ...
> > > --- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> > > +++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> > > @@ -44,7 +44,7 @@ inherit autotools gettext ptest
> > >  
> > >  EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
> > >  EXTRA_OECONF_append_class-native = " --without-bzlib"
> > > -RDEPENDS_${PN}-ptest = "libasm libelf bash make coreutils ${PN}-
> > > binutils ${PN}"
> > > +RDEPENDS_${PN}-ptest = "libasm libelf bash make coreutils ${PN}-
> > > binutils"
> > 
> > Won't that need a += there to preserve the class definition?
> 
> Nice catch, v2 sent.
> 
> > How was this tested?
> 
> It looked obviously correct (famous last words...),
> and I trust that this is breakage that would be
> caught on the autobuilder.

It would get caught by some of my local tests I'm using to check the
ptest dependencies but because the autobuilder uses one image with all
the ptests in, I doubt it would catch it unfortunately :(

Cheers,

Richard


