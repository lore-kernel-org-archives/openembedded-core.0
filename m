Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1T3Ro8-0007Fo-JD
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 15:14:16 +0200
Received: from localhost (193.41.119.134) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.245.1; Mon, 20 Aug 2012
	15:01:20 +0200
Date: Mon, 20 Aug 2012 15:02:18 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20120820130217.GA9188@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1345448771-4656-1-git-send-email-radu.moisan@intel.com>
	<8627395.gapg0V4nHB@helios>
	<1345451321.24626.77.camel@x121e.pbcl.net>
	<1754598.kxQRJyreg5@helios> <50320338.8090203@intel.com>
	<1345455067.24626.85.camel@x121e.pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1345455067.24626.85.camel@x121e.pbcl.net>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.20 (2009-12-10)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH v2] busybox: Upgrade to upstream 1.20.2
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
X-List-Received-Date: Mon, 20 Aug 2012 13:14:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Phil Blundell <philb@gnu.org> [120820 11:33]:

> On Mon, 2012-08-20 at 12:28 +0300, Radu Moisan wrote:
> > Any suggestions on how to do that?

> "vi defconfig", then add 

> # CONFIG_LSOF is not set

> at some appropriate place.

> Alternatively, bitbake -c menuconfig busybox, make sure lsof is
> disabled, then copy the resulting .config file back into defconfig.

And as a last step (regardless of which way you're modifying the
defconfig) use git diff to check that you're changing things correclty,
i.e. not enabling more functionality than before (unless there's a good
reason for this).

Apart from that, I prefer that we copy the defconfig from a build, as
busybox sometimes likes to re-order the configuration options between
releases. I just happen to prefer to easily be able to compare my built
config with the supplied defconfig, with the minimum of changes.

Cheers,
Anders


-- 
Anders Darander
ChargeStorm AB / eStorm AB


