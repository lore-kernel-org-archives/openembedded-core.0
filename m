Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Tzr7Y-0006fl-Cf
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 17:00:04 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r0SFhxeU023327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Jan 2013 16:44:00 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TzqsZ-0008NT-3V; Mon, 28 Jan 2013 16:44:15 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Phil Blundell <pb@pbcl.net>
References: <fdad95c5f7fc287a6b173d5c30447ab05fab0778.1359049755.git.ross.burton@intel.com>
	<1359377661.22371.54.camel@ted>
	<lypq0pl8ee.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4710226.v3bfS80rgU@helios>
	<ly622hl5r0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1359385200.7131.11.camel@phil-desktop.brightsign>
Date: Mon, 28 Jan 2013 16:44:15 +0100
In-Reply-To: <1359385200.7131.11.camel@phil-desktop.brightsign> (Phil
	Blundell's message of "Mon, 28 Jan 2013 15:00:00 +0000")
Message-ID: <ly1ud5l3cg.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.71
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base: make feature backfilling happen earlier
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
X-List-Received-Date: Mon, 28 Jan 2013 16:00:07 -0000
Content-Type: text/plain

Phil Blundell <pb@pbcl.net> writes:

> This does seem rather like an abuse of DISTRO_FEATURES_BACKFILL.  Can
> you explain why you are doing it this way rather than just setting
> DISTRO_FEATURES directly to what you wanted?

I need a way to:

1. set some defaults on distribution base and avoid nasty details like
   mandatory ${DISTRO_FEATURES_LIBC} flags in the project configuration

2. allow to override these defaults on a per-project base

3. add features support by recipes/classes of my distribution

afaik, DISTRO_FEATURES_BACKFILL + _CONSIDERED exist to allow the first
two point without an '-=' operator which lacks in bitbake.

Of course, I could reinvent the wheel and write my own _CONSIDERED
mechanism.  But until now (resp. without the '=' => '?=' change), it
worked fine with DISTRO_FEATURES_BACKFILL.


Enrico


