Received: from stoexhub03.domain01.net ([83.145.59.144])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1T1Gpr-0004GT-1m
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 15:07:03 +0200
Received: from localhost (193.41.119.134) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server id 8.3.245.1; Tue, 14 Aug 2012
	14:54:24 +0200
Date: Tue, 14 Aug 2012 14:55:16 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20120814125514.GC3444@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1344934956-28631-1-git-send-email-radu.moisan@intel.com>
	<20120814120153.GB3444@ad.chargestorm.se>
	<502A41C7.4030009@intel.com> <10849222.KjNZNLiumm@helios>
MIME-Version: 1.0
In-Reply-To: <10849222.KjNZNLiumm@helios>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.20 (2009-12-10)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH] busybox: Upgrade to upstream 1.20.2
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
X-List-Received-Date: Tue, 14 Aug 2012 13:07:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Paul Eggleton <paul.eggleton@linux.intel.com> [120814 14:38]:

> On Tuesday 14 August 2012 15:17:11 Radu Moisan wrote:
> > +CONFIG_LSOF=y

> This would be the only change that would concern me. If we didn't provide this 
> with busybox before I think it should be disabled by default.

I was about to reply with more or less the same comment.

The other changes in the defconfig looks minor, at least without any
deeper inspection. 

However, we should think twice before we add more applets in the default
config. And if we decide to do this, we're probably going to need to add
update-alternatives handling for lsof.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


