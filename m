Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RntF1-00062b-0o
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 15:45:27 +0100
Received: by wgbdt11 with SMTP id dt11so208310wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 06:37:44 -0800 (PST)
Received: by 10.180.99.225 with SMTP id et1mr44790506wib.2.1326983864589;
	Thu, 19 Jan 2012 06:37:44 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id eq5sm19079080wib.2.2012.01.19.06.37.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jan 2012 06:37:43 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1326978483.2511.68.camel@ted>
Date: Thu, 19 Jan 2012 15:37:38 +0100
Message-Id: <7BD299FF-ED9A-4C3C-9581-4EF9B8D89B25@dominion.thruhere.net>
References: <1326978483.2511.68.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Buildhistory in action
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
X-List-Received-Date: Thu, 19 Jan 2012 14:45:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 jan. 2012, om 14:08 heeft Richard Purdie het volgende geschreven:

> We've recently added the buildhistory class and I wanted to illustrate
> how it can help us improve the quality of what we're doing. I =
appreciate
> elements of this have been around for a while as part of testlab

About 4 years: =
http://dominion.thruhere.net/koen/cms/the-testlab-strikes-again :D

> but I
> do want to raise the profile of these tools. I added:
>=20
> INHERIT +=3D "buildhistory"
> BUILDHISTORY_COMMIT =3D "1"
>=20
> to my local.conf, then ran "bitbake gst-openmax liba52 js". I then
> applied the staticdev patches from Saul, which should only move the .a
> files to the -staticdev package. I then ran the bitbake command again.
>=20
> If I change into tmp/buildhistory and show the last commit the result =
is
> included below. Since the version changed, the diff isn't as readable =
as
> would be ideal, however reading through it clearly shows the .a files
> moving to the staticdev packages with no unintended changes as far as =
I
> could tell.
>=20
> One of my big worries with the staticdev changes is any unintended
> packaging changes. This lets me view the changes more precisely which
> can only lead to higher quality regression spotting for the project. =
I'd
> like to suggest more people start enabling this and using it to check
> the changes they're making.

If you want to see a longer history, have a look at =
https://github.com/Angstrom-distribution/buildhistory/commits/master, =
I've been using it heavily today when working on udev 177 which changed =
its default filesystem layout.=20
One thing to keep in mind:

$ du -hs /data/ssd/OE/buildhistory/=20
548M	/data/ssd/OE/buildhistory/

I keep it on an SSD to avoid needing to wait a few minutes after every =
bitbake invocation.

regards,

Koen=


