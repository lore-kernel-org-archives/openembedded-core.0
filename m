Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 69C5862133
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 23:36:53 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id s8so13607255pfj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 16:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=kIe7YbeHwE139OoDShcLXeaMXt0tcpS3YYfe75+sYqE=;
	b=bgrtq+1lstXCa1YkoXjLwAelxvTus7oCK/nCFi1EF4bHqvQ+VaHGRQVDQzz57gUMjw
	H+NFi3wm551D7BZ/KpFypOdqYmcOmBYxWOJtXMiF3j1gntuOYrG5cdK5uoNt5vyyfZAU
	TqrZn+Te4OWW4wGX/sQTcPBCE+AkLrlRKN2VL2E72UuH8kC1wUfu2b46kanNI/PcfB55
	pnEqjJTRkVBpIOfUkheZ4+JmKqWFKczCXAYdiQDv8OfyNtcUIBU+bF0ja6LvRf+4igul
	NCjGW+dbk6uwVwnfSCc8U+7fAgL4TxFEOf+OGBagMu1ACBnCNoDrjSCEB7yaicEHIFds
	Rh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=kIe7YbeHwE139OoDShcLXeaMXt0tcpS3YYfe75+sYqE=;
	b=ef8O6xs56Yx+0gQncuRkLHcR3ktBdU/+TdqTb3cYYlFBZzQaQI7Z94UJebD70aB018
	IJEFym+XgVd7xhwUfzr6vqTPQLadFwpmNrWFVFS7gZWfvpFU9OHzNEK4ILtxlvR3eYiT
	l1Dy0Npc33OC8NsMwNSSwXHnNpeK8hCUjTLRrKy/n1qpk8J7R8ryRLMt5yNwPik4kao3
	08grGOMBHQt/8OgAql1DxYuQBRERrkm6o/xEPKsW7uE0wrb0EI0Gw7dXB8jg26ksskby
	PaKu1VhN/044AbMl0683sMH0fAqqMR2aAdSmH/blKgzNo6U+C0WGHhw2OV1BxaAtXxRu
	oc2Q==
X-Gm-Message-State: AA6/9RnQorCti9EOeFJcFELjn1muTRBKnfO9kRT4NTXw4fJkovz0BPFlhD0uYstGqdsdeA==
X-Received: by 10.99.116.91 with SMTP id e27mr51399pgn.154.1476747414777;
	Mon, 17 Oct 2016 16:36:54 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:ec00:906:f8cb:31c1?
	([2601:646:8882:b8c:ec00:906:f8cb:31c1])
	by smtp.gmail.com with ESMTPSA id
	bu9sm13693280pab.25.2016.10.17.16.36.53
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Oct 2016 16:36:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1476198850-1529-1-git-send-email-samuli.piippo@qt.io>
Date: Mon, 17 Oct 2016 16:36:53 -0700
Message-Id: <64ADE2BA-C5CE-47C5-975F-05C11DE145D2@gmail.com>
References: <1476198850-1529-1-git-send-email-samuli.piippo@qt.io>
To: Samuli Piippo <samuli.piippo@qt.io>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] systemd-serialgetty: add dependency to agetty
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
X-List-Received-Date: Mon, 17 Oct 2016 23:36:55 -0000
X-Groupsio-MsgNum: 88292
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2D392D78-868E-4847-BD2E-B4724213DFC6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2D392D78-868E-4847-BD2E-B4724213DFC6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 11, 2016, at 8:14 AM, Samuli Piippo <samuli.piippo@qt.io> =
wrote:
>=20
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
> meta/recipes-core/systemd/systemd-serialgetty.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb =
b/meta/recipes-core/systemd/systemd-serialgetty.bb
> index 768b130..c4e5310 100644
> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> @@ -38,7 +38,7 @@ do_install() {
> 	fi
> }
>=20
> -RDEPENDS_${PN} =3D "systemd"
> +RDEPENDS_${PN} =3D "systemd util-linux-agetty=E2=80=9D

Does it need agetty specifically ? since there are other providers of =
getty as well.
I wonder if its possible to use those too

>=20
> # This is a machine specific file
> FILES_${PN} =3D "${systemd_unitdir}/system/*.service ${sysconfdir}"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_2D392D78-868E-4847-BD2E-B4724213DFC6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgFYJUACgkQuwUzVZGdMxQEKgCfR/9cKK5bN95t+yen+qZom9VU
rlMAoIH6D8Ld5xOxy6LjhGB03OgOJcaE
=RnXJ
-----END PGP SIGNATURE-----

--Apple-Mail=_2D392D78-868E-4847-BD2E-B4724213DFC6--
