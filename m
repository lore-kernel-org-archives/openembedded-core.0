Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1R1EBU-0005T7-3K
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 11:12:40 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Wed, 7 Sep 2011
	11:07:35 +0200
Date: Wed, 7 Sep 2011 11:07:50 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20110907090750.GE4181@chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1315371835.git.sgw@linux.intel.com>
	<4E67114D.80507@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4E67114D.80507@eukrea.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 0/1] Fix MakeMaker's finding of perl.real
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
X-List-Received-Date: Wed, 07 Sep 2011 09:12:40 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Eric B=E9nard <eric@eukrea.com> [110907 08:41]:
> Le 07/09/2011 07:09, Saul Wold a =E9crit :
> > When configuring cpan packages, the directories passed to MakeMaker are=
 the
> > target directories. There was a patch that was applied to the native pe=
rl
> > to find perl.real and convert that to perl.  This does not apply for the
> > target perl modules and therefore MakeMaker find perl.real.
> >
> > This patch to cpan configure modifies the Makefile after configure and
> > changes the perl.real to just straight perl so we have the correct paths
> > and shared state info in usable.
> >
> when sending 1 patch, is it possible to not use cover letter in order to =
have
> the explanation in the patch commit ?
> That's easier to understand what the patch is doing when browsing log.

Cover letter or not, the patch should include a commit message that
explains the patch. It doesn't really matter if there is only one patch
or a large patch series.

For a single patch, the cover letter can be usefull to provide some
extra information and discussion. In other cases, it can be pretty
useless IMHO.

Regards,
Anders

--=20
Anders Darander
ChargeStorm AB


