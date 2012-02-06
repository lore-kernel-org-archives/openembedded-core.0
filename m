Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RuREB-00059J-UE
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 17:15:39 +0100
Received: by werc1 with SMTP id c1so4909086wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 08:07:39 -0800 (PST)
Received: by 10.216.134.74 with SMTP id r52mr7273858wei.19.1328544458982;
	Mon, 06 Feb 2012 08:07:38 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id q2sm26171817wiy.7.2012.02.06.08.07.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 08:07:38 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1328543751.14363.11.camel@phil-desktop>
Date: Mon, 6 Feb 2012 17:07:28 +0100
Message-Id: <C06A966C-2217-4539-86F9-47BAABA224D4@dominion.thruhere.net>
References: <CAMKF1spO-FVweKU21EdHK-Rs5gc4qun=JRYnwMWc88SOSeQufg@mail.gmail.com>
	<CAMKF1soq=EaZ4KMb7McFcEjNyTVT2sMHPHvEr11+kL603iCOUQ@mail.gmail.com>
	<1408084.uBj8QddilE@helios>
	<1328543751.14363.11.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Duplicate recipes in meta-oe
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
X-List-Received-Date: Mon, 06 Feb 2012 16:15:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Op 6 feb. 2012, om 16:55 heeft Phil Blundell het volgende geschreven:

> On Mon, 2012-02-06 at 15:39 +0000, Paul Eggleton wrote:
>> I talked to Koen at FOSDEM and apparently he prefers having a symlink =
rather=20
>> than a copy for the timezone file. I can't express an opinion one way =
or=20
>> another but it sounds like this one aspect still needs to be resolved =
- should=20
>> this be selectable?
>=20
> I guess this is all bound up with the "/usr on a separate partition"
> thing.  If your position is that the root filesystem is meant to work
> without /usr mounted then having /etc/localtime be a symlink
> into /usr/share is probably not going to fly.  Conversely, one were to
> take the view that any reasonable system in the 21st century is going =
to
> have / and=CC=A3 /usr on the same device, making it be a symlink would =
be a
> fine idea.

That was my reasoning as well.

regards,

Koen=


