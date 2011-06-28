Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qbepd-0000BU-IO
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 22:24:26 +0200
Received: by wwi18 with SMTP id 18so499575wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 13:20:44 -0700 (PDT)
Received: by 10.227.173.66 with SMTP id o2mr6986674wbz.17.1309292443955;
	Tue, 28 Jun 2011 13:20:43 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gg16sm411059wbb.34.2011.06.28.13.20.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 13:20:43 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1309292092.16722.3.camel@scimitar>
Date: Tue, 28 Jun 2011 22:20:40 +0200
Message-Id: <B63D1FE8-267F-4551-BF49-0149E6A929AE@dominion.thruhere.net>
References: <1309292092.16722.3.camel@scimitar>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Cc: "Hart, Darren" <darren.hart@intel.com>, Sean_Hudson@Dell.com
Subject: Re: Building behind a firewall/proxy
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
X-List-Received-Date: Tue, 28 Jun 2011 20:24:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jun 2011, om 22:14 heeft Joshua Lock het volgende geschreven:

> All,
>=20
> For the Yocto 1.1 release we want to ease the pain of getting set up =
to
> build behind a firewall.
>=20
> I have a series of patches under development to run a one hit sanity
> test which tries to verify the user can fetch and in the case of =
failure
> point the user to a wiki page where we'd document common causes of =
fetch
> failures.
>=20
> We're also going to look at the site.conf file, which can be used to
> specify proxy settings and other site specific settings such MIRRORS,
> and ensure that it can easily be edited to help people get set up.
>=20
> It'd be great if people who operate behind a proxy/firewall can help =
us
> document the steps they had to take to work around this.
>=20
> Further if you have other ideas as to how we can help make this =
process
> less painful please let us know.

This is what I'm using inside TI: =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/setup-scripts/tree/o=
ebb.sh?h=3Doe-core

It grew organically, so grepping for 'proxy' is your best bet :)

regards,

Koen=


