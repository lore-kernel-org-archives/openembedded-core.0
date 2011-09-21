Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6Hph-0006Rr-5e
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 10:07:05 +0200
Received: by bke11 with SMTP id 11so1567786bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 01:01:47 -0700 (PDT)
Received: by 10.204.152.66 with SMTP id f2mr339258bkw.63.1316592106816;
	Wed, 21 Sep 2011 01:01:46 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id t13sm15216117fae.0.2011.09.21.01.01.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 01:01:46 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E7995F4.5040409@linux.intel.com>
Date: Wed, 21 Sep 2011 10:01:40 +0200
Message-Id: <9AF2A75F-7507-4DB5-AE98-30E651A3DDD7@dominion.thruhere.net>
References: <cover.1316562083.git.sgw@linux.intel.com>	<91e9da0fc938b836752d9e956e99931ec61464c0.1316562083.git.sgw@linux.intel.com>
	<3688FC08-2B0B-4230-BD32-4C57ED2B6BF1@dominion.thruhere.net>
	<4E7995F4.5040409@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [RC Fixes 7/8] distro tracking: Update Distro Aliases
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
X-List-Received-Date: Wed, 21 Sep 2011 08:07:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 sep. 2011, om 09:44 heeft Saul Wold het volgende geschreven:

> On 09/21/2011 12:07 AM, Koen Kooi wrote:
>>=20
>> Op 21 sep. 2011, om 01:43 heeft Saul Wold het volgende geschreven:
>>=20
>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>> ---
>>> .../conf/distro/include/distro_tracking_fields.inc |   83 =
+++++++++++++++++++-
>>> 1 files changed, 81 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc =
b/meta/conf/distro/include/distro_tracking_fields.inc
>>>=20
>>> DISTRO_PN_ALIAS_pn-task-core-qt =3D "OE-Core"
>>> DISTRO_PN_ALIAS_pn-task-core-sdk =3D "OE-Core"
>>> DISTRO_PN_ALIAS_pn-task-core-sdk-gmae =3D "OE-Core"
>>> +DISTRO_PN_ALIAS_pn-task-core-ssh-dropbear =3D "Poky"
>>> +DISTRO_PN_ALIAS_pn-task-core-ssh-openssh =3D "Poky"
>>> DISTRO_PN_ALIAS_pn-task-core-standalone-gmae-sdk-target =3D =
"OE-Core"
>>> DISTRO_PN_ALIAS_pn-task-core-standalone-sdk-target =3D "OE-Core"
>>> DISTRO_PN_ALIAS_pn-task-core-tools =3D "OE-Core"
>>> DISTRO_PN_ALIAS_pn-task-core-x11-sato =3D "OE-Core"
>>> +DISTRO_PN_ALIAS_pn-task-qt4e =3D "Poky"
>>> +DISTRO_PN_ALIAS_pn-task-qte-toolchain-host-natives =3D "Poky"
>>> DISTRO_PN_ALIAS_pn-initramfs-boot =3D "OE-Core"
>>> DISTRO_PN_ALIAS_pn-initramfs-live-boot =3D "OE-Core"
>>> DISTRO_PN_ALIAS_pn-initramfs-live-install =3D "OE-Core"
>>=20
>>=20
>> That doesn't look right
>=20
> And your issue is?
>=20
> They are part of OE-Core now correct?  Is this a problem?

They are part of OE-core now, yes, so why do you mark them as poky?=


