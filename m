Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QfI76-0008AH-6C
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 22:57:28 +0200
Received: by fxh10 with SMTP id 10so2709890fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 13:53:35 -0700 (PDT)
Received: by 10.223.17.68 with SMTP id r4mr3665043faa.62.1310158415207;
	Fri, 08 Jul 2011 13:53:35 -0700 (PDT)
Received: from [94.157.42.61] ([94.157.42.61])
	by mx.google.com with ESMTPS id h28sm7593137faj.29.2011.07.08.13.53.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jul 2011 13:53:34 -0700 (PDT)
References: <1310139697.6337.134.camel@phil-desktop>
	<1310143750.20015.911.camel@rex>
	<9DA5872FEF993D41B7173F58FCF6BE94DE226629@orsmsx504.amr.corp.intel.com>
	<1310145557.20015.914.camel@rex>
From: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: iPhone Mail (8J2)
In-Reply-To: <1310145557.20015.914.camel@rex>
Message-Id: <A82B3490-1824-4A3F-A5F8-24CE82E41E39@dominion.thruhere.net>
Date: Fri, 8 Jul 2011 22:53:13 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (iPhone Mail 8J2)
Subject: Re: eglibc issuettes continued
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
X-List-Received-Date: Fri, 08 Jul 2011 20:57:28 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



Op 8 jul. 2011 om 19:19 heeft Richard Purdie <richard.purdie@linuxfoundation=
.org> het volgende geschreven:

> On Fri, 2011-07-08 at 09:59 -0700, Kamble, Nitin A wrote:
>> I sent a patch to fix /etc/localtime & /etc/rpc files. Other than that I a=
m not seeing any issues for the eglibc recipe packaging.
>=20
> I pushed:
>=20
> http://git.openembedded.net/cgit.cgi/openembedded-core/commit/?id=3D93ce74=
a299832ca7f24b4ce1b951abffa0232612
>=20
> to fix one of those. If there is still the localtime issue, we probably
> need a patch for that one...

iirc we don't use the libc localtime, but another in .dev, but I can't check=
 that right now. fwiw having a image function to change the localtime would b=
e nice to have, but is a different issue=20


>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


