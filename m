Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1THUQg-0001gy-AF
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 08:52:06 +0200
Received: from localhost (193.41.119.134) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.279.1; Fri, 28 Sep 2012
	08:37:02 +0200
Date: Fri, 28 Sep 2012 08:37:56 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20120928063756.GA21472@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
	<2523654.gPkJCTUPfL@helios> <20120927154530.GE3454@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120927154530.GE3454@jama.jama.net>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.20 (2009-12-10)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH 00/10] qt4: upgrade to 4.8.3 and cleanup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 06:52:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Martin Jansa <martin.jansa@gmail.com> [120927 17:44]:

> On Thu, Sep 27, 2012 at 04:10:20PM +0100, Paul Eggleton wrote:
> > On Thursday 27 September 2012 00:27:05 Martin Jansa wrote:
> > > Please test on more architectures.
> > > I've tested complete qt4-native + qt4-free-x11 on armv4t.
> > > And only do_patch for nativesdk-qt4-tools, qt-mobility-*, qt4-embedded.
> > 
> > So this is great work and these patches look good, although I'm still not 
> > particularly happy with breaking out so many of the configure options because 
> > I'm convinced it won't stop here; but it's possible I might be overruled on 
> > this issue. 

> I've added that, because meta-webos layer disables more stuff then .inc
> file forces enabled, so I would have to rewrite whole QT_CONFIG_FLAGS
> (if I don't want to have e.g. -webkit from .inc and -no-webkit appended
> after that through QT_DISTRO_FLAGS).

> But it can be just 2 variables instead of 6 if it's issue.

I haven't looked closely at the patches, but we're also disabling lots
of stuff (though, quite a bit of that comes from meta-oe). Thus, I'm
leaning towards an easier way to handle this.

We're currently using an approach were we add to QT_CONFIG_FLAGS, to set
our desired config, and oe_filter_out() to remove certain defaults from
oe-core and meta-oe. Thus, everything that can help reduce this mess is
something we'd appreciate.

Cheers,
Anders


-- 
Anders Darander
ChargeStorm AB / eStorm AB


