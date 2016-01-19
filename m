Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 473BC601A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 15:20:35 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id e65so177438731pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 07:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=3TfZAp9V6nhQibCMw76XSojPQdefUJhL4I4QpUA0qVw=;
	b=S0avjceG3bQa2CwdLylu8hjuNeJ9qYXgzkqK5EP6J3rOEQnJgGjnrZ/OubobquV5Zh
	NWdoIgjcnhW8zOEWz/8xywVjWAtEMJY9nOA22RgjiCiSgnxVVaQpJd3eQnNMK8deZn6d
	/cXWzdZipQaiSgB9EEEqPLS5AizBTsb6MUdk1rdU40ZUcv+y9BhkkTxt1bByiGD7uTu6
	LbuLFgdvFLEdMgEcR3+ds9QfwOF++C1iVgOyIVsUVRzNA7fdf/C3aeRl8oLb5CMzgM6P
	JVC3VGPT9YAXCoSr9R7XMI4p1+WQnqfy/PPipfGs4ewoLaXUqttaJ1FDJIXt6KEhoEZH
	FH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=3TfZAp9V6nhQibCMw76XSojPQdefUJhL4I4QpUA0qVw=;
	b=KBI2vU/Ms0muBkv90KE+20fUIvjgK1U6Civft9wXq/L221k7aNV43JQ6a4phlgjgne
	qRrUqVeB6g4TnSc9kLwJ2/ODQGZEUJ4086FHr3ttEERylbvbt/KvYKJAuG/UN3EbGQKp
	E/KBf1bJsnNQDHODWn7Sa32uRzR75AIHJgoPeENQMwFWLv4l+N6g9o64xnhCzzxNDxmH
	9zAETpaYwZ/vn8EeM1m91ZE5igcssdOBdEherVOnyO7iYyY2AXXzXWPup6YERqT670kn
	oqEjWJRpgTEkRnNoCVTphwPmLrnmZ/NMVJM5SznRxYJ6Yww4+G97fGfQ+xubTY9fB3NS
	dXRw==
X-Gm-Message-State: ALoCoQljPlIaKAyzEfEc7kIzVPxL49AnpmLP1XZmHhyPPKnEIlVE621beBQeDKM4o3th392A9Am6Lub/hvjKJJRTBisWBLNs6A==
X-Received: by 10.98.70.208 with SMTP id o77mr45383456pfi.123.1453216836717;
	Tue, 19 Jan 2016 07:20:36 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:2cdb:35b7:1df4:399a?
	([2601:646:8802:5d5c:2cdb:35b7:1df4:399a])
	by smtp.gmail.com with ESMTPSA id
	q27sm42237660pfi.80.2016.01.19.07.20.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 07:20:36 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <67d8d3b06b6daf7bde8a09a63a0a8f778cb46958.1453200108.git.joshua.g.lock@intel.com>
Date: Tue, 19 Jan 2016 07:20:35 -0800
Message-Id: <992A10F8-76BA-4926-AC80-AAC8068CF9FF@gmail.com>
References: <cover.1453200108.git.joshua.g.lock@intel.com>
	<cover.1453200108.git.joshua.g.lock@intel.com>
	<67d8d3b06b6daf7bde8a09a63a0a8f778cb46958.1453200108.git.joshua.g.lock@intel.com>
To: Joshua Lock <joshua.g.lock@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gcc-runtime: switch to removal override syntax to modify CXXFLAGS
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
X-List-Received-Date: Tue, 19 Jan 2016 15:20:36 -0000
X-Groupsio-MsgNum: 76400
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4DA06941-40CB-4A99-9B04-86646ED5D052";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4DA06941-40CB-4A99-9B04-86646ED5D052
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 19, 2016, at 2:44 AM, Joshua Lock <joshua.g.lock@intel.com> =
wrote:
>=20
> The use of immediate expansion can cause issues when trying to
> override variables, further the removal override syntax is clearer
> than oe_filter_out () =E2=80=94 switch to using removal override =
syntax
> instead.

LGTM

>=20
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
> meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc =
b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index c31072a..075afbd 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -1,6 +1,6 @@
> require gcc-configure-common.inc
>=20
> -CXXFLAGS :=3D "${@oe_filter_out('-fvisibility-inlines-hidden', =
'${CXXFLAGS}', d)}"
> +CXXFLAGS_remove =3D "-fvisibility-inlines-hidden"
>=20
> EXTRA_OECONF_PATHS =3D "\
>     --with-gxx-include-dir=3D${includedir}/c++/${BINV} \
> --
> 2.5.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_4DA06941-40CB-4A99-9B04-86646ED5D052
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaeVEMACgkQuwUzVZGdMxQ7BQCdGrJ/E/41ojXRs9MRxr8uvX8C
K+kAmQEnLGlWt8X+zFZqqxm1TkpAh0f/
=Pjpu
-----END PGP SIGNATURE-----

--Apple-Mail=_4DA06941-40CB-4A99-9B04-86646ED5D052--
