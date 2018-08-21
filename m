Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1E6979022
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 22:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E6FF21836E;
	Wed, 22 Aug 2018 00:48:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id YSHWT5EsZMCV; Wed, 22 Aug 2018 00:48:03 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id E358818134;
	Wed, 22 Aug 2018 00:48:03 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC05A1A07B;
	Wed, 22 Aug 2018 00:48:03 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0D0B1A077;
	Wed, 22 Aug 2018 00:48:03 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 22 Aug 2018 00:48:03 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id B4B372F7D;
	Wed, 22 Aug 2018 00:48:03 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 22 Aug 2018 00:48:03 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Wed, 22 Aug 2018 00:48:03 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Andrej Valek
	<andrej.valek@siemens.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] busybox: update to 1.29.1
Thread-Index: AQHUH1P2j3IvBzLYn0+4pao6VLo2VKTDpXAAgAcVzYCAAEB3YA==
Date: Tue, 21 Aug 2018 22:48:03 +0000
Message-ID: <1d41027052aa40659d2d164dc15b38be@XBOX02.axis.com>
References: <20180719085353.4499-1-andrej.valek@siemens.com>
	<20180719113037.6337-1-andrej.valek@siemens.com>
	<3540cc10-ffab-8805-c471-0a7f12b81acc@siemens.com>
	<5adbae192a432b8997d266ddb4fb6860be4f5ccf.camel@linuxfoundation.org>
In-Reply-To: <5adbae192a432b8997d266ddb4fb6860be4f5ccf.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v2] busybox: update to 1.29.1
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
X-List-Received-Date: Tue, 21 Aug 2018 22:48:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 21 augusti 2018 22:30
> To: Andrej Valek <andrej.valek@siemens.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH v2] busybox: update to 1.29.1
>=20
> On Fri, 2018-08-17 at 10:18 +0200, Andrej Valek wrote:
> > ping
>=20
> Fails to build on the autobuilder due to missing crypt headers. That is
> probably a missing DEPENDS

Well, the patch I sent to add a dependency on virtual/crypt will solve=20
this, but see below.

> but I'm wondering what changed and if the
> change was intentional.

The change was intentional, but it should have been conditional.
libbb/pw_encrypt.c now unconditionally includes crypt.h, but it should=20
only include it if ENABLE_USE_BB_CRYPT is not set:

diff --git a/libbb/pw_encrypt.c b/libbb/pw_encrypt.c
index 86455cd0d..47c20690f 100644
--- a/libbb/pw_encrypt.c
+++ b/libbb/pw_encrypt.c
@@ -6,7 +6,9 @@
  *
  * Licensed under GPLv2 or later, see file LICENSE in this source tree.
  */
+#if !ENABLE_USE_BB_CRYPT
 #include <crypt.h>
+#endif
 #include "libbb.h"

 /* static const uint8_t ascii64[] ALIGN1 =3D

> https://autobuilder.yocto.io/builders/nightly-x86/builds/1259/steps/Build=
Images/logs/stdio
>=20
> https://autobuilder.yocto.io/builders/nightly-x32/builds/1225/steps/Build=
Images/logs/stdio
>=20
> and more...
>=20
> Cheers,
>=20
> Richard

//Peter


