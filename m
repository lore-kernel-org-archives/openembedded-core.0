Return-Path: <pbarker.renesas@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513AECD1292
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 08:39:09 +0000 (UTC)
Received: from relmlie6.idc.renesas.com (relmlie6.idc.renesas.com [210.160.252.172])
 by mx.groups.io with SMTP id smtpd.web11.7669.1712047139694754174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 01:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: bp.renesas.com, ip: 210.160.252.172, mailfrom: paul.barker.ct@bp.renesas.com)
X-IronPort-AV: E=Sophos;i="6.07,174,1708354800"; 
   d="asc'?scan'208";a="204035470"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Apr 2024 17:38:58 +0900
Received: from [10.226.93.98] (unknown [10.226.93.98])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7CEC741B0F86;
	Tue,  2 Apr 2024 17:38:56 +0900 (JST)
Message-ID: <1f92e19a-6e2e-43ed-b300-2d4f5cd4815b@bp.renesas.com>
Date: Tue, 2 Apr 2024 09:38:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Openembedded-architecture] New mailing list for layer patches
Content-Language: en-GB
To: Ross Burton <ross.burton@arm.com>,
 openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>,
 Yocto-mailing-list <yocto@lists.yoctoproject.org>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <8363E7C5-B3C0-4B3E-941E-762A400DF87B@arm.com>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <8363E7C5-B3C0-4B3E-941E-762A400DF87B@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qi2dMd21oWSzwW02qH6KOJGp"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 08:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197868

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qi2dMd21oWSzwW02qH6KOJGp
Content-Type: multipart/mixed; boundary="------------6qJWPpZARVgEq6mVejJiXR1M";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Ross Burton <ross.burton@arm.com>,
 openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>,
 Yocto-mailing-list <yocto@lists.yoctoproject.org>,
 OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <1f92e19a-6e2e-43ed-b300-2d4f5cd4815b@bp.renesas.com>
Subject: Re: [Openembedded-architecture] New mailing list for layer patches
References: <8363E7C5-B3C0-4B3E-941E-762A400DF87B@arm.com>
In-Reply-To: <8363E7C5-B3C0-4B3E-941E-762A400DF87B@arm.com>

--------------6qJWPpZARVgEq6mVejJiXR1M
Content-Type: multipart/mixed; boundary="------------q9UE7QPgN7QHu0iiGqdOiYT0"

--------------q9UE7QPgN7QHu0iiGqdOiYT0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28/03/2024 14:36, Ross Burton wrote:
> Hi,
>=20
> At the moment if a layer doesn=E2=80=99t have enough volume to justify =
a dedicated mailing list for patches (see, for example, meta-arm@lists.yo=
ctoproject.org <mailto:meta-arm@lists.yoctoproject.org>) then the convent=
ion is that the patches can be sent to yocto@lists.yoctoproject.org <mail=
to:yocto@lists.yoctoproject.org>.
>=20
> However, that=E2=80=99s also the list that we encourage users of Yocto =
to use for help, so the list has a mix of patches for various layers and =
people asking for help, which isn=E2=80=99t ideal: users who want help do=
n=E2=80=99t want to be flooded with patches for layers they=E2=80=99re no=
t using, layer maintainers may not want to see the requests for help, and=
 people who want the status reports have to receive patches and support.
>=20
> The Yocto TSC has been discussing this, and as a solution to this we=E2=
=80=99ve just created a new mailing list: yocto-patches@lists.yoctoprojec=
t.org <mailto:yocto-patches@lists.yoctoproject.org>.  This list is specif=
ically for Yocto-related projects which don=E2=80=99t have their own mail=
ing list or other patch submission process.   We ask that all layers curr=
ently using yocto@ for patches move to yocto-patches@, so that yocto@ can=
 be used purely for discussion and other non-patch related subjects.

I think this is a great change, along with the new yocto-status@ list it =
will make things easier to follow :)

Do you know if yocto-patches@ will be available via lore.kernel.org?

Thanks,

--=20
Paul Barker

--------------q9UE7QPgN7QHu0iiGqdOiYT0
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------q9UE7QPgN7QHu0iiGqdOiYT0--

--------------6qJWPpZARVgEq6mVejJiXR1M--

--------------qi2dMd21oWSzwW02qH6KOJGp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZgvEHgUDAAAAAAAKCRDbaV4Vf/JGvZsL
AP96Uh2bzQPNYC76G91QkWAn6EeC2qUaeqcnFNhY8439PwEAt6JeNUd9YAEdA/PY0XOUBPIiAufJ
DYGlHoJa1G/7IAw=
=qH0M
-----END PGP SIGNATURE-----

--------------qi2dMd21oWSzwW02qH6KOJGp--

