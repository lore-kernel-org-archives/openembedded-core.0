Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB52605C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 22:50:44 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m203so328034wma.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 14:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3fADCSGwcCaRG8l++ZFTmLg44rkoIGqj6vIwS85hDhc=;
	b=aWqfeuYDO5ylzgWml2TFPoY+tSTru2dylV20RkjMmHSW5DqnFSI0GJBp5ZQJSjt/e0
	rJ5tk85S9WGPFyy+y3mqdRYi4wjpnDXqkZA3lzQ0UOBoLDtLEDMhIoW7d6CUx2Zs/hjz
	q1q/Mgmr290BL4hgFkuG1Hc2AoNO1fRqXrcYSPXsVvlJqg13ocJ8+w/S337y6GnTLM+J
	jL5ldOZV6l1QquezYdcMuFdmejZxjZa5vwu/BPfUsDlmcH+G6T6QE5MBFQi84qfuzBqK
	cUCutFW8jS3IMuCspWDFzjh2xnk4VIMnHYKEIUqS7jFYvMfHcwMLilzuuI9VNPT8S2rs
	JEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3fADCSGwcCaRG8l++ZFTmLg44rkoIGqj6vIwS85hDhc=;
	b=QNW4VpMIsCZHqJGgA02sc9pt5vtqZCzQ4dL4u1AgP9po4AitqOu6GYILA4iZ+xZiU6
	/5q2NuI9sn4fjXXEi/hC3BooXI03SdqAqr3zZbjQUo6qn2qlGBZiToEUB0SHdztt9I16
	EzWcMIWOj1iQPApBnlulpHe56ovqTBn8/VNgddIweANgFI5XYo/q9Qeb0//S7XfB3EYJ
	jEQnJCIQhpLgX98Xq+q3dP5Eewnua7oRefqA+dm2QE6lpEQCJejhLpPrPb4ey+v/FO5r
	Gc0AOndqD+TeCWAVPKhQxRmkOBamYD1YgopPvMyVnNN6lmA+vhUrFwxliwT+wVj0uKr0
	mifA==
X-Gm-Message-State: AKaTC02mxNdF+GAM5eqkaLv0mExp12qK6XvMrT6xNghV02zxqzgkY391eqGOM9jAkmHwHA==
X-Received: by 10.194.246.69 with SMTP id xu5mr3701218wjc.85.1479423045981;
	Thu, 17 Nov 2016 14:50:45 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	ei2sm5568087wjd.47.2016.11.17.14.50.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 17 Nov 2016 14:50:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Nov 2016 23:50:47 +0100
To: Fabio Berton <fabio.berton@ossystems.com.br>
Message-ID: <20161117225047.GB3240@jama>
References: <1479396394-26134-1-git-send-email-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1479396394-26134-1-git-send-email-fabio.berton@ossystems.com.br>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpcap: Fix build when PACKAGECONFIG ipv6 is not enable
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
X-List-Received-Date: Thu, 17 Nov 2016 22:50:46 -0000
X-Groupsio-MsgNum: 89551
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline

--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2016 at 01:26:34PM -0200, Fabio Berton wrote:
> Add patches to fix error:
> /
> | ERROR: oe_runmake failed
> | config.status: creating pcap-config.tmp
> | mv pcap-config.tmp pcap-config
> | chmod a+x pcap-config
> | ../libpcap-1.8.1/gencode.c: In function 'pcap_compile':
> | ../libpcap-1.8.1/gencode.c:693:8: error: 'compiler_state_t
> | {aka struct _compiler_state}' has no member named 'ai'
> |   cstate.ai =3D NULL;
> |         ^
> | ../libpcap-1.8.1/gencode.c: In function 'gen_gateway':
> | ../libpcap-1.8.1/gencode.c:4914:13: error: 'cstate' undeclared
> | (first use in this function)
> |    bpf_error(cstate, "direction applied to 'gateway'");
> |              ^~~~~~
> | ../libpcap-1.8.1/gencode.c:4914:13: note: each undeclared identifier is
> | reported only once for each function it appears in
> \

Thanks!

