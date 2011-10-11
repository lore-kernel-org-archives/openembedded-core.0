Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDWzk-0005yV-Vc
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 09:43:25 +0200
Received: by wyh5 with SMTP id 5so7162868wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 00:37:43 -0700 (PDT)
Received: by 10.223.17.3 with SMTP id q3mr13794312faa.28.1318318663178;
	Tue, 11 Oct 2011 00:37:43 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id x22sm36142190faa.5.2011.10.11.00.37.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 00:37:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20111011070820.GB27073@jama.jama.net>
Date: Tue, 11 Oct 2011 09:37:38 +0200
Message-Id: <4E1CC160-8612-47C0-A2DB-E66830F84366@dominion.thruhere.net>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
	<A8FC601D-2A25-46D0-8AB0-3FE9E8561B01@dominion.thruhere.net>
	<20111011070820.GB27073@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCHv3 00/31] Xorg related changes
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
X-List-Received-Date: Tue, 11 Oct 2011 07:43:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 okt. 2011, om 09:08 heeft Martin Jansa het volgende geschreven:

> On Mon, Oct 10, 2011 at 12:40:08PM +0200, Koen Kooi wrote:
>>=20
>> Op 7 okt. 2011, om 19:05 heeft Martin Jansa het volgende geschreven:
>>=20
>>> this patchset brings meta-oe and oe-core xorg stuff together and =
most of
>>> xorg recipes will be removed from meta-oe (sending another pull =
request now).
>>>=20
>>> This step is needed to be able to separate common x11 to meta-x11 or =
whatever later.
>>>=20
>>> The following changes since commit =
808b3123e359f1aebabb8af44694275e4075e031:
>>>=20
>>> gnutls: Disable p11-kit dependency explicitly to resolve build =
failures (2011-10-07 15:40:42 +0100)
>>>=20
>>> are available in the git repository at:
>>> git://git.openembedded.org/openembedded-core-contrib jansa/x11-v2
>>> =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dj=
ansa/x11-v2
>>>=20
>>> Martin Jansa (31):
>>>=20
>>> xserver-xorg-common: move RDEPENDS_${PN} +=3D xorg-minimal-fonts to
>>>   shared .inc
>>=20
>> I have been running X images without minimal fonts for some time now, =
so AFAICS it can be dropped completely.
>=20
> I'm also fine without (as it was in meta-oe and OE-classic), but it's
> quite small:
> 276	KiB /all/xorg-minimal-fonts_1.0-r1_all.ipk
> so I've kept it as it was..

I know it's small, it's a minimal collection of fonts from my debian =
system a few years ago :) It's not a real package, just a hack to get an =
ancient X working years ago.

regards,

Koen=


