Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q3wa2-00008M-1f
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Mar 2011 22:28:58 +0200
Received: by wwb17 with SMTP id 17so2769214wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Mar 2011 13:26:11 -0700 (PDT)
Received: by 10.216.69.15 with SMTP id m15mr2917100wed.70.1301257571576;
	Sun, 27 Mar 2011 13:26:11 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id t72sm1224914wei.44.2011.03.27.13.26.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Mar 2011 13:26:10 -0700 (PDT)
References: <600E597B-5D02-419E-A378-5EE511B848FA@dominion.thruhere.net>
	<20110327193405.GA23957@sakrah.homelinux.org>
In-Reply-To: <20110327193405.GA23957@sakrah.homelinux.org>
Mime-Version: 1.0 (iPhone Mail 8G4)
Message-Id: <4CF3B010-EDBD-4A51-8078-50AFE191CC98@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8G4)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 27 Mar 2011 22:26:05 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Using meta-toolchain output as prebuilt toolchains
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
X-List-Received-Date: Sun, 27 Mar 2011 20:28:58 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 27 mrt. 2011 om 21:34 heeft Khem Raj <raj.khem@gmail.com> het volgende ge=
schreven:

> On (27/03/11 13:44), Koen Kooi wrote:
>> Hi,
>>=20
>> What is the preferred way of 'importing' prebuilt toolchains into OE-core=
? In oe.dev I can use this: http://cgit.openembedded.org/cgit.cgi/openembedd=
ed/tree/recipes/meta/external-toolchain-angstrom.bb to 'import' an angstrom t=
oolchain built with 'bitbake meta-toolchain', but I'm not sure how to do tha=
t in OE-core.
>>=20
>> My actual use case is actually 2 use-cases:
>>=20
>> 1) Hand people a prebuilt angstrom toolchain and migrate them to OE while=
 keeping the toolchain
>=20
> Did you mean "migrate them to OE-core" ? or are there totaly n00b to OE
>=20

Total n00bs :)


>> 2) "Get started in 10 minutes" type of thing, I suspect an sstate mirror m=
ight be better.
>>=20
>> So any suggestions for #2 as well?
>>=20
>> regards,
>>=20
>> Koen
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --=20
> -Khem
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


