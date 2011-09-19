Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R5ckB-0002WI-ST
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 14:14:39 +0200
Received: by wwf27 with SMTP id 27so6253756wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 05:09:23 -0700 (PDT)
Received: by 10.227.43.11 with SMTP id u11mr2631292wbe.24.1316434163793;
	Mon, 19 Sep 2011 05:09:23 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ev5sm25634278wbb.11.2011.09.19.05.09.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Sep 2011 05:09:22 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKoemW81Sob3uUe-1LedWXcoJqEdkUGTj-+ZjgrUsytb_Q@mail.gmail.com>
Date: Mon, 19 Sep 2011 14:09:20 +0200
Message-Id: <49A59D49-5FF1-4F8D-A259-F6F8CA42ADC9@dominion.thruhere.net>
References: <20110911172241.GA3674@chargestorm.se>
	<4E7246EB.2070607@eukrea.com>
	<CAP9ODKqCc3zAuwBoL7Yiet0GKuJKFymZMtStkpwAq88b=ZGibw@mail.gmail.com>
	<201109161212.19780.paul.eggleton@linux.intel.com>
	<4E733F7D.6090109@eukrea.com>
	<CAP9ODKo9-6qHhCWfWS5_GXrNxw38VCXjzih2hdoWRQ9vY3MVFg@mail.gmail.com>
	<DD23E745-87D9-4831-85D4-C038CD79DCF7@dominion.thruhere.net>
	<CAP9ODKoemW81Sob3uUe-1LedWXcoJqEdkUGTj-+ZjgrUsytb_Q@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1244.3)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Mon, 19 Sep 2011 12:14:40 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 19 sep. 2011, om 13:48 heeft Otavio Salvador het volgende geschreven:

> On Mon, Sep 19, 2011 at 06:45, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> Send a patch that adds 4.7.4 with DEFAULT_PREFERENCE =3D -1, but =
leaves 4.7.3 intact.
>>=20
>> That way people can migrate their bbappends without needing a flag =
day and it also allows people to test 4.7.4 more easily before it gets =
made the default.
>=20
> I prefer to have 4.7.4 in as it ... it has been in test here, on Eric
> and maybe others with no know issues so I'd prefer to have it into the
> release and get done with it. 4.7.4 is the current stable release, the
> only know regression has a fix available and people have been using it
> locally so no reason to leave it behind.

I'd like to see 4.7.4 go in. Richard and Saul have made it clear that =
removing 4.7.3 isn't going to happen before the release, so I'm trying =
make a compromise here. Are you saying you would find it unacceptable =
for both 4.7.3 and 4.7.4 to be in OE-core for a short while?=


