Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA827050E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 06:43:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,670,1400018400"; d="scan'208";a="54953099"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 16 Jul 2014 08:43:59 +0200
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.156]) by
	COSNADEXC22.usr.ingenico.loc ([10.31.4.222]) with mapi id
	14.03.0174.001; Wed, 16 Jul 2014 08:43:59 +0200
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] libav: set LICENSE and LICENSE_FLAGS
	according to PACKAGECONFIG options
Thread-Index: AQHPoEtsIv0WyBFzxUKO68vjMvSzsZuiPc6Q
Date: Wed, 16 Jul 2014 06:43:58 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050BA8B27F6E@COSNADEXC13.usr.ingenico.loc>
References: <8672BB614B4CCA40A6B3BDD6FD82050BA8B27988@COSNADEXC13.usr.ingenico.loc>
	<1405436079-13220-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<53C55932.2050206@opendreambox.org>
In-Reply-To: <53C55932.2050206@opendreambox.org>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [PATCH v3] libav: set LICENSE and LICENSE_FLAGS according to PACKAGECONFIG options
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
X-List-Received-Date: Wed, 16 Jul 2014 06:44:08 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi again,

> Some optional parts of Libav are licensed under the GNU General Public Li=
cense version 2 or later (GPL v2+). See the file COPYING.GPLv2 for details.=
=20
> None of these parts are used by default, you have to explicitly pass --en=
able-gpl to configure to activate them. In this case, Libav's license chang=
es to GPL v2+."

I may misunderstood something here.

For example:
- libavfiler. It contains yadif code which is GPLv2+ and frei0r code is LGP=
Lv2.1+. Libavfiler is clearly contaminated:=20
LICENSE_libavfilter =3D "GPLv2+"
- libavutils is 100% LGPL
LICENSE_libavutils =3D " LGPLv2.1+"

Giving --enable-gpl to configure does not convert pure 100% LGPL licensed l=
ibrary to GPL license. Am I wrong?

> Do you think it would be feasible to add code which decides whether to se=
t --enable-gpl or not? Because --enable-gpl forbids linking libav for progr=
ams with incompatible licenses.
Yes it's possible.

Regards,
M

