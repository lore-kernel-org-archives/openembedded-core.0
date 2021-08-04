Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.11160.1628093238156844165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 09:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1FC6940C1E;
	Wed,  4 Aug 2021 16:07:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JwyzKxg2EmJI; Wed,  4 Aug 2021 16:07:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ECCE340BEC;
	Wed,  4 Aug 2021 16:07:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5955417464F; Wed,  4 Aug 2021 12:07:14 -0400 (EDT)
Date: Wed, 4 Aug 2021 12:07:14 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] convert-overrides.py: handle few more cases of overrides
Message-ID: <20210804160714.GW1528@denix.org>
References: <1628040485-45946-1-git-send-email-denis@denix.org>
 <1628040485-45946-2-git-send-email-denis@denix.org>
 <3abc2853445a6f54a68cca95a87ee63925bf1588.camel@linuxfoundation.org>
 <CA+chaQfComiP6AtnyhFbcqbhxzjD8epMuxSbdDNYibDGjFtPOA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQfComiP6AtnyhFbcqbhxzjD8epMuxSbdDNYibDGjFtPOA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 04, 2021 at 04:29:45PM +0200, Martin Jansa wrote:
> Yes, I see the same in meta-oe and meta-webosose.
> 
> It's easy to spot false translations in incremental conversion where the
> diff is relatively small, but doing initial conversion on big layer with
> this change already included might be more painful.
> 
> On Wed, Aug 4, 2021 at 12:31 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> 
> > On Tue, 2021-08-03 at 21:28 -0400, Denys Dmytriyenko wrote:
> > > Add task-configure and few more supported values of TARGET_OS override.
> > >
> > > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > > ---
> > >  scripts/contrib/convert-overrides.py | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/scripts/contrib/convert-overrides.py
> > b/scripts/contrib/convert-overrides.py
> > > index 6505b18..23f63a2 100755
> > > --- a/scripts/contrib/convert-overrides.py
> > > +++ b/scripts/contrib/convert-overrides.py
> > > @@ -36,9 +36,10 @@ vars = vars + ["mipsarch", "x86-x32", "mips16e",
> > "microblaze", "e5500-64b", "mip
> > >  vars = vars + ["class-native", "class-target", "class-cross-canadian",
> > "class-cross", "class-devupstream"]
> > >  vars = vars + ["tune-",  "pn-", "forcevariable"]
> > >  vars = vars + ["libc-musl", "libc-glibc",
> > "libc-newlib","libc-baremetal"]
> > > -vars = vars + ["task-compile", "task-install", "task-clean",
> > "task-image-qa", "task-rm_work", "task-image-complete", "task-populate-sdk"]
> > > +vars = vars + ["task-configure", "task-compile", "task-install",
> > "task-clean", "task-image-qa", "task-rm_work", "task-image-complete",
> > "task-populate-sdk"]
> > >  vars = vars + ["toolchain-clang", "mydistro", "nios2", "sdkmingw32",
> > "overrideone", "overridetwo"]
> > >  vars = vars + ["linux-gnux32", "linux-muslx32", "linux-gnun32",
> > "mingw32", "poky", "darwin", "linuxstdbase"]
> > > +vars = vars + ["linux", "linux-gnueabi", "elf", "eabi"]
> >
> > I have reservations about linux and elf being here since this does lead to
> > a lot of false translations for OE-Core. Since OE-Core is now translated I
> > guess that isn't the driving factor so I'll probably take this but it is
> > worth
> > being aware of.
> >
> > I did just have to retest a translation of core so I now need to filter all
> > these out the diff...

Should I re-submit with 'linux' and 'elf' removed?

-- 
Denys
