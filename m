Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 403FB6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 00:56:36 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i6so120138pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 17:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=jha7UtsRZJl1N86eIFwTV4R90GZ+XZTvm2XupvLL8EY=;
	b=rxJERA/lsIccdmAvPmCsG7Xn0AbOLMKKchu4SKtHtqnAhUofS5wOQN20PogcB1UDc6
	4J+PWfXc+JwVDpPxKLXokMY3Hx3L8wO5Qa6P6wQn1vg/jUlVAby9sWBVnNC2mrTbaNMY
	FHCik4ASYmjnxJAW258o4OyQ4T7A1WAdL8Hxpcw0yOZF/Iewi0eZ2G66FcV2RKkFqL+w
	pVu4kByVsTYMuUYQfHNqdu7fxZQ+xQ8BzT0vXFIASfFiJytryy1Dj6XbHLNNosiw85eS
	KO7E3fOaKGTOwstWceKLXeVTXwEGlilOHBkAR7prXq4uPoKt6kxGFw1DesGMv0BLRloe
	3fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=jha7UtsRZJl1N86eIFwTV4R90GZ+XZTvm2XupvLL8EY=;
	b=WWCrP4m72nMOkMxUngyUVxPIxhy/m6YkzNuyU8lvI7bdcGWCT57AE3LJTlX9TE20L5
	N34c++hRsT9X+Mu/ZeGGMa+LXe5u/tQ7b4uLnFasF7Ws2bNILhZyPQD5abppGFfytPAZ
	VE3Bv5+CtycI1yaOePBdSjBzwagaRXCR6BHhPr+MZUKoM5k9ZOxxcxazi1oQ5bAnKqgM
	HLS+TQ4rGZlGGgbHzl2ogq++Uya9NZPP4KSntDFK2/gQdHV/fpS7ctn2AYmJ9zb5qlTe
	ZasekhVV1S+MYqy/f26uzFvpd4S/5ljGXRtVDTuvS59A7GP54IrBM6m1hidNNauxPZ5x
	mOWw==
X-Gm-Message-State: AE9vXwNm7VTYW0JA19WGuDZnthMLM1eOMOhat+CACsv5+k9z8YS7wZwO79LVw8MarN/mZg==
X-Received: by 10.98.54.134 with SMTP id d128mr557588pfa.150.1472000197167;
	Tue, 23 Aug 2016 17:56:37 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:1187:df8a:ad13:273d?
	([2601:646:8882:b8c:1187:df8a:ad13:273d])
	by smtp.gmail.com with ESMTPSA id
	p67sm8486657pfg.22.2016.08.23.17.56.35
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Aug 2016 17:56:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1471943028-8276-3-git-send-email-mubinusm@xilinx.com>
Date: Tue, 23 Aug 2016 17:56:58 -0700
Message-Id: <94CF2103-219D-4209-AF1E-6667B44B0A1B@gmail.com>
References: <1471943028-8276-1-git-send-email-mubinusm@xilinx.com>
	<1471943028-8276-3-git-send-email-mubinusm@xilinx.com>
To: Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
X-Mailer: Apple Mail (2.3124)
Cc: Mubin Sayyed <mubinusm@xilinx.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe] [master] [PATCH 2/3] benchmarks:Added recipe for dhrystone
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
X-List-Received-Date: Wed, 24 Aug 2016 00:56:37 -0000
X-Groupsio-MsgNum: 86195
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4B52F52D-9437-4AF5-967E-611D39DB876F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4B52F52D-9437-4AF5-967E-611D39DB876F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 23, 2016, at 2:03 AM, Mubin Sayyed =
<mubin.usman.sayyed@xilinx.com> wrote:
>=20
> This patch adds recipe for dhrystone benchmarks.
> Dhrystone benchmarks measure CPU performance.
>=20
> Signed-off-by: Mubin Sayyed <mubinusm@xilinx.com>
> ---
> .../recipes-benchmark/dhrystone/dhrystone_2.1.bb   | 22 =
++++++++++++++++++++++
> 1 file changed, 22 insertions(+)
> create mode 100644 =
meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
>=20
> diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb =
b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
> new file mode 100644
> index 0000000..d0026d5
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "CPU Benchmark to measure integer performance"
> +SECTION =3D "benchmark/tests"
> +HOMEPAGE =3D "http://en.wikipedia.org/wiki/Dhrystone"
> +
> +LICENSE =3D "NCSA"
> +LIC_FILES_CHKSUM =3D =
"file://${COMMON_LICENSE_DIR}/NCSA;md5=3D1b5fdec70ee13ad8a91667f16c1959d7"=

> +
> +SRC_URI =3D =
"http://fossies.org/linux/privat/old/dhrystone-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "15e13d1d2329571a60c04b2f05920d24"
> +SRC_URI[sha256sum] =3D =
"8c8da46c34fde271b8f60a96a432164d2918706911199f43514861f07ef6b2f1"
> +
> +EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D'GCC=3D${CC}' 'PROGS=3Dunix' =
'TIME_FUNC=3D -DTIME' \
> +                'HZ=3D60' 'OPTIMIZE=3D -O4' 'GCCOPTIM=3D-O=E2=80=99"

There seems to be no -O4 anything beyond -O3 is same as -O3
however we probably should use the SELECTED_OPTIMIZATIONS

> +S =3D "${WORKDIR}"
> +
> +do_install () {
> +
> +	install -d ${D}${bindir}
> +	install -m 0755 gcc_dry2  ${D}${bindir}
> +	install -m 0755 gcc_dry2reg  ${D}${binder}

may be just use install -Dm gcc_dry2 ${D}${binder}/gcc_dry2
and can combine the install -d into single cmd

> +}
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_4B52F52D-9437-4AF5-967E-611D39DB876F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle88NoACgkQuwUzVZGdMxQsUgCbBks99pf5UebhK9QMfv99EwS0
L50An1LB+xZrLH3pf0Zk6uj06GqmDrzA
=zroo
-----END PGP SIGNATURE-----

--Apple-Mail=_4B52F52D-9437-4AF5-967E-611D39DB876F--
