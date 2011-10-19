Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RGUp8-0006gT-Ou
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 14:00:43 +0200
Received: from ad.chargestorm.se (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server (TLS) id 8.3.137.0;
	Wed, 19 Oct 2011 13:54:49 +0200
Date: Wed, 19 Oct 2011 13:55:04 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20111019115504.GB4790@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1319022793.git.anders@chargestorm.se>
	<40dcebe98e97bb4fabfec74e9e7acb59548da091.1319022793.git.anders@chargestorm.se>
	<3D79364E-4D29-49B8-B196-4E1FBD4E82FE@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <3D79364E-4D29-49B8-B196-4E1FBD4E82FE@dominion.thruhere.net>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/1] module.bbclass: add lock to prevent error bulding ext modules
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
X-List-Received-Date: Wed, 19 Oct 2011 12:00:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Koen Kooi <koen@dominion.thruhere.net> [111019 13:38]:

> Op 19 okt. 2011, om 13:15 heeft Anders Darander het volgende geschreven:

> > When external modules are built, files in $STAGING_KERNEL_DIR/scripts/basic will/can get
> > rebuilt.
> > This raises a potential race condition. Prevent this by adding a lock around the
> > do_make_scripts() function. Further, make sure that the kernel has been installed
> > to the sysroot, prior to executing this new task.

> So what do external module recipe that aren't using do_compile from
> module.bbclass need to change to keep working?

I haven't tried any, do you know any widely available ones that I could
check?

If they aren't using the do_compile from module.bbclass, are they
inheriting module.bbclass anyway? If they aren't inheriting
module.bbclass, then they shouldn't be affected.

If they inherit module.bbclass, than I guess that we should remove the
call to do_make_scripts from their do_compile. _But_ this is untested,
as I've got no such recipe (that I'm aware of). If my assumptions hold,
we should probably rephrase the comment regarding do_make_scripts.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


