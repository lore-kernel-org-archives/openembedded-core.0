Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RkZHV-0003j4-GU
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 11:50:18 +0100
Received: from ad.chargestorm.se (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.213.0;
	Tue, 10 Jan 2012 11:42:39 +0100
Date: Tue, 10 Jan 2012 11:42:39 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20120110104238.GC3664@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <20120110100306.GB3664@ad.chargestorm.se>
	<1326190107.12160.45.camel@phil-desktop>
	<1326195469.B1rBFhU1YM@helios>
MIME-Version: 1.0
In-Reply-To: <1326195469.B1rBFhU1YM@helios>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: Preventing RRECOMMENDS from installing
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
X-List-Received-Date: Tue, 10 Jan 2012 10:50:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Paul Eggleton <paul.eggleton@linux.intel.com> [120110 11:26]:

> On Tuesday 10 January 2012 10:08:24 Phil Blundell wrote:
> > On Tue, 2012-01-10 at 11:03 +0100, Anders Darander wrote:
> > > Is there a simple way, in a bbappend-file to prevent packages in an
> > > RRECOMMENDS from being installed? E.g. if package foo has:
> > > RRECOMMENDS_${PN} += "bar"

> > If you mean you just want to stop them getting installed during rootfs
> > construction, you can achieve that by declaring them to be
> > BAD_RECOMMENDATIONS.

> FWIW, it should be noted that this currently works for ipk packaging only.

Ah, good to know...
I was just about to start a new round of tests, but as we're currently
using rpm packaging, there probably is no need...

For the beginning, I'll have to stay with the local patch approach then,
and later on, investigate what it would take to implement this for rpm
packaging.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


