Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 27DB47F33C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 00:05:44 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id u72so10545316pgb.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 17:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=3ziQwz9T+U/F4TDdeSDtAFsjPPBnX/dqrqhzfSGqy7w=;
	b=Cr7m2/+Hq9guL135IY8SvkUEBoy4mvvxgbPXdmvLE9yrSwmS9APixndXoLFtgbbHnN
	1Gri+D7D8w5jSUIBf+3ozWT92ZLFL0K6jII+LZs3/TtEweBDeJ1otCcRBMInPkcF/bUn
	IR3PadG6vmfz07p5SrbNBCVViq3LveA2HftIH5+B+CPpHPMONc9b6rp0YaQwgDh52cpz
	S8lxi92Vj1CtETKORFgVLkwWNCyKwjVFaNkU0Zr664UPm9EZr2kEYKLkyOO4WD61612W
	puNpCIKxBQBS9bnNxAh8ZfYj0iKBnIlF8Vu6GzQxHgwFmKEwOm4JxcCcce/5/gEKA8/J
	HXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=3ziQwz9T+U/F4TDdeSDtAFsjPPBnX/dqrqhzfSGqy7w=;
	b=nrqF6x1ZDNQ6xw7qs4o4xQo5KHrSWUW6bt7C6Zul7cTS8pAxUCcoLw0P64F0tmX5p6
	WQwVLM4AX4ICWpd77FqSgsWowFgJRGrDN56orAnrvo7F4aAPqqxoGkcGAN4sRbrxb6Gy
	YfovB8cZNfmVfu717rKlAy16iMM7Tu/xg2ZTpErxXqdi+cbTFNH1jlBdm4HnYK/Ulp1N
	/bKKGKrqtNXpZpKP98NaM6L+UgY5vVrD48kTuLahgCMQtQA4m8wVC4bu0DFf5leQqPv8
	FDyu7fMukR/aIzrVaA8lYRy9WxBixtSAdUdnnubMHpLRAMsGbDCzu8ek3GvL9SBWaekv
	qyqQ==
X-Gm-Message-State: APjAAAXWnFYrCRiJFgUu9GLAOa81uypxRxrx9V4f6tExfQ4G3g88732o
	9su9aOC2YBNEzCoaA0zWXdirLD5felQ=
X-Google-Smtp-Source: APXvYqwCR2Ll8zkFuRDuLmgjPzhw7zUhPPve+B+k8cQMfmKBi7IL2OtPMEeCOqiKKmPfeRN0iVJXZQ==
X-Received: by 2002:a17:90a:ba96:: with SMTP id
	t22mr2383417pjr.104.1568160345560; 
	Tue, 10 Sep 2019 17:05:45 -0700 (PDT)
Received: from [10.20.245.11] ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id 30sm829029pjk.25.2019.09.10.17.05.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Sep 2019 17:05:44 -0700 (PDT)
To: msft.dantran@gmail.com, openembedded-core@lists.openembedded.org
References: <1568159145-3827-1-git-send-email-dantran@microsoft.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	mQINBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABtCFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT6JAj0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxC5Ag0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAGJAiUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <c482aa43-b339-e675-bd70-8e3ec5a5347c@gmail.com>
Date: Tue, 10 Sep 2019 17:05:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568159145-3827-1-git-send-email-dantran@microsoft.com>
Subject: Re: [thud][PATCH] python3: Fix CVEs
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
X-List-Received-Date: Wed, 11 Sep 2019 00:05:45 -0000
Content-Type: multipart/alternative;
	boundary="------------E93AB25E463777C1E3AA7544"
Content-Language: en-US

--------------E93AB25E463777C1E3AA7544
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dan,


On 9/10/19 4:45 PM, msft.dantran@gmail.com wrote:
> From: Dan Tran <dantran@microsoft.com>
>
> Fixes CVE-2018-14647, CVE-2018-20406, CVE-2018-20852, CVE-2019-9636,
> CVE-2019-9740, and CVE-2019-9747.
> ---
>  .../python/python3/CVE-2018-14647.patch            |  95 +++++++++
>  .../python/python3/CVE-2018-20406.patch            | 217 +++++++++++++=
++++++++
>  .../python/python3/CVE-2018-20852.patch            | 129 ++++++++++++
>  .../python/python3/CVE-2019-9636.patch             | 154 +++++++++++++=
++
>  .../python/python3/CVE-2019-9740.patch             | 160 +++++++++++++=
++
9740 is already in the queue.
https://git.openembedded.org/openembedded-core-contrib/commit/meta/recipe=
s-devtools/python?h=3Dstable/thud-nmut&id=3Dad90312adabbad951f62e3bd4ad95=
fcc763ad0c4

Can you drop it or rebase off of stable/thud-nmut
<https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/t=
hud-nmut>
in https://git.openembedded.org/openembedded-core-contrib

Thanks,
Armin

>  meta/recipes-devtools/python/python3_3.5.6.bb      |   5 +
>  6 files changed, 760 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2018-14647=
=2Epatch
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2018-20406=
=2Epatch
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2018-20852=
=2Epatch
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9636.=
patch
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9740.=
patch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2018-14647.patch =
b/meta/recipes-devtools/python/python3/CVE-2018-14647.patch
> new file mode 100644
> index 0000000..c1f21f8
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2018-14647.patch
> @@ -0,0 +1,95 @@
> +From 610b4b0dbaedd3099ab76acf678e9cc845d99a76 Mon Sep 17 00:00:00 2001=

