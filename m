Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 414 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Nov 2015 10:10:51 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2983360125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 10:10:51 +0000 (UTC)
Received: from [216.82.241.132] by server-4.bemta-8.messagelabs.com id
	E2/63-24484-D08D9365; Wed, 04 Nov 2015 10:03:57 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-10.tower-45.messagelabs.com!1446631436!2627925!1
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 7.19.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16767 invoked from network); 4 Nov 2015 10:03:57 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-10.tower-45.messagelabs.com with AES256-SHA encrypted SMTP;
	4 Nov 2015 10:03:57 -0000
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0248.002;
	Wed, 4 Nov 2015 11:03:56 +0100
From: "Viguera, Javier" <Javier.Viguera@digi.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Question about bluetooth bbclass
Thread-Index: AdEW6Bvn+zG+k54XSLKcZmUfnZ3+rA==
Date: Wed, 4 Nov 2015 10:03:55 +0000
Message-ID: <DA8287CC96892A4EB4FCF4FB3FBDA1AB1D7D7A@dor-sms-xch01.digi.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.250]
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean
MIME-Version: 1.0
Subject: Question about bluetooth bbclass
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
X-List-Received-Date: Wed, 04 Nov 2015 10:10:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

One question about bluetooth class.

The Yocto reference manual and also the bluetooth.bbclass says that the way=
 to use the class is:

# Use this with:
#  inherit bluetooth
#  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, '${BLUEZ}', '', d)}
#  PACKAGECONFIG[bluez4] =3D "--enable-bluez4,--disable-bluez4,bluez4"

Is the ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '',=
 d)} needed at all?

The class code is:

BLUEZ ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', bb.utils.c=
ontains('DISTRO_FEATURES', 'bluez5', 'bluez5', 'bluez4', d), '', d)}"

So if I understand this correctly, the BLUEZ variable is already checking t=
he DISTRO_FEATURES and will be empty if 'bluetooth' is not there, so wouldn=
't just a:

inherit bluetooth
PACKAGECONFIG ??=3D "${BLUEZ}"
...

be enough?

_____

JAVIER VIGUERA
SOFTWARE ENGINEERING

Digi International Spain S.A.U.

