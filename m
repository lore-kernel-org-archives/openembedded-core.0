Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QW8rW-0007ev-U5
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:15:34 +0200
Received: by wwb17 with SMTP id 17so4137247wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 08:12:07 -0700 (PDT)
Received: by 10.227.197.201 with SMTP id el9mr5259063wbb.22.1307977927454;
	Mon, 13 Jun 2011 08:12:07 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d19sm4325659wbh.42.2011.06.13.08.12.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Jun 2011 08:12:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1307976845.10825.5.camel@elmorro>
Date: Mon, 13 Jun 2011 17:12:05 +0200
Message-Id: <149A39A6-0D00-4D57-9B29-F230FA9CF6C5@dominion.thruhere.net>
References: <1307975748.10825.2.camel@elmorro>
	<05D8A861-D865-4303-BB8B-69F5F22B651D@dominion.thruhere.net>
	<1307976845.10825.5.camel@elmorro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] systemtap: remove non-core COMPATIBLE_MACHINES
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
X-List-Received-Date: Mon, 13 Jun 2011 15:15:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 jun 2011, om 16:54 heeft Tom Zanussi het volgende geschreven:

> On Mon, 2011-06-13 at 07:47 -0700, Koen Kooi wrote:
>> Op 13 jun 2011, om 16:35 heeft Tom Zanussi het volgende geschreven:
>>> -COMPATIBLE_MACHINE =3D =
"(qemux86|qemux86-64|qemuppc|emenlow|crownbay|atom-pc|n450)"
>>> +COMPATIBLE_MACHINE =3D "(qemux86|qemux86-64|qemuppc|atom-pc)"
>>=20
>> After having looked at the recipe (basically 'inherit autotools', =
PACKAGE_ARCH =3D BASE_PACKAGE_ARCH) and reading the systemtap wiki I =
can't figure out why COMPATIBLE_MACHINE is actually needed. The closest =
I get is "needs specific kernel config", but that argument quickly falls =
down when looking at other recipes that need that (e.g. udev) and =
considering out layer strategy (bbappending it for all your machines).
>>=20
>> So, what am I missing here?
>>=20
>=20
> My testing showed systemtap doesn't actually work on arm, and has no
> support for mips - the machines listed are the only ones I've been =
able
> to verify that work.

So that sounds like COMPATIBLE_HOST instead of machine, no?

regards,

Koen=


