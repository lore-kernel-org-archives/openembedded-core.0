Received: from stoexhub02.domain01.net ([83.145.59.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Se2AM-0002sW-Eh
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 12:48:10 +0200
Received: from localhost (193.41.119.134) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.245.1; Mon, 11 Jun 2012
	12:37:36 +0200
Date: Mon, 11 Jun 2012 12:36:31 +0200
From: Anders Darander <anders@chargestorm.se>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120611103631.GB6900@ad.chargestorm.se>
Mail-Followup-To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1339405061.git.lianhao.lu@intel.com>
	<ebe46107b8bcc9637bf93b125fa5f9b0a0a045bd.1339405061.git.lianhao.lu@intel.com>
	<20120611094548.GA6900@ad.chargestorm.se>
	<2537506.sJK0eATnrm@helios>
MIME-Version: 1.0
In-Reply-To: <2537506.sJK0eATnrm@helios>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.20 (2009-12-10)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH 1/3] openssh: Allow empty passwords login.
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
X-List-Received-Date: Mon, 11 Jun 2012 10:48:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Paul Eggleton <paul.eggleton@linux.intel.com> [120611 12:24]:

> On Monday 11 June 2012 11:45:49 Anders Darander wrote:
> > * Lianhao Lu <lianhao.lu@intel.com> [120611 11:03]:
> > > Allow empty passwords login so that the default root user can login in
> > > through openssh.
> > 
> > NAK, this isn't a sane default for a OpenSSH-recipe...

> I agree, however more below...

Good.

> > What's your use-case? Is it for automatic testing/development? If so,
> > can't you either set the password, or change the config using some other
> > means, e.g. a post rootfs installation script? (And make sure that this
> > is only run for the image in question, _not_ for all images).

> I don't think we want this to be image-specific. FWIW, we do already have a 
> mechanism to handle this for the dropbear recipe - debug-tweaks in 
> IMAGE_FEATURES. I don't particularly like it however since IMAGE_FEATURES 
> should not be influencing non-image recipes. This has bothered me for a while 
> and I think we ought to change to some other mechanism (perhaps make it a 
> separate variable) and then make the OpenSSH recipe use that.

That's right, the image shouldn't affect compile-time options. However,
in this particular case, as it is a configuration file, it should be
fine.

The variable idea is also fine with me, as long as we keep sensible
defaults, i.e. no empty password logins etc.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


