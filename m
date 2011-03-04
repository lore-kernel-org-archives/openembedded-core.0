Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PvYa5-0002ue-T3
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 18:14:28 +0100
Received: by wwe15 with SMTP id 15so2597025wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2011 09:12:36 -0800 (PST)
Received: by 10.216.220.88 with SMTP id n66mr778156wep.50.1299258755893;
	Fri, 04 Mar 2011 09:12:35 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	r80sm1277460wei.15.2011.03.04.09.12.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 09:12:35 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4D71192E.3050706@windriver.com>
Date: Fri, 4 Mar 2011 18:12:33 +0100
Message-Id: <B4A135D2-3DE3-4432-9C06-ADAE52BE1209@dominion.thruhere.net>
References: <BFB7E27E-AFA1-4F08-8D64-3B55C21D180C@dominion.thruhere.net>
	<4D71175D.4050307@gmail.com> <4D71192E.3050706@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: Gst-plugin dependencies
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
X-List-Received-Date: Fri, 04 Mar 2011 17:14:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 mrt 2011, om 17:54 heeft Mark Hatle het volgende geschreven:

> On 3/4/11 10:46 AM, Khem Raj wrote:
>> On 3/4/2011 7:58 AM, Koen Kooi wrote:
>>> Hi,
>>>=20
>>> The current gst-plguin-<foo>  in oe-core is a bit anemic and the =
ones in OE are really full featured. How do we want to handle this going =
forward? I'm a big fan of shifting the pain to buildtime so people can =
install any plugin they want at runtime instead of needing to rebuild =
it.
>>> At TI we have cut-down versions of the recipes to save buildtime[1], =
but it's a pain to maintain those and keep them up to date. It would be =
nice to come with a way to say you want full featured gstreamer or not. =
With my angstrom hat on, I would like the full feature set :)
>>>=20
>>=20
>> May be controlling it with distro features
>=20
> Due to the licensing issues in the gst-plugins..  I'd be inclined to =
say they're
> out of the core myself.  Move it to the distro specific layers.

Even outside of licensing issues with things like MP3, I would like to =
have some kind of framework in OE (-core) for gst-plugins that layers =
can extend to their liking. Having dealt with the recipes over the =
years, too many things change between versions. It takes someone =
familiar with gst to maintain those recipes, and there aren't a lot of =
such people in OE :(

regards,

Koen=


