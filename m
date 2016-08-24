Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4E6607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 16:54:32 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id vy10so1478905pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 09:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=vPgFj252COGD/sw7KGqsiYl5Xj6hQsnKIAm/JgkrEd4=;
	b=dHi9YHMS/RWuQjgMqg9Iu8ZB9CwaHPtgghpYTs3X5EgHMzqYyjbyvn4B+a4qWrg5Yv
	bUgYFyWj0V7rencgjqOSvL/3iYV91T23bQ7xkODBvwBuksI5WZFgls4pjQv4PWY/nUEm
	1zdmYC4GH2b+gq0QTlsj49Aa5yEiugwyqYfo2pQvnE3v+qhl7N1idDORNbfBt+Mhi4nS
	Ixv2pCHvhGFhFerd7Co7eDRDKuAbXEEwhYT8j2XOSaeCnOjH+WGtsj5Ciz4cIsswlYX/
	1HV1U7enO2rcjYG8zOc2/4F2d3hhYnGNWQSVTUil3FQcJlsVytFJfCP6mxdgfH3pfee8
	xksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=vPgFj252COGD/sw7KGqsiYl5Xj6hQsnKIAm/JgkrEd4=;
	b=gsH4gt5IGRv8ZD5MpMK5jLupBuNcjClXyzVxeIfvIAWeC9tWeFhXqD7VZS3Nz6fq+d
	NrGsWjXsBLjtYddEXtqOZUc054Ck5E1n8LHQiVM3TFtjf4FNZ8uENJYBCGdmkIjx0aOZ
	23qQNvDNxvkPfcj0roH6YKCbClAtIwZX2W1sbeNTrUdFEMaGCcgSD449LUZZMhnkxd21
	KMlfMnEX4LqsMsOdZZKd9V9BhMdsBvua/NTU47PpDec6zSoXqPPaIeE29ukv82xGlgZs
	RG4XN/rdO0S9hXNP8cGCYP7gSWdZSbf/QlbB+mrmIRNPukhIT34TcvRsEAOh+ZrCL1w9
	Vrqg==
X-Gm-Message-State: AE9vXwNkDXl1H17r1o/m/0McIp17TfYQtogAIqK+SjSom6mQKr0WeoDZE99/S5xqXn6nFw==
X-Received: by 10.66.182.232 with SMTP id eh8mr7485702pac.146.1472057672873;
	Wed, 24 Aug 2016 09:54:32 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:a95a:5453:ca61:abd?
	([2601:646:8882:b8c:a95a:5453:ca61:abd])
	by smtp.gmail.com with ESMTPSA id
	c125sm14964227pfc.40.2016.08.24.09.54.31
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Aug 2016 09:54:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160824122236.26445-1-adrian.ratiu@ni.com>
Date: Wed, 24 Aug 2016 09:54:52 -0700
Message-Id: <066B71BA-5F46-44D5-B23F-8077F6848E2B@gmail.com>
References: <20160824122236.26445-1-adrian.ratiu@ni.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: package carl9170 separately
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
X-List-Received-Date: Wed, 24 Aug 2016 16:54:36 -0000
X-Groupsio-MsgNum: 86247
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9DAC6489-409F-440C-89F1-4A4352C92C56";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9DAC6489-409F-440C-89F1-4A4352C92C56
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 24, 2016, at 5:22 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> =
wrote:
>=20
> carl9170 is an atheros-based firmware, the succesor of ar9170 which is
> deprecated and its driver (ar9170) was removed from the kernel tree.
> carl9170 comes both as a binary blob and also with free sources; the
> sources are deleted in linux-firmware.bb to avoid depeding on =
bash/etc.
>=20
> Package the carl9170 binary firmware separately because it is needed
> by various usb dongles and installing whole linux-firmware is =
overkill.

while you are at it. Can you also scrutinize the license needs for this =
firmware ?
should it require packaging a license file explicitly into rootfs or =
some such

>=20
> Also we should keep ar9170 as is because OOT drivers might still use =
it.
>=20
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
> meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb =
b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index 948dfa8..1657445 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -226,7 +226,7 @@ PACKAGES =3D+ "${PN}-ralink-license ${PN}-ralink \
>              ${PN}-vt6656-license ${PN}-vt6656 \
>              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce =
${PN}-rtl8192su \
>              ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 =
${PN}-bcm4334 ${PN}-bcm43340 ${PN}-bcm4339 ${PN}-bcm4354 \
> -             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k =
${PN}-ath9k \
> +             ${PN}-atheros-license ${PN}-ar9170 ${PN}-carl9170 =
${PN}-ath6k ${PN}-ath9k \
>              ${PN}-ar3k-license  ${PN}-ar3k  ${PN}-ath10k-license  =
${PN}-ath10k  \
>              \
>              ${PN}-iwlwifi-license ${PN}-iwlwifi \
> @@ -255,6 +255,9 @@ FILES_${PN}-atheros-license =3D =
"/lib/firmware/LICENCE.atheros_firmware"
> FILES_${PN}-ar9170 =3D " \
>   /lib/firmware/ar9170*.fw \
> "
> +FILES_${PN}-carl9170 =3D " \
> +  /lib/firmware/carl9170*.fw \
> +"
> FILES_${PN}-ath6k =3D " \
>   /lib/firmware/ath6k \
> "
> @@ -266,6 +269,7 @@ FILES_${PN}-ath9k =3D " \
> "
>=20
> RDEPENDS_${PN}-ar9170 +=3D "${PN}-atheros-license"
> +RDEPENDS_${PN}-carl9170 +=3D "${PN}-atheros-license"
> RDEPENDS_${PN}-ath6k +=3D "${PN}-atheros-license"
> RDEPENDS_${PN}-ath9k +=3D "${PN}-atheros-license"
>=20
> --
> 2.9.3
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_9DAC6489-409F-440C-89F1-4A4352C92C56
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle90WEACgkQuwUzVZGdMxQ1MACgj4ivfDW3o3AJEUY5QjlWmy8F
c6QAnA4KOpv21nX40geGk7UMSLLa8CPF
=x9KG
-----END PGP SIGNATURE-----

--Apple-Mail=_9DAC6489-409F-440C-89F1-4A4352C92C56--
