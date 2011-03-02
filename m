Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PuqnQ-0002Kq-8D
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 19:29:12 +0100
Received: by wwe15 with SMTP id 15so300100wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 10:27:44 -0800 (PST)
Received: by 10.227.157.17 with SMTP id z17mr54956wbw.54.1299090464624;
	Wed, 02 Mar 2011 10:27:44 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id bd8sm173572wbb.1.2011.03.02.10.27.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 10:27:44 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1299088802.26736.10715.camel@rex>
Date: Wed, 2 Mar 2011 19:27:42 +0100
Message-Id: <BED5DD21-1E73-4DB2-9E29-17E70DF7344C@dominion.thruhere.net>
References: <4D6E7EB1.5080602@windriver.com> <1299088802.26736.10715.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: oe-core cleanup...
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
X-List-Received-Date: Wed, 02 Mar 2011 18:29:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 mrt 2011, om 19:00 heeft Richard Purdie het volgende geschreven:

> Thanks for starting this thread Mark, I've also just been looking at
> this question so its timely.
>=20
> On Wed, 2011-03-02 at 11:30 -0600, Mark Hatle wrote:
>> I finally got a chance to look at the oe-core and where it currently =
is..  Some
>> suggestions below:
>>=20
>> LICENSE file, this may need to be cleaned up to only cover the =
components
>> actually in the oe-core.
>>=20
>> README likely needs some revision
>>=20
>> README.hardware needs a lot of revision.  Anything outside of support =
for QEMU
>> should be removed.
>>=20
>> The meta-demoapps and meta-rt components, will those be staying or =
going?
>>=20
>> The meta/recipes.txt needs to be verified as still what we want -- I =
assume it
>> is at this point..
>>=20
>> meta/recipes-...  sato, qt, gnome, I thought were going elsewhere?
>>=20
>> Do the items in the "scripts" need to be renamed or is Poky being =
kept in the
>> naming?  Same with the poky-init-build-env?
>>=20
>> Then I also assume the items in the documentation directory need to =
be cleaned
>> up as well...
>>=20
>> Let me know what you'd like me to try and tackle -- or if we need to =
bring these
>> items up at the TSC for recommendation.
>=20
> I'm proposing this change so far:
>=20
> =
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/roor=
g&id=3D891ad22536b49d4fee066a5865ad730f791d36e9
>=20
> with those relocated files being removed from oe-core. Any objections =
to
> that to start with?=20

Why not put the recipes in meta-oe? I have need for e.g eds-dbus and =
would like to have that in meta-oe.

regards,

Koen=


