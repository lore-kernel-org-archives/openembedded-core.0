Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B87B071A69
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 21:42:43 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i88so5871061pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 14:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=J0COhXGjKpyg79rlhXAXw3R6FhvVrGZTpyEn2A6iU4E=;
	b=eghmX74GWdUFxDOO1w9WaDe3FpA/4IDLKOHOAFkiMKhJxnCseaLBSVVUJ9OyC2Lpk6
	YtPSaQVsPiBVsFo+oq2RqnpZnEH2xaW5NmUEBWCargf3gE+CGOQhRHT1D48ascUD1DUA
	UuxmKhHUwUTsla1BkQLL1mxQ2Fu8o1euiuqgagfDcrt95RHAMSfcQEPwHT/4TBEF9oZB
	83vIXRHXbH2WTEDZOz6C4MWAB5eQ4KDxbAooFfUGYj8UNNGngk9wdR5emwOydp1V2TcI
	t4W54+A5sXHVXbygpsTMo4wba7iaKsFzw2MjrbTvNlgPtDhr038Akq0A2ZXhPX6bLOYU
	Qm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=J0COhXGjKpyg79rlhXAXw3R6FhvVrGZTpyEn2A6iU4E=;
	b=Ogw39V0IXAJSZdgu1BPOessrluOwsNQj9ObEwSON87jDU9s8JMGO9k4u///vmxHsHK
	NuWCb69HnOimdzB3tvm0V1NdnYaR4u2vkZsm0dqhRWVjyREkR+Uw9rsPmPieQ60ELykE
	l7Y6myx95dBKRfO2kduK+7t/CiGlMGmDD5ILQ896pwR8Asn8A5/J5ZM0W3PUtJOrpzLl
	G2C1a5zx9AppR4zOsniahOLDN5LjsfvQZ8oQINyycCuWPkj49aiT33VdvnU8GqXONs4p
	PHK8hacUZOT7pyg8/cq4in32wAyq+kWqFwV1/1mtIw1RTDGyjsq9aYn1vBWKNYG956T0
	k87A==
X-Gm-Message-State: ABUngvfL86Yn/DgYgeYtsIG8q6DVgrHG657AftVx3vg7H+K6sHqplPZvvY8R8fJpQ+rfHQ==
X-Received: by 10.98.57.144 with SMTP id u16mr20297462pfj.142.1478209364845;
	Thu, 03 Nov 2016 14:42:44 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:d87c:cd06:754:6afe?
	([2601:646:8882:b8c:d87c:cd06:754:6afe])
	by smtp.gmail.com with ESMTPSA id
	rx1sm14909856pab.32.2016.11.03.14.42.44
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 14:42:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1477910801-9169-1-git-send-email-ed.bartosh@linux.intel.com>
Date: Thu, 3 Nov 2016 14:42:39 -0700
Message-Id: <CD1ACFFA-619F-4C36-99AC-76D6A6068E74@gmail.com>
References: <1477910801-9169-1-git-send-email-ed.bartosh@linux.intel.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mkefidisk.sh: add deprecation warning to the output
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
X-List-Received-Date: Thu, 03 Nov 2016 21:42:43 -0000
X-Groupsio-MsgNum: 88998
Content-Type: multipart/signed;
	boundary="Apple-Mail=_099D2279-FE52-42E3-A268-A281BC6A2667";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_099D2279-FE52-42E3-A268-A281BC6A2667
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 31, 2016, at 3:46 AM, Ed Bartosh <ed.bartosh@linux.intel.com> =
wrote:
>=20
> mkefidisk.sh will soon be deprecated in favor of .wic images.
>=20
> Added deprecation warning to the script to inform users that
> this script will soon be removed from the codebase.
>=20
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
> scripts/contrib/mkefidisk.sh | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/scripts/contrib/mkefidisk.sh =
b/scripts/contrib/mkefidisk.sh
> index d8db3c0..a175895 100755
> --- a/scripts/contrib/mkefidisk.sh
> +++ b/scripts/contrib/mkefidisk.sh
> @@ -20,6 +20,11 @@
>=20
> LANG=3DC
>=20
> +echo
> +echo "WARNING: This script is deprecated and will be removed soon."
> +echo "Please consider using wic EFI images instead."
> +echo
> +

is .wic image dd=E2=80=99able directly ?
We should also document, the wic steps in wiki pages e.g. =
http://wiki.minnowboard.org/Yocto_Project



> # Set to 1 to enable additional output
> DEBUG=3D0
> OUT=3D"/dev/null"
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_099D2279-FE52-42E3-A268-A281BC6A2667
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgbr1MACgkQuwUzVZGdMxTRQACghJp7hogIycuWoUJzEwh1v2TI
RugAni5iF1SR+dgkZqbQiCkOO9RbViu2
=NrkC
-----END PGP SIGNATURE-----

--Apple-Mail=_099D2279-FE52-42E3-A268-A281BC6A2667--
