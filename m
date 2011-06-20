Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QYfTE-0002EO-BO
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 16:28:56 +0200
Received: by wwg12 with SMTP id 12so2133030wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 07:25:20 -0700 (PDT)
Received: by 10.227.208.12 with SMTP id ga12mr5004238wbb.68.1308579920833;
	Mon, 20 Jun 2011 07:25:20 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ej7sm3225743wbb.19.2011.06.20.07.25.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Jun 2011 07:25:19 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DFF515B.1040202@windriver.com>
Date: Mon, 20 Jun 2011 16:25:13 +0200
Message-Id: <D7C9C77C-ED18-4FCB-A522-C8F023E37405@dominion.thruhere.net>
References: <AE69955E-732E-4002-90F9-FF833BC78D8A@dominion.thruhere.net>	<4DFF49B8.9050908@windriver.com>	<1308576583.25285.12093.camel@phil-desktop>
	<90AD0E19-73AB-4443-AAC5-D1069E260D2C@dominion.thruhere.net>
	<4DFF515B.1040202@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Architecture mismatch QA check not fatal?
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
X-List-Received-Date: Mon, 20 Jun 2011 14:28:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 jun 2011, om 15:55 heeft Mark Hatle het volgende geschreven:

> On 6/20/11 8:31 AM, Koen Kooi wrote:
>>=20
>> Op 20 jun 2011, om 15:29 heeft Phil Blundell het volgende geschreven:
>>=20
>>> On Mon, 2011-06-20 at 08:23 -0500, Mark Hatle wrote:
>>>> (The minor cases are primarily firmware loaded into off-board cards =
in PCI
>>>> chasis and such.. occasionally these firmware are ELF and of an =
architecture not
>>>> the same as the host..  it's rare, but I have seen it before.)
>>>=20
>>> Shouldn't those firmware images just go in a separate package?
>=20
> Depends on how the system is configured..  Often I see them packaged =
with the
> firmware loader -- which is the proper arch, etc..
>=20
>> If we do that we can use INSANE_SKIP_firmwarepackage =3D True, which =
seems like a good solution.
>=20
> Ya, as long as we can skip -- or change it to a warning instead of an =
error.. I
> think we're good.  Like I said, this is rare and unlikely to be an =
issue in
> anything in oe-core, meta-oe or even the distributions based on =
oe-core.. but I
> have seen it in customer production environments before.

We have exactly 1 xorg driver in oe .dev that triggers it :)=


