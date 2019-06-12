Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 20AEE7CFF6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 22:26:07 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g135so8111695wme.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 15:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=TWdycOwTXIAPX0vot5XwYp/JCTwKog2YMB8SKlgI24Y=;
	b=JROZUSclIIcmrcJEcLT4qzqnctAqXCx58L4G8g5HrItbSM7V1tEtvpMrjlP4rFPHkz
	6AxLQ+mkMTKjQuOxKAOhaweKQACTDxBl+4W81YKZtlwjUzweeHNvO5ki2EpAPjhaeWEF
	TTY+FooeHEb4TJmUkSq6wHzEVj8cJBOCBCLUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TWdycOwTXIAPX0vot5XwYp/JCTwKog2YMB8SKlgI24Y=;
	b=B6KBckgc/1jYoE6z7n96yZE3S6aV6ClZRxGC7nosPt2J8r1pZNpi4G0qHFUYa5Eo6F
	gv9eT816HpnXKgbaZWX5u9nC4Inf8z6utW40D8TTjssUOlcOTdGnUzNQCKWk054UoTzu
	+6VwMZRwGeoBBFF5h7CnY2ecJlEZSbst36jzjyFkYWtW9eCMgNUhWgNvKUeoL8absJGd
	FwEiIc5laAeN08A3T0koagjS7+gXB38FloHLhmO4JCxkrEDau3KEG92obWFAat0W0NZC
	vjCsUiNOd2WA0X31V0Z72cxoslgmdFsl1wppmCIooRRY/4EzXS/uchzi+iET0yNVuYML
	xdUg==
X-Gm-Message-State: APjAAAUDbkeVFaE2rSozj9/gAv2tdTRduqwzIfiRa8YVdhjQ6ABrdpwB
	PYSIlrwuvJ7Bfz5hSJF8cgvo4Q==
X-Google-Smtp-Source: APXvYqzA8vN9NgNAYLYihGNX53pzwsP8eohRn8v+aH73Ky2A/xgvF3zdnk+OaViKdpj4KKdthqNGGA==
X-Received: by 2002:a1c:e914:: with SMTP id q20mr967073wmc.55.1560378367802;
	Wed, 12 Jun 2019 15:26:07 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s8sm1489578wra.55.2019.06.12.15.26.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 12 Jun 2019 15:26:07 -0700 (PDT)
Message-ID: <c068fa5192d65f2ffab2b1037bcf5f709b719862.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, Adrian Bunk <bunk@stusta.de>
Date: Wed, 12 Jun 2019 23:26:06 +0100
In-Reply-To: <20190612222338.GN2112@denix.org>
References: <1560289312-19244-1-git-send-email-denis@denix.org>
	<20190612053326.GA12642@localhost> <20190612222338.GN2112@denix.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mtd-utils: upgrade 2.0.2 -> 2.1.0
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
X-List-Received-Date: Wed, 12 Jun 2019 22:26:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-12 at 18:23 -0400, Denys Dmytriyenko wrote:
> On Wed, Jun 12, 2019 at 08:33:26AM +0300, Adrian Bunk wrote:
> > On Tue, Jun 11, 2019 at 05:41:52PM -0400, Denys Dmytriyenko wrote:
> > > ...
> > > * Now requires openssl:
> > > > In file included from ../git/ubifs-
> > > > utils/mkfs.ubifs/mkfs.ubifs.c:25:
> > > > ../git/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h:49:10: fatal error:
> > > > openssl/rand.h: No such file or directory
> > > >  #include <openssl/rand.h>
> > > >           ^~~~~~~~~~~~~~~~
> > > > compilation terminated.
> > > > Makefile:3457: recipe for target 'ubifs-
> > > > utils/mkfs.ubifs/mkfs_ubifs-mkfs.ubifs.o' failed
> > > > make: *** [ubifs-utils/mkfs.ubifs/mkfs_ubifs-mkfs.ubifs.o]
> > > > Error 1
> > > ...
> > > -DEPENDS = "zlib e2fsprogs util-linux"
> > > +DEPENDS = "zlib e2fsprogs util-linux openssl"
> > 
> > It doesn't (and should not) require it unconditionally.
> > 
> > Please backport "mkfs.ubifs: fix build without openssl" from
> > upstream git instead.
> > 
> > > ...
> > > -PV = "2.0.2+${SRCPV}"
> > > +PV = "2.1.0+${SRCPV}"
> > > ...
> > 
> > This was already wrong before but now is an opportunity to fix:
> > Since this is exactly the release, it should be
> >   PV = "2.1.0"
> 
> So, which is it? Do you want it to be exactly the release, or do you
> want to start backporting fixes from after the release? It doesn't
> seem to be a critical issue to warrant backporting, in my opinion.

openssl is not a light dependency and is one I'd prefer not to be
adding unless we really need it. Things like this may look/sound
trivial but they inflate build times, image sizes and build complexity.

I'd probably prefer to have the 2.1.0 with a backported patch in this
case if you're after an opinion :)

Cheers,

Richard




