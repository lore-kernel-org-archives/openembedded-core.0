Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QrVM6-0007tS-Ph
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 15:31:26 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Thu, 11 Aug 2011
	15:26:55 +0200
Date: Thu, 11 Aug 2011 15:27:03 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20110811132703.GA29758@chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1313065027.6733.127.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1313065027.6733.127.camel@phil-desktop>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: X11 as DISTRO_FEATURE
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
X-List-Received-Date: Thu, 11 Aug 2011 13:31:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Phil Blundell <philb@gnu.org> [110811 14:17]:
> Right now, there are a bunch of recipes (e.g. dbus, cairo) which always
> build against X11 even though the underlying software can work without
> it.  This makes it somewhat painful to build a display system using
> clutter (for example) without X.

> It's also moderately fiddly to stop X11 from leaking in by mistake; you
> can't just BBMASK the whole of "xorg-*" because things like pixman are
> still needed by cairo even when not using X11.

> So, to combat this, I would like to make X11 be a DISTRO_FEATURE and
> arrange for:

> a) libx11 to skip itself; and
> b) recipes for which x11 is optional to not depend on X stuff 
> if that feature isn't selected.

> Any objections, better suggestions, ...?

The opposite of objections, at least from me... This is something that
I've wanted to do for a long time (but I never seem to get the time for
it).

Once again, I'm fighting against not only building X-related stuff, but
also preventing it from leaking into my image...

I think making it a distro feature is the best option, and once we get
this into oe-core, I think we could extend this to some more parts.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB


