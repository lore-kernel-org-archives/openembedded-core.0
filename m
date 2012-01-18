Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RnVgR-0002ph-6d
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 14:36:11 +0100
Received: by wgbdr11 with SMTP id dr11so3588686wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2012 05:28:33 -0800 (PST)
Received: by 10.180.93.168 with SMTP id cv8mr31629919wib.2.1326893312988;
	Wed, 18 Jan 2012 05:28:32 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fd1sm22688943wib.0.2012.01.18.05.28.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jan 2012 05:28:32 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAAQYJAvA40tv+9Avwxo736itjGM6yL4EZA98YnKYvw_XtZR-9A@mail.gmail.com>
Date: Wed, 18 Jan 2012 14:28:26 +0100
Message-Id: <6B52813D-DFFF-400C-9BD6-F661FDEC0A36@dominion.thruhere.net>
References: <1326841411-6369-1-git-send-email-andrea.adami@gmail.com>
	<4E95A0DD-C978-4621-A624-8313A743CE56@dominion.thruhere.net>
	<CAAQYJAvA40tv+9Avwxo736itjGM6yL4EZA98YnKYvw_XtZR-9A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] xinput: add utility for configuring and testing XInput devices.
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
X-List-Received-Date: Wed, 18 Jan 2012 13:36:11 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 18 jan. 2012, om 13:40 heeft Andrea Adami het volgende geschreven:

> On Wed, Jan 18, 2012 at 2:46 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>>=20
>> Op 18 jan. 2012 om 00:03 heeft Andrea Adami <andrea.adami@gmail.com> =
het volgende geschreven:
>>=20
>>> * from meta-openembedded with minor editings
>>> * added PE
>>=20
>> why?
>=20
> Just because most oe-core's recipes in xorg-app set PE.
> I quickly inspected some and edited trying to normalize (fields order,
> summary, ...).

Summary: no good reason

>>> and reset PR
>>=20
>> why?
>=20
> Because this revised version is committed for the first time in this =
layer.
> I see now this can break package management of distros using meta-oe
> and the recipe with higher PR...
> and I don't want to force another PE bump.Sorry.
>=20
> Would it be acceptable for you if I update the patch with PR =3D "r7" =
?

Yes

> What about PE?

remove it=


