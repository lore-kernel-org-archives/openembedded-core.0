Received: from stoexhub03.domain01.net ([83.145.59.144])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RG4zb-0000C6-Ng
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 10:25:47 +0200
Received: from ad.chargestorm.se (193.235.91.228) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server (TLS) id 8.3.137.0;
	Tue, 18 Oct 2011 10:18:50 +0200
Date: Tue, 18 Oct 2011 10:19:05 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20111018081905.GB3751@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <20111014075529.GB4437@ad.chargestorm.se>
	<20111014104745.GD4437@ad.chargestorm.se>
	<1318592560.942.3.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1318592560.942.3.camel@ted>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [RFC] Preventing race when compiling external kernel modules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Oct 2011 08:25:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Richard Purdie <richard.purdie@linuxfoundation.org> [111014 13:43]:
> On Fri, 2011-10-14 at 12:47 +0200, Anders Darander wrote:
> > * Anders Darander <anders@chargestorm.se> [111014 09:55]:
> > > In our local tree, I've circumvented this race by applying a patch like
> > > [3]. (Well, we could likely have put the lock in do_make_scripts()
> > > instead of module_do_compile(), as we have done currently). Obviously,
> > > I'm not proposing to apply this patch, as it depends on lockfile from
> > > the procmail-package (host-package).

> > Just to confirm, it seems (after a very few tests) that it indeed is
> > enough to guard the do_make_scripts() with the lock.

> > However, the question on how to make the real solution remains...

> I've not tested this but it might give you enough info to test
> something:

> (Basic idea is to promote that function to a task, then apply a lock to
> it).

Just to give you some status feedback. 
Your code gave me enough to get my previously failed attempt at
promoting the function to a task. Which obviously showed a few new
problems, which I think I've solved. I'll just want to test it a few
more times, but expect a patch today or tomorrow.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


