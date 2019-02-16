Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id C12407C7F4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 15:08:35 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v26so12503426wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 07:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=C/B+g+NWjTl9C9XyHs4sj45RUPZLaIkMe4PO8GUTH80=;
	b=GpgWVcmsAlTvLQgZ07MryJF6X17t8W/jEVwC75EFenf0Snt4I+UyMmWmSoi0FVEtN2
	ha59tvGqrCe4/rPrlrR5Y3ObYY+bnA2hpbYeqX85uHRKQkYSMTKqgKf4Ofs7lrqs11mF
	sdvbRln6l4b8CO5zsAgtzvcBi2lvWKN4CkZP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=C/B+g+NWjTl9C9XyHs4sj45RUPZLaIkMe4PO8GUTH80=;
	b=Ch0LG+WCbMpB42nQsAb3sbkNjjVz1a8ijNssm8Yx1gBr4qITbUvE7izLXpMTm0Gvs8
	oj3iucf98IGA91HBWptE6EVrFPZ3m/9ivSV1KqyHlYEnGlH/Yr5aKlr5tKs7EgW6viqB
	zuq6Q8DWLJdHarj1EBSIQnLSlL3ARntqMpG1wBpj0b6mA7u3xONWKGwyCluMnhaIUBYN
	BOmIdznXtQoDGHiQdQaIb00ArtjlS0pP10Z7usWKz+VTG1CvWelmLRSnuEt3VwSyHLiI
	AP4GEnwtT1W31K6JpCt0PMhEcTQCjZ3dors38h9jTiohRVYARtoFxv2nq9KXUk58Gcn6
	718Q==
X-Gm-Message-State: AHQUAubgJfuJxJRonZZA8mojYYNIA3/jQ7kCkrQH1KE/XXMT8x551zkQ
	CoZpl9rFBWH2atLPl00DaqlYkw==
X-Google-Smtp-Source: AHgI3IbBAMO/1rzRYzzsx6FBr6uYUEa+jzP39kIsFqLHspHJhXMC0vaxYazRlQqWuQ4M81nxzUrg5A==
X-Received: by 2002:a1c:ac85:: with SMTP id v127mr9099805wme.62.1550329716331; 
	Sat, 16 Feb 2019 07:08:36 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id e9sm9790436wrc.56.2019.02.16.07.08.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 16 Feb 2019 07:08:35 -0800 (PST)
Message-ID: <c339588bee3e0558f35652d08071543b96973079.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 16 Feb 2019 15:08:29 +0000
In-Reply-To: <CAO5Uq5Q=GWBrsUGpk=uMGRrBapcnmB31XwYLve7OuhiXNOvp7g@mail.gmail.com>
References: <1550178589-15839-1-git-send-email-alex.kiernan@gmail.com>
	<76d71f8af98a4ebe6154ff5b7ebb59ccf989408b.camel@linuxfoundation.org>
	<CAO5Uq5R=cFd3h4QLmF_b=5iJORG2C2Zo3BXwtDL2MkR+PfucCA@mail.gmail.com>
	<689a3e6f6f81d9f9e300ea5d0d0e9641f753d87b.camel@linuxfoundation.org>
	<CAO5Uq5Q=GWBrsUGpk=uMGRrBapcnmB31XwYLve7OuhiXNOvp7g@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bmap-tools: update from 3.4 to 3.5
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
X-List-Received-Date: Sat, 16 Feb 2019 15:08:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-02-16 at 12:22 +0000, Alex Kiernan wrote:
> On Sat, Feb 16, 2019 at 11:32 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > We appear to have walked into spools of razor wire :/
> > 
> > This is an open bug:
> > 
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=10113
> > 
> > which I'm struggling to know how to fix.
> > 
> > What does appear to work locally is adding something like:
> > 
> > # We need the native dependency on python3-six at runtime
> > # See bug 10113
> > EXTRASYSROOTDEPTASK = ""
> > EXTRASYSROOTDEPTASK_class-native = "do_populate_sysroot"
> > do_populate_sysroot[rdeptask] = "${EXTRASYSROOTDEPTASK}"
> > 
> > Whether this is the right thing to do I'm less sure about.
> > 
> > It may be an idea to start introducing these dependencies where we
> > need
> > them to fix bugs, until we can sort the problem properly in
> > native.bbclass.
> > 
> 
> Thanks, that seems to work... I'd have been here forever trying to
> find that.
> 
> I'll send a v3 with that change in it.

Thanks! I poked a bit more at that underlying RDEPENDS problem as it
bothers me. Once I fixed the dependency loop detection code in bitbake,
the real errors became clear and once two of them were fixed, things
started working more as they should.

I've put together a patchset and thrown it at the autobuilder, see what
it makes of it.

I'll either merge your patch with or without the hack depending on how
that goes...

Cheers,

Richard



