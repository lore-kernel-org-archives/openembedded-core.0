Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id BA59D6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 00:53:55 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id cf3so106173pad.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 17:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=A6wjOCgaFRGEoOKB4p7UZlhXchsiRVEj7gOVDYLFCG4=;
	b=kgR76ZZzONUjdT4Jvay1SQ6HeiSjp9t3usoSUYawxoKpgSzeZc7DAs2WgTsuTFIipZ
	Oc6ed7+5G4GeRUKzchl7SRRvtMCp8IcwMeQoWPV2KOwDUPcIHtHNitIuU7JkLOfTi2HU
	Z/U2CIgxNxfuPrE/X7oE0qt8WOj0vn6RK/rlI5hf0PMeZLXEFwyzi2QXOQek9GU9GRxF
	YIZpF1KwO1YCkA6lc8uwjaJFbtzaCwj+ZK1wzjghjqVTusBUHpPvYz5+u3uoVcit/UAp
	DXIWJM8SfeKu44AUSxvzL47vAgVFAyZrO1KmPI9RkzZi+rCnu962zMGVpCAJBNgjkE3s
	RsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=A6wjOCgaFRGEoOKB4p7UZlhXchsiRVEj7gOVDYLFCG4=;
	b=KxNpLm5+vh5wV1cTuUgOWGBrCH7lOPQIF0GLLSBZmSZx9R9U9/th4zKJE9nPp7NPjt
	J7oNE0m+odLEOTHugW4nVkJQ6RZHJJD4DRyu8gnEWN08puBG4/NsYbrEK2F4xDojZ70Y
	/86xpJAAqT7H6lRx7vXDPE8Pvy51KHG4eaol8LryInPUte0z/Ss58tdvLhVcS0Y3WKhc
	zWJzWI94GM6nAmu0kxqoh3tbbI5H7hMO2Secplkn9LzzxF9KNm99o+VHTqW3xzqHugFD
	rLErIl4e9/Y5X534thdiV3/xfH9AZYMgDVHT5NN0b5I6KujKR44X6QVFPs2r2BcY/WVn
	w+VA==
X-Gm-Message-State: AE9vXwNluws4Q4qC5fafjwxAvUqtnxCwSHVYDNwVbWcICRGEY5qpahEu0r4TPJduvzQvWA==
X-Received: by 10.66.172.237 with SMTP id bf13mr583193pac.42.1472000036147;
	Tue, 23 Aug 2016 17:53:56 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:1187:df8a:ad13:273d?
	([2601:646:8882:b8c:1187:df8a:ad13:273d])
	by smtp.gmail.com with ESMTPSA id
	bw10sm8471231pac.27.2016.08.23.17.53.55
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Aug 2016 17:53:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1471945649-3164-2-git-send-email-mubinusm@xilinx.com>
Date: Tue, 23 Aug 2016 17:54:17 -0700
Message-Id: <9E97CEA9-029A-41B3-9398-3D305FB829A1@gmail.com>
References: <1471945649-3164-1-git-send-email-mubinusm@xilinx.com>
	<1471945649-3164-2-git-send-email-mubinusm@xilinx.com>
To: Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
X-Mailer: Apple Mail (2.3124)
Cc: Mubin Sayyed <mubinusm@xilinx.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe] [master] [PATCH 1/3] benchmarks:Added recipe for whetstone benchmarks
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
X-List-Received-Date: Wed, 24 Aug 2016 00:53:58 -0000
X-Groupsio-MsgNum: 86194
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EDD12149-CB04-4542-901A-746B4FE8A31D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_EDD12149-CB04-4542-901A-746B4FE8A31D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 23, 2016, at 2:47 AM, Mubin Sayyed =
<mubin.usman.sayyed@xilinx.com> wrote:
>=20
> This patch adds recipe for whestone benchmarks.
> Whestone benchmarks measures CPU's floating-point
> arithmetic performance
>=20
> Signed-off-by: Mubin Sayyed <mubinusm@xilinx.com>
> ---
> .../recipes-benchmark/whetstone/whetstone_1.0.bb   | 22 =
++++++++++++++++++++++
> 1 file changed, 22 insertions(+)
> create mode 100644 =
meta-oe/recipes-benchmark/whetstone/whetstone_1.0.bb
>=20
> diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.0.bb =
b/meta-oe/recipes-benchmark/whetstone/whetstone_1.0.bb
> new file mode 100644
> index 0000000..e6f51cb
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.0.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "CPU benchmark to measure floating point performance"
> +HOMEPAGE =3D "https://en.wikipedia.org/wiki/Whetstone_(benchmark)"
> +SECTION =3D "benchmark/tests"
> +
> +LICENSE =3D "GPLv1"
> +LIC_FILES_CHKSUM =
=3D"file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=3De9e36a9de734199567a4d769498=
f743d"
> +
> +SRC_URI =3D "http://www.netlib.org/benchmark/whetstone.c"
> +SRC_URI[md5sum] =3D "d8eb2cd7104bb5a12d614ac6d3f1f9fb"
> +SRC_URI[sha256sum] =3D =
"333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf"
> +
> +S =3D "${WORKDIR}"
> +
> +do_compile () {
> +	${CC} -O3 -Ofast -o whetstone whetstone.c -lm

hardcoding, compiler options may not be the right thing
just leveraging CFLAGS is right thing.

Secondly, also pass LDFLAGS since compile and link are
happening in same step

> +}
> +
> +do_install () {
> +	install -d ${D}${bindir}
> +	install -m 0755 whetstone ${D}${bindir}
> +}
> +
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_EDD12149-CB04-4542-901A-746B4FE8A31D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle88DkACgkQuwUzVZGdMxTqHgCglNg5akg1/r+7LhfZFLskfsfk
DfEAn0DznZ3Jz+BBQ/xT4BPwc7pgqD1q
=fW0X
-----END PGP SIGNATURE-----

--Apple-Mail=_EDD12149-CB04-4542-901A-746B4FE8A31D--