> +From: stratakis <cstratak@redhat.com>
> +Date: Mon, 25 Feb 2019 22:04:09 +0100
> +Subject: [PATCH] [3.5] bpo-34623: Use XML_SetHashSalt in _elementtree =
(#9933)
> +
> +* bpo-34623: Use XML_SetHashSalt in _elementtree (GH-9146)
> +
> +The C accelerated _elementtree module now initializes hash randomizati=
on
> +salt from _Py_HashSecret instead of libexpat's default CPRNG.
> +
> +Signed-off-by: Christian Heimes <christian@python.org>
> +
> +https://bugs.python.org/issue34623
> +(cherry picked from commit cb5778f00ce48631c7140f33ba242496aaf7102b)
> +
> +Co-authored-by: Christian Heimes <christian@python.org>
> +
> +CVE: CVE-2018-14647
> +Upstream-Status: Backport
> +[https://github.com/python/cpython/commit/41b48e71ac8a71f56694b548f118=
bd20ce203410]
> +
> +Signed-off-by: Dan Tran <dantran@microsoft.com>
> +---
> + Include/pyexpat.h                                            | 4 +++-=

> + .../next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst   | 2 ++
> + Modules/_elementtree.c                                       | 5 ++++=
+
> + Modules/pyexpat.c                                            | 5 ++++=
+
> + 4 files changed, 15 insertions(+), 1 deletion(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-=
34623.Ua9jMv.rst
> +
> +diff --git a/Include/pyexpat.h b/Include/pyexpat.h
> +index 44259bf6d7..07020b5dc9 100644
> +--- a/Include/pyexpat.h
> ++++ b/Include/pyexpat.h
> +@@ -3,7 +3,7 @@
> +=20
> + /* note: you must import expat.h before importing this module! */
> +=20
> +-#define PyExpat_CAPI_MAGIC  "pyexpat.expat_CAPI 1.0"
> ++#define PyExpat_CAPI_MAGIC  "pyexpat.expat_CAPI 1.1"
> + #define PyExpat_CAPSULE_NAME "pyexpat.expat_CAPI"
> +=20
> + struct PyExpat_CAPI
> +@@ -48,6 +48,8 @@ struct PyExpat_CAPI
> +     enum XML_Status (*SetEncoding)(XML_Parser parser, const XML_Char =
*encoding);
> +     int (*DefaultUnknownEncodingHandler)(
> +         void *encodingHandlerData, const XML_Char *name, XML_Encoding=
 *info);
> ++    /* might be none for expat < 2.1.0 */
> ++    int (*SetHashSalt)(XML_Parser parser, unsigned long hash_salt);
> +     /* always add new stuff to the end! */
> + };
> +=20
> +diff --git a/Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.U=
a9jMv.rst b/Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jM=
v.rst
> +new file mode 100644
> +index 0000000000..cbaa4b7506
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.r=
st
> +@@ -0,0 +1,2 @@
> ++CVE-2018-14647: The C accelerated _elementtree module now initializes=
 hash
> ++randomization salt from _Py_HashSecret instead of libexpat's default =
CSPRNG.
> +diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
> +index 5dba9f70a9..90c6daf64a 100644
> +--- a/Modules/_elementtree.c
> ++++ b/Modules/_elementtree.c
> +@@ -3282,6 +3282,11 @@ _elementtree_XMLParser___init___impl(XMLParserO=
bject *self, PyObject *html,
> +         PyErr_NoMemory();
> +         return -1;
> +     }
> ++    /* expat < 2.1.0 has no XML_SetHashSalt() */
> ++    if (EXPAT(SetHashSalt) !=3D NULL) {
> ++        EXPAT(SetHashSalt)(self->parser,
> ++                           (unsigned long)_Py_HashSecret.expat.hashsa=
lt);
> ++    }
> +=20
> +     if (target) {
> +         Py_INCREF(target);
> +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
> +index adc9b6cde8..948ab1b703 100644
> +--- a/Modules/pyexpat.c
> ++++ b/Modules/pyexpat.c
> +@@ -1882,6 +1882,11 @@ MODULE_INITFUNC(void)
> +     capi.SetStartDoctypeDeclHandler =3D XML_SetStartDoctypeDeclHandle=
r;
> +     capi.SetEncoding =3D XML_SetEncoding;
> +     capi.DefaultUnknownEncodingHandler =3D PyUnknownEncodingHandler;
> ++#if XML_COMBINED_VERSION >=3D 20100
> ++    capi.SetHashSalt =3D XML_SetHashSalt;
> ++#else
> ++    capi.SetHashSalt =3D NULL;
> ++#endif
> +=20
> +     /* export using capsule */
> +     capi_object =3D PyCapsule_New(&capi, PyExpat_CAPSULE_NAME, NULL);=

> +--=20
> +2.22.0.vfs.1.1.57.gbaf16c8
> +
> diff --git a/meta/recipes-devtools/python/python3/CVE-2018-20406.patch =
b/meta/recipes-devtools/python/python3/CVE-2018-20406.patch
> new file mode 100644
> index 0000000..b69e0c4
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2018-20406.patch
> @@ -0,0 +1,217 @@
> +From 3c7fd2b2729e3ebcf7877e7a32b3bbabf907a38d Mon Sep 17 00:00:00 2001=

> +From: Victor Stinner <vstinner@redhat.com>
> +Date: Tue, 26 Feb 2019 01:42:39 +0100
> +Subject: [PATCH] closes bpo-34656: Avoid relying on signed overflow in=
 _pickle
> + memos. (GH-9261) (#11869)
> +
> +(cherry picked from commit a4ae828ee416a66d8c7bf5ee71d653c2cc6a26dd)
> +
> +CVE: CVE-2018-20406
> +Upstream-Status: Backport
> +[https://github.com/python/cpython/commit/ef33dd6036aafbd3f06c1d56e2b1=
a81dae3da63c]
> +
> +Signed-off-by: Dan Tran <dantran@microsoft.com>
> +---
> + Modules/_pickle.c | 63 ++++++++++++++++++++++++----------------------=
-
> + 1 file changed, 32 insertions(+), 31 deletions(-)
> +
> +diff --git a/Modules/_pickle.c b/Modules/_pickle.c
> +index 0f62b1c019..fcb9e87899 100644
> +--- a/Modules/_pickle.c
> ++++ b/Modules/_pickle.c
> +@@ -527,9 +527,9 @@ typedef struct {
> + } PyMemoEntry;
> +=20
> + typedef struct {
> +-    Py_ssize_t mt_mask;
> +-    Py_ssize_t mt_used;
> +-    Py_ssize_t mt_allocated;
> ++    size_t mt_mask;
> ++    size_t mt_used;
> ++    size_t mt_allocated;
> +     PyMemoEntry *mt_table;
> + } PyMemoTable;
> +=20
> +@@ -573,8 +573,8 @@ typedef struct UnpicklerObject {
> +     /* The unpickler memo is just an array of PyObject *s. Using a di=
ct
> +        is unnecessary, since the keys are contiguous ints. */
> +     PyObject **memo;
> +-    Py_ssize_t memo_size;       /* Capacity of the memo array */
> +-    Py_ssize_t memo_len;        /* Number of objects in the memo */
> ++    size_t memo_size;       /* Capacity of the memo array */
> ++    size_t memo_len;        /* Number of objects in the memo */
> +=20
> +     PyObject *pers_func;        /* persistent_load() method, can be N=
ULL. */
> +=20
> +@@ -658,7 +658,6 @@ PyMemoTable_New(void)
> + static PyMemoTable *
> + PyMemoTable_Copy(PyMemoTable *self)
> + {
> +-    Py_ssize_t i;
> +     PyMemoTable *new =3D PyMemoTable_New();
> +     if (new =3D=3D NULL)
> +         return NULL;
> +@@ -675,7 +674,7 @@ PyMemoTable_Copy(PyMemoTable *self)
> +         PyErr_NoMemory();
> +         return NULL;
> +     }
> +-    for (i =3D 0; i < self->mt_allocated; i++) {
> ++    for (size_t i =3D 0; i < self->mt_allocated; i++) {
> +         Py_XINCREF(self->mt_table[i].me_key);
> +     }
> +     memcpy(new->mt_table, self->mt_table,
> +@@ -721,7 +720,7 @@ _PyMemoTable_Lookup(PyMemoTable *self, PyObject *k=
ey)
> + {
> +     size_t i;
> +     size_t perturb;
> +-    size_t mask =3D (size_t)self->mt_mask;
> ++    size_t mask =3D self->mt_mask;
> +     PyMemoEntry *table =3D self->mt_table;
> +     PyMemoEntry *entry;
> +     Py_hash_t hash =3D (Py_hash_t)key >> 3;
> +@@ -743,22 +742,24 @@ _PyMemoTable_Lookup(PyMemoTable *self, PyObject =
*key)
> +=20
> + /* Returns -1 on failure, 0 on success. */
> + static int
> +-_PyMemoTable_ResizeTable(PyMemoTable *self, Py_ssize_t min_size)
> ++_PyMemoTable_ResizeTable(PyMemoTable *self, size_t min_size)
> + {
> +     PyMemoEntry *oldtable =3D NULL;
> +     PyMemoEntry *oldentry, *newentry;
> +-    Py_ssize_t new_size =3D MT_MINSIZE;
> +-    Py_ssize_t to_process;
> ++    size_t new_size =3D MT_MINSIZE;
> ++    size_t to_process;
> +=20
> +     assert(min_size > 0);
> +=20
> +-    /* Find the smallest valid table size >=3D min_size. */
> +-    while (new_size < min_size && new_size > 0)
> +-        new_size <<=3D 1;
> +-    if (new_size <=3D 0) {
> ++    if (min_size > PY_SSIZE_T_MAX) {
> +         PyErr_NoMemory();
> +         return -1;
> +     }
> ++
> ++    /* Find the smallest valid table size >=3D min_size. */
> ++    while (new_size < min_size) {
> ++        new_size <<=3D 1;
> ++    }
> +     /* new_size needs to be a power of two. */
> +     assert((new_size & (new_size - 1)) =3D=3D 0);
> +=20
> +@@ -808,6 +809,7 @@ static int
> + PyMemoTable_Set(PyMemoTable *self, PyObject *key, Py_ssize_t value)
> + {
> +     PyMemoEntry *entry;
> ++    size_t desired_size;
> +=20
> +     assert(key !=3D NULL);
> +=20
> +@@ -831,10 +833,12 @@ PyMemoTable_Set(PyMemoTable *self, PyObject *key=
, Py_ssize_t value)
> +      * Very large memo tables (over 50K items) use doubling instead.
> +      * This may help applications with severe memory constraints.
> +      */
> +-    if (!(self->mt_used * 3 >=3D (self->mt_mask + 1) * 2))
> ++    if (SIZE_MAX / 3 >=3D self->mt_used && self->mt_used * 3 < self->=
mt_allocated * 2) {
> +         return 0;
> +-    return _PyMemoTable_ResizeTable(self,
> +-        (self->mt_used > 50000 ? 2 : 4) * self->mt_used);
> ++    }
> ++    // self->mt_used is always < PY_SSIZE_T_MAX, so this can't overfl=
ow.
> ++    desired_size =3D (self->mt_used > 50000 ? 2 : 4) * self->mt_used;=

> ++    return _PyMemoTable_ResizeTable(self, desired_size);
> + }
> +=20
> + #undef MT_MINSIZE
> +@@ -1273,9 +1277,9 @@ _Unpickler_Readline(UnpicklerObject *self, char =
**result)
> + /* Returns -1 (with an exception set) on failure, 0 on success. The m=
emo array
> +    will be modified in place. */
> + static int
> +-_Unpickler_ResizeMemoList(UnpicklerObject *self, Py_ssize_t new_size)=

> ++_Unpickler_ResizeMemoList(UnpicklerObject *self, size_t new_size)
> + {
> +-    Py_ssize_t i;
> ++    size_t i;
> +=20
> +     assert(new_size > self->memo_size);
> +=20
> +@@ -1292,9 +1296,9 @@ _Unpickler_ResizeMemoList(UnpicklerObject *self,=
 Py_ssize_t new_size)
> +=20
> + /* Returns NULL if idx is out of bounds. */
> + static PyObject *
> +-_Unpickler_MemoGet(UnpicklerObject *self, Py_ssize_t idx)
> ++_Unpickler_MemoGet(UnpicklerObject *self, size_t idx)
> + {
> +-    if (idx < 0 || idx >=3D self->memo_size)
> ++    if (idx >=3D self->memo_size)
> +         return NULL;
> +=20
> +     return self->memo[idx];
> +@@ -1303,7 +1307,7 @@ _Unpickler_MemoGet(UnpicklerObject *self, Py_ssi=
ze_t idx)
> + /* Returns -1 (with an exception set) on failure, 0 on success.
> +    This takes its own reference to `value`. */
> + static int
> +-_Unpickler_MemoPut(UnpicklerObject *self, Py_ssize_t idx, PyObject *v=
alue)
> ++_Unpickler_MemoPut(UnpicklerObject *self, size_t idx, PyObject *value=
)
> + {
> +     PyObject *old_item;
> +=20
> +@@ -4194,14 +4198,13 @@ static PyObject *
> + _pickle_PicklerMemoProxy_copy_impl(PicklerMemoProxyObject *self)
> + /*[clinic end generated code: output=3Dbb83a919d29225ef input=3Db7304=
3485ac30b36]*/
> + {
> +-    Py_ssize_t i;
> +     PyMemoTable *memo;
> +     PyObject *new_memo =3D PyDict_New();
> +     if (new_memo =3D=3D NULL)
> +         return NULL;
> +=20
> +     memo =3D self->pickler->memo;
> +-    for (i =3D 0; i < memo->mt_allocated; ++i) {
> ++    for (size_t i =3D 0; i < memo->mt_allocated; ++i) {
> +         PyMemoEntry entry =3D memo->mt_table[i];
> +         if (entry.me_key !=3D NULL) {
> +             int status;
> +@@ -6620,7 +6623,7 @@ static PyObject *
> + _pickle_UnpicklerMemoProxy_copy_impl(UnpicklerMemoProxyObject *self)
> + /*[clinic end generated code: output=3De12af7e9bc1e4c77 input=3D97769=
247ce032c1d]*/
> + {
> +-    Py_ssize_t i;
> ++    size_t i;
> +     PyObject *new_memo =3D PyDict_New();
> +     if (new_memo =3D=3D NULL)
> +         return NULL;
> +@@ -6771,8 +6774,7 @@ static int
> + Unpickler_set_memo(UnpicklerObject *self, PyObject *obj)
> + {
> +     PyObject **new_memo;
> +-    Py_ssize_t new_memo_size =3D 0;
> +-    Py_ssize_t i;
> ++    size_t new_memo_size =3D 0;
> +=20
> +     if (obj =3D=3D NULL) {
> +         PyErr_SetString(PyExc_TypeError,
> +@@ -6789,7 +6791,7 @@ Unpickler_set_memo(UnpicklerObject *self, PyObje=
ct *obj)
> +         if (new_memo =3D=3D NULL)
> +             return -1;
> +=20
> +-        for (i =3D 0; i < new_memo_size; i++) {
> ++        for (size_t i =3D 0; i < new_memo_size; i++) {
> +             Py_XINCREF(unpickler->memo[i]);
> +             new_memo[i] =3D unpickler->memo[i];
> +         }
> +@@ -6837,8 +6839,7 @@ Unpickler_set_memo(UnpicklerObject *self, PyObje=
ct *obj)
> +=20
> +   error:
> +     if (new_memo_size) {
> +-        i =3D new_memo_size;
> +-        while (--i >=3D 0) {
> ++        for (size_t i =3D new_memo_size - 1; i !=3D SIZE_MAX; i--) {
> +             Py_XDECREF(new_memo[i]);
> +         }
> +         PyMem_FREE(new_memo);
> +--=20
> +2.22.0.vfs.1.1.57.gbaf16c8
> +
> diff --git a/meta/recipes-devtools/python/python3/CVE-2018-20852.patch =
b/meta/recipes-devtools/python/python3/CVE-2018-20852.patch
> new file mode 100644
> index 0000000..82a114f
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2018-20852.patch
> @@ -0,0 +1,129 @@
> +From 31c16d62fc762ab87e66e7f47e36dbfcfc8b5224 Mon Sep 17 00:00:00 2001=

> +From: Xtreak <tir.karthi@gmail.com>
> +Date: Sun, 17 Mar 2019 05:33:39 +0530
> +Subject: [PATCH] [3.5] bpo-35121: prefix dot in domain for proper subd=
omain
> + validation (GH-10258) (#12281)
> +
> +Don't send cookies of domain A without Domain attribute to domain B wh=
en domain A is a suffix match of domain B while using a cookiejar with `h=
ttp.cookiejar.DefaultCookiePolicy` policy.  Patch by Karthikeyan Singarav=
elan.
> +(cherry picked from commit ca7fe5063593958e5efdf90f068582837f07bd14)
> +
> +Co-authored-by: Xtreak <tir.karthi@gmail.com>
> +
> +CVE: CVE-2018-20852
> +Upstream-Status: Backport
> +[https://github.com/python/cpython/commit/4749f1b69000259e23b4cc6f63c5=
42a9bdc62f1b]
> +
> +Signed-off-by: Dan Tran <dantran@microsoft.com>
> +---
> + Lib/http/cookiejar.py                         | 13 ++++++--
> + Lib/test/test_http_cookiejar.py               | 30 ++++++++++++++++++=
+
> + .../2018-10-31-15-39-17.bpo-35121.EgHv9k.rst  |  4 +++
> + 3 files changed, 45 insertions(+), 2 deletions(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-=
35121.EgHv9k.rst
> +
> +diff --git a/Lib/http/cookiejar.py b/Lib/http/cookiejar.py
> +index 6d4572af03..1cc9378ae4 100644
> +--- a/Lib/http/cookiejar.py
> ++++ b/Lib/http/cookiejar.py
> +@@ -1148,6 +1148,11 @@ class DefaultCookiePolicy(CookiePolicy):
> +         req_host, erhn =3D eff_request_host(request)
> +         domain =3D cookie.domain
> +=20
> ++        if domain and not domain.startswith("."):
> ++            dotdomain =3D "." + domain
> ++        else:
> ++            dotdomain =3D domain
> ++
> +         # strict check of non-domain cookies: Mozilla does this, MSIE=
5 doesn't
> +         if (cookie.version =3D=3D 0 and
> +             (self.strict_ns_domain & self.DomainStrictNonDomain) and
> +@@ -1160,7 +1165,7 @@ class DefaultCookiePolicy(CookiePolicy):
> +             _debug("   effective request-host name %s does not domain=
-match "
> +                    "RFC 2965 cookie domain %s", erhn, domain)
> +             return False
> +-        if cookie.version =3D=3D 0 and not ("."+erhn).endswith(domain=
):
> ++        if cookie.version =3D=3D 0 and not ("."+erhn).endswith(dotdom=
ain):
> +             _debug("   request-host %s does not match Netscape cookie=
 domain "
> +                    "%s", req_host, domain)
> +             return False
> +@@ -1174,7 +1179,11 @@ class DefaultCookiePolicy(CookiePolicy):
> +             req_host =3D "."+req_host
> +         if not erhn.startswith("."):
> +             erhn =3D "."+erhn
> +-        if not (req_host.endswith(domain) or erhn.endswith(domain)):
> ++        if domain and not domain.startswith("."):
> ++            dotdomain =3D "." + domain
> ++        else:
> ++            dotdomain =3D domain
> ++        if not (req_host.endswith(dotdomain) or erhn.endswith(dotdoma=
in)):
> +             #_debug("   request domain %s does not match cookie domai=
n %s",
> +             #       req_host, domain)
> +             return False
> +diff --git a/Lib/test/test_http_cookiejar.py b/Lib/test/test_http_cook=
iejar.py
> +index 49c01ae489..e67e6ae780 100644
> +--- a/Lib/test/test_http_cookiejar.py
> ++++ b/Lib/test/test_http_cookiejar.py
> +@@ -417,6 +417,7 @@ class CookieTests(unittest.TestCase):
> +             ("http://foo.bar.com/", ".foo.bar.com", True),
> +             ("http://foo.bar.com/", "foo.bar.com", True),
> +             ("http://foo.bar.com/", ".bar.com", True),
> ++            ("http://foo.bar.com/", "bar.com", True),
> +             ("http://foo.bar.com/", "com", True),
> +             ("http://foo.com/", "rhubarb.foo.com", False),
> +             ("http://foo.com/", ".foo.com", True),
> +@@ -427,6 +428,8 @@ class CookieTests(unittest.TestCase):
> +             ("http://foo/", "foo", True),
> +             ("http://foo/", "foo.local", True),
> +             ("http://foo/", ".local", True),
> ++            ("http://barfoo.com", ".foo.com", False),
> ++            ("http://barfoo.com", "foo.com", False),
> +             ]:
> +             request =3D urllib.request.Request(url)
> +             r =3D pol.domain_return_ok(domain, request)
> +@@ -961,6 +964,33 @@ class CookieTests(unittest.TestCase):
> +         c.add_cookie_header(req)
> +         self.assertFalse(req.has_header("Cookie"))
> +=20
> ++        c.clear()
> ++
> ++        pol.set_blocked_domains([])
> ++        req =3D urllib.request.Request("http://acme.com/")
> ++        res =3D FakeResponse(headers, "http://acme.com/")
> ++        cookies =3D c.make_cookies(res, req)
> ++        c.extract_cookies(res, req)
> ++        self.assertEqual(len(c), 1)
> ++
> ++        req =3D urllib.request.Request("http://acme.com/")
> ++        c.add_cookie_header(req)
> ++        self.assertTrue(req.has_header("Cookie"))
> ++
> ++        req =3D urllib.request.Request("http://badacme.com/")
> ++        c.add_cookie_header(req)
> ++        self.assertFalse(pol.return_ok(cookies[0], req))
> ++        self.assertFalse(req.has_header("Cookie"))
> ++
> ++        p =3D pol.set_blocked_domains(["acme.com"])
> ++        req =3D urllib.request.Request("http://acme.com/")
> ++        c.add_cookie_header(req)
> ++        self.assertFalse(req.has_header("Cookie"))
> ++
> ++        req =3D urllib.request.Request("http://badacme.com/")
> ++        c.add_cookie_header(req)
> ++        self.assertFalse(req.has_header("Cookie"))
> ++
> +     def test_secure(self):
> +         for ns in True, False:
> +             for whitespace in " ", "":
> +diff --git a/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.E=
gHv9k.rst b/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9=
k.rst
> +new file mode 100644
> +index 0000000000..d2eb8f1f35
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.r=
st
> +@@ -0,0 +1,4 @@
> ++Don't send cookies of domain A without Domain attribute to domain B
> ++when domain A is a suffix match of domain B while using a cookiejar
> ++with :class:`http.cookiejar.DefaultCookiePolicy` policy. Patch by
> ++Karthikeyan Singaravelan.
> +--=20
> +2.22.0.vfs.1.1.57.gbaf16c8
> +
> diff --git a/meta/recipes-devtools/python/python3/CVE-2019-9636.patch b=
/meta/recipes-devtools/python/python3/CVE-2019-9636.patch
> new file mode 100644
> index 0000000..ce8eb66
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2019-9636.patch
> @@ -0,0 +1,154 @@
> +From b0305339567b64e07df87620e97e4cb99332aef6 Mon Sep 17 00:00:00 2001=

> +From: Steve Dower <steve.dower@microsoft.com>
> +Date: Sun, 10 Mar 2019 21:59:24 -0700
> +Subject: [PATCH] bpo-36216: Add check for characters in netloc that no=
rmalize
> + to separators (GH-12201) (#12223)
> +
> +CVE: CVE-2019-9636
> +Upstream-Status: Backport
> +[https://github.com/python/cpython/commit/c0d95113b070799679bcb9dc49d4=
960d82e8bb08]
> +
> +Signed-off-by: Dan Tran <dantran@microsoft.com>
> +---
> + Doc/library/urllib.parse.rst                  | 18 +++++++++++++++
> + Lib/test/test_urlparse.py                     | 23 ++++++++++++++++++=
+
> + Lib/urllib/parse.py                           | 17 ++++++++++++++
> + .../2019-03-06-09-38-40.bpo-36216.6q1m4a.rst  |  3 +++
> + 4 files changed, 61 insertions(+)
> + create mode 100644 Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-=
36216.6q1m4a.rst
> +
> +diff --git a/Doc/library/urllib.parse.rst b/Doc/library/urllib.parse.r=
st
> +index 6f722a8897..a4c6b6726e 100644
> +--- a/Doc/library/urllib.parse.rst
> ++++ b/Doc/library/urllib.parse.rst
> +@@ -120,6 +120,11 @@ or on combining URL components into a URL string.=

> +    Unmatched square brackets in the :attr:`netloc` attribute will rai=
se a
> +    :exc:`ValueError`.
> +=20
> ++   Characters in the :attr:`netloc` attribute that decompose under NF=
KC
> ++   normalization (as used by the IDNA encoding) into any of ``/``, ``=
?``,
> ++   ``#``, ``@``, or ``:`` will raise a :exc:`ValueError`. If the URL =
is
> ++   decomposed before parsing, no error will be raised.
> ++
> +    .. versionchanged:: 3.2
> +       Added IPv6 URL parsing capabilities.
> +=20
> +@@ -128,6 +133,10 @@ or on combining URL components into a URL string.=

> +       false), in accordance with :rfc:`3986`.  Previously, a whitelis=
t of
> +       schemes that support fragments existed.
> +=20
> ++   .. versionchanged:: 3.5.7
> ++      Characters that affect netloc parsing under NFKC normalization =
will
> ++      now raise :exc:`ValueError`.
> ++
> +=20
> + .. function:: parse_qs(qs, keep_blank_values=3DFalse, strict_parsing=3D=
False, encoding=3D'utf-8', errors=3D'replace')
> +=20
> +@@ -236,6 +245,15 @@ or on combining URL components into a URL string.=

> +    Unmatched square brackets in the :attr:`netloc` attribute will rai=
se a
> +    :exc:`ValueError`.
> +=20
> ++   Characters in the :attr:`netloc` attribute that decompose under NF=
KC
> ++   normalization (as used by the IDNA encoding) into any of ``/``, ``=
?``,
> ++   ``#``, ``@``, or ``:`` will raise a :exc:`ValueError`. If the URL =
is
> ++   decomposed before parsing, no error will be raised.
> ++
> ++   .. versionchanged:: 3.5.7
> ++      Characters that affect netloc parsing under NFKC normalization =
will
> ++      now raise :exc:`ValueError`.
> ++
> +=20
> + .. function:: urlunsplit(parts)
> +=20
> +diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
> +index e2cf1b7e0f..d0420b0e74 100644
> +--- a/Lib/test/test_urlparse.py
> ++++ b/Lib/test/test_urlparse.py
> +@@ -1,3 +1,5 @@
> ++import sys
> ++import unicodedata
> + import unittest
> + import urllib.parse
> +=20
> +@@ -970,6 +972,27 @@ class UrlParseTestCase(unittest.TestCase):
> +                 expected.append(name)
> +         self.assertCountEqual(urllib.parse.__all__, expected)
> +=20
> ++    def test_urlsplit_normalization(self):
> ++        # Certain characters should never occur in the netloc,
> ++        # including under normalization.
> ++        # Ensure that ALL of them are detected and cause an error
> ++        illegal_chars =3D '/:#?@'
> ++        hex_chars =3D {'{:04X}'.format(ord(c)) for c in illegal_chars=
}
> ++        denorm_chars =3D [
> ++            c for c in map(chr, range(128, sys.maxunicode))
> ++            if (hex_chars & set(unicodedata.decomposition(c).split())=
)
> ++            and c not in illegal_chars
> ++        ]
> ++        # Sanity check that we found at least one such character
> ++        self.assertIn('\u2100', denorm_chars)
> ++        self.assertIn('\uFF03', denorm_chars)
> ++
> ++        for scheme in ["http", "https", "ftp"]:
> ++            for c in denorm_chars:
> ++                url =3D "{}://netloc{}false.netloc/path".format(schem=
e, c)
> ++                with self.subTest(url=3Durl, char=3D'{:04X}'.format(o=
rd(c))):
> ++                    with self.assertRaises(ValueError):
> ++                        urllib.parse.urlsplit(url)
> +=20
> + class Utility_Tests(unittest.TestCase):
> +     """Testcase to test the various utility functions in the urllib."=
""
> +diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
> +index 62e8ddf04b..7ba2b445f5 100644
> +--- a/Lib/urllib/parse.py
> ++++ b/Lib/urllib/parse.py
> +@@ -327,6 +327,21 @@ def _splitnetloc(url, start=3D0):
> +             delim =3D min(delim, wdelim)     # use earliest delim pos=
ition
> +     return url[start:delim], url[delim:]   # return (domain, rest)
> +=20
> ++def _checknetloc(netloc):
> ++    if not netloc or not any(ord(c) > 127 for c in netloc):
> ++        return
> ++    # looking for characters like \u2100 that expand to 'a/c'
> ++    # IDNA uses NFKC equivalence, so normalize for this check
> ++    import unicodedata
> ++    netloc2 =3D unicodedata.normalize('NFKC', netloc)
> ++    if netloc =3D=3D netloc2:
> ++        return
> ++    _, _, netloc =3D netloc.rpartition('@') # anything to the left of=
 '@' is okay
> ++    for c in '/?#@:':
> ++        if c in netloc2:
> ++            raise ValueError("netloc '" + netloc2 + "' contains inval=
id " +
> ++                             "characters under NFKC normalization")
> ++
> + def urlsplit(url, scheme=3D'', allow_fragments=3DTrue):
> +     """Parse a URL into 5 components:
> +     <scheme>://<netloc>/<path>?<query>#<fragment>
> +@@ -356,6 +371,7 @@ def urlsplit(url, scheme=3D'', allow_fragments=3DT=
rue):
> +                 url, fragment =3D url.split('#', 1)
> +             if '?' in url:
> +                 url, query =3D url.split('?', 1)
> ++            _checknetloc(netloc)
> +             v =3D SplitResult(scheme, netloc, url, query, fragment)
> +             _parse_cache[key] =3D v
> +             return _coerce_result(v)
> +@@ -379,6 +395,7 @@ def urlsplit(url, scheme=3D'', allow_fragments=3DT=
rue):
> +         url, fragment =3D url.split('#', 1)
> +     if '?' in url:
> +         url, query =3D url.split('?', 1)
> ++    _checknetloc(netloc)
> +     v =3D SplitResult(scheme, netloc, url, query, fragment)
> +     _parse_cache[key] =3D v
> +     return _coerce_result(v)
> +diff --git a/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6=
q1m4a.rst b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4=
a.rst
> +new file mode 100644
> +index 0000000000..5546394157
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.r=
st
> +@@ -0,0 +1,3 @@
> ++Changes urlsplit() to raise ValueError when the URL contains characte=
rs that
> ++decompose under IDNA encoding (NFKC-normalization) into characters th=
at
> ++affect how the URL is parsed.
> +--=20
> +2.22.0.vfs.1.1.57.gbaf16c8
> +
> diff --git a/meta/recipes-devtools/python/python3/CVE-2019-9740.patch b=
/meta/recipes-devtools/python/python3/CVE-2019-9740.patch
> new file mode 100644
> index 0000000..d223058
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2019-9740.patch
> @@ -0,0 +1,160 @@
> +From 5db6dd393a113012abc6d730a46eb4ba2e04468f Mon Sep 17 00:00:00 2001=

> +From: =3D?UTF-8?q?Miro=3D20Hron=3DC4=3D8Dok?=3D <miro@hroncok.cz>
> +Date: Sun, 14 Jul 2019 11:07:11 +0200
> +Subject: [PATCH] bpo-30458: Disallow control chars in http URLs. (GH-1=
2755)
> + (#13207)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Disallow control chars in http URLs in urllib.urlopen.  This addresses=
 a potential security problem for applications that do not sanity check t=
heir URLs where http request headers could be injected.
> +
> +Disable https related urllib tests on a build without ssl (GH-13032)
> +These tests require an SSL enabled build. Skip these tests when python=
 is built without SSL to fix test failures.
> +
> +Use http.client.InvalidURL instead of ValueError as the new error case=
's exception. (GH-13044)
> +
> +Co-Authored-By: Miro Hron=C4=8Dok <miro@hroncok.cz>
> +
> +CVE: CVE-2019-9740 CVE-2019-9747
> +Upstream-Status: Backport
> +[https://github.com/python/cpython/commit/afe3a4975cf93c97e5d6eb8800e4=
8f368011d37a]
> +
> +Signed-off-by: Dan Tran <dantran@microsoft.com>
> +---
> + Lib/http/client.py                            | 16 ++++++
> + Lib/test/test_urllib.py                       | 55 ++++++++++++++++++=
+
> + Lib/test/test_xmlrpc.py                       |  8 ++-
> + .../2019-04-10-08-53-30.bpo-30458.51E-DA.rst  |  1 +
> + 4 files changed, 79 insertions(+), 1 deletion(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-=
30458.51E-DA.rst
> +
> +diff --git a/Lib/http/client.py b/Lib/http/client.py
> +index 352c1017ad..76b9be69a3 100644
> +--- a/Lib/http/client.py
> ++++ b/Lib/http/client.py
> +@@ -141,6 +141,16 @@ _MAXHEADERS =3D 100
> + _is_legal_header_name =3D re.compile(rb'[^:\s][^:\r\n]*').fullmatch
> + _is_illegal_header_value =3D re.compile(rb'\n(?![ \t])|\r(?![ \t\n])'=
).search
> +=20
> ++# These characters are not allowed within HTTP URL paths.
> ++#  See https://tools.ietf.org/html/rfc3986#section-3.3 and the
> ++#  https://tools.ietf.org/html/rfc3986#appendix-A pchar definition.
> ++# Prevents CVE-2019-9740.  Includes control characters such as \r\n.
> ++# We don't restrict chars above \x7f as putrequest() limits us to ASC=
II.
> ++_contains_disallowed_url_pchar_re =3D re.compile('[\x00-\x20\x7f]')
> ++# Arguably only these _should_ allowed:
> ++#  _is_allowed_url_pchars_re =3D re.compile(r"^[/!$&'()*+,;=3D:@%a-zA=
-Z0-9._~-]+$")
> ++# We are more lenient for assumed real world compatibility purposes.
> ++
> + # We always set the Content-Length header for these methods because s=
ome
> + # servers will otherwise respond with a 411
> + _METHODS_EXPECTING_BODY =3D {'PATCH', 'POST', 'PUT'}
> +@@ -978,6 +988,12 @@ class HTTPConnection:
> +         self._method =3D method
> +         if not url:
> +             url =3D '/'
> ++        # Prevent CVE-2019-9740.
> ++        match =3D _contains_disallowed_url_pchar_re.search(url)
> ++        if match:
> ++            raise InvalidURL("URL can't contain control characters. {=
!r} "
> ++                             "(found at least {!r})".format(url,
> ++                                                            match.gro=
up()))
> +         request =3D '%s %s %s' % (method, url, self._http_vsn_str)
> +=20
> +         # Non-ASCII characters should have been eliminated earlier
> +diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
> +index 1a28c9a21d..5deb5339de 100644
> +--- a/Lib/test/test_urllib.py
> ++++ b/Lib/test/test_urllib.py
> +@@ -329,6 +329,61 @@ class urlopen_HttpTests(unittest.TestCase, FakeHT=
TPMixin, FakeFTPMixin):
> +         finally:
> +             self.unfakehttp()
> +=20
> ++    @unittest.skipUnless(ssl, "ssl module required")
> ++    def test_url_with_control_char_rejected(self):
> ++        for char_no in list(range(0, 0x21)) + [0x7f]:
> ++            char =3D chr(char_no)
> ++            schemeless_url =3D "//localhost:7777/test{}/".format(char=
)
> ++            self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
> ++            try:
> ++                # We explicitly test urllib.request.urlopen() instead=
 of the top
> ++                # level 'def urlopen()' function defined in this... (=
quite ugly)
> ++                # test suite.  They use different url opening codepat=
hs.  Plain
> ++                # urlopen uses FancyURLOpener which goes via a codepa=
th that
> ++                # calls urllib.parse.quote() on the URL which makes a=
ll of the
> ++                # above attempts at injection within the url _path_ s=
afe.
> ++                escaped_char_repr =3D repr(char).replace('\\', r'\\')=

> ++                InvalidURL =3D http.client.InvalidURL
> ++                with self.assertRaisesRegex(
> ++                    InvalidURL,
> ++                    "contain control.*{}".format(escaped_char_repr)):=

> ++                    urllib.request.urlopen("http:{}".format(schemeles=
s_url))
> ++                with self.assertRaisesRegex(
> ++                    InvalidURL,
> ++                    "contain control.*{}".format(escaped_char_repr)):=

> ++                    urllib.request.urlopen("https:{}".format(schemele=
ss_url))
> ++                # This code path quotes the URL so there is no inject=
ion.
> ++                resp =3D urlopen("http:{}".format(schemeless_url))
> ++                self.assertNotIn(char, resp.geturl())
> ++            finally:
> ++                self.unfakehttp()
> ++
> ++    @unittest.skipUnless(ssl, "ssl module required")
> ++    def test_url_with_newline_header_injection_rejected(self):
> ++        self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
> ++        host =3D "localhost:7777?a=3D1 HTTP/1.1\r\nX-injected: header=
\r\nTEST: 123"
> ++        schemeless_url =3D "//" + host + ":8080/test/?test=3Da"
> ++        try:
> ++            # We explicitly test urllib.request.urlopen() instead of =
the top
> ++            # level 'def urlopen()' function defined in this... (quit=
e ugly)
> ++            # test suite.  They use different url opening codepaths. =
 Plain
> ++            # urlopen uses FancyURLOpener which goes via a codepath t=
hat
> ++            # calls urllib.parse.quote() on the URL which makes all o=
f the
> ++            # above attempts at injection within the url _path_ safe.=

> ++            InvalidURL =3D http.client.InvalidURL
> ++            with self.assertRaisesRegex(
> ++                InvalidURL, r"contain control.*\\r.*(found at least .=
 .)"):
> ++                urllib.request.urlopen("http:{}".format(schemeless_ur=
l))
> ++            with self.assertRaisesRegex(InvalidURL, r"contain control=
=2E*\\n"):
> ++                urllib.request.urlopen("https:{}".format(schemeless_u=
rl))
> ++            # This code path quotes the URL so there is no injection.=

> ++            resp =3D urlopen("http:{}".format(schemeless_url))
> ++            self.assertNotIn(' ', resp.geturl())
> ++            self.assertNotIn('\r', resp.geturl())
> ++            self.assertNotIn('\n', resp.geturl())
> ++        finally:
> ++            self.unfakehttp()
> ++
> +     def test_read_0_9(self):
> +         # "0.9" response accepted (but not "simple responses" without=

> +         # a status line)
> +diff --git a/Lib/test/test_xmlrpc.py b/Lib/test/test_xmlrpc.py
> +index c2de057ecb..99e510fcee 100644
> +--- a/Lib/test/test_xmlrpc.py
> ++++ b/Lib/test/test_xmlrpc.py
> +@@ -896,7 +896,13 @@ class SimpleServerTestCase(BaseServerTestCase):
> +     def test_partial_post(self):
> +         # Check that a partial POST doesn't make the server loop: iss=
ue #14001.
> +         conn =3D http.client.HTTPConnection(ADDR, PORT)
> +-        conn.request('POST', '/RPC2 HTTP/1.0\r\nContent-Length: 100\r=
\n\r\nbye')
> ++        conn.send('POST /RPC2 HTTP/1.0\r\n'
> ++                  'Content-Length: 100\r\n\r\n'
> ++                  'bye HTTP/1.1\r\n'
> ++                  'Host: {}:{}\r\n'
> ++                  'Accept-Encoding: identity\r\n'
> ++                  'Content-Length: 0\r\n\r\n'
> ++                  .format(ADDR, PORT).encode('ascii'))
> +         conn.close()
> +=20
> +     def test_context_manager(self):
> +diff --git a/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.5=
1E-DA.rst b/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-D=
A.rst
> +new file mode 100644
> +index 0000000000..ed8027fb4d
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.r=
st
> +@@ -0,0 +1 @@
> ++Address CVE-2019-9740 by disallowing URL paths with embedded whitespa=
ce or control characters through into the underlying http client request.=
  Such potentially malicious header injection URLs now cause an http.clie=
nt.InvalidURL exception to be raised.
> +--=20
> +2.22.0.vfs.1.1.57.gbaf16c8
> +
> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recip=
es-devtools/python/python3_3.5.6.bb
> index 6aa6df6..262f91f 100644
> --- a/meta/recipes-devtools/python/python3_3.5.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
> @@ -43,6 +43,11 @@ SRC_URI +=3D "\
>              file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH=
-6976.patch \
>              file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305=
=2Epatch \
>              file://run-ptest \
> +            file://CVE-2018-14647.patch \
> +            file://CVE-2018-20406.patch \
> +            file://CVE-2018-20852.patch \
> +            file://CVE-2019-9636.patch \
> +            file://CVE-2019-9740.patch \=20
>             "
> =20
>  inherit multilib_header python3native update-alternatives qemu ptest


--------------E93AB25E463777C1E3AA7544
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Dan,<br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 9/10/19 4:45 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:msft.dantran@gmail.com">msft.dantran@gmail.com</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1568159145-3827-1-git-send-email-dantran@microsoft.com">
      <pre class="moz-quote-pre" wrap="">From: Dan Tran <a class="moz-txt-link-rfc2396E" href="mailto:dantran@microsoft.com">&lt;dantran@microsoft.com&gt;</a>

Fixes CVE-2018-14647, CVE-2018-20406, CVE-2018-20852, CVE-2019-9636,
CVE-2019-9740, and CVE-2019-9747.
---
 .../python/python3/CVE-2018-14647.patch            |  95 +++++++++
 .../python/python3/CVE-2018-20406.patch            | 217 +++++++++++++++++++++
 .../python/python3/CVE-2018-20852.patch            | 129 ++++++++++++
 .../python/python3/CVE-2019-9636.patch             | 154 +++++++++++++++
 .../python/python3/CVE-2019-9740.patch             | 160 +++++++++++++++</pre>
    </blockquote>
    9740 is already in the queue.<br>
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core-contrib/commit/meta/recipes-devtools/python?h=stable/thud-nmut&amp;id=ad90312adabbad951f62e3bd4ad95fcc763ad0c4">https://git.openembedded.org/openembedded-core-contrib/commit/meta/recipes-devtools/python?h=stable/thud-nmut&amp;id=ad90312adabbad951f62e3bd4ad95fcc763ad0c4</a><br>
    <br>
    Can you drop it or rebase off of <span class="decoration"><a
        class="branch-deco"
href="https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/thud-nmut">stable/thud-nmut</a>
      in </span><a rel="vcs-git"
      href="https://git.openembedded.org/openembedded-core-contrib"
      title="openembedded-core-contrib Git repository">https://git.openembedded.org/openembedded-core-contrib</a><br>
    <br>
    Thanks, <br>
    Armin<br>
    <br>
    <blockquote type="cite"
      cite="mid:1568159145-3827-1-git-send-email-dantran@microsoft.com">
      <pre class="moz-quote-pre" wrap="">
 meta/recipes-devtools/python/python3_3.5.6.bb      |   5 +
 6 files changed, 760 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2018-14647.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2018-20406.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2018-20852.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9636.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9740.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2018-14647.patch b/meta/recipes-devtools/python/python3/CVE-2018-14647.patch
new file mode 100644
index 0000000..c1f21f8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2018-14647.patch
@@ -0,0 +1,95 @@
+From 610b4b0dbaedd3099ab76acf678e9cc845d99a76 Mon Sep 17 00:00:00 2001
+From: stratakis <a class="moz-txt-link-rfc2396E" href="mailto:cstratak@redhat.com">&lt;cstratak@redhat.com&gt;</a>
+Date: Mon, 25 Feb 2019 22:04:09 +0100
+Subject: [PATCH] [3.5] bpo-34623: Use XML_SetHashSalt in _elementtree (#9933)
+
+* bpo-34623: Use XML_SetHashSalt in _elementtree (GH-9146)
+
+The C accelerated _elementtree module now initializes hash randomization
+salt from _Py_HashSecret instead of libexpat's default CPRNG.
+
+Signed-off-by: Christian Heimes <a class="moz-txt-link-rfc2396E" href="mailto:christian@python.org">&lt;christian@python.org&gt;</a>
+
+https://bugs.python.org/issue34623
+(cherry picked from commit cb5778f00ce48631c7140f33ba242496aaf7102b)
+
+Co-authored-by: Christian Heimes <a class="moz-txt-link-rfc2396E" href="mailto:christian@python.org">&lt;christian@python.org&gt;</a>
+
+CVE: CVE-2018-14647
+Upstream-Status: Backport
+[<a class="moz-txt-link-freetext" href="https://github.com/python/cpython/commit/41b48e71ac8a71f56694b548f118bd20ce203410">https://github.com/python/cpython/commit/41b48e71ac8a71f56694b548f118bd20ce203410</a>]
+
+Signed-off-by: Dan Tran <a class="moz-txt-link-rfc2396E" href="mailto:dantran@microsoft.com">&lt;dantran@microsoft.com&gt;</a>
+---
+ Include/pyexpat.h                                            | 4 +++-
+ .../next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst   | 2 ++
+ Modules/_elementtree.c                                       | 5 +++++
+ Modules/pyexpat.c                                            | 5 +++++
+ 4 files changed, 15 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst
+
+diff --git a/Include/pyexpat.h b/Include/pyexpat.h
+index 44259bf6d7..07020b5dc9 100644
+--- a/Include/pyexpat.h
++++ b/Include/pyexpat.h
+@@ -3,7 +3,7 @@
+ 
+ /* note: you must import expat.h before importing this module! */
+ 
+-#define PyExpat_CAPI_MAGIC  "pyexpat.expat_CAPI 1.0"
++#define PyExpat_CAPI_MAGIC  "pyexpat.expat_CAPI 1.1"
+ #define PyExpat_CAPSULE_NAME "pyexpat.expat_CAPI"
+ 
+ struct PyExpat_CAPI
+@@ -48,6 +48,8 @@ struct PyExpat_CAPI
+     enum XML_Status (*SetEncoding)(XML_Parser parser, const XML_Char *encoding);
+     int (*DefaultUnknownEncodingHandler)(
+         void *encodingHandlerData, const XML_Char *name, XML_Encoding *info);
++    /* might be none for expat &lt; 2.1.0 */
++    int (*SetHashSalt)(XML_Parser parser, unsigned long hash_salt);
+     /* always add new stuff to the end! */
+ };
+ 
+diff --git a/Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst b/Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst
+new file mode 100644
+index 0000000000..cbaa4b7506
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst
+@@ -0,0 +1,2 @@
++CVE-2018-14647: The C accelerated _elementtree module now initializes hash
++randomization salt from _Py_HashSecret instead of libexpat's default CSPRNG.
+diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
+index 5dba9f70a9..90c6daf64a 100644
+--- a/Modules/_elementtree.c
++++ b/Modules/_elementtree.c
+@@ -3282,6 +3282,11 @@ _elementtree_XMLParser___init___impl(XMLParserObject *self, PyObject *html,
+         PyErr_NoMemory();
+         return -1;
+     }
++    /* expat &lt; 2.1.0 has no XML_SetHashSalt() */
++    if (EXPAT(SetHashSalt) != NULL) {
++        EXPAT(SetHashSalt)(self-&gt;parser,
++                           (unsigned long)_Py_HashSecret.expat.hashsalt);
++    }
+ 
+     if (target) {
+         Py_INCREF(target);
+diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
+index adc9b6cde8..948ab1b703 100644
+--- a/Modules/pyexpat.c
++++ b/Modules/pyexpat.c
+@@ -1882,6 +1882,11 @@ MODULE_INITFUNC(void)
+     capi.SetStartDoctypeDeclHandler = XML_SetStartDoctypeDeclHandler;
+     capi.SetEncoding = XML_SetEncoding;
+     capi.DefaultUnknownEncodingHandler = PyUnknownEncodingHandler;
++#if XML_COMBINED_VERSION &gt;= 20100
++    capi.SetHashSalt = XML_SetHashSalt;
++#else
++    capi.SetHashSalt = NULL;
++#endif
+ 
+     /* export using capsule */
+     capi_object = PyCapsule_New(&amp;capi, PyExpat_CAPSULE_NAME, NULL);
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/python/python3/CVE-2018-20406.patch b/meta/recipes-devtools/python/python3/CVE-2018-20406.patch
new file mode 100644
index 0000000..b69e0c4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2018-20406.patch
@@ -0,0 +1,217 @@
+From 3c7fd2b2729e3ebcf7877e7a32b3bbabf907a38d Mon Sep 17 00:00:00 2001
+From: Victor Stinner <a class="moz-txt-link-rfc2396E" href="mailto:vstinner@redhat.com">&lt;vstinner@redhat.com&gt;</a>
+Date: Tue, 26 Feb 2019 01:42:39 +0100
+Subject: [PATCH] closes bpo-34656: Avoid relying on signed overflow in _pickle
+ memos. (GH-9261) (#11869)
+
+(cherry picked from commit a4ae828ee416a66d8c7bf5ee71d653c2cc6a26dd)
+
+CVE: CVE-2018-20406
+Upstream-Status: Backport
+[<a class="moz-txt-link-freetext" href="https://github.com/python/cpython/commit/ef33dd6036aafbd3f06c1d56e2b1a81dae3da63c">https://github.com/python/cpython/commit/ef33dd6036aafbd3f06c1d56e2b1a81dae3da63c</a>]
+
+Signed-off-by: Dan Tran <a class="moz-txt-link-rfc2396E" href="mailto:dantran@microsoft.com">&lt;dantran@microsoft.com&gt;</a>
+---
+ Modules/_pickle.c | 63 ++++++++++++++++++++++++-----------------------
+ 1 file changed, 32 insertions(+), 31 deletions(-)
+
+diff --git a/Modules/_pickle.c b/Modules/_pickle.c
+index 0f62b1c019..fcb9e87899 100644
+--- a/Modules/_pickle.c
++++ b/Modules/_pickle.c
+@@ -527,9 +527,9 @@ typedef struct {
+ } PyMemoEntry;
+ 
+ typedef struct {
+-    Py_ssize_t mt_mask;
+-    Py_ssize_t mt_used;
+-    Py_ssize_t mt_allocated;
++    size_t mt_mask;
++    size_t mt_used;
++    size_t mt_allocated;
+     PyMemoEntry *mt_table;
+ } PyMemoTable;
+ 
+@@ -573,8 +573,8 @@ typedef struct UnpicklerObject {
+     /* The unpickler memo is just an array of PyObject *s. Using a dict
+        is unnecessary, since the keys are contiguous ints. */
+     PyObject **memo;
+-    Py_ssize_t memo_size;       /* Capacity of the memo array */
+-    Py_ssize_t memo_len;        /* Number of objects in the memo */
++    size_t memo_size;       /* Capacity of the memo array */
++    size_t memo_len;        /* Number of objects in the memo */
+ 
+     PyObject *pers_func;        /* persistent_load() method, can be NULL. */
+ 
+@@ -658,7 +658,6 @@ PyMemoTable_New(void)
+ static PyMemoTable *
+ PyMemoTable_Copy(PyMemoTable *self)
+ {
+-    Py_ssize_t i;
+     PyMemoTable *new = PyMemoTable_New();
+     if (new == NULL)
+         return NULL;
+@@ -675,7 +674,7 @@ PyMemoTable_Copy(PyMemoTable *self)
+         PyErr_NoMemory();
+         return NULL;
+     }
+-    for (i = 0; i &lt; self-&gt;mt_allocated; i++) {
++    for (size_t i = 0; i &lt; self-&gt;mt_allocated; i++) {
+         Py_XINCREF(self-&gt;mt_table[i].me_key);
+     }
+     memcpy(new-&gt;mt_table, self-&gt;mt_table,
+@@ -721,7 +720,7 @@ _PyMemoTable_Lookup(PyMemoTable *self, PyObject *key)
+ {
+     size_t i;
+     size_t perturb;
+-    size_t mask = (size_t)self-&gt;mt_mask;
++    size_t mask = self-&gt;mt_mask;
+     PyMemoEntry *table = self-&gt;mt_table;
+     PyMemoEntry *entry;
+     Py_hash_t hash = (Py_hash_t)key &gt;&gt; 3;
+@@ -743,22 +742,24 @@ _PyMemoTable_Lookup(PyMemoTable *self, PyObject *key)
+ 
+ /* Returns -1 on failure, 0 on success. */
+ static int
+-_PyMemoTable_ResizeTable(PyMemoTable *self, Py_ssize_t min_size)
++_PyMemoTable_ResizeTable(PyMemoTable *self, size_t min_size)
+ {
+     PyMemoEntry *oldtable = NULL;
+     PyMemoEntry *oldentry, *newentry;
+-    Py_ssize_t new_size = MT_MINSIZE;
+-    Py_ssize_t to_process;
++    size_t new_size = MT_MINSIZE;
++    size_t to_process;
+ 
+     assert(min_size &gt; 0);
+ 
+-    /* Find the smallest valid table size &gt;= min_size. */
+-    while (new_size &lt; min_size &amp;&amp; new_size &gt; 0)
+-        new_size &lt;&lt;= 1;
+-    if (new_size &lt;= 0) {
++    if (min_size &gt; PY_SSIZE_T_MAX) {
+         PyErr_NoMemory();
+         return -1;
+     }
++
++    /* Find the smallest valid table size &gt;= min_size. */
++    while (new_size &lt; min_size) {
++        new_size &lt;&lt;= 1;
++    }
+     /* new_size needs to be a power of two. */
+     assert((new_size &amp; (new_size - 1)) == 0);
+ 
+@@ -808,6 +809,7 @@ static int
+ PyMemoTable_Set(PyMemoTable *self, PyObject *key, Py_ssize_t value)
+ {
+     PyMemoEntry *entry;
++    size_t desired_size;
+ 
+     assert(key != NULL);
+ 
+@@ -831,10 +833,12 @@ PyMemoTable_Set(PyMemoTable *self, PyObject *key, Py_ssize_t value)
+      * Very large memo tables (over 50K items) use doubling instead.
+      * This may help applications with severe memory constraints.
+      */
+-    if (!(self-&gt;mt_used * 3 &gt;= (self-&gt;mt_mask + 1) * 2))
++    if (SIZE_MAX / 3 &gt;= self-&gt;mt_used &amp;&amp; self-&gt;mt_used * 3 &lt; self-&gt;mt_allocated * 2) {
+         return 0;
+-    return _PyMemoTable_ResizeTable(self,
+-        (self-&gt;mt_used &gt; 50000 ? 2 : 4) * self-&gt;mt_used);
++    }
++    // self-&gt;mt_used is always &lt; PY_SSIZE_T_MAX, so this can't overflow.
++    desired_size = (self-&gt;mt_used &gt; 50000 ? 2 : 4) * self-&gt;mt_used;
++    return _PyMemoTable_ResizeTable(self, desired_size);
+ }
+ 
+ #undef MT_MINSIZE
+@@ -1273,9 +1277,9 @@ _Unpickler_Readline(UnpicklerObject *self, char **result)
+ /* Returns -1 (with an exception set) on failure, 0 on success. The memo array
+    will be modified in place. */
+ static int
+-_Unpickler_ResizeMemoList(UnpicklerObject *self, Py_ssize_t new_size)
++_Unpickler_ResizeMemoList(UnpicklerObject *self, size_t new_size)
+ {
+-    Py_ssize_t i;
++    size_t i;
+ 
+     assert(new_size &gt; self-&gt;memo_size);
+ 
+@@ -1292,9 +1296,9 @@ _Unpickler_ResizeMemoList(UnpicklerObject *self, Py_ssize_t new_size)
+ 
+ /* Returns NULL if idx is out of bounds. */
+ static PyObject *
+-_Unpickler_MemoGet(UnpicklerObject *self, Py_ssize_t idx)
++_Unpickler_MemoGet(UnpicklerObject *self, size_t idx)
+ {
+-    if (idx &lt; 0 || idx &gt;= self-&gt;memo_size)
++    if (idx &gt;= self-&gt;memo_size)
+         return NULL;
+ 
+     return self-&gt;memo[idx];
+@@ -1303,7 +1307,7 @@ _Unpickler_MemoGet(UnpicklerObject *self, Py_ssize_t idx)
+ /* Returns -1 (with an exception set) on failure, 0 on success.
+    This takes its own reference to `value`. */
+ static int
+-_Unpickler_MemoPut(UnpicklerObject *self, Py_ssize_t idx, PyObject *value)
++_Unpickler_MemoPut(UnpicklerObject *self, size_t idx, PyObject *value)
+ {
+     PyObject *old_item;
+ 
+@@ -4194,14 +4198,13 @@ static PyObject *
+ _pickle_PicklerMemoProxy_copy_impl(PicklerMemoProxyObject *self)
+ /*[clinic end generated code: output=bb83a919d29225ef input=b73043485ac30b36]*/
+ {
+-    Py_ssize_t i;
+     PyMemoTable *memo;
+     PyObject *new_memo = PyDict_New();
+     if (new_memo == NULL)
+         return NULL;
+ 
+     memo = self-&gt;pickler-&gt;memo;
+-    for (i = 0; i &lt; memo-&gt;mt_allocated; ++i) {
++    for (size_t i = 0; i &lt; memo-&gt;mt_allocated; ++i) {
+         PyMemoEntry entry = memo-&gt;mt_table[i];
+         if (entry.me_key != NULL) {
+             int status;
+@@ -6620,7 +6623,7 @@ static PyObject *
+ _pickle_UnpicklerMemoProxy_copy_impl(UnpicklerMemoProxyObject *self)
+ /*[clinic end generated code: output=e12af7e9bc1e4c77 input=97769247ce032c1d]*/
+ {
+-    Py_ssize_t i;
++    size_t i;
+     PyObject *new_memo = PyDict_New();
+     if (new_memo == NULL)
+         return NULL;
+@@ -6771,8 +6774,7 @@ static int
+ Unpickler_set_memo(UnpicklerObject *self, PyObject *obj)
+ {
+     PyObject **new_memo;
+-    Py_ssize_t new_memo_size = 0;
+-    Py_ssize_t i;
++    size_t new_memo_size = 0;
+ 
+     if (obj == NULL) {
+         PyErr_SetString(PyExc_TypeError,
+@@ -6789,7 +6791,7 @@ Unpickler_set_memo(UnpicklerObject *self, PyObject *obj)
+         if (new_memo == NULL)
+             return -1;
+ 
+-        for (i = 0; i &lt; new_memo_size; i++) {
++        for (size_t i = 0; i &lt; new_memo_size; i++) {
+             Py_XINCREF(unpickler-&gt;memo[i]);
+             new_memo[i] = unpickler-&gt;memo[i];
+         }
+@@ -6837,8 +6839,7 @@ Unpickler_set_memo(UnpicklerObject *self, PyObject *obj)
+ 
+   error:
+     if (new_memo_size) {
+-        i = new_memo_size;
+-        while (--i &gt;= 0) {
++        for (size_t i = new_memo_size - 1; i != SIZE_MAX; i--) {
+             Py_XDECREF(new_memo[i]);
+         }
+         PyMem_FREE(new_memo);
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/python/python3/CVE-2018-20852.patch b/meta/recipes-devtools/python/python3/CVE-2018-20852.patch
new file mode 100644
index 0000000..82a114f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2018-20852.patch
@@ -0,0 +1,129 @@
+From 31c16d62fc762ab87e66e7f47e36dbfcfc8b5224 Mon Sep 17 00:00:00 2001
+From: Xtreak <a class="moz-txt-link-rfc2396E" href="mailto:tir.karthi@gmail.com">&lt;tir.karthi@gmail.com&gt;</a>
+Date: Sun, 17 Mar 2019 05:33:39 +0530
+Subject: [PATCH] [3.5] bpo-35121: prefix dot in domain for proper subdomain
+ validation (GH-10258) (#12281)
+
+Don't send cookies of domain A without Domain attribute to domain B when domain A is a suffix match of domain B while using a cookiejar with `http.cookiejar.DefaultCookiePolicy` policy.  Patch by Karthikeyan Singaravelan.
+(cherry picked from commit ca7fe5063593958e5efdf90f068582837f07bd14)
+
+Co-authored-by: Xtreak <a class="moz-txt-link-rfc2396E" href="mailto:tir.karthi@gmail.com">&lt;tir.karthi@gmail.com&gt;</a>
+
+CVE: CVE-2018-20852
+Upstream-Status: Backport
+[<a class="moz-txt-link-freetext" href="https://github.com/python/cpython/commit/4749f1b69000259e23b4cc6f63c542a9bdc62f1b">https://github.com/python/cpython/commit/4749f1b69000259e23b4cc6f63c542a9bdc62f1b</a>]
+
+Signed-off-by: Dan Tran <a class="moz-txt-link-rfc2396E" href="mailto:dantran@microsoft.com">&lt;dantran@microsoft.com&gt;</a>
+---
+ Lib/http/cookiejar.py                         | 13 ++++++--
+ Lib/test/test_http_cookiejar.py               | 30 +++++++++++++++++++
+ .../2018-10-31-15-39-17.bpo-35121.EgHv9k.rst  |  4 +++
+ 3 files changed, 45 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst
+
+diff --git a/Lib/http/cookiejar.py b/Lib/http/cookiejar.py
+index 6d4572af03..1cc9378ae4 100644
+--- a/Lib/http/cookiejar.py
++++ b/Lib/http/cookiejar.py
+@@ -1148,6 +1148,11 @@ class DefaultCookiePolicy(CookiePolicy):
+         req_host, erhn = eff_request_host(request)
+         domain = cookie.domain
+ 
++        if domain and not domain.startswith("."):
++            dotdomain = "." + domain
++        else:
++            dotdomain = domain
++
+         # strict check of non-domain cookies: Mozilla does this, MSIE5 doesn't
+         if (cookie.version == 0 and
+             (self.strict_ns_domain &amp; self.DomainStrictNonDomain) and
+@@ -1160,7 +1165,7 @@ class DefaultCookiePolicy(CookiePolicy):
+             _debug("   effective request-host name %s does not domain-match "
+                    "RFC 2965 cookie domain %s", erhn, domain)
+             return False
+-        if cookie.version == 0 and not ("."+erhn).endswith(domain):
++        if cookie.version == 0 and not ("."+erhn).endswith(dotdomain):
+             _debug("   request-host %s does not match Netscape cookie domain "
+                    "%s", req_host, domain)
+             return False
+@@ -1174,7 +1179,11 @@ class DefaultCookiePolicy(CookiePolicy):
+             req_host = "."+req_host
+         if not erhn.startswith("."):
+             erhn = "."+erhn
+-        if not (req_host.endswith(domain) or erhn.endswith(domain)):
++        if domain and not domain.startswith("."):
++            dotdomain = "." + domain
++        else:
++            dotdomain = domain
++        if not (req_host.endswith(dotdomain) or erhn.endswith(dotdomain)):
+             #_debug("   request domain %s does not match cookie domain %s",
+             #       req_host, domain)
+             return False
+diff --git a/Lib/test/test_http_cookiejar.py b/Lib/test/test_http_cookiejar.py
+index 49c01ae489..e67e6ae780 100644
+--- a/Lib/test/test_http_cookiejar.py
++++ b/Lib/test/test_http_cookiejar.py
+@@ -417,6 +417,7 @@ class CookieTests(unittest.TestCase):
+             (<a class="moz-txt-link-rfc2396E" href="http://foo.bar.com/">"http://foo.bar.com/"</a>, ".foo.bar.com", True),
+             (<a class="moz-txt-link-rfc2396E" href="http://foo.bar.com/">"http://foo.bar.com/"</a>, "foo.bar.com", True),
+             (<a class="moz-txt-link-rfc2396E" href="http://foo.bar.com/">"http://foo.bar.com/"</a>, ".bar.com", True),
++            (<a class="moz-txt-link-rfc2396E" href="http://foo.bar.com/">"http://foo.bar.com/"</a>, "bar.com", True),
+             (<a class="moz-txt-link-rfc2396E" href="http://foo.bar.com/">"http://foo.bar.com/"</a>, "com", True),
+             (<a class="moz-txt-link-rfc2396E" href="http://foo.com/">"http://foo.com/"</a>, "rhubarb.foo.com", False),
+             (<a class="moz-txt-link-rfc2396E" href="http://foo.com/">"http://foo.com/"</a>, ".foo.com", True),
+@@ -427,6 +428,8 @@ class CookieTests(unittest.TestCase):
+             (<a class="moz-txt-link-rfc2396E" href="http://foo/">"http://foo/"</a>, "foo", True),
+             (<a class="moz-txt-link-rfc2396E" href="http://foo/">"http://foo/"</a>, "foo.local", True),
+             (<a class="moz-txt-link-rfc2396E" href="http://foo/">"http://foo/"</a>, ".local", True),
++            (<a class="moz-txt-link-rfc2396E" href="http://barfoo.com">"http://barfoo.com"</a>, ".foo.com", False),
++            (<a class="moz-txt-link-rfc2396E" href="http://barfoo.com">"http://barfoo.com"</a>, "foo.com", False),
+             ]:
+             request = urllib.request.Request(url)
+             r = pol.domain_return_ok(domain, request)
+@@ -961,6 +964,33 @@ class CookieTests(unittest.TestCase):
+         c.add_cookie_header(req)
+         self.assertFalse(req.has_header("Cookie"))
+ 
++        c.clear()
++
++        pol.set_blocked_domains([])
++        req = urllib.request.Request(<a class="moz-txt-link-rfc2396E" href="http://acme.com/">"http://acme.com/"</a>)
++        res = FakeResponse(headers, <a class="moz-txt-link-rfc2396E" href="http://acme.com/">"http://acme.com/"</a>)
++        cookies = c.make_cookies(res, req)
++        c.extract_cookies(res, req)
++        self.assertEqual(len(c), 1)
++
++        req = urllib.request.Request(<a class="moz-txt-link-rfc2396E" href="http://acme.com/">"http://acme.com/"</a>)
++        c.add_cookie_header(req)
++        self.assertTrue(req.has_header("Cookie"))
++
++        req = urllib.request.Request(<a class="moz-txt-link-rfc2396E" href="http://badacme.com/">"http://badacme.com/"</a>)
++        c.add_cookie_header(req)
++        self.assertFalse(pol.return_ok(cookies[0], req))
++        self.assertFalse(req.has_header("Cookie"))
++
++        p = pol.set_blocked_domains(["acme.com"])
++        req = urllib.request.Request(<a class="moz-txt-link-rfc2396E" href="http://acme.com/">"http://acme.com/"</a>)
++        c.add_cookie_header(req)
++        self.assertFalse(req.has_header("Cookie"))
++
++        req = urllib.request.Request(<a class="moz-txt-link-rfc2396E" href="http://badacme.com/">"http://badacme.com/"</a>)
++        c.add_cookie_header(req)
++        self.assertFalse(req.has_header("Cookie"))
++
+     def test_secure(self):
+         for ns in True, False:
+             for whitespace in " ", "":
+diff --git a/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst b/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst
+new file mode 100644
+index 0000000000..d2eb8f1f35
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst
+@@ -0,0 +1,4 @@
++Don't send cookies of domain A without Domain attribute to domain B
++when domain A is a suffix match of domain B while using a cookiejar
++with :class:`http.cookiejar.DefaultCookiePolicy` policy. Patch by
++Karthikeyan Singaravelan.
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/python/python3/CVE-2019-9636.patch b/meta/recipes-devtools/python/python3/CVE-2019-9636.patch
new file mode 100644
index 0000000..ce8eb66
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2019-9636.patch
@@ -0,0 +1,154 @@
+From b0305339567b64e07df87620e97e4cb99332aef6 Mon Sep 17 00:00:00 2001
+From: Steve Dower <a class="moz-txt-link-rfc2396E" href="mailto:steve.dower@microsoft.com">&lt;steve.dower@microsoft.com&gt;</a>
+Date: Sun, 10 Mar 2019 21:59:24 -0700
+Subject: [PATCH] bpo-36216: Add check for characters in netloc that normalize
+ to separators (GH-12201) (#12223)
+
+CVE: CVE-2019-9636
+Upstream-Status: Backport
+[<a class="moz-txt-link-freetext" href="https://github.com/python/cpython/commit/c0d95113b070799679bcb9dc49d4960d82e8bb08">https://github.com/python/cpython/commit/c0d95113b070799679bcb9dc49d4960d82e8bb08</a>]
+
+Signed-off-by: Dan Tran <a class="moz-txt-link-rfc2396E" href="mailto:dantran@microsoft.com">&lt;dantran@microsoft.com&gt;</a>
+---
+ Doc/library/urllib.parse.rst                  | 18 +++++++++++++++
+ Lib/test/test_urlparse.py                     | 23 +++++++++++++++++++
+ Lib/urllib/parse.py                           | 17 ++++++++++++++
+ .../2019-03-06-09-38-40.bpo-36216.6q1m4a.rst  |  3 +++
+ 4 files changed, 61 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
+
+diff --git a/Doc/library/urllib.parse.rst b/Doc/library/urllib.parse.rst
+index 6f722a8897..a4c6b6726e 100644
+--- a/Doc/library/urllib.parse.rst
++++ b/Doc/library/urllib.parse.rst
+@@ -120,6 +120,11 @@ or on combining URL components into a URL string.
+    Unmatched square brackets in the :attr:`netloc` attribute will raise a
+    :exc:`ValueError`.
+ 
++   Characters in the :attr:`netloc` attribute that decompose under NFKC
++   normalization (as used by the IDNA encoding) into any of ``/``, ``?``,
++   ``#``, ``@``, or ``:`` will raise a :exc:`ValueError`. If the URL is
++   decomposed before parsing, no error will be raised.
++
+    .. versionchanged:: 3.2
+       Added IPv6 URL parsing capabilities.
+ 
+@@ -128,6 +133,10 @@ or on combining URL components into a URL string.
+       false), in accordance with :rfc:`3986`.  Previously, a whitelist of
+       schemes that support fragments existed.
+ 
++   .. versionchanged:: 3.5.7
++      Characters that affect netloc parsing under NFKC normalization will
++      now raise :exc:`ValueError`.
++
+ 
+ .. function:: parse_qs(qs, keep_blank_values=False, strict_parsing=False, encoding='utf-8', errors='replace')
+ 
+@@ -236,6 +245,15 @@ or on combining URL components into a URL string.
+    Unmatched square brackets in the :attr:`netloc` attribute will raise a
+    :exc:`ValueError`.
+ 
++   Characters in the :attr:`netloc` attribute that decompose under NFKC
++   normalization (as used by the IDNA encoding) into any of ``/``, ``?``,
++   ``#``, ``@``, or ``:`` will raise a :exc:`ValueError`. If the URL is
++   decomposed before parsing, no error will be raised.
++
++   .. versionchanged:: 3.5.7
++      Characters that affect netloc parsing under NFKC normalization will
++      now raise :exc:`ValueError`.
++
+ 
+ .. function:: urlunsplit(parts)
+ 
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index e2cf1b7e0f..d0420b0e74 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -1,3 +1,5 @@
++import sys
++import unicodedata
+ import unittest
+ import urllib.parse
+ 
+@@ -970,6 +972,27 @@ class UrlParseTestCase(unittest.TestCase):
+                 expected.append(name)
+         self.assertCountEqual(urllib.parse.__all__, expected)
+ 
++    def test_urlsplit_normalization(self):
++        # Certain characters should never occur in the netloc,
++        # including under normalization.
++        # Ensure that ALL of them are detected and cause an error
++        illegal_chars = '/:#?@'
++        hex_chars = {'{:04X}'.format(ord(c)) for c in illegal_chars}
++        denorm_chars = [
++            c for c in map(chr, range(128, sys.maxunicode))
++            if (hex_chars &amp; set(unicodedata.decomposition(c).split()))
++            and c not in illegal_chars
++        ]
++        # Sanity check that we found at least one such character
++        self.assertIn('\u2100', denorm_chars)
++        self.assertIn('\uFF03', denorm_chars)
++
++        for scheme in ["http", "https", "ftp"]:
++            for c in denorm_chars:
++                url = "{}://netloc{}false.netloc/path".format(scheme, c)
++                with self.subTest(url=url, char='{:04X}'.format(ord(c))):
++                    with self.assertRaises(ValueError):
++                        urllib.parse.urlsplit(url)
+ 
+ class Utility_Tests(unittest.TestCase):
+     """Testcase to test the various utility functions in the urllib."""
+diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
+index 62e8ddf04b..7ba2b445f5 100644
+--- a/Lib/urllib/parse.py
++++ b/Lib/urllib/parse.py
+@@ -327,6 +327,21 @@ def _splitnetloc(url, start=0):
+             delim = min(delim, wdelim)     # use earliest delim position
+     return url[start:delim], url[delim:]   # return (domain, rest)
+ 
++def _checknetloc(netloc):
++    if not netloc or not any(ord(c) &gt; 127 for c in netloc):
++        return
++    # looking for characters like \u2100 that expand to 'a/c'
++    # IDNA uses NFKC equivalence, so normalize for this check
++    import unicodedata
++    netloc2 = unicodedata.normalize('NFKC', netloc)
++    if netloc == netloc2:
++        return
++    _, _, netloc = netloc.rpartition('@') # anything to the left of '@' is okay
++    for c in '/?#@:':
++        if c in netloc2:
++            raise ValueError("netloc '" + netloc2 + "' contains invalid " +
++                             "characters under NFKC normalization")
++
+ def urlsplit(url, scheme='', allow_fragments=True):
+     """Parse a URL into 5 components:
+     &lt;scheme&gt;://&lt;netloc&gt;/&lt;path&gt;?&lt;query&gt;#&lt;fragment&gt;
+@@ -356,6 +371,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
+                 url, fragment = url.split('#', 1)
+             if '?' in url:
+                 url, query = url.split('?', 1)
++            _checknetloc(netloc)
+             v = SplitResult(scheme, netloc, url, query, fragment)
+             _parse_cache[key] = v
+             return _coerce_result(v)
+@@ -379,6 +395,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
+         url, fragment = url.split('#', 1)
+     if '?' in url:
+         url, query = url.split('?', 1)
++    _checknetloc(netloc)
+     v = SplitResult(scheme, netloc, url, query, fragment)
+     _parse_cache[key] = v
+     return _coerce_result(v)
+diff --git a/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
+new file mode 100644
+index 0000000000..5546394157
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
+@@ -0,0 +1,3 @@
++Changes urlsplit() to raise ValueError when the URL contains characters that
++decompose under IDNA encoding (NFKC-normalization) into characters that
++affect how the URL is parsed.
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/python/python3/CVE-2019-9740.patch b/meta/recipes-devtools/python/python3/CVE-2019-9740.patch
new file mode 100644
index 0000000..d223058
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2019-9740.patch
@@ -0,0 +1,160 @@
+From 5db6dd393a113012abc6d730a46eb4ba2e04468f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <a class="moz-txt-link-rfc2396E" href="mailto:miro@hroncok.cz">&lt;miro@hroncok.cz&gt;</a>
+Date: Sun, 14 Jul 2019 11:07:11 +0200
+Subject: [PATCH] bpo-30458: Disallow control chars in http URLs. (GH-12755)
+ (#13207)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Disallow control chars in http URLs in urllib.urlopen.  This addresses a potential security problem for applications that do not sanity check their URLs where http request headers could be injected.
+
+Disable https related urllib tests on a build without ssl (GH-13032)
+These tests require an SSL enabled build. Skip these tests when python is built without SSL to fix test failures.
+
+Use http.client.InvalidURL instead of ValueError as the new error case's exception. (GH-13044)
+
+Co-Authored-By: Miro Hrončok <a class="moz-txt-link-rfc2396E" href="mailto:miro@hroncok.cz">&lt;miro@hroncok.cz&gt;</a>
+
+CVE: CVE-2019-9740 CVE-2019-9747
+Upstream-Status: Backport
+[<a class="moz-txt-link-freetext" href="https://github.com/python/cpython/commit/afe3a4975cf93c97e5d6eb8800e48f368011d37a">https://github.com/python/cpython/commit/afe3a4975cf93c97e5d6eb8800e48f368011d37a</a>]
+
+Signed-off-by: Dan Tran <a class="moz-txt-link-rfc2396E" href="mailto:dantran@microsoft.com">&lt;dantran@microsoft.com&gt;</a>
+---
+ Lib/http/client.py                            | 16 ++++++
+ Lib/test/test_urllib.py                       | 55 +++++++++++++++++++
+ Lib/test/test_xmlrpc.py                       |  8 ++-
+ .../2019-04-10-08-53-30.bpo-30458.51E-DA.rst  |  1 +
+ 4 files changed, 79 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
+
+diff --git a/Lib/http/client.py b/Lib/http/client.py
+index 352c1017ad..76b9be69a3 100644
+--- a/Lib/http/client.py
++++ b/Lib/http/client.py
+@@ -141,6 +141,16 @@ _MAXHEADERS = 100
+ _is_legal_header_name = re.compile(rb'[^:\s][^:\r\n]*').fullmatch
+ _is_illegal_header_value = re.compile(rb'\n(?![ \t])|\r(?![ \t\n])').search
+ 
++# These characters are not allowed within HTTP URL paths.
++#  See <a class="moz-txt-link-freetext" href="https://tools.ietf.org/html/rfc3986#section-3.3">https://tools.ietf.org/html/rfc3986#section-3.3</a> and the
++#  <a class="moz-txt-link-freetext" href="https://tools.ietf.org/html/rfc3986#appendix-A">https://tools.ietf.org/html/rfc3986#appendix-A</a> pchar definition.
++# Prevents CVE-2019-9740.  Includes control characters such as \r\n.
++# We don't restrict chars above \x7f as putrequest() limits us to ASCII.
++_contains_disallowed_url_pchar_re = re.compile('[\x00-\x20\x7f]')
++# Arguably only these _should_ allowed:
++#  _is_allowed_url_pchars_re = re.compile(r<a class="moz-txt-link-rfc2396E" href="mailto:^[/!$&amp;'()*+,;=:@%a-zA-Z0-9._~-]+$">"^[/!$&amp;'()*+,;=:@%a-zA-Z0-9._~-]+$"</a>)
++# We are more lenient for assumed real world compatibility purposes.
++
+ # We always set the Content-Length header for these methods because some
+ # servers will otherwise respond with a 411
+ _METHODS_EXPECTING_BODY = {'PATCH', 'POST', 'PUT'}
+@@ -978,6 +988,12 @@ class HTTPConnection:
+         self._method = method
+         if not url:
+             url = '/'
++        # Prevent CVE-2019-9740.
++        match = _contains_disallowed_url_pchar_re.search(url)
++        if match:
++            raise InvalidURL("URL can't contain control characters. {!r} "
++                             "(found at least {!r})".format(url,
++                                                            match.group()))
+         request = '%s %s %s' % (method, url, self._http_vsn_str)
+ 
+         # Non-ASCII characters should have been eliminated earlier
+diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
+index 1a28c9a21d..5deb5339de 100644
+--- a/Lib/test/test_urllib.py
++++ b/Lib/test/test_urllib.py
+@@ -329,6 +329,61 @@ class urlopen_HttpTests(unittest.TestCase, FakeHTTPMixin, FakeFTPMixin):
+         finally:
+             self.unfakehttp()
+ 
++    @unittest.skipUnless(ssl, "ssl module required")
++    def test_url_with_control_char_rejected(self):
++        for char_no in list(range(0, 0x21)) + [0x7f]:
++            char = chr(char_no)
++            schemeless_url = "//localhost:7777/test{}/".format(char)
++            self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
++            try:
++                # We explicitly test urllib.request.urlopen() instead of the top
++                # level 'def urlopen()' function defined in this... (quite ugly)
++                # test suite.  They use different url opening codepaths.  Plain
++                # urlopen uses FancyURLOpener which goes via a codepath that
++                # calls urllib.parse.quote() on the URL which makes all of the
++                # above attempts at injection within the url _path_ safe.
++                escaped_char_repr = repr(char).replace('\\', r'\\')
++                InvalidURL = http.client.InvalidURL
++                with self.assertRaisesRegex(
++                    InvalidURL,
++                    "contain control.*{}".format(escaped_char_repr)):
++                    urllib.request.urlopen(<a class="moz-txt-link-rfc2396E" href="http:{}">"http:{}"</a>.format(schemeless_url))
++                with self.assertRaisesRegex(
++                    InvalidURL,
++                    "contain control.*{}".format(escaped_char_repr)):
++                    urllib.request.urlopen(<a class="moz-txt-link-rfc2396E" href="https:{}">"https:{}"</a>.format(schemeless_url))
++                # This code path quotes the URL so there is no injection.
++                resp = urlopen(<a class="moz-txt-link-rfc2396E" href="http:{}">"http:{}"</a>.format(schemeless_url))
++                self.assertNotIn(char, resp.geturl())
++            finally:
++                self.unfakehttp()
++
++    @unittest.skipUnless(ssl, "ssl module required")
++    def test_url_with_newline_header_injection_rejected(self):
++        self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
++        host = "localhost:7777?a=1 HTTP/1.1\r\nX-injected: header\r\nTEST: 123"
++        schemeless_url = "//" + host + ":8080/test/?test=a"
++        try:
++            # We explicitly test urllib.request.urlopen() instead of the top
++            # level 'def urlopen()' function defined in this... (quite ugly)
++            # test suite.  They use different url opening codepaths.  Plain
++            # urlopen uses FancyURLOpener which goes via a codepath that
++            # calls urllib.parse.quote() on the URL which makes all of the
++            # above attempts at injection within the url _path_ safe.
++            InvalidURL = http.client.InvalidURL
++            with self.assertRaisesRegex(
++                InvalidURL, r"contain control.*\\r.*(found at least . .)"):
++                urllib.request.urlopen(<a class="moz-txt-link-rfc2396E" href="http:{}">"http:{}"</a>.format(schemeless_url))
++            with self.assertRaisesRegex(InvalidURL, r"contain control.*\\n"):
++                urllib.request.urlopen(<a class="moz-txt-link-rfc2396E" href="https:{}">"https:{}"</a>.format(schemeless_url))
++            # This code path quotes the URL so there is no injection.
++            resp = urlopen(<a class="moz-txt-link-rfc2396E" href="http:{}">"http:{}"</a>.format(schemeless_url))
++            self.assertNotIn(' ', resp.geturl())
++            self.assertNotIn('\r', resp.geturl())
++            self.assertNotIn('\n', resp.geturl())
++        finally:
++            self.unfakehttp()
++
+     def test_read_0_9(self):
+         # "0.9" response accepted (but not "simple responses" without
+         # a status line)
+diff --git a/Lib/test/test_xmlrpc.py b/Lib/test/test_xmlrpc.py
+index c2de057ecb..99e510fcee 100644
+--- a/Lib/test/test_xmlrpc.py
++++ b/Lib/test/test_xmlrpc.py
+@@ -896,7 +896,13 @@ class SimpleServerTestCase(BaseServerTestCase):
+     def test_partial_post(self):
+         # Check that a partial POST doesn't make the server loop: issue #14001.
+         conn = http.client.HTTPConnection(ADDR, PORT)
+-        conn.request('POST', '/RPC2 HTTP/1.0\r\nContent-Length: 100\r\n\r\nbye')
++        conn.send('POST /RPC2 HTTP/1.0\r\n'
++                  'Content-Length: 100\r\n\r\n'
++                  'bye HTTP/1.1\r\n'
++                  'Host: {}:{}\r\n'
++                  'Accept-Encoding: identity\r\n'
++                  'Content-Length: 0\r\n\r\n'
++                  .format(ADDR, PORT).encode('ascii'))
+         conn.close()
+ 
+     def test_context_manager(self):
+diff --git a/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst b/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
+new file mode 100644
+index 0000000000..ed8027fb4d
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
+@@ -0,0 +1 @@
++Address CVE-2019-9740 by disallowing URL paths with embedded whitespace or control characters through into the underlying http client request.  Such potentially malicious header injection URLs now cause an http.client.InvalidURL exception to be raised.
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 6aa6df6..262f91f 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -43,6 +43,11 @@ SRC_URI += "\
             <a class="moz-txt-link-freetext" href="file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch">file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch</a> \
             <a class="moz-txt-link-freetext" href="file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch">file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch</a> \
             <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
+            <a class="moz-txt-link-freetext" href="file://CVE-2018-14647.patch">file://CVE-2018-14647.patch</a> \
+            <a class="moz-txt-link-freetext" href="file://CVE-2018-20406.patch">file://CVE-2018-20406.patch</a> \
+            <a class="moz-txt-link-freetext" href="file://CVE-2018-20852.patch">file://CVE-2018-20852.patch</a> \
+            <a class="moz-txt-link-freetext" href="file://CVE-2019-9636.patch">file://CVE-2019-9636.patch</a> \
+            <a class="moz-txt-link-freetext" href="file://CVE-2019-9740.patch">file://CVE-2019-9740.patch</a> \ 
            "
 
 inherit multilib_header python3native update-alternatives qemu ptest
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------E93AB25E463777C1E3AA7544--