>=20
> Patches were submitted to upstream [1]
>=20
> [1] https://github.com/the-tcpdump-group/libpcap/pull/541
>=20
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  ...r_state_t.ai-usage-when-INET6-is-not-defi.patch | 41 +++++++++++++
>  ...02-Add-missing-compiler_state_t-parameter.patch | 67 ++++++++++++++++=
++++++
>  meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb |  2 +
>  3 files changed, 110 insertions(+)
>  create mode 100644 meta/recipes-connectivity/libpcap/libpcap/0001-Fix-co=
mpiler_state_t.ai-usage-when-INET6-is-not-defi.patch
>  create mode 100644 meta/recipes-connectivity/libpcap/libpcap/0002-Add-mi=
ssing-compiler_state_t-parameter.patch
>=20
> diff --git a/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-compiler_=
state_t.ai-usage-when-INET6-is-not-defi.patch b/meta/recipes-connectivity/l=
ibpcap/libpcap/0001-Fix-compiler_state_t.ai-usage-when-INET6-is-not-defi.pa=
tch
> new file mode 100644
> index 0000000..edb6ae5
> --- /dev/null
> +++ b/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-compiler_state_t=
=2Eai-usage-when-INET6-is-not-defi.patch
> @@ -0,0 +1,41 @@
> +From 64aa033a061c43fc15c711f2490ae41d23b868c3 Mon Sep 17 00:00:00 2001
> +From: Fabio Berton <fabio.berton@ossystems.com.br>
> +Date: Thu, 17 Nov 2016 09:44:42 -0200
> +Subject: [PATCH 1/2] Fix compiler_state_t.ai usage when INET6 is not def=
ined
> +Organization: O.S. Systems Software LTDA.
> +
> +Fix error:
> +
> +/
> +| ../libpcap-1.8.1/gencode.c: In function 'pcap_compile':
> +| ../libpcap-1.8.1/gencode.c:693:8: error: 'compiler_state_t
> +| {aka struct _compiler_state}' has no member named 'ai'
> +|   cstate.ai =3D NULL;
> +\
> +
> +Upstream-Status: Submitted [1]
> +
> +[1] https://github.com/the-tcpdump-group/libpcap/pull/541
> +
> +Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> +---
> + gencode.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/gencode.c b/gencode.c
> +index a887f27..e103c70 100644
> +--- a/gencode.c
> ++++ b/gencode.c
> +@@ -690,7 +690,9 @@ pcap_compile(pcap_t *p, struct bpf_program *program,
> + 	}
> + 	initchunks(&cstate);
> + 	cstate.no_optimize =3D 0;
> ++#ifdef INET6
> + 	cstate.ai =3D NULL;
> ++#endif
> + 	cstate.ic.root =3D NULL;
> + 	cstate.ic.cur_mark =3D 0;
> + 	cstate.bpf_pcap =3D p;
> +--=20
> +2.1.4
> +
> diff --git a/meta/recipes-connectivity/libpcap/libpcap/0002-Add-missing-c=
ompiler_state_t-parameter.patch b/meta/recipes-connectivity/libpcap/libpcap=
/0002-Add-missing-compiler_state_t-parameter.patch
> new file mode 100644
> index 0000000..032b265
> --- /dev/null
> +++ b/meta/recipes-connectivity/libpcap/libpcap/0002-Add-missing-compiler=
_state_t-parameter.patch
> @@ -0,0 +1,67 @@
> +From 50ec0a088d5924a8305b2d70dcba71b0942dee1a Mon Sep 17 00:00:00 2001
> +From: Fabio Berton <fabio.berton@ossystems.com.br>
> +Date: Thu, 17 Nov 2016 09:47:29 -0200
> +Subject: [PATCH 2/2] Add missing compiler_state_t parameter
> +Organization: O.S. Systems Software LTDA.
> +
> +Fix error:
> +
> +/
> +|../libpcap-1.8.1/gencode.c: In function 'gen_gateway':
> +|../libpcap-1.8.1/gencode.c:4914:13: error: 'cstate' undeclared
> +| (first use in this function)
> +|    bpf_error(cstate, "direction applied to 'gateway'");
> +\
> +
> +Upstream-Status: Submitted [1]
> +
> +[1] https://github.com/the-tcpdump-group/libpcap/pull/541
> +
> +Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> +---
> + gencode.c | 15 ++++++++-------
> + 1 file changed, 8 insertions(+), 7 deletions(-)
> +
> +diff --git a/gencode.c b/gencode.c
> +index e103c70..f07c0be 100644
> +--- a/gencode.c
> ++++ b/gencode.c
> +@@ -523,7 +523,7 @@ static struct block *gen_host6(compiler_state_t *, s=
truct in6_addr *,
> +     struct in6_addr *, int, int, int);
> + #endif
> + #ifndef INET6
> +-static struct block *gen_gateway(const u_char *, bpf_u_int32 **, int, i=
nt);
> ++static struct block *gen_gateway(compiler_state_t *, const u_char *, bp=
f_u_int32 **, int, int);
> + #endif
> + static struct block *gen_ipfrag(compiler_state_t *);
> + static struct block *gen_portatom(compiler_state_t *, int, bpf_int32);
> +@@ -4904,11 +4904,12 @@ gen_host6(compiler_state_t *cstate, struct in6_a=
ddr *addr,
> +=20
> + #ifndef INET6
> + static struct block *
> +-gen_gateway(eaddr, alist, proto, dir)
> +-	const u_char *eaddr;
> +-	bpf_u_int32 **alist;
> +-	int proto;
> +-	int dir;
> ++gen_gateway(cstate, eaddr, alist, proto, dir)
> ++    compiler_state_t *cstate;
> ++    const u_char *eaddr;
> ++    bpf_u_int32 **alist;
> ++    int proto;
> ++    int dir;
> + {
> + 	struct block *b0, *b1, *tmp;
> +=20
> +@@ -6472,7 +6473,7 @@ gen_scode(compiler_state_t *cstate, const char *na=
me, struct qual q)
> + 		alist =3D pcap_nametoaddr(name);
> + 		if (alist =3D=3D NULL || *alist =3D=3D NULL)
> + 			bpf_error(cstate, "unknown host '%s'", name);
> +-		b =3D gen_gateway(eaddr, alist, proto, dir);
> ++		b =3D gen_gateway(cstate, eaddr, alist, proto, dir);
> + 		free(eaddr);
> + 		return b;
> + #else
> +--=20
> +2.1.4
> +
> diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb b/meta/re=
cipes-connectivity/libpcap/libpcap_1.8.1.bb
> index 9072fe0..e9db28a 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
> +++ b/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
> @@ -2,6 +2,8 @@ require libpcap.inc
> =20
>  SRC_URI +=3D " \
>      file://libpcap-pkgconfig-support.patch \
> +    file://0001-Fix-compiler_state_t.ai-usage-when-INET6-is-not-defi.pat=
ch \
> +    file://0002-Add-missing-compiler_state_t-parameter.patch \
>  "
> =20
>  SRC_URI[md5sum] =3D "3d48f9cd171ff12b0efd9134b52f1447"
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlguNEYACgkQN1Ujt2V2gBxnkwCfeIo5KMjmEHkfrnJ3GtEu/VQN
PQAAmwe/c1vWIyDVVnj9ZaviOOEr4Rm2
=9gXx
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--
