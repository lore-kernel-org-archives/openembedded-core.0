Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BBFAC7F455
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 14:48:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45zGW50nS5z1n;
	Wed, 31 Jul 2019 16:48:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564584481;
	bh=1jWdAhINvPKpGVX7GGMMAhNy0o6WraPr1wJar6gSZiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZwwCrHk6uz8rvcEkLuQWWRVx3/cclMOeHe+j9g5MA48Ekz4/FW/7RkvDwxOw3wBtX
	XmRpr2fwHI+jnVW2PkIO3rqPkLU07VW2vl3V9WjDqED2Vi9UgJ4TG5GmyEEsILvkoW
	kXm768YITN7IP5BX+9SQOOAZ3gUyVymsAMz8NBENP6rdlY1YX6kJBM/+r7gRaQyKz+
	xLvqrTJKSicwXdlFGr/mKwc0GKcJhSaM0Fbs/yBMuneEE3dRQICFhGfep/V6x39gy4
	+0HLZuST4ffq986MOhTRxuqU/33QljB5vYuJkH2GZ6enOtYiFd03bps9Cuv9B32P3x
	m+Ctw94z61DnBfPIYl/zeZ/bGWP5KF5EdCmsZjpZ+Zjm7PDnprU/K4IMo6C7TSrslv
	zyvOhr9TxPPw3gPizEAYK2azte0AeBi9DwwpwlTedFuSIYT1Az1Y7aqT0MDNCKd76l
	0DFKyfh2kpw2UHoZXKYRDMIw9/PkbpINCLcIEr/JfbZcHB90Gy0eK36dE3tFLAfcbG
	rrap+zcTw4Hrmn8170NZ5s5cYgpQ4tQEF/0hzFCCXOAgxa8Je040UdHsuyg5BuQ8JM
	Ii7JgRMiU5LYn0YdUSYWtexsemXWCbW0D2JBWRI70FIWeScS+/8oY1PMil24nXoicZ
	pYlYXG4ciPqVpJZPWDS86qD8=
Date: Wed, 31 Jul 2019 17:47:58 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190731144758.GC1647@localhost>
References: <20190731132957.4782-1-bunk@stusta.de>
	<CAMKF1sriCokV8j2TsVva1DbxBnoe3q84cd=XXXaLpv6aHhLT-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sriCokV8j2TsVva1DbxBnoe3q84cd=XXXaLpv6aHhLT-A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [yocto] [yocto-docs][PATCH] ref-manual: Remove documentation for the removed gnome class
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
X-List-Received-Date: Wed, 31 Jul 2019 14:48:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jul 31, 2019 at 07:33:37AM -0700, Khem Raj wrote:
> On Wed, Jul 31, 2019 at 6:30 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > When removed all it did was
> >   inherit gnomebase gtk-icon-cache gconf mime
> > which would also be the most trivial replacement.
> >
> > Most of the time not all of these classes were needed,
> > and it is recommended to use only the ones actually required.
> >
> 
> This should go to oe-core ml as well.

Added to Cc.

> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  documentation/ref-manual/ref-classes.xml | 15 ---------------
> >  1 file changed, 15 deletions(-)
> >
> > diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
> > index 37619e382d..5403f20b6f 100644
> > --- a/documentation/ref-manual/ref-classes.xml
> > +++ b/documentation/ref-manual/ref-classes.xml
> > @@ -920,21 +920,6 @@
> >      </para>
> >  </section>
> >
> > -<section id='ref-classes-gnome'>
> > -    <title><filename>gnome.bbclass</filename></title>
> > -
> > -    <para>
> > -        The <filename>gnome</filename> class supports recipes that
> > -        build software from the GNOME stack.
> > -        This class inherits the
> > -        <link linkend='ref-classes-gnomebase'><filename>gnomebase</filename></link>,
> > -        <link linkend='ref-classes-gtk-icon-cache'><filename>gtk-icon-cache</filename></link>,
> > -        <link linkend='ref-classes-gconf'><filename>gconf</filename></link> and
> > -        <link linkend='ref-classes-mime'><filename>mime</filename></link> classes.
> > -        The class also disables GObject introspection where applicable.
> > -    </para>
> > -</section>
> > -
> 
> do we need to enhance the documentation for gnomebase bbclass to
> mention about disabling  gobject introspection
> or is it handled differently now.
>...

This part of the documentation had been wrong for 3-4 years.

The gobject introspection disabling was moved to the gnomebase class
back in 2015.

In 2016 the gnomebase class stopped disabling gobject introspection.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


