Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R7q7d-000108-Eg
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 16:56:01 +0200
Received: by fxi1 with SMTP id 1so5133408fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 07:50:38 -0700 (PDT)
Received: by 10.223.52.218 with SMTP id j26mr8859513fag.56.1316962238370;
	Sun, 25 Sep 2011 07:50:38 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id c5sm17260302fai.2.2011.09.25.07.50.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 25 Sep 2011 07:50:37 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1316950444.8185.14.camel@ted>
Date: Sun, 25 Sep 2011 16:50:31 +0200
Message-Id: <1DFC8F6E-C652-42A6-83B2-147A77A70A95@dominion.thruhere.net>
References: <1316950444.8185.14.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: qt3 vs qt4 issues
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
X-List-Received-Date: Sun, 25 Sep 2011 14:56:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 sep. 2011, om 13:33 heeft Richard Purdie het volgende geschreven:

> I've been looking at the qt3 failures on the autobuilder. It seems =
there
> is some kind of contamination between the qt4 builds and the qt3 =
builds
> and I'm not sure what is or isn't expected to work there.
>=20
> We're doing the following in the build:
>=20
> a) Build core-image-lsb (includes qt4, builds qt4+qt4-native)
> b) Wipe out tmp
> c) Add in meta-qt3 layer
> d) Enable sstate from build in a)
> e) Build core-image-lsb-qt3 which adds in qt3
> f) Bitbake determines it needs to install qt4 for the image but=20
>   nothing depends on the native qt4 tools so these are not installed
> g) This will build qt3+qt3-native with qt4 in the sysroot but no=20
>   qt4-native
> h) We see build failures as qt3 seems to want to find bits of =
qt4-native
>=20
> If qt4 and qt4-native are present, qt3 works
> If qt4 and qt4-native are not present, qt3 works
> If qt4 is present but qt4-native is not, qt3 fails
>=20
> How do we fix this?

I suspect qt3 is missing bits of the tool renaming we do for qt4 and qt2 =
(moc, uic, lrelease, etc)=


