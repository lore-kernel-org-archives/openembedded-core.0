Received: from mail-wy0-f169.google.com ([74.125.82.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R5jUW-0002Qc-MS
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 21:26:56 +0200
Received: by wyi11 with SMTP id 11so8765285wyi.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 12:21:40 -0700 (PDT)
Received: by 10.216.157.132 with SMTP id o4mr3180306wek.58.1316460100107;
	Mon, 19 Sep 2011 12:21:40 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f26sm6060388wbp.7.2011.09.19.12.21.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Sep 2011 12:21:39 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E77927A.4020402@windriver.com>
Date: Mon, 19 Sep 2011 21:21:36 +0200
Message-Id: <A0C53D3F-D82B-46D0-B173-D81B7BC791AB@dominion.thruhere.net>
References: <cover.1316454869.git.sgw@linux.intel.com>
	<c61c00e6f90ad71f8a111d502e228af7be0a7838.1316454869.git.sgw@linux.intel.com>
	<4E77927A.4020402@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 1/1] avahi: Check for GPLv3 license and disable x11
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
X-List-Received-Date: Mon, 19 Sep 2011 19:26:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 sep. 2011, om 21:05 heeft Mark Hatle het volgende geschreven:

> On 9/19/11 12:55 PM, Saul Wold wrote:
>> [YOCTO #1492]
>>=20
>> Since the non-GPLv3 build does not want gnome, which this will pull =
in
>> by the default DISTRO_FEATURE x11 being set and enabling gtk for =
avahi,
>> we filter x11 out of DISTRO_FEATURES here when INCOMPATIBLE_LICENSE =
is
>> set to GPLv3.
>=20
> If the avahi GTK UI app is needed when X11 is enabled, this should be =
a decent
> enough way to work around the condition.
>=20
> However, I question if avahi should -ever- be producing the gtk =
component.
>=20
> =46rom the investigation I did, the gtk component is something that =
helps with
> discovering mDNS servers (either prompting the user or simply =
displaying status,
> I'm not sure).  Is this of use to anyone using oe-core?  Otherwise I'd =
be in
> favor of simply removing the X11 option from the avahi package.
>=20
> (I talked with Saul about this already on IRC.. he's concerned that =
we'd be
> turning of required [by someone] functionality... I'm really not sure =
it is
> required by anyone...)

In OE classic the UI stuff in in avahi-ui.bb=


