Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id EA14A78ADC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 12:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 416C018585;
	Thu, 26 Jul 2018 14:30:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ykkYo_7bwAIr; Thu, 26 Jul 2018 14:30:21 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 8F8E6182CF;
	Thu, 26 Jul 2018 14:30:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7650B1A08A;
	Thu, 26 Jul 2018 14:30:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 693061A088;
	Thu, 26 Jul 2018 14:30:21 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 26 Jul 2018 14:30:21 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 5E1303028;
	Thu, 26 Jul 2018 14:30:21 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 26 Jul 2018 14:30:21 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Thu, 26 Jul 2018 14:30:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: ChenQi <Qi.Chen@windriver.com>, Ricardo Salveti <rsalveti@rsalveti.net>
Thread-Topic: [OE-core] [PATCH 1/2] systemd: upgrade to 239
Thread-Index: AQHUHXIp1Bo6awZYuUKdWGWDOwqN/KSge6UAgABxFICAAI5GgA==
Date: Thu, 26 Jul 2018 12:30:21 +0000
Message-ID: <90a08929e5fe482b9cde1599fa2585a2@XBOX02.axis.com>
References: <cover.1531792805.git.Qi.Chen@windriver.com>
	<29d24bb7dc5de1ae18398b5754b675fdf9b9fdf3.1531792805.git.Qi.Chen@windriver.com>
	<CAHYQr0pwkuE6B1CcN2TLhJ=YyXDHQH0v-SV7ejxL+05ifnmbMQ@mail.gmail.com>
	<105601ae-614a-5d9b-3822-598b009f8859@windriver.com>
In-Reply-To: <105601ae-614a-5d9b-3822-598b009f8859@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] systemd: upgrade to 239
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2018 12:30:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of ChenQi
> Sent: den 26 juli 2018 07:51
> To: Ricardo Salveti <rsalveti@rsalveti.net>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/2] systemd: upgrade to 239
>=20
> On 07/26/2018 07:05 AM, Ricardo Salveti wrote:
> > On Mon, Jul 16, 2018 at 11:05 PM, Chen Qi <Qi.Chen@windriver.com> wrote=
:
> >> Upgrade systemd to 239.

[cut]

> >> 3. update-alternatives changes
> >>    The utilities like shutdown, poweroff, etc. are now created as syml=
inks
> >>    at do_install. So there's no need to use update-alternatives mechan=
ism
> >>    anymore to create the symlinks now. In addtion, I don't think we> n=
ow
> >>    support multiple init systems at one running system, so there's rea=
lly
> >>    no need to use update-alternatives mechanism here.
> >
> > I noticed that reboot stopped working locally as I had busybox
> > installed together with systemd, and the busybox version ended up
> > being used as it was provided via update-alternatives.
> >
> > Looking for possible similar broken links, I found that
> > update-alternatives ended up pointing reboot, halt and poweroff to the
> > busybox binary instead of systemctl. Should we revert the changes and
> > bring back update-alternatives for them?
> >
> > Thanks,
>=20
> I think the correct direction to fix this problem is to make busybox
> only provide init utilities (reboot, halt, etc) when init manager is
> set to busybox.
>=20
> We current have in busybox recipe's SRC_URI:
>             ${@["",
> "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') =3D=3D
> 'busybox')]} \
>=20
> I think the init utilities should be moved to init.cfg.
>=20
> Please check my logic to see if you can agree with it.
> We have two facts here.
> 1. Init utilities (reboot, halt, etc.) are tightly bond to the specific
> implementation of PID 1.
> 2. We only allow one PID 1 in our image. (VIRTUAL-RUNTIME_init_manager).
> So we can conclude from the above two facts that it does not make much
> sense to have multiple providers of init utilities while we only allow
> one PID 1 provider on image.
>=20
> After all, we are using update-*alternatives*, things that this
> mechanism manages are supposed to generally serve as alternatives to
> each other.
>=20
> Best Regards,
> Chen Qi

For what it is worth, we have a package that installs wrappers for init and=
=20
reboot, which is now causing image creation to fail due to the change to=20
systemd since both packages now try to install init and reboot. I can of=20
course add a systemd_%.bbappend to remove init and reboot, but that means=20
the systemd package is broken unless the package with the wrappers is =20
always installed.

//Peter


