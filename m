Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id BBCC17F2E7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 21:04:41 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u25so67467763wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 14:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=GWtxQ2hXBPCOnyCQbN2c5J7unVgNrTEqNB9LPE4QP30=;
	b=POQWpTKIkuT8pve1OwFRswfV3JMDKOJDkhqHYWudT7P6R6VQbVg40bGIFwN9wCE7Hp
	5o/QXIJ9BSEmYA3l71kWbHvNqQG4EKbeRxAZdktF4YPeg5UYMHVyr/bce7vNKGfnX+t7
	g7LK5zSauodgYWVGlIaQ5rUOibCmgOi6yy55Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=GWtxQ2hXBPCOnyCQbN2c5J7unVgNrTEqNB9LPE4QP30=;
	b=DJd1C5Jt0Y5r/VXbBSw6wmDLDYwtPGux8LQidYD2etwHK5WggaaKyRATC8jHXd9Sa7
	FhYoZOKrE+zdSSxn7MeHeyxKhzEtHcOpGsvy1pqTtjpx5adLIl0OYW/+y78YOre6iDuh
	OXxiQbZU+LT0Tg/AvvOmim6oLlIZtG8O4LrxmBSta2OvPfmoCSVgpMRd04um1EMF1rAE
	s5KgdsEvU+uy+IZ4N58Pyh7U/Th6ZAvJW+I6NseADLjg4DMZqr5wRzNKqrs/KrN8haM7
	DdK+LWJ331IOynhbg734l8c8GEMCYyWqKWEJTFWMg7iPpB6AypWnjejunWMvI7iVALfS
	5VBA==
X-Gm-Message-State: APjAAAVItYSjcAplJ9cJpME67eOhSllr05vzqB/vbC2SPgY5Ch7buVPI
	ggeeSzwMoTNSGV+7tUrdJUz1jQ==
X-Google-Smtp-Source: APXvYqxB/rwkALtUBR5xlr1f9m2fz14wYiDaQLqGk/vSLWMaW2K3blxYMgKZbh7fIe14e1eKWHIUww==
X-Received: by 2002:a1c:a186:: with SMTP id k128mr5843948wme.74.1565125482485; 
	Tue, 06 Aug 2019 14:04:42 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f204sm148770310wme.18.2019.08.06.14.04.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 14:04:41 -0700 (PDT)
Message-ID: <2568b4259b4f1015ed6d72dbe7333c237cad2db9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 06 Aug 2019 22:04:35 +0100
In-Reply-To: <CAMKF1sqqXUDKM6gULavO49mbQk68xboaH1AcBTc5VR7fsH0KYw@mail.gmail.com>
References: <20190806205716.12240-1-richard.purdie@linuxfoundation.org>
	<CAMKF1sqqXUDKM6gULavO49mbQk68xboaH1AcBTc5VR7fsH0KYw@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sqlite3: Fix zlib determinism problem
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
X-List-Received-Date: Tue, 06 Aug 2019 21:04:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-06 at 13:58 -0700, Khem Raj wrote:
> On Tue, Aug 6, 2019 at 1:57 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > sqlite3-native in particular was finding zlib from the host if
> > zlib-devel
> > was installed. This could lead to races where pseudo-native may or
> > may not
> > fail to build.
> > 
> > We don't need/use compressed page support with sqlite so disable
> > the dependency
> > (it doesn't have a configure option so use a autoconf cache
> > variable).
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-support/sqlite/sqlite3.inc | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/meta/recipes-support/sqlite/sqlite3.inc
> > b/meta/recipes-support/sqlite/sqlite3.inc
> > index daf3db5e9fb..2ad621503cd 100644
> > --- a/meta/recipes-support/sqlite/sqlite3.inc
> > +++ b/meta/recipes-support/sqlite/sqlite3.inc
> > @@ -21,6 +21,10 @@ CVE_PRODUCT = "sqlite"
> > 
> >  inherit autotools pkgconfig
> > 
> > +# disable compressed page support as we don't need it
> > +# we can see non-deterministic floating zlib dependencies
> > otherwise
> > +CACHED_CONFIGUREVARS += "ac_cv_search_deflate=no"
> > +
> 
> should this be done for native only ?

Its currently disabled on the target since the dependency isn't in the
sysroot and nobody has asked for it...

I think Jason is working on a PACKAGECONFIG controlled version but its
going to be uglier and I'm torn...

Cheers,

Richard


