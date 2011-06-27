Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbBis-0003mF-V9
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 15:19:31 +0200
Received: by wwi14 with SMTP id 14so2056527wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 06:15:50 -0700 (PDT)
Received: by 10.227.37.7 with SMTP id v7mr5733905wbd.41.1309180135079;
	Mon, 27 Jun 2011 06:08:55 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id en1sm4083016wbb.1.2011.06.27.06.08.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 06:08:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1309179940.21613.299.camel@phil-desktop>
Date: Mon, 27 Jun 2011 15:08:47 +0200
Message-Id: <EDC8F551-D63C-4BDD-9E4A-E53B278835BE@dominion.thruhere.net>
References: <4E043FEF.8080107@linux.intel.com>
	<1309179940.21613.299.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: gconf-dbus fetch failure
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
X-List-Received-Date: Mon, 27 Jun 2011 13:19:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jun 2011, om 15:05 heeft Phil Blundell het volgende geschreven:

> On Fri, 2011-06-24 at 00:42 -0700, Darren Hart wrote:
>> It seems there is a problem with the subversion repository for =
gconf-dbus. Are others seeing this as well, or this perhaps a local =
networking issue?
>=20
> Yeah, gconf-dbus is apparently stored in git nowadays.
>=20
> The patch in
>=20
> =
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-June/004074.ht=
ml
>=20
> looks like it would probably fix this issue but doesn't seem to have
> been applied.

That patch mixes 2 things:

* SRC_URI change
* update to an unstable 2.odd.x release=


