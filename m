Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1U5JHQ-0004gr-2T
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 18:04:45 +0100
Received: from ad.chargestorm.se (194.237.193.51) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Tue, 12 Feb 2013 17:48:28 +0100
Date: Tue, 12 Feb 2013 17:49:34 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20130212164934.GA5045@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1360657337-7154-1-git-send-email-raj.khem@gmail.com>
	<C7C45274F728429FA76E2C1C47BACCDC@intel.com>
	<20130212150107.GB5968@ad.chargestorm.se>
	<62239FFF613F4094A369C927D0617497@intel.com>
MIME-Version: 1.0
In-Reply-To: <62239FFF613F4094A369C927D0617497@intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH] systemd: Add systemd package to PACKAGE var
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
X-List-Received-Date: Tue, 12 Feb 2013 17:04:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Ross Burton <ross.burton@intel.com> [130212 16:07]:

> On Tuesday, 12 February 2013 at 15:01, Anders Darander wrote:
> > > Or is there another use-case I'm missing?

> > Well, there is always the possibillity that the install is split into
> > multiple packages, with binaries also in some sub-packages. I can't
> > recall right now if we have such packages, where the binaries in the
> > sub-packages should be started by init, though.

> And those sub-packages are obviously already in PACKAGES, so this
> isn't required again.  I'm just trying to keep the amount of magic in
> the class to a minimum unless it's required.

Ah, of course they are...

I completely mis-read the patch... As the patch only was concerned with
adding packages to PACKAGES, I completely agree with you. Lets get rid
of that extra magic.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


