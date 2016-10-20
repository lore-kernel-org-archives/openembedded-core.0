Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7DA601F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 10:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 0612D2E304;
	Thu, 20 Oct 2016 12:44:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id mvZuyc91Jw5I; Thu, 20 Oct 2016 12:44:31 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 8CFC02E2FA;
	Thu, 20 Oct 2016 12:44:31 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 677DD1E07D;
	Thu, 20 Oct 2016 12:44:31 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BBA11E077;
	Thu, 20 Oct 2016 12:44:31 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 20 Oct 2016 12:44:31 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 4FAE8460;
	Thu, 20 Oct 2016 12:44:31 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 20 Oct 2016 12:44:31 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Thu, 20 Oct 2016 12:44:31 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Olaf Mandel <o.mandel@menlosystems.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] Remove $COREBASE/LICENSE from
	LIC_FILES_CHKSUM
Thread-Index: AQHSKfIp2fLnvvwPDUGbxklelwfns6CxJZkw
Date: Thu, 20 Oct 2016 10:44:31 +0000
Message-ID: <2cc36b90426449c9bf030d2604b93bab@XBOX02.axis.com>
References: <1476871513-19739-1-git-send-email-o.mandel@menlosystems.com>
	<1476871513-19739-2-git-send-email-o.mandel@menlosystems.com>
In-Reply-To: <1476871513-19739-2-git-send-email-o.mandel@menlosystems.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/1] Remove $COREBASE/LICENSE from LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 20 Oct 2016 10:44:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Olaf Mandel
> Sent: den 19 oktober 2016 12:05
> To: openembedded-core@lists.openembedded.org
> Cc: Olaf Mandel
> Subject: [OE-core] [PATCH 1/1] Remove $COREBASE/LICENSE from
> LIC_FILES_CHKSUM
>=20
> Several recipes reference the LICENSE file in their LIC_FILES_CHKSUM
> variable as ${COREBASE}/LICENSE. This forces distribution providers to
> keep this file verbatim or to overload the affected recipes. The
> section
> "Moving to the Yocto Project 1.6 Release" in the Yocto manual suggests
> removing the LICENSE file where possible.
>=20
> Remove LICENSE in cases where COPYING.MIT is also given and replace
> LICENSE with COPYING.MIT if the former was the only entry. All modified
> recipes specify LICENSE =3D "MIT" and none of the in-tree files specify a
> different license either.
>=20
> As the packages do not change (the license files are not contained in
> them), do not increase PR.
> ---
>  meta-skeleton/recipes-skeleton/useradd/useradd-example.bb | 3 +--
>  meta/recipes-bsp/formfactor/formfactor_0.0.bb             | 3 +--
>  meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb    | 3 +--
>  meta/recipes-core/systemd/systemd-compat-units.bb         | 2 +-
>  meta/recipes-core/systemd/systemd-systemctl-native.bb     | 2 +-
>  meta/recipes-core/udev/udev-extraconf_1.1.bb              | 3 +--
>  meta/recipes-devtools/devel-config/distcc-config.bb       | 3 +--
>  meta/recipes-devtools/devel-config/nfs-export-root.bb     | 3 +--
>  meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb  | 3 +--
>  meta/recipes-graphics/wayland/weston-init.bb              | 2 +-
>  meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb    | 3 +--
>  11 files changed, 11 insertions(+), 19 deletions(-)

Even after this is applied, there are still nine recipes in OE-Core=20
that reference ${COREBASE}/LICENSE. There is also an example in=20
dev-manual-common-tasks.xml with a reference to ${COREBASE}/LICENSE.=20
AFAICT, they all look just like the ones that this patch removes.=20
Any reason they were not fixed as well?

There are also 17 recipes in OpenEmbedded with a reference to=20
${COREBASE}/LICENSE. They too need to be fixed.

//Peter


