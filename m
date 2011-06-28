Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbUVx-0004Bb-FQ
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 11:23:25 +0200
Received: by wyg30 with SMTP id 30so6415wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 02:19:44 -0700 (PDT)
Received: by 10.216.221.33 with SMTP id q33mr276140wep.90.1309252784469;
	Tue, 28 Jun 2011 02:19:44 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm4694511wbb.65.2011.06.28.02.19.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 02:19:43 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1309252319.21613.330.camel@phil-desktop>
Date: Tue, 28 Jun 2011 11:19:41 +0200
Message-Id: <0FACC81C-8E9B-4A6D-A33E-C9D8383F8B0B@dominion.thruhere.net>
References: <cover.1309246787.git.edwin.zhai@intel.com>
	<2c83cbe9b56b589ad8786d8d371c2d85810b31f2.1309246787.git.edwin.zhai@intel.com>
	<1309252319.21613.330.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/3] glib-networking: Add 2.28.7 as new recipe
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
X-List-Received-Date: Tue, 28 Jun 2011 09:23:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jun 2011, om 11:11 heeft Phil Blundell het volgende geschreven:

> On Tue, 2011-06-28 at 15:42 +0800, edwin.zhai@intel.com wrote:
>> +SRC_URI =3D "${GNOME_MIRROR}/${PN}/2.28/${PN}-${PV}.tar.bz2"
>=20
> FYI, gnome.bbclass will do this for you and will also figure out the
> "2.28" part automatically.

THat will also drag in a ton of deps, gnomebase.bbclass in meta-oe does =
a better job :)=


