Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.183.1587779562320080036
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2020 18:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rd1Hrty3;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id 145so5671771pfw.13
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2020 18:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to;
        bh=pfCxl+Zya8vqKHKSzKwPaYzrzrjj/dfipbwLpJggxq8=;
        b=Rd1Hrty3vlNS2+MChtMtJYCGtmOAyeNbIfYeHiN4UBbFO8Qn5C3ZIvEUekqNVWWrWR
         mPsfidypInH3GJf1XclNhTDzmEpJqjttnWzJiiVDdp3SASCGXBye0eOINCipFG4L6ZK+
         CWnGq418FRd783cCFrhzgDE1YfQ+0UB59FGt0fltHGZKlwDsCiDY21XsHXU9Q07unp84
         JNhF458fMfpmaWMwIxXsqFmSbfPYwTluz8x+c2NuJds0MFU6efQ9FwvkXEHTXJFDTZA3
         qCbnOKwJHy8cGXsmqRN5iXndvsYHqByrgfuyey6RvGazxq7PH+I2wEy0zHn9kgcNbW9X
         al3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=pfCxl+Zya8vqKHKSzKwPaYzrzrjj/dfipbwLpJggxq8=;
        b=N8hnPUonQ7IlJgaeTMtGTWCQqITDrfRpn5ixEXhaViHeFXtbu2ALKkDp67OA8WAjDB
         Rd6ABMT3SXzH/fZgdSKoE3WkqbkWjoUh1PKEbnPCyxVYkeVd0hdr6f2iIaplEmvn71oP
         ACczDgwG6QRuZ/sYzfqp7EzZmnz3B+/PPHx1CTJj8OVwLd2BO36kwGBJVHNFZ9/DtJEW
         wR4J00Xr8QJq5cC87ByiBqhYMmrslEeuktYIOeeXGyTgfVH/s1i/xZREWdXv2pE9GMv1
         NGtNDxqKnqN+AGptLWInj2S0uHqNRIpxqidFWPZ4iCj8d9rMYzaULK/mIZy3Rxx17uIZ
         RSoA==
X-Gm-Message-State: AGi0PuYneF0eGp13JulqJLWeCQp9PbLAO6jbV6hQuDDBfmBsEBS3GSj0
	wqqQ1upW/Zm8j2BI37tXU1w=
X-Google-Smtp-Source: APiQypIgEFwkXaF90w4jNdhnG374ibFoHdEu6SeGkFfwlbSELb8NUqmbpvFFvVRHpzFvYN7efz0zdA==
X-Received: by 2002:aa7:81d1:: with SMTP id c17mr11623250pfn.58.1587779561644;
        Fri, 24 Apr 2020 18:52:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::ac76? ([2601:646:9200:4e0::ac76])
        by smtp.gmail.com with ESMTPSA id q63sm6782480pfb.178.2020.04.24.18.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 18:52:41 -0700 (PDT)
Subject: Re: [oe-core][PATCH 1/1] re2c: advance to version 1.3
To: Joe Slater <joe.slater@windriver.com>,
 openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
References: <20200423194301.24424-1-joe.slater@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Organization: HIMVIS LLC
Message-ID: <5872a356-f219-9a4b-6caa-7c7d3d3b4d3e@gmail.com>
Date: Fri, 24 Apr 2020 18:52:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423194301.24424-1-joe.slater@windriver.com>
X-Groupsio-MsgNum: 137454
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="aBx4FTwCkjpp6AOlD3qmzxDPzNyDiUwSj"

--aBx4FTwCkjpp6AOlD3qmzxDPzNyDiUwSj
Content-Type: multipart/mixed; boundary="RTksGivY685TxvPNOyR4f48F1StOhDT4C";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Joe Slater <joe.slater@windriver.com>,
 openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Message-ID: <5872a356-f219-9a4b-6caa-7c7d3d3b4d3e@gmail.com>
Subject: Re: [oe-core][PATCH 1/1] re2c: advance to version 1.3
References: <20200423194301.24424-1-joe.slater@windriver.com>
In-Reply-To: <20200423194301.24424-1-joe.slater@windriver.com>

