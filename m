Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id D139A6D44F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 17:01:37 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id t9-v6so2409769ljh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 09:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=gOgkXpFlkP1zXNApf10FM9NKHiBQNKeiTz2rW5MtTnw=;
	b=LOY6J6XPK1jRbZ+Sd8wjzfOA/SyOO23W6O3QN+qoJXOV1sWRbGVn6yCDbxtDKefAPN
	tEzXs8NXflTgr1ewZRYT5l3ok2nsy8zk0VkNZdj+zAhPY0hdXWVJub/f1bzrGrsWNyqX
	xZBb129esr6pVU6rWF9V+8nMvtG+GG2ZungXGBD4mi9ugAjnnfkVOSDvQ91dH8EOugPt
	9RN1Yi8GTPCi3oUXD4v2GtGiaKBT3JX/LE5gFPfzXD2ES3BoqrLog1iPbtNbnc62XBl1
	jrEsSq4K9zwxp2FtzW4lhGXIyoEvziPNWJrTnOHN5eBQ59m1S+DRvZDFSsZzzwsrZPWj
	LVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=gOgkXpFlkP1zXNApf10FM9NKHiBQNKeiTz2rW5MtTnw=;
	b=ko8NkLOw5DHTtdg4wwDMNYQ6GwgYPpcX6pc5wHwRTOtwF9KSrkoocA8BxyXsoaHMVM
	uTUKyPwXRKNzvF+NL8pAPGm6UDwc9P7ZaeuEH0f1keneC3umKHgu6YdJl7dlObLKaQNn
	rgxI5HOsRJhOpbh7fgqJHsAvVdCr8qvBBcVNpINwc/0y0es/IIioxT5QJ7Pc6j6fUQBg
	cZdJDGuFjwdroiQ7ECHNT9dCl1JVcVpHFFj15zn1dDVyyKdcr3wQ7ThOA8jhCwqJn7io
	eLeNUW4JrSHPHGH2az+plrmSwoJmGw3mDrah0syo0fwPLYLwltvlsRA7zw+NXVGB4yb3
	spHA==
X-Gm-Message-State: AA+aEWZQSw9WyjOSs5LyJXIBqlgV2CmxIdFCo9M6TTMi8E3ky6XTDyGW
	QD+C7XkoHDuLGgTcuo6VBrA5IbwA
X-Google-Smtp-Source: AFSGD/W20h4uqZFWZUIg7WbL4g4nbvB3x4UV5AJmlv/aPh9hXri5NzfL3DcTGKBa26EsueV2rfKXGA==
X-Received: by 2002:a2e:9ad0:: with SMTP id
	p16-v6mr292190ljj.102.1544720498142; 
	Thu, 13 Dec 2018 09:01:38 -0800 (PST)
Received: from tuxracer.as41781.net (nat18.vpn1-no7-iev.as41781.net.
	[193.34.155.18]) by smtp.gmail.com with ESMTPSA id
	h12-v6sm378931ljb.80.2018.12.13.09.01.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 09:01:35 -0800 (PST)
To: Andrea Adami <andrea.adami@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20181213141312.14587-1-andrea.adami@gmail.com>
From: Serhey Popovych <serhe.popovych@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=serhe.popovych@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <14eebe58-fcec-c44d-262f-9b557fe780ef@gmail.com>
Date: Thu, 13 Dec 2018 19:01:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Firefox/52.0 SeaMonkey/2.49.1
MIME-Version: 1.0
In-Reply-To: <20181213141312.14587-1-andrea.adami@gmail.com>
Subject: Re: [PATCH] python3: fix build for powerpc-linux.musl and powerpc64-linux-musl
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
X-List-Received-Date: Thu, 13 Dec 2018 17:01:38 -0000
X-Groupsio-MsgNum: 119113
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="gJh240e0YGS0r4pPOKWp3u2ZRKJ5417nM"

--gJh240e0YGS0r4pPOKWp3u2ZRKJ5417nM
Content-Type: multipart/mixed; boundary="gMJwJ5OJX4aXn1ea4zHuvex3vjLwxKlsW";
 protected-headers="v1"
From: Serhey Popovych <serhe.popovych@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <14eebe58-fcec-c44d-262f-9b557fe780ef@gmail.com>
Subject: Re: [OE-core] [PATCH] python3: fix build for powerpc-linux.musl and
 powerpc64-linux-musl
References: <20181213141312.14587-1-andrea.adami@gmail.com>
In-Reply-To: <20181213141312.14587-1-andrea.adami@gmail.com>

