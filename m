Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Qsx5R-0008I5-Ve
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 15:20:14 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Mon, 15 Aug 2011
	15:15:37 +0200
Date: Mon, 15 Aug 2011 15:15:47 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20110815131547.GA22184@chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1313164659.6733.163.camel@phil-desktop>
	<20110815122327.GA7862@chargestorm.se>
	<1313413653.6733.175.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1313413653.6733.175.camel@phil-desktop>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH] libx11: skip self if x11 not in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 15 Aug 2011 13:20:14 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Phil Blundell <philb@gnu.org> [110815 15:07]:
> On Mon, 2011-08-15 at 14:23 +0200, Anders Darander wrote:
> > Although, it is already mergerd by Richard, I really like this patch
> > series (after testing it).
> >=20
> > * Phil Blundell <philb@gnu.org> [110812 17:57]:
> > > This stops (most) x11 packages leaking into a non-x11 distro by mista=
ke.
> >=20
> > Will you submit this to meta-oe also?
> > This question might apply to a few of the other patches also.

> I hadn't planned to (in fact, I hadn't previously realised that meta-oe
> had its own copy of those files).  If you think that would be a good
> idea then you're obviously welcome to do so, though.

Ok, then I'll submit such a patch.

I didn't really this either, until just before lunch, when I found the
reason that e.g. libxcb and libx11 still was being built...

The short-term solution is to get a similar patch applied to meta-oe.
The long-term solution, any volunteers?, would be to convert the
qt4-recipes in meta-to bbappends (if they still are needed).

Cheers,
Anders

--=20
Anders Darander
ChargeStorm AB		Tel: +46 702 44 84 36
Laxholmstorget 3	Email: anders@chargestorm.se
602 21 Norrk=F6ping	Web: www.chargestorm.se


