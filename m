Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 059B178332
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 07:55:41 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i131so2054516wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 00:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TQJJBkJ/iphFKX1mafS4NgOr0Wgfee3HZ1FxGWtwh6w=;
	b=kSB6rWhCMTLagOM4/s3u/rNYvMeuCK5iuc9AWD9k2JpWjU0fP38oC/hH+y91M4Gq7c
	Rtwa38o03YtE8GVXHfsqvpgg/MTame67vBiXxMSjzV8G+C2mWTOg5ui0AZhvA2z0oF+T
	mvAU1leK9Ab8YIzNj0YBXFVjfEC6Qt0Lxxdv+Xp1VgR7zqTNdmXfpMuWKwWwWqag2wK/
	wWndDW6X2FoF7O3O6ZZ2QnHw8jjT4LvA7mEt0tbs55iA+Bg9XJqcJbmLfwHkr27q5uEs
	0XCRbD/SwXmoWdu1VqgJi4Lx0TSLYz7tthKnDRkwPjTujID4wQsCPTry4NT+md3PjxB6
	HeZw==
X-Gm-Message-State: AHPjjUhZx7ryAhybvb6WTeHFyMp9pmdGpvz0a24xBACmb1eZ+PPFRRg6
	r4k+pnu9v9rQLW1apjM=
X-Google-Smtp-Source: ADKCNb6eNMH2PvqS9Ax5GvnyiWmCmf8ZzQNYqpGZLWDD+BBccykxRKOqxdPVZdh1zM2YSqAqxL7Jkg==
X-Received: by 10.80.144.242 with SMTP id d47mr13929239eda.79.1505462142312;
	Fri, 15 Sep 2017 00:55:42 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id e56sm326461edb.7.2017.09.15.00.55.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 15 Sep 2017 00:55:41 -0700 (PDT)
Message-ID: <1505462140.19222.6.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 15 Sep 2017 08:55:40 +0100
In-Reply-To: <CAP9ODKpLckOoc-dvXOFwCoDRiPXZb4dJJJ15+cs1SbtbBQ4wyQ@mail.gmail.com>
References: <20170912203608.14327-1-otavio@ossystems.com.br>
	<20170912203608.14327-3-otavio@ossystems.com.br>
	<1505290515.32675.4.camel@andred.net>
	<CAP9ODKoRrYs0SB1f6GCvFW6fStoEQNYkv7YbMfZdqbhLfGnXJw@mail.gmail.com>
	<1505384767.19222.4.camel@andred.net>
	<CAP9ODKpLckOoc-dvXOFwCoDRiPXZb4dJJJ15+cs1SbtbBQ4wyQ@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH v8 3/3] kernel-devicetree.bbclass: Add support to generate append to kernel
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
X-List-Received-Date: Fri, 15 Sep 2017 07:55:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-09-14 at 09:13 -0300, Otavio Salvador wrote:
> On Thu, Sep 14, 2017 at 7:26 AM, André Draszik <git@andred.net> wrote:
> > On Wed, 2017-09-13 at 09:30 -0300, Otavio Salvador wrote:
> > > On Wed, Sep 13, 2017 at 5:15 AM, André Draszik <git@andred.net> wrote:
> > > > On Tue, 2017-09-12 at 17:36 -0300, Otavio Salvador wrote:
> > > 
> > > ...
> > > > AFAICS, zImage is specific to x86 and arm, all other arches,
> > > > including
> > > > MIPS
> > > > have no zImage Makefile target, so we'll never get here.
> > > 
> > > Do you know which types we can use here?
> > 
> > * for CONFIG_MIPS_RAW_APPENDED_DTB this can be either vmlinux.bin, or
> >   vmlinuz.bin
> > * for for CONFIG_MIPS_ELF_APPENDED_DTB this should be vmlinux
> > 
> > see other mail :-)
> 
> What if I add ARM support now and when someone has the need for MIPS,
> and can test it,  it is added? I can use a switch case for ARM and
> error out for others so it is easy to extend.

Sure, at least it won't set wrong expectations.

Cheers,
Andre'


