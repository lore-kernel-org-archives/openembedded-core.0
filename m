Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QsxM5-000056-Kr
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 15:37:25 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Mon, 15 Aug 2011
	15:32:47 +0200
Date: Mon, 15 Aug 2011 15:32:59 +0200
From: Anders Darander <anders@chargestorm.se>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20110815133258.GB22184@chargestorm.se>
Mail-Followup-To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1313164659.6733.163.camel@phil-desktop>
	<1313413653.6733.175.camel@phil-desktop>
	<20110815131547.GA22184@chargestorm.se>
	<201108151424.01537.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <201108151424.01537.paul.eggleton@linux.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 15 Aug 2011 13:37:25 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Paul Eggleton <paul.eggleton@linux.intel.com> [110815 15:24]:
> On Monday 15 August 2011 14:15:47 Anders Darander wrote:
> > The short-term solution is to get a similar patch applied to meta-oe.
> > The long-term solution, any volunteers?, would be to convert the
> > qt4-recipes in meta-to bbappends (if they still are needed).

s/qt4*/libx11/ in this section.

> I already did this a few weeks ago. The only Qt 4 thing left that is a fu=
ll=20
> recipe in meta-oe is qmake2 (for the target).

My apologies... You're of course right, and that change is something I
appreciate (it makes my life a lot simpler).

I've been struggling with a few other qt4-related issues (one or two
RFC-patches will be submitted shortly), that's why I mistakenly wrote
qt4.

I meant libx11 (in xorg-lib) in my last e-mail.

Cheers,
Anders

--=20
Anders Darander
ChargeStorm AB		Tel: +46 702 44 84 36
Laxholmstorget 3	Email: anders@chargestorm.se
602 21 Norrk=F6ping	Web: www.chargestorm.se