--RTksGivY685TxvPNOyR4f48F1StOhDT4C
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 4/23/20 12:43 PM, Joe Slater wrote:
> The locations of release archives has changed.  We change to pulling
> source from the git repo.
>=20
> Fix CVE-2020-11958 which applies to versions 1.2 and 1.3.
>=20
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../recipes-support/re2c/re2c/cve-2020-11958.patch | 48 +++++++++++++++=
+++++++
>  meta/recipes-support/re2c/re2c_1.0.1.bb            | 14 -------
>  meta/recipes-support/re2c/re2c_git.bb              | 23 +++++++++++
>  3 files changed, 71 insertions(+), 14 deletions(-)
>  create mode 100644 meta/recipes-support/re2c/re2c/cve-2020-11958.patch
>  delete mode 100644 meta/recipes-support/re2c/re2c_1.0.1.bb
>  create mode 100644 meta/recipes-support/re2c/re2c_git.bb
>=20
> diff --git a/meta/recipes-support/re2c/re2c/cve-2020-11958.patch b/meta/=
recipes-support/re2c/re2c/cve-2020-11958.patch
> new file mode 100644
> index 0000000..95a1cb9
> --- /dev/null
> +++ b/meta/recipes-support/re2c/re2c/cve-2020-11958.patch
> @@ -0,0 +1,48 @@
> +From c4603ba5ce229db83a2a4fb93e6d4b4e3ec3776a Mon Sep 17 00:00:00 2001
> +From: Ulya Trofimovich <skvadrik@gmail.com>
> +Date: Fri, 17 Apr 2020 22:47:14 +0100
> +Subject: [oe-core][PATCH 1/1] Fix crash in lexer refill (reported by Ag=
ostino
> + Sarubbo).
> +
> +The crash happened in a rare case of a very long lexeme that doen't fit
> +into the buffer, forcing buffer reallocation.
> +
> +The crash was caused by an incorrect calculation of the shift offset
> +(it was smaller than necessary). As a consequence, the data from buffer
> +start and up to the beginning of the current lexeme was not discarded
> +(as it should have been), resulting in less free space for new data tha=
n
> +expected.
> +---
> + src/parse/scanner.cc | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +---
> +
> +CVE: CVE-2020-11958
> +
> +Upstream-Status: Backport [github.com/skvadrik/re2c.git]
> +
> +Signed-off-by: Joe Slater <jslater@windriver.com>
> +
> +diff --git a/src/parse/scanner.cc b/src/parse/scanner.cc
> +index 1d6e9ef..bd65131 100644
> +--- a/src/parse/scanner.cc
> ++++ b/src/parse/scanner.cc
> +@@ -155,13 +155,14 @@ bool Scanner::fill(size_t need)
> +         if (!buf) fatal("out of memory");
> +=20
> +         memmove(buf, tok, copy);
> +-        shift_ptrs_and_fpos(buf - bot);
> ++        shift_ptrs_and_fpos(buf - tok);
> +         delete [] bot;
> +         bot =3D buf;
> +=20
> +         free =3D BSIZE - copy;
> +     }
> +=20
> ++    DASSERT(lim + free <=3D bot + BSIZE);
> +     if (!read(free)) {
> +         eof =3D lim;
> +         memset(lim, 0, YYMAXFILL);
> +--=20
> +2.7.4
> +
> diff --git a/meta/recipes-support/re2c/re2c_1.0.1.bb b/meta/recipes-supp=
ort/re2c/re2c_1.0.1.bb
> deleted file mode 100644
> index 4ed8d25..0000000
> --- a/meta/recipes-support/re2c/re2c_1.0.1.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY =3D "Tool for writing very fast and very flexible scanners"
> -HOMEPAGE =3D "http://re2c.sourceforge.net/"
> -AUTHOR =3D "Marcus B=C3=B6rger <helly@users.sourceforge.net>"
> -SECTION =3D "devel"
> -LICENSE =3D "PD"
> -LIC_FILES_CHKSUM =3D "file://README;beginline=3D146;md5=3D881056c9add17=
f8019ccd8c382ba963a"
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "e2c6cf52fc6a21595f21bc82db5324f8"
> -SRC_URI[sha256sum] =3D "605058d18a00e01bfc32aebf83af35ed5b13180b4e9f279=
c90843afab2c66c7c"
> -
> -BBCLASSEXTEND =3D "native"
> -
> -inherit autotools
> diff --git a/meta/recipes-support/re2c/re2c_git.bb b/meta/recipes-suppor=
t/re2c/re2c_git.bb
> new file mode 100644
> index 0000000..06242ce
> --- /dev/null
> +++ b/meta/recipes-support/re2c/re2c_git.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Tool for writing very fast and very flexible scanners"
> +HOMEPAGE =3D "http://re2c.sourceforge.net/"
> +AUTHOR =3D "Marcus B=C3=B6rger <helly@users.sourceforge.net>"
> +SECTION =3D "devel"
> +LICENSE =3D "PD"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D64eca4d8a3b67f9dc7656094731a=
2c8d"
> +
> +SRC_URI =3D  "git://github.com/skvadrik/re2c.git \
> +            file://cve-2020-11958.patch \
> +           "
> +
> +# rev of 1.3 tag
> +#
> +SRCREV =3D "e1901b71c6414c510f10f4cc30c0a05600e55ed1"
> +PV =3D "1.3+git"

if it is release tag then just set PV =3D "1.3"

> +
> +# override the default S
> +#
> +S =3D "${WORKDIR}/git"
> +
> +BBCLASSEXTEND =3D "native"
> +
> +inherit autotools

Usually inherit should go above BBCLASSEXTEND
>=20
>=20
>=20
>=20


--RTksGivY685TxvPNOyR4f48F1StOhDT4C--

--aBx4FTwCkjpp6AOlD3qmzxDPzNyDiUwSj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXqOX4AAKCRC7BTNVkZ0z
FDbHAJ9t8MVEAZJ5Yy+yPMH9b4xcEXGFtwCfc15gWKeuf8DNNs5VPgmY2ZRA+mo=
=212+
-----END PGP SIGNATURE-----

--aBx4FTwCkjpp6AOlD3qmzxDPzNyDiUwSj--