--gMJwJ5OJX4aXn1ea4zHuvex3vjLwxKlsW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Andrea Adami wrote:
> Add the missing triplets (not considering uclibc) for do_configure.
>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../python3/powerpc-musl-triplets.patch       | 43 +++++++++++++++++++=

>  meta/recipes-devtools/python/python3_3.5.6.bb |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/powerpc-musl-t=
riplets.patch
>=20
> diff --git a/meta/recipes-devtools/python/python3/powerpc-musl-triplets=
=2Epatch b/meta/recipes-devtools/python/python3/powerpc-musl-triplets.pat=
ch
> new file mode 100644
> index 0000000000..477d049858
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/powerpc-musl-triplets.patch
> @@ -0,0 +1,43 @@
> +Using musl libc the task do_configure fails on powerpc*.
> +
> +  checking build system type... x86_64-pc-linux-gnu
> +  checking host system type... powerpc-oe-linux-musl
> +  checking for python3.5... python3.5
> + ...
> +  checking for the platform triplet based on compiler characteristics.=
=2E.=20
> +  powerpc-linux-gnu
> +  configure: error: internal configure error for the platform triplet
> +
> +Fix this by adding the musl triplets.
> +Note: uclibc is purposedly not considered (unsupported in oe-core).
> +
> +Upstream-Status: Pending
> +Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> +
> +--- a/configure.ac	2018-12-13 14:44:55.414309610 +0100
> ++++ b/configure.ac	2018-12-13 13:22:37.546497547 +0100
> +@@ -831,14 +831,22 @@
> +         or1k-linux-gnu
> + # elif defined(__powerpc__) && defined(__SPE__)
> +         powerpc-linux-gnuspe
> ++# elif defined(__powerpc__) && !defined(__GLIBC__)
> ++        powerpc-linux-musl
> ++# elif defined(__powerpc__)
> ++        powerpc-linux-gnu
> ++# elif defined(__powerpc64__) && !defined(__GLIBC__)
> ++#  if defined(__LITTLE_ENDIAN__)
> ++        powerpc64le-linux-musl
> ++#  else
> ++        powerpc64-linux-musl
> ++#  endif
> + # elif defined(__powerpc64__)
> + #  if defined(__LITTLE_ENDIAN__)
> +         powerpc64le-linux-gnu
> + #  else
> +         powerpc64-linux-gnu
> + #  endif
> +-# elif defined(__powerpc__)
> +-        powerpc-linux-gnu
> + # elif defined(__s390x__)
> +         s390x-linux-gnu
> + # elif defined(__s390__)
> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recip=
es-devtools/python/python3_3.5.6.bb
> index cd7991e7f8..2e8ae711d5 100644
> --- a/meta/recipes-devtools/python/python3_3.5.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
> @@ -44,6 +44,7 @@ SRC_URI +=3D "\
>              file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305=
=2Epatch \
>              file://run-ptest \
>             "
> +SRC_URI_append_libc-musl =3D " file://powerpc-musl-triplets.patch"
> =20
>  inherit multilib_header python3native update-alternatives qemu ptest
> =20
>=20

Have you looked at approach implemented in commit cda0ef61d373
("python3: fix do_configure check platform triplet error")?

Maybe we should add same tweak for musl?


--gMJwJ5OJX4aXn1ea4zHuvex3vjLwxKlsW--

--gJh240e0YGS0r4pPOKWp3u2ZRKJ5417nM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJcEpBtAAoJEBTawMmQ61bBO74H/1IaJoxAiv/Q9nTP68FIH9Sf
Y0K+EOWU59wQTK3wI6uMNTWAs4OAH7aLI+hGBSM37G14Hxo2xw8ZRzCXfWZL5Fv6
Xb5EP79BAW8vwi4e7hpR5CrWql0GXDyn+aYu2EWVv/vh1/1YTRnFnmqIFLqT0igN
4//B1iz7j/iClIE3W81FHgaV40C8uut4V8fMS+POJFIRk2SW5SlYQGrbS5931Cpg
w7/0ao77ycc6EV8rl0i6AhVCLBpvjIo+5HMSSTzxWvlajb6rcJLEg43BmbP70nVi
Jg0d4ayYkNOMcdub+UH5mNmFQjxgxeEk/12r3hDa0bRYf+XrTDPms+N2TSth88A=
=wZsK
-----END PGP SIGNATURE-----

--gJh240e0YGS0r4pPOKWp3u2ZRKJ5417nM--
