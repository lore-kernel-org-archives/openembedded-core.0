Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RQ28E-0006Pu-6d
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 20:23:50 +0100
Received: by wwp14 with SMTP id 14so4623683wwp.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 11:17:25 -0800 (PST)
Received: by 10.227.209.71 with SMTP id gf7mr6922875wbb.11.1321298245268;
	Mon, 14 Nov 2011 11:17:25 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gb13sm522897wbb.5.2011.11.14.11.17.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 11:17:24 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 14 Nov 2011 20:17:15 +0100
In-Reply-To: <2ffb85152b2b9356efeb008891d8ed29f1f35cef.1321296476.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<2ffb85152b2b9356efeb008891d8ed29f1f35cef.1321296476.git.paul.eggleton@linux.intel.com>
Message-Id: <E3435B57-20F8-421E-8E1B-966A1B95CC8F@dominion.thruhere.net>
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
X-List-Received-Date: Mon, 14 Nov 2011 19:23:50 -0000
X-Groupsio-MsgNum: 12452
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DCFB5AC7-CC86-4DA9-92CA-4D472BECD121";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DCFB5AC7-CC86-4DA9-92CA-4D472BECD121
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


Op 14 nov. 2011, om 19:54 heeft Paul Eggleton het volgende geschreven:

> Most people building distcc will not need the distccmon-gnome GUI to be
> built, so make it optional via the new PACKAGECONFIG functionality and
> default it to disabled. (This also removes the need to disable it for
> uclibc.)
> 
> Part of the fix for [YOCTO #1690].

I think splitting distccmon-gnome into a seperate recipe is a better idea.

regards,

Koen

--Apple-Mail=_DCFB5AC7-CC86-4DA9-92CA-4D472BECD121
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7BaT4ACgkQMkyGM64RGpFE7ACeNrrxrjU8n5lYBo1B4GJNeOmW
Gr4Anjx5yZo0mdNo9lBjt7tecttYYKVq
=qEIt
-----END PGP SIGNATURE-----

--Apple-Mail=_DCFB5AC7-CC86-4DA9-92CA-4D472BECD121--
