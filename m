Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCyOm-0006rE-MW
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 20:14:40 +0200
Received: by wye20 with SMTP id 20so1854175wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 11:12:16 -0700 (PDT)
Received: by 10.227.174.14 with SMTP id r14mr269943wbz.30.1303409536476;
	Thu, 21 Apr 2011 11:12:16 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id h11sm1331812wbc.26.2011.04.21.11.12.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 11:12:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1303407705.9960.51.camel@vorpal>
Date: Thu, 21 Apr 2011 20:12:13 +0200
Message-Id: <76BC4841-53CE-4F09-A5CE-7B627922451E@dominion.thruhere.net>
References: <8313867A-EA5C-473D-A82B-D8338186BF5F@dominion.thruhere.net>
	<201104211605.28351.paul.eggleton@linux.intel.com>
	<1303404025.9960.6.camel@vorpal>
	<6252772B-4D5D-4E5D-BCD5-1A53C1D25AFA@dominion.thruhere.net>
	<1303407705.9960.51.camel@vorpal>
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
X-List-Received-Date: Thu, 21 Apr 2011 18:14:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 apr 2011, om 19:41 heeft Joshua Lock het volgende geschreven:

> On Thu, 2011-04-21 at 19:29 +0200, Koen Kooi wrote:
>> Op 21 apr 2011, om 18:40 heeft Joshua Lock het volgende geschreven:
>>=20
>>> On Thu, 2011-04-21 at 16:05 +0100, Paul Eggleton wrote:
>>>> On Thursday 21 April 2011 15:02:49 Koen Kooi wrote:
>>>>> and possibly more. I would like to create a meta-gnome layer in =
the
>>>>> meta-openembedded repository where new recipes get added and =
things from
>>>>> meta-demoapps can get moved over into. Long term recipes-gnome in =
oe-core
>>>>> should move there as well.
>>>>>=20
>>>>> What are your thoughts on this?
>>>=20
>>> +1
>>>=20
>>>>=20
>>>> =46rom my perspective this sounds like a great idea. The only =
question would be=20
>>>> how much of the "GNOME" libs would remain in oe-core as some of =
them are quite=20
>>>> widely used outside of GNOME proper; however that can easily be =
worked out as=20
>>>> these things mature.
>>>=20
>>> +1
>>>=20
>>> My personal opinion would be that we start with glib & gtk+ (plus =
their
>>> dependencies, i.e. pango, atk, etc) in core and move the rest out to =
a
>>> layer.
>>>=20
>>> I feel that Gtk+ is used by enough non-gnome software that it =
belongs in
>>> core but others may disagree?
>>>=20
>>> Between meta/recipes-gnome and meta-demoapps we have a reasonable =
start
>>> to a meta-gnome/
>>=20
>> Where did meta-demoapps go? It's not in OE-core anymore by the looks =
of it.
>=20
> Hmm, still exists for me:
>=20
> joshual@vorpal:~/Projects/Yocto/oe-core/meta-demoapps[master]
> $ pwd
> /home/joshual/Projects/Yocto/oe-core/meta-demoapps
>=20
>=20
>>=20
>>> I'd be happy to help with this layer.
>>=20
>> Awesome, do you have any objection to put meta-gnome into the =
meta-openembedded repo for the time being? Once we get better tooling we =
can move it elsewhere, of course.
>=20
> None whatsoever. I keep meaning to push some recipes into that layer
> anyway.

I just sent out 10 patches for review that import recipes-gnome from =
meta-demoapps into meta-gnome. Please review :)

regards,

Koen=


