Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RQ3fA-00014U-MV
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 22:01:56 +0100
Received: by wyg8 with SMTP id 8so1943505wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 12:55:35 -0800 (PST)
Received: by 10.180.87.199 with SMTP id ba7mr27651254wib.27.1321304134919;
	Mon, 14 Nov 2011 12:55:34 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n2sm13054022wiz.16.2011.11.14.12.55.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 12:55:34 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1321303197.26881.74.camel@ted>
Date: Mon, 14 Nov 2011 21:55:28 +0100
Message-Id: <22478035-0923-402B-8617-45F140D38288@dominion.thruhere.net>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<2ffb85152b2b9356efeb008891d8ed29f1f35cef.1321296476.git.paul.eggleton@linux.intel.com>
	<E3435B57-20F8-421E-8E1B-966A1B95CC8F@dominion.thruhere.net>
	<1321303197.26881.74.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 3/4] distcc: make distccmon-gnome optional and default to off
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
X-List-Received-Date: Mon, 14 Nov 2011 21:01:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 nov. 2011, om 21:39 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-11-14 at 20:17 +0100, Koen Kooi wrote:
>> Op 14 nov. 2011, om 19:54 heeft Paul Eggleton het volgende =
geschreven:
>>=20
>>> Most people building distcc will not need the distccmon-gnome GUI to =
be
>>> built, so make it optional via the new PACKAGECONFIG functionality =
and
>>> default it to disabled. (This also removes the need to disable it =
for
>>> uclibc.)
>>>=20
>>> Part of the fix for [YOCTO #1690].
>>=20
>> I think splitting distccmon-gnome into a seperate recipe is a better =
idea.
>=20
> I think that makes sense in some cases but I'd hate for it to become =
the
> default approach for issues like this as the duplication of code,
> parsing and build time etc. grate on me. Do we really need separate
> recipes?

I think for this case, yes. And I'll happily trade needing extra =
buildtime for not needing USEFLAGS.

>=20
> I'll probably take this patch as it improves the situation IMO (and is
> easy to change the configuration from a distro config if anyone does
> have an issue with it being disabled).

This patch changes the default behaviour in a way that distros need to =
update their configs in order to keep the status quo. I know I use =
distccmon-gnome on my boards, but will I remember 2 months from now that =
this patch went in? I asked this before in a different context, but I'll =
ask again: do you expect distro maintainers to vet each and every commit =
that goes into OE-core to find out when default got (silently) changed?

USEFLAGS should be a last resort when having seperate recipes doesn't =
work out, not a default cure.=20

regards,

Koen=


