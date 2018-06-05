Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F74477138
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 10:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 037DA183B0;
	Tue,  5 Jun 2018 12:44:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id hqVszouNXXMC; Tue,  5 Jun 2018 12:43:58 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0676818392;
	Tue,  5 Jun 2018 12:43:58 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B10321E08E;
	Tue,  5 Jun 2018 12:43:57 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4F5B1E08D;
	Tue,  5 Jun 2018 12:43:57 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue,  5 Jun 2018 12:43:57 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id 97F20282B;
	Tue,  5 Jun 2018 12:43:57 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 5 Jun 2018 12:43:57 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 5 Jun 2018 12:43:57 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Tue, 5 Jun 2018 12:43:57 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] [PATCH] wpa-supplicant: fix the bug for
	PATCHTOOL	= "patch"
Thread-Index: AQHT/KTo4deBsy5A4Uyk80BVEVcrY6RRdqCg
Date: Tue, 5 Jun 2018 10:43:57 +0000
Message-ID: <ed003177b59644fe9b7f33975d3758c8@XBOX02.axis.com>
References: <20180605081056.16610-1-hongl.fnst@cn.fujitsu.com>
	<20180605081056.16610-3-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20180605081056.16610-3-hongl.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] [PATCH] wpa-supplicant: fix the bug for PATCHTOOL	= "patch"
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
X-List-Received-Date: Tue, 05 Jun 2018 10:44:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Hong Liu
> Sent: den 5 juni 2018 10:11
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] [PATCH] wpa-supplicant: fix the bug for
> PATCHTOOL =3D "patch"
>=20
> When switch PATCHTOOL to patch, applying 'key-replay-cve-
> multiple.patch' failed:
>=20
> checking file src/ap/ieee802_11.c
> checking file src/ap/wpa_auth.c
> checking file src/ap/wpa_auth.h
> checking file src/ap/wpa_auth_ft.c
> checking file src/ap/wpa_auth_i.h
> checking file src/common/wpa_common.h
> checking file src/rsn_supp/wpa.c
> checking file src/rsn_supp/wpa_i.h
> checking file src/rsn_supp/wpa.c
> Hunk #1 FAILED at 709.
> Hunk #2 FAILED at 757.
> Hunk #3 succeeded at 840 (offset -12 lines).
> Hunk #4 FAILED at 868.
> Hunk #5 FAILED at 900.
> Hunk #6 FAILED at 924.
> Hunk #7 succeeded at 1536 (offset -38 lines).
> Hunk #8 FAILED at 2386.
> Hunk #9 FAILED at 2920.
> Hunk #10 succeeded at 2940 (offset -46 lines).
> Hunk #11 FAILED at 2998.
> 8 out of 11 hunks FAILED
> checking file src/rsn_supp/wpa_i.h
> Hunk #1 FAILED at 32.
> 1 out of 1 hunk FAILED
> checking file src/common/wpa_common.h
> Hunk #1 succeeded at 215 with fuzz 1.
> checking file src/rsn_supp/wpa.c
> checking file src/rsn_supp/wpa_i.h
> checking file src/ap/wpa_auth.c
> Hunk #1 succeeded at 1898 (offset -3 lines).
> Hunk #2 succeeded at 2470 (offset -3 lines).
> checking file src/rsn_supp/tdls.c
> checking file wpa_supplicant/wnm_sta.c
> checking file src/rsn_supp/wpa.c
> Hunk #1 succeeded at 2378 (offset -62 lines).
> checking file src/rsn_supp/wpa_ft.c
> checking file src/rsn_supp/wpa_i.h
> Hunk #1 succeeded at 123 (offset -5 lines).
>=20
> So split the wpa-supplicant/key-replay-cve-multiple to 8 patches.

Why does it need to be split into eight separate patches? Isn't it=20
just a case of having to regenerate the patch so that the hunk=20
contexts match the current code?

> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../wpa-supplicant/key-replay-cve-multiple.patch   | 1025 --------------=
------
>  .../wpa-supplicant/key-replay-cve-multiple1.patch  |  191 ++++
>  .../wpa-supplicant/key-replay-cve-multiple2.patch  |  249 +++++
>  .../wpa-supplicant/key-replay-cve-multiple3.patch  |  183 ++++
>  .../wpa-supplicant/key-replay-cve-multiple4.patch  |   78 ++
>  .../wpa-supplicant/key-replay-cve-multiple5.patch  |   63 ++
>  .../wpa-supplicant/key-replay-cve-multiple6.patch  |  131 +++
>  .../wpa-supplicant/key-replay-cve-multiple7.patch  |   42 +
>  .../wpa-supplicant/key-replay-cve-multiple8.patch  |   81 ++
>  .../wpa-supplicant/wpa-supplicant_2.6.bb           |    9 +-
>  10 files changed, 1026 insertions(+), 1026 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/key-replay-cve-multiple.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/key-replay-cve-multiple1.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/key-replay-cve-multiple2.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/key-replay-cve-multiple3.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/key-replay-cve-multiple4.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/key-replay-cve-multiple5.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/key-replay-cve-multiple6.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/key-replay-cve-multiple7.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/key-replay-cve-multiple8.patch

//Peter


