Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCxjX-0005vB-90
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 19:32:03 +0200
Received: by wwb17 with SMTP id 17so1981199wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 10:29:39 -0700 (PDT)
Received: by 10.216.254.82 with SMTP id g60mr2310003wes.36.1303406979472;
	Thu, 21 Apr 2011 10:29:39 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id h39sm1063108wes.29.2011.04.21.10.29.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 10:29:38 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1303404025.9960.6.camel@vorpal>
Date: Thu, 21 Apr 2011 19:29:37 +0200
Message-Id: <6252772B-4D5D-4E5D-BCD5-1A53C1D25AFA@dominion.thruhere.net>
References: <8313867A-EA5C-473D-A82B-D8338186BF5F@dominion.thruhere.net>
	<201104211605.28351.paul.eggleton@linux.intel.com>
	<1303404025.9960.6.camel@vorpal>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [RFC] Working toward a GNOME layer
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
X-List-Received-Date: Thu, 21 Apr 2011 17:32:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 apr 2011, om 18:40 heeft Joshua Lock het volgende geschreven:

> On Thu, 2011-04-21 at 16:05 +0100, Paul Eggleton wrote:
>> On Thursday 21 April 2011 15:02:49 Koen Kooi wrote:
>>> and possibly more. I would like to create a meta-gnome layer in the
>>> meta-openembedded repository where new recipes get added and things =
from
>>> meta-demoapps can get moved over into. Long term recipes-gnome in =
oe-core
>>> should move there as well.
>>>=20
>>> What are your thoughts on this?
>=20
> +1
>=20
>>=20
>> =46rom my perspective this sounds like a great idea. The only =
question would be=20
>> how much of the "GNOME" libs would remain in oe-core as some of them =
are quite=20
>> widely used outside of GNOME proper; however that can easily be =
worked out as=20
>> these things mature.
>=20
> +1
>=20
> My personal opinion would be that we start with glib & gtk+ (plus =
their
> dependencies, i.e. pango, atk, etc) in core and move the rest out to a
> layer.
>=20
> I feel that Gtk+ is used by enough non-gnome software that it belongs =
in
> core but others may disagree?
>=20
> Between meta/recipes-gnome and meta-demoapps we have a reasonable =
start
> to a meta-gnome/

Where did meta-demoapps go? It's not in OE-core anymore by the looks of =
it.

> I'd be happy to help with this layer.

Awesome, do you have any objection to put meta-gnome into the =
meta-openembedded repo for the time being? Once we get better tooling we =
can move it elsewhere, of course.

regards,

Koen=


