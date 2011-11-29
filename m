Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RVJAl-0006dR-IR
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 09:36:15 +0100
Received: from ad.chargestorm.se (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.213.0;
	Tue, 29 Nov 2011 09:29:36 +0100
Date: Tue, 29 Nov 2011 09:29:38 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20111129082938.GB3653@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1321972428.git.anders@chargestorm.se>
	<4ECC07D8.2070104@linux.intel.com>
	<20111123085906.GA16705@ad.chargestorm.se>
	<4ED47205.6050608@linux.intel.com>
	<20111129070444.GA3653@ad.chargestorm.se>
	<4ED49447.9070805@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4ED49447.9070805@linux.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH v2 0/1] busybox: update to 1.19.3
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
X-List-Received-Date: Tue, 29 Nov 2011 08:36:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Saul Wold <sgw@linux.intel.com> [111129 09:14]:
> On 11/28/2011 11:04 PM, Anders Darander wrote:
> > * Saul Wold<sgw@linux.intel.com>  [111129 06:47]:
> >> On 11/23/2011 12:59 AM, Anders Darander wrote:
> >>> * Saul Wold<sgw@linux.intel.com>   [111122 21:36]:
> >>>> On 11/22/2011 06:34 AM, Anders Darander wrote:
> >>>>> This updates busybox to the latest stable, 1.19.3.

> >>>>> Among other things, there should be rudimentary support in syslogd for
> >>>>> systemd, by enabling CONFIG_FEATURE_SYSTEMD.

> >>>> How much size does this add to busybox by having it enabled by default?

> >>> Enabling FEATURE_SYSTEMD in busybox costs 192 bytes in my tests in
> >>> qemux86.

> >>>> Is it possible to conditional add a config fragment if systemd is
> >>>> enabled ad the DISTRO/IMAGE_FEATURE level?

> >>>> More info is required.

> > Any more comment on this one? Otavio replied earlier that if it was a
> > small cost, he would prefer to have it on by default. Otherwise, any
> > suggestions for DISTRO/IMAGE_FEATURE?

> Sorry for not being clear on this on, yes to the SYSTEMD change, it's 
> small enough and something we are considering. As Phil points out in the 
> follow-up to this, most are using custom defconfig's that we should just 
> go ahead and enable this for future flexibility.

Thanks!

As we're running systemd, I'm one of those in favour of getting systemd
into oe-core, at least now that is hopefully is getting slightly more
stable.

And yes, just as Phil points out, we're also running custom defconfigs.

> >>>>> Changes:
> >>>>> v2: * Checked the new defconfig (removed settings implying CFLAGS and
> >>>>>        ARCH). The new defconfig should be as close as possible to the old one,
> >>>>>        with the exception of some new utils/options.
> >>>> Can you clearly enumerate what new utils and options and what their size
> >>>> impact on the busybox image is.


> >>> FGCONSOLE, print active console number, 128 bytes

> >>> FEATURE_LOADFONT_PSF2, FEATURE_LOADFONT_RAW, cost 576 bytes

> >> Seems resonable, but why did we not need this before, what changed?

> > Not really sure what the change is (normally I'm only working on
> > headless systems, thus no need for fonts). The two FEATURE_LOADFONT_*
> > options were not available in the old defconfig. I'll leave these two in
> > v3, as you thought the seemd reasonable.

> For minimal, it's good to assume headless, then we should not need the 
> LOADFONT. I thought it was needed for headless as well.

Well, there is a risk of getting a few warning when booting, at least if
you also disable CONFIG_LOADFONT, unless you look through the boot
process. (We're running our system without CONFIG_LOADFONT, hence the
other LOADFONT-options becomes moot).

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


