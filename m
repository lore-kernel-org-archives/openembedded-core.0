Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id B3C306C0E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 17:22:15 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id v11so35347017itj.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 09:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=V9wvU43z/5kxkmxdhIUjKxR3ad/+j4t94P6cE3pKl+Y=;
	b=G7AtqQw2I2hRGHgwG0mOyms7zWqmY2LC4dBy5DIX5pwghWXy6XLyA4W6Ugd9Tx/7VV
	UNIaaZKj2pzcHdCU+GV7SfsvdP2zJ4H30kE3tcCKr0NQoL0a0CycRhIpYMSLGKCN3Nk/
	klafzfmXTsfAyDg362KtE32kK3NZoRe+2GXiOVc6YV0Bd461hLzUzxJuq8EKPw+lc+9R
	u04UpU1pJwgI+1lv68IpPGU1HUxElLRUUnPLNY7ju4BkyxLzrLXsMtJdnxcKTpVKuhSO
	Cw94Yk0dB9Tdd3HBIIOUUpgoJQ0s6ihNt0vkyjUtMF6keY5/1DnvFugEpkd0sZd3H6EM
	cPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=V9wvU43z/5kxkmxdhIUjKxR3ad/+j4t94P6cE3pKl+Y=;
	b=lnRh6yVZ/R5hZFFu4Kw933slX3gBidaUw3WLtPOC06vOSry1bZNgxPcB8a9eRP57hM
	+QESMdsd5v4Mj9WyFUMNrPUhbDZDKQiqSLCi+aK3vhvnVAWt+oSfSi8kpbinkjRXVUo+
	8QPiWLUPDbXh9msQPGMIQudN4hEp2R2LhwlCiTHq4GARTJgi0rvmYg1iq5TYtoyzjWwu
	xbTBCKSs/kXO7n4Vtk6DHO+CyO+bt1rh0UeyJAMDHN/TVBNaTpsex58IzK20mbwo17hK
	h9MAK9z8dt187TnicxLBYdRuLJRrqbvWD64seVTlBVY5LKhL6KCjHnMXI52GhKNs+ZjE
	ldTQ==
X-Gm-Message-State: AGRZ1gIrGiK4o4SO+3nppyIfTw+sqbYjFYGWPcDZuULyweT/y+2vlkTV
	ZTr/6mxXvbfBg5MBUuBtq59winxMlv5u4Kt+p/S1nw==
X-Google-Smtp-Source: AFSGD/VZQLPYKJF+XWQe8GQ65QHTwjU4uDV1rc+xwNtnVgyAxbI8fiZ2RfXZBT2nPixGz4O1RsQ79QNnwaCed3IvjZY=
X-Received: by 2002:a24:9142:: with SMTP id
	i63-v6mr11469859ite.130.1542388936659; 
	Fri, 16 Nov 2018 09:22:16 -0800 (PST)
MIME-Version: 1.0
References: <20181114132336.71049-1-raphael.kubo.da.costa@intel.com>
	<5d7a7c30-0d55-da47-c6a2-1dc0fcddce5c@gmail.com>
	<871s7l6mx3.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAMKF1sobx8ed6ncDifE-iCDyn=+NZpar2Wb4dXwbKzkmcphEWA@mail.gmail.com>
	<2a06fb2631686ac5691b5943815535167fe774bb.camel@intel.com>
In-Reply-To: <2a06fb2631686ac5691b5943815535167fe774bb.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Nov 2018 17:22:05 +0000
Message-ID: <CAJTo0LZgyZ+UF8aA5o1omor+Bev85uGzgOsnv+x74u-J8vK_QA@mail.gmail.com>
To: "Kubo Da Costa, Raphael" <raphael.kubo.da.costa@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH] m4: Workaround gnulib's fseeko.c implementation
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
X-List-Received-Date: Fri, 16 Nov 2018 17:22:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Nov 2018 at 17:16, Kubo Da Costa, Raphael
<raphael.kubo.da.costa@intel.com> wrote:
> On Fri, 2018-11-16 at 09:05 -0800, Khem Raj wrote:
> > On Fri, Nov 16, 2018 at 7:51 AM Raphael Kubo da Costa
> > <raphael.kubo.da.costa@intel.com> wrote:
> > > What's the relationship between the -next, -nmut and -nmut2
> > > branches in Yocto's poky-contrib? How do they interact with oe-
> > > core's -next branches? And what's the process for merging them into
> > > the actual stable branches?
> >
> > they are staging private branches used by maintainers. Eventually
> > they should show up in <release>-next and then into <release> branch
>
> Right, and how do I know which and whose branch(es) to check for before
> sending a backport (or even to track in case I just want things to work
> locally)?

You can be excused for not checking the maintainer's private branches,
so just check the release branch.  If there's a patch in one the
maintainer may point it out to keep you informed, feel free to review
it to verify what is scheduled to be merged is complete.

Ross

