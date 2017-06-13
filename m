Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B501782DA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 07:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 117D018466;
	Tue, 13 Jun 2017 09:52:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id FR-bImo5Fzvk; Tue, 13 Jun 2017 09:52:17 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 15A8218491;
	Tue, 13 Jun 2017 09:52:15 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF7D41A0B5;
	Tue, 13 Jun 2017 09:52:15 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B49191A0B3;
	Tue, 13 Jun 2017 09:52:15 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 13 Jun 2017 09:52:15 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id A83572F15;
	Tue, 13 Jun 2017 09:52:15 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 13 Jun 2017 09:52:15 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Tue, 13 Jun 2017 09:52:15 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3 2/8] cross.bbclass: merged /usr support
Thread-Index: AQHS5BIx8573WIJKfU6UeE4FrV7QnaIiaz3A
Date: Tue, 13 Jun 2017 07:52:15 +0000
Message-ID: <6c245347ca324b9ea7b88bcaf920e35f@XBOX02.axis.com>
References: <1497336760-36835-1-git-send-email-amarnath.valluri@intel.com>
	<1497336760-36835-3-git-send-email-amarnath.valluri@intel.com>
In-Reply-To: <1497336760-36835-3-git-send-email-amarnath.valluri@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v3 2/8] cross.bbclass: merged /usr support
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
X-List-Received-Date: Tue, 13 Jun 2017 07:52:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Amarnath Valluri
> Sent: den 13 juni 2017 08:53
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v3 2/8] cross.bbclass: merged /usr support
>=20
> To be align with base configuration change, use ${root_prefix} while
> preparing
> ${target_base_libdir}.
>=20
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>  meta/classes/cross.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
> index 8757303..7720185 100644
> --- a/meta/classes/cross.bbclass
> +++ b/meta/classes/cross.bbclass
> @@ -50,10 +50,10 @@ SSTATE_SCAN_CMD ?=3D "${SSTATE_SCAN_CMD_NATIVE}"
>  # Path mangling needed by the cross packaging
>  # Note that we use :=3D here to ensure that libdir and includedir are
>  # target paths.
> -target_base_prefix :=3D "${base_prefix}"
> +target_root_prefix :=3D "${root_prefix}"

It is probably better to do:

target_base_prefix :=3D "${root_prefix}"

I.e., maintain the target_base_prefix variable, in case it is used=20
in some external layer.

>  target_prefix :=3D "${prefix}"
>  target_exec_prefix :=3D "${exec_prefix}"
> -target_base_libdir =3D "${target_base_prefix}/${baselib}"
> +target_base_libdir =3D "${target_root_prefix}/${baselib}"
>  target_libdir =3D "${target_exec_prefix}/${baselib}"
>  target_includedir :=3D "${includedir}"
>=20
> --
> 2.7.4

//Peter


