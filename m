Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 65E8260034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 16:26:08 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so89534993pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 09:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=6uTmUftH22oabuHzwOS1uErz1a1ZKc6SqXDK+V/6h/4=;
	b=wzicnKjuc81dpk6/Z0VfNY7QT5ZVvc//Qo0pFRaOME+fLD3BxWAZRBJf03OUvzVyQH
	2H3koAfNA4Ix1p3ic6K3ia2kp2aOxZSwdRWDE7xwFsIpFrrr/nIoTzFqeEOcwlLr1GZX
	iRxKwi17mYUSpoXAQIH3fueiZscUcwGX1iPII/dmrNfEqxTrVjJGIc8WGYZNwLhiDXXg
	0YnqD98AMaRYB1fhnoqZgIoJKF/rQLem36qiJ0Nc5j2p0xRBDO02MfmT3PPniIG4CyML
	R0DHoG0YS6BsLN+wgS7/Iv8ib91IXwqcyNLJpH+b2eYGm1F5/Y6mpMwtnsIEH07uWOzx
	KhUw==
X-Received: by 10.70.33.67 with SMTP id p3mr7774385pdi.126.1431102310735;
	Fri, 08 May 2015 09:25:10 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id j14sm5653336pbq.29.2015.05.08.09.25.08
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 May 2015 09:25:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1431095308-17934-2-git-send-email-haris.okanovic@ni.com>
Date: Fri, 8 May 2015 09:25:08 -0700
Message-Id: <EE730FC6-F633-48B4-946D-3A8B47E566A0@gmail.com>
References: <1431095308-17934-1-git-send-email-haris.okanovic@ni.com>
	<1431095308-17934-2-git-send-email-haris.okanovic@ni.com>
To: Haris Okanovic <haris.okanovic@ni.com>
X-Mailer: Apple Mail (2.2098)
Cc: Ken Sharp <ken.sharp@ni.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] glibc: CVE-2015-1781: resolv/nss_dns/dns-host.c buffer overflow
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
X-List-Received-Date: Fri, 08 May 2015 16:26:09 -0000
X-Groupsio-MsgNum: 65304
Content-Type: multipart/signed;
	boundary="Apple-Mail=_ED10D92E-F1B9-4543-800A-992C06342347";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_ED10D92E-F1B9-4543-800A-992C06342347
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

this is ok

> On May 8, 2015, at 7:28 AM, Haris Okanovic <haris.okanovic@ni.com> =
wrote:
>=20
> Backport Arjun Shankar's patch for CVE-2015-1781:
>=20
> A buffer overflow flaw was found in the way glibc's gethostbyname_r() =
and
> other related functions computed the size of a buffer when passed a
> misaligned buffer as input. An attacker able to make an application =
call
> any of these functions with a misaligned buffer could use this flaw to
> crash the application or, potentially, execute arbitrary code with the
> permissions of the user running the application.
>=20
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D18287
>=20
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> Signed-off-by: Ken Sharp <ken.sharp@ni.com>
> Reviewed-by: Rich Tollerton <rich.tollerton@ni.com>
> ---
> Natinst-CAR-ID: 525428
> Natinst-ReviewBoard-ID: 96712
> ---
> ...81-resolv-nss_dns-dns-host.c-buffer-overf.patch | 43 =
++++++++++++++++++++++
> meta/recipes-core/glibc/glibc_2.20.bb              |  1 +
> 2 files changed, 44 insertions(+)
> create mode 100644 =
meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-buff=
er-overf.patch
>=20
> diff --git =
a/meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-bu=
ffer-overf.patch =
b/meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-bu=
ffer-overf.patch
> new file mode 100644
> index 0000000..c02fa12
> --- /dev/null
> +++ =
b/meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-bu=
ffer-overf.patch
> @@ -0,0 +1,43 @@
> +=46rom 2959eda9272a033863c271aff62095abd01bd4e3 Mon Sep 17 00:00:00 =
2001
> +From: Arjun Shankar <arjun.is@lostca.se>
> +Date: Tue, 21 Apr 2015 14:06:31 +0200
> +Subject: [PATCH] CVE-2015-1781: resolv/nss_dns/dns-host.c buffer =
overflow
> + [BZ#18287]
> +
> +Upstream-Status: Backport
> +https://sourceware.org/bugzilla/show_bug.cgi?id=3D18287
> +---
> + resolv/nss_dns/dns-host.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
> +index =
b16b0ddf110907a0086b86612e544d3dc75182b8..d8c55791591750567f00e616e5d7b378=
dec934a0 100644
> +--- a/resolv/nss_dns/dns-host.c
> ++++ b/resolv/nss_dns/dns-host.c
> +@@ -608,21 +608,22 @@ getanswer_r (const querybuf *answer, int =
anslen, const char *qname, int qtype,
> +   int n, ancount, qdcount;
> +   int haveanswer, had_error;
> +   char *bp, **ap, **hap;
> +   char tbuf[MAXDNAME];
> +   const char *tname;
> +   int (*name_ok) (const char *);
> +   u_char packtmp[NS_MAXCDNAME];
> +   int have_to_map =3D 0;
> +   uintptr_t pad =3D -(uintptr_t) buffer % __alignof__ (struct =
host_data);
> +   buffer +=3D pad;
> +-  if (__glibc_unlikely (buflen < sizeof (struct host_data) + pad))
> ++  buflen =3D buflen > pad ? buflen - pad : 0;
> ++  if (__glibc_unlikely (buflen < sizeof (struct host_data)))
> +     {
> +       /* The buffer is too small.  */
> +     too_small:
> +       *errnop =3D ERANGE;
> +       *h_errnop =3D NETDB_INTERNAL;
> +       return NSS_STATUS_TRYAGAIN;
> +     }
> +   host_data =3D (struct host_data *) buffer;
> +   linebuflen =3D buflen - sizeof (struct host_data);
> +   if (buflen - sizeof (struct host_data) !=3D linebuflen)
> +--
> +2.2.2
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.20.bb =
b/meta/recipes-core/glibc/glibc_2.20.bb
> index e3427dd..ba62fc3 100644
> --- a/meta/recipes-core/glibc/glibc_2.20.bb
> +++ b/meta/recipes-core/glibc/glibc_2.20.bb
> @@ -47,6 +47,7 @@ CVEPATCHES =3D "\
>         file://CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch =
\
>         file://CVE-2014-9402_endless-loop-in-getaddr_r.patch \
>         file://CVE-2015-1472-wscanf-allocates-too-little-memory.patch =
\
> +        =
file://CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch \
>     "
> LIC_FILES_CHKSUM =3D =
"file://LICENSES;md5=3De9a558e243b36d3209f380deb394b213 \
>       file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> --
> 2.2.2
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_ED10D92E-F1B9-4543-800A-992C06342347
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVM42QACgkQuwUzVZGdMxQAsQCfV03Rahts/KFwewUhevzzop9C
VBgAni5vmtJJzprZhSS6rDSp0BrZ/4k+
=i4+N
-----END PGP SIGNATURE-----

--Apple-Mail=_ED10D92E-F1B9-4543-800A-992C06342347--
