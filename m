Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 06E236004D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 14:47:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4785qG5MxVzF2;
	Thu,  7 Nov 2019 15:47:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573138075;
	bh=A+3gGGzSw7GcY8R8xsQZyEANu3/5YBilL5moupIh1OQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qXrSRI5+edJA9+5EiMcTbEpFHimUGhs6zurNwmmxbnVs8G0I7kSlVV14Qa+T/77MN
	7koqkEfynLMVhjFFSgttUZoaOtLgPmIHHXxXMsqrLo8dLkv0/xWlNGf5+OGJ1U6WtW
	4glRXyW1l4unXHATdnEaiMX8vQLoVV9lpe+EsUjPE6AraDiD8g+elMPUMT8+DqkfND
	2zCSMYXkSC7UJm9lrt3kj9en42S64lodWYUA1EHHhpW/PXZD89sadUj5WwZlj4lSc1
	9b/JE36t6IppB9WiiF6JnCvv6AqEAjgP9UXnLg/VfhkBpud7S0I5k0AofA76bFPYpZ
	l4mZDyZPhnrprHKhOBBSQUYbSDgcLHLeLeiKQ7kXZoipPEd4lmnMa5GW+R2XkL92t3
	o1AK91EoHfQlMMwDmgDwR1mVrLlZiCvbx1f26lQSuzPTbkBtNgTKWhEGmTXG7HibP9
	Jlg+vO0cSOEv4sAQzHs5bWzWzd4IP3Xw/MG0fKCVRLSbvSx+FHuFyQfP3uRZz3zLMu
	8F5/R3w9vA9QZY/8fkRH4F4sdgTbKk6BkvNMAh5APVcXrD/ofgnhOKlaWbFt+xDb7h
	qdHU5Kfzo4hJQWj7XELsRP0tqHFjug+89DBIj+3vqotrvwqrQZfBn/nb/rGJc+7+81
	VtUq7u/ftZyihJbhC1psymtY=
Date: Thu, 7 Nov 2019 16:47:52 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Mikko.Rapeli@bmw.de
Message-ID: <20191107144752.GB23775@localhost>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
	<20191107111332.GA23775@localhost> <20191107121351.GK2398@hiutale>
MIME-Version: 1.0
In-Reply-To: <20191107121351.GK2398@hiutale>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH RFC CFH][sumo 00/47] CVE check backport
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
X-List-Received-Date: Thu, 07 Nov 2019 14:47:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Nov 07, 2019 at 12:13:51PM +0000, Mikko.Rapeli@bmw.de wrote:
> Hi,

Hi Mikko,

> On Thu, Nov 07, 2019 at 01:13:32PM +0200, Adrian Bunk wrote:
> > On Wed, Nov 06, 2019 at 05:37:15PM +0200, Mikko Rapeli wrote:
> > > Hi,
> > 
> > Hi Mikko,
> > 
> > >...
> > > I use sumo and due to various reasons like BSP layers, binary
> > > compatibility, contracts etc can't update to newer release
> > > or to master branch. I suspect I'm not alone.
> > 
> > I might end up with similar reasons, but for warrior.
> > And might end up doing similar longer term updates for warrior.
> > (not yet 100% certain)
> 
> I'm skipping warrior but going to zeus in addition to sumo. After
> insipiration from Yocto Project Summit I hope to run master branch
> in some projects with regular updates, and eventually aligning to
> some stable release again. Hopefully an LTS one :)

everyone is currently running projects on different releases.

Let's hope LTS will happen, and that with a properly communicated LTS 
schedule most distributions and users will switch to the LTS releases
just like what happened with Ubuntu.

> > >...
> > > The tooling will expose that sumo is severely lacking in security
> > > patches, but the tooling is a start for anyone interested, like me,
> > > to fill the gaps and publish patches for bitbake recipes we care
> > > about.
> > >...
> > 
> > Thud is officially still community maintained, as long as this is true
> > the point could be made that everything that gets fixed in sumo should
> > also get fixed in thud.
> 
> So to keep sumo alive, we should the also keep zeus, warrior and thud, and
> of course master branch first. For some issues this actually works when
> the exact same CVE patch applies, but the open question then is testing.
>...

When a branch is EOL it is documented to be dead.

But upgrading to a more recent non-EOL branch, e.g. sumo to thud,
should not result in losing (security) fixes.

The root problem is that "community support" for a stable branch in 
practice often means "no support".

If sumo is supported but thud is not, this should at least be made 
visible to users.

> -Mikko

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


