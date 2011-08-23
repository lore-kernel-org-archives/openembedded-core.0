Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Qvknj-000098-93
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 08:49:31 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Tue, 23 Aug 2011
	08:44:46 +0200
Date: Tue, 23 Aug 2011 08:44:55 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20110823064454.GA8170@chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1313606178.git.paul.eggleton@linux.intel.com>
	<8c4bf939c0906cd744debeb85d5d55de622c184e.1313606178.git.paul.eggleton@linux.intel.com>
	<91BBD9D6-2616-4A85-B87A-5DFA1AD82152@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <91BBD9D6-2616-4A85-B87A-5DFA1AD82152@dominion.thruhere.net>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [RFC PATCH 1/2] image.bbclass, kernel.bbclass: create warning file about deleting deploydir files
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
X-List-Received-Date: Tue, 23 Aug 2011 06:49:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Koen Kooi <koen@dominion.thruhere.net> [110822 23:01]:
> Op 17 aug. 2011, om 20:37 heeft Paul Eggleton het volgende geschreven:
> > +	cp -n ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOY_DIR_IMAGE}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> > +

> That doesn't work on my debian box:

> | + cp -n /OE/tentacle/sources/openembedded-core/meta/files/deploydir_readme.txt /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/deploy/images/beagleboard/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> | cp: invalid option -- 'n'
> | Try `cp --help' for more information.

Which debian version are you running?

I've seen no problem, as far as I can tell, on neither my ubuntu, nor my
debian box. (Although I'm running debian sid on that one).

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB


