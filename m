Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 043006C1BE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 21:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 267CA1845E;
	Tue,  2 Jul 2019 23:04:22 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id iViDMyKsMZSf; Tue,  2 Jul 2019 23:04:20 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 81E561835E;
	Tue,  2 Jul 2019 23:04:20 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A8BF1E092;
	Tue,  2 Jul 2019 23:04:20 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5EE0D1E08E;
	Tue,  2 Jul 2019 23:04:20 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue,  2 Jul 2019 23:04:20 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 51FE8712;
	Tue,  2 Jul 2019 23:04:20 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 2 Jul 2019 23:04:20 +0200
Received: from xbox06.axis.com (10.0.15.176) by xbox11.axis.com (10.0.5.25)
	with Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 2 Jul 2019 23:04:19 +0200
Received: from xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35]) by
	xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35%12]) with mapi id
	15.00.1395.000; Tue, 2 Jul 2019 23:04:19 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: ChenQi <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH V2 1/1] image.bbclass: fix systemd_preset_all
Thread-Index: AQHVL8H4hiSqMABPGkWtMYigx2N1Iqa2aPsQgAADsgCAAWY9UA==
Date: Tue, 2 Jul 2019 21:04:19 +0000
Message-ID: <99c9b16228b5482e9af8c69f43484e54@xbox06.axis.com>
References: <cover.1561954425.git.Qi.Chen@windriver.com>
	<8253aa4004e6a23f783cd930c222138f86d9fa3c.1561954425.git.Qi.Chen@windriver.com>
	<9b4441e390c842ef8d12442f872ada93@xbox06.axis.com>
	<58de5f15-e6e5-9fba-82fd-4b31626289fb@windriver.com>
In-Reply-To: <58de5f15-e6e5-9fba-82fd-4b31626289fb@windriver.com>
Accept-Language: en-US, sv-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH V2 1/1] image.bbclass: fix systemd_preset_all
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
X-List-Received-Date: Tue, 02 Jul 2019 21:04:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of ChenQi
> Sent: den 2 juli 2019 03:39
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH V2 1/1] image.bbclass: fix
> systemd_preset_all
>=20
> On 07/02/2019 07:34 AM, Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> <openembedded-
> >> core-bounces@lists.openembedded.org> On Behalf Of Chen Qi
> >> Sent: den 1 juli 2019 06:16
> >> To: openembedded-core@lists.openembedded.org
> >> Subject: [OE-core] [PATCH V2 1/1] image.bbclass: fix
> systemd_preset_all
> >>
> >> Check the existence of systemd before using systemctl to preset
> units.
> >> This is because even if 'systemd' is in DISTRO_FEATURES, it's
> possible
> >> that systemd is not even installed. e.g. container-test-image in
> >> meta-selftest layer.
> >>
> >> As systemd DEPENDS on systemd-systemctl-native, the existence of
> systemd
> >> also ensures the existence of systemd-systemctl-native.
> >>
> >> This would fix the following test case when using systemd as the
> init
> >> manager.
> >>
> >>    containerimage.ContainerImageTests.test_expected_files
> >>
> >> Also remove the IMAGE_EXTRADEPENDS setting, as nothing references
> this
> >> variable.
> >>
> >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> ---
> >>   meta/classes/image.bbclass | 5 +++--
> >>   1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> >> index d2b2fb9..7daa97e 100644
> >> --- a/meta/classes/image.bbclass
> >> +++ b/meta/classes/image.bbclass
> >> @@ -666,10 +666,11 @@ reproducible_final_image_task () {
> >>   }
> >>
> >>   systemd_preset_all () {
> >> -    systemctl --root=3D"${IMAGE_ROOTFS}" --preset-mode=3Denable-only
> preset-all
> >> +    if [ -e ${IMAGE_ROOTFS}${root_prefix}/lib/systemd/systemd ];
> then
> >                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > That should be ${systemd_system_unitdir}, which will also use the
> correct path
> > (it is /lib/systemd/system, not /lib/systemd/systemd).
>=20
> I'm checking the systemd binary under ${root_prefix}/lib/systemd, not
> the directory holding units.

Right, my bad. Still, then the path above should be
"${IMAGE_ROOTFS}${systemd_unitdir}/systemd".

> Regards,
> Chen Qi
>=20
> >> +	systemctl --root=3D"${IMAGE_ROOTFS}" --preset-mode=3Denable-only
> preset-all
> >> +    fi
> >>   }
> >>
> >> -IMAGE_EXTRADEPENDS +=3D "${@ 'systemd-systemctl-native' if
> bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not
> bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d)
> else ''}"
> >>   IMAGE_PREPROCESS_COMMAND_append =3D " ${@ 'systemd_preset_all;' if
> bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not
> bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d)
> else ''} reproducible_final_image_task; "
> >>
> >>   CVE_PRODUCT =3D ""
> >> --
> >> 1.9.1
> > //Peter

//Peter


