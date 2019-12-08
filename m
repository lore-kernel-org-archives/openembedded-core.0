Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id AC4A77F7C3
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2019 21:37:14 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id s35so4945180pjb.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Dec 2019 13:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=4bUBWk1NWMaEzlk/z61L+iU0Hcwx6zSVOGnjRu3E49k=;
	b=THp5AS73dq4w4aokVw9YrSIhIGcCvnm4xDagc0saIfUzrduAr1eX26sXzXqBfR6SQ5
	vKw1SjlSXf/k7eqQEiMPF7Z1CaYHm4ftjoV8v844aYxkBXevb50LfYPRmKEvbiV1h5Rc
	FI+1ThyFFx9KlUAq1QKUCAGXXHl+Wik6ULS96un3xRAiKpqv23kQqM/iyfIhoU8TYyPy
	HXLMOdNv/osthkl6FVH+pxywhM51D3g7ACC4ZcoCFT5GC+g/FyevnyJY8upQJfkgULfR
	yEoMGbonwfq+1b1h0bchItiiU8Sam3xbzoWgrjVwoEDcFEPwcDB9nlELpMQFDJInem2V
	BEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=4bUBWk1NWMaEzlk/z61L+iU0Hcwx6zSVOGnjRu3E49k=;
	b=lpLlM15yIaXkjgzVwZRZEqJg4+g5ZSjCc/QlhTEq6im3hDZKr9+JWa20l2IQ56aZwv
	5rSacYtIfvx35FttGp8etpP+9DT9GZhh70xSdKY42a+F5KSyT/K6tJGO0M3PkHttehes
	61zQCNW1DbB9U0c9LY9Rjzu9i0FoRuv9kr3FAMsXFc0KewwdrR2NWI7WpYJ1Gz7tpIJl
	FpBIgHVVP743u24jfMLTC20vwOXPlj7UGvHwPwIn6LW5RSOpRqSRrRBdDqnSm0W94mHc
	hCCvUdRMUUlonPR50razyhlyACz40Jb1JTHk7k45EzOh3Rd9Nhq4L66VOtZrSE2sfxrh
	uwPw==
X-Gm-Message-State: APjAAAW84qYVBix1KL+Q4jCS/H8x5zONaz3TklFvv9P0ywgOdOIw6wBN
	d5efpjxGxHWBTV+Pq1dtZyO4oVYqmbs=
X-Google-Smtp-Source: APXvYqxJcB4tFdFwiTyjAlhnT9XpoqjlhgBw8GnF3NC/XNeRe8Q8M5K3biiy3bvcoeIChGDxzKwGBQ==
X-Received: by 2002:a17:902:904b:: with SMTP id
	w11mr22075030plz.204.1575841035091; 
	Sun, 08 Dec 2019 13:37:15 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:8551:ea9:91ad:87f7?
	([2601:202:4180:a5c0:8551:ea9:91ad:87f7])
	by smtp.gmail.com with ESMTPSA id
	q7sm24339142pfb.44.2019.12.08.13.37.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Dec 2019 13:37:14 -0800 (PST)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20191205144551.26888-1-ross.burton@intel.com>
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
Message-ID: <b0e36eed-340b-7c1b-bcc3-5f4e302c737b@gmail.com>
Date: Sun, 8 Dec 2019 13:37:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191205144551.26888-1-ross.burton@intel.com>
Subject: Re: [PATCH][thud] glibc: finish incomplete fix for CVE-2016-10739
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
X-List-Received-Date: Sun, 08 Dec 2019 21:37:14 -0000
Content-Type: multipart/alternative;
	boundary="------------2EA449D53ACDF3492EC8DF5F"
Content-Language: en-US

--------------2EA449D53ACDF3492EC8DF5F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 12/5/19 6:45 AM, Ross Burton wrote:
> Somehow the patch for this CVE only included one of the four required patches.

fails:

Applying patch CVE-2016-10739.patch
patching file resolv/inet_addr.c
patching file resolv/nss_dns/dns-host.c
patching file NEWS
Hunk #1 FAILED at 10.
Hunk #2 succeeded at 18 with fuzz 2 (offset -39 lines).
1 out of 2 hunks FAILED -- rejects in file NEWS
patching file include/arpa/inet.h
patching file nscd/gai.c
patching file nscd/gethstbynm3_r.c
patching file nss/digits_dots.c
patching file resolv/Makefile
patching file resolv/Versions
patching file resolv/inet_addr.c
patching file resolv/res_init.c
patching file resolv/tst-aton.c
patching file resolv/tst-inet_aton_exact.c
patching file resolv/tst-resolv-nondecimal.c
patching file resolv/tst-resolv-trailing.c
patching file sysdeps/posix/getaddrinfo.c
patching file nscd/Makefile
patching file nscd/gai.c
patching file nscd/nscd-inet_addr.c
Patch CVE-2016-10739.patch does not apply (enforce with -f)


https://errors.yoctoproject.org/Errors/Details/296402/
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../glibc/glibc/CVE-2016-10739.patch          | 932 +++++++++++++++++-
>  1 file changed, 929 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2016-10739.patch b/meta/recipes-core/glibc/glibc/CVE-2016-10739.patch
> index 7eb55d6663d..871627da195 100644
> --- a/meta/recipes-core/glibc/glibc/CVE-2016-10739.patch
> +++ b/meta/recipes-core/glibc/glibc/CVE-2016-10739.patch
> @@ -5,12 +5,12 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
>  From 8e92ca5dd7a7e38a4dddf1ebc4e1e8f0cb27e4aa Mon Sep 17 00:00:00 2001
>  From: Florian Weimer <fweimer@redhat.com>
>  Date: Mon, 21 Jan 2019 08:59:42 +0100
> -Subject: [PATCH] resolv: Reformat inet_addr, inet_aton to GNU style
> +Subject: [PATCH 1/4] resolv: Reformat inet_addr, inet_aton to GNU style
>  
>  (cherry picked from commit 5e30b8ef0758763effa115634e0ed7d8938e4bc0)
>  ---
>   ChangeLog          |   5 ++
> - resolv/inet_addr.c | 192 ++++++++++++++++++++++++++++-------------------------
> + resolv/inet_addr.c | 192 ++++++++++++++++++++++++---------------------
>   2 files changed, 106 insertions(+), 91 deletions(-)
>  
>  diff --git a/resolv/inet_addr.c b/resolv/inet_addr.c
> @@ -229,4 +229,930 @@ index 022f7ea084..32f58b0e13 100644
>   weak_alias (__inet_aton, inet_aton)
>   libc_hidden_def (__inet_aton)
>  -- 
> -2.11.0
> +2.20.1
> +
> +
> +From 37edf1d3f8ab9adefb61cc466ac52b53114fbd5b Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Mon, 21 Jan 2019 09:26:41 +0100
> +Subject: [PATCH 2/4] resolv: Do not send queries for non-host-names in nss_dns
> + [BZ #24112]
> +
> +Before this commit, nss_dns would send a query which did not contain a
> +host name as the query name (such as invalid\032name.example.com) and
> +then reject the answer in getanswer_r and gaih_getanswer_slice, using
> +a check based on res_hnok.  With this commit, no query is sent, and a
> +host-not-found error is returned to NSS without network interaction.
> +
> +(cherry picked from commit 6ca53a2453598804a2559a548a08424fca96434a)
> +---
> + ChangeLog                 |  9 +++++++++
> + resolv/nss_dns/dns-host.c | 24 ++++++++++++++++++++++--
> + 2 files changed, 31 insertions(+), 2 deletions(-)
> +
> +diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
> +index 5dc2829cd1..99c3b61e1c 100644
> +--- a/resolv/nss_dns/dns-host.c
> ++++ b/resolv/nss_dns/dns-host.c
> +@@ -274,11 +274,26 @@ gethostbyname3_context (struct resolv_context *ctx,
> +   return status;
> + }
> + 
> ++/* Verify that the name looks like a host name.  There is no point in
> ++   sending a query which will not produce a usable name in the
> ++   response.  */
> ++static enum nss_status
> ++check_name (const char *name, int *h_errnop)
> ++{
> ++  if (res_hnok (name))
> ++    return NSS_STATUS_SUCCESS;
> ++  *h_errnop = HOST_NOT_FOUND;
> ++  return NSS_STATUS_NOTFOUND;
> ++}
> ++
> + enum nss_status
> + _nss_dns_gethostbyname2_r (const char *name, int af, struct hostent *result,
> + 			   char *buffer, size_t buflen, int *errnop,
> + 			   int *h_errnop)
> + {
> ++  enum nss_status status = check_name (name, h_errnop);
> ++  if (status != NSS_STATUS_SUCCESS)
> ++    return status;
> +   return _nss_dns_gethostbyname3_r (name, af, result, buffer, buflen, errnop,
> + 				    h_errnop, NULL, NULL);
> + }
> +@@ -289,6 +304,9 @@ _nss_dns_gethostbyname_r (const char *name, struct hostent *result,
> + 			  char *buffer, size_t buflen, int *errnop,
> + 			  int *h_errnop)
> + {
> ++  enum nss_status status = check_name (name, h_errnop);
> ++  if (status != NSS_STATUS_SUCCESS)
> ++    return status;
> +   struct resolv_context *ctx = __resolv_context_get ();
> +   if (ctx == NULL)
> +     {
> +@@ -296,7 +314,7 @@ _nss_dns_gethostbyname_r (const char *name, struct hostent *result,
> +       *h_errnop = NETDB_INTERNAL;
> +       return NSS_STATUS_UNAVAIL;
> +     }
> +-  enum nss_status status = NSS_STATUS_NOTFOUND;
> ++  status = NSS_STATUS_NOTFOUND;
> +   if (res_use_inet6 ())
> +     status = gethostbyname3_context (ctx, name, AF_INET6, result, buffer,
> + 				     buflen, errnop, h_errnop, NULL, NULL);
> +@@ -313,6 +331,9 @@ _nss_dns_gethostbyname4_r (const char *name, struct gaih_addrtuple **pat,
> + 			   char *buffer, size_t buflen, int *errnop,
> + 			   int *herrnop, int32_t *ttlp)
> + {
> ++  enum nss_status status = check_name (name, herrnop);
> ++  if (status != NSS_STATUS_SUCCESS)
> ++    return status;
> +   struct resolv_context *ctx = __resolv_context_get ();
> +   if (ctx == NULL)
> +     {
> +@@ -347,7 +368,6 @@ _nss_dns_gethostbyname4_r (const char *name, struct gaih_addrtuple **pat,
> +   int ans2p_malloced = 0;
> + 
> +   int olderr = errno;
> +-  enum nss_status status;
> +   int n = __res_context_search (ctx, name, C_IN, T_QUERY_A_AND_AAAA,
> + 				host_buffer.buf->buf, 2048, &host_buffer.ptr,
> + 				&ans2p, &nans2p, &resplen2, &ans2p_malloced);
> +-- 
> +2.20.1
> +
> +
> +From 2373941bd73cb288c8a42a33e23e7f7bb81151e7 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Mon, 21 Jan 2019 21:26:03 +0100
> +Subject: [PATCH 3/4] CVE-2016-10739: getaddrinfo: Fully parse IPv4 address
> + strings [BZ #20018]
> +
> +The IPv4 address parser in the getaddrinfo function is changed so that
> +it does not ignore trailing whitespace and all characters after it.
> +For backwards compatibility, the getaddrinfo function still recognizes
> +legacy name syntax, such as 192.000.002.010 interpreted as 192.0.2.8
> +(octal).
> +
> +This commit does not change the behavior of inet_addr and inet_aton.
> +gethostbyname already had additional sanity checks (but is switched
> +over to the new __inet_aton_exact function for completeness as well).
> +
> +To avoid sending the problematic query names over DNS, commit
> +6ca53a2453598804a2559a548a08424fca96434a ("resolv: Do not send queries
> +for non-host-names in nss_dns [BZ #24112]") is needed.
> +
> +(cherry picked from commit 108bc4049f8ae82710aec26a92ffdb4b439c83fd)
> +---
> + ChangeLog                      |  33 ++++++++
> + NEWS                           |   4 +
> + include/arpa/inet.h            |   6 +-
> + nscd/gai.c                     |   1 -
> + nscd/gethstbynm3_r.c           |   2 -
> + nss/digits_dots.c              |   3 +-
> + resolv/Makefile                |   7 ++
> + resolv/Versions                |   1 +
> + resolv/inet_addr.c             |  62 ++++++++++-----
> + resolv/res_init.c              |  17 ++--
> + resolv/tst-aton.c              |  35 +++++++--
> + resolv/tst-inet_aton_exact.c   |  47 +++++++++++
> + resolv/tst-resolv-nondecimal.c | 139 +++++++++++++++++++++++++++++++++
> + resolv/tst-resolv-trailing.c   | 136 ++++++++++++++++++++++++++++++++
> + sysdeps/posix/getaddrinfo.c    |   2 +-
> + 15 files changed, 455 insertions(+), 40 deletions(-)
> + create mode 100644 resolv/tst-inet_aton_exact.c
> + create mode 100644 resolv/tst-resolv-nondecimal.c
> + create mode 100644 resolv/tst-resolv-trailing.c
> +
> +diff --git a/NEWS b/NEWS
> +index 0e58ca8904..a1af88e193 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -10,6 +10,7 @@ Version 2.28.1
> + The following bugs are resolved with this release:
> + 
> +   [19444] build failures with -O1 due to -Wmaybe-uninitialized
> ++  [20018] getaddrinfo should reject IP addresses with trailing characters
> +   [20209] localedata: Spelling mistake for Sunday in Greenlandic kl_GL
> +   [22927] libanl: properly cleanup if first helper thread creation failed
> +   [23400] stdlib/test-bz22786.c creates temporary files in glibc source tree
> +@@ -57,6 +58,9 @@ Security related changes:
> +   memcmp gave the wrong result since it treated the size argument as
> +   zero.  Reported by H.J. Lu.
> + 
> ++  CVE-2016-10739: The getaddrinfo function could successfully parse IPv4
> ++  addresses with arbitrary trailing characters, potentially leading to data
> ++  or command injection issues in applications.
> + 
> + Version 2.28
> + 
> +diff --git a/include/arpa/inet.h b/include/arpa/inet.h
> +index c3f28f2baa..19aec74275 100644
> +--- a/include/arpa/inet.h
> ++++ b/include/arpa/inet.h
> +@@ -1,10 +1,10 @@
> + #include <inet/arpa/inet.h>
> + 
> + #ifndef _ISOMAC
> +-extern int __inet_aton (const char *__cp, struct in_addr *__inp);
> +-libc_hidden_proto (__inet_aton)
> ++/* Variant of inet_aton which rejects trailing garbage.  */
> ++extern int __inet_aton_exact (const char *__cp, struct in_addr *__inp);
> ++libc_hidden_proto (__inet_aton_exact)
> + 
> +-libc_hidden_proto (inet_aton)
> + libc_hidden_proto (inet_ntop)
> + libc_hidden_proto (inet_pton)
> + extern __typeof (inet_pton) __inet_pton;
> +diff --git a/nscd/gai.c b/nscd/gai.c
> +index 24bdfee1db..f57f396f57 100644
> +--- a/nscd/gai.c
> ++++ b/nscd/gai.c
> +@@ -19,7 +19,6 @@
> + 
> + /* This file uses the getaddrinfo code but it compiles it without NSCD
> +    support.  We just need a few symbol renames.  */
> +-#define __inet_aton inet_aton
> + #define __ioctl ioctl
> + #define __getsockname getsockname
> + #define __socket socket
> +diff --git a/nscd/gethstbynm3_r.c b/nscd/gethstbynm3_r.c
> +index 7beb9dce9f..f792c4fcd0 100644
> +--- a/nscd/gethstbynm3_r.c
> ++++ b/nscd/gethstbynm3_r.c
> +@@ -38,8 +38,6 @@
> + #define HAVE_LOOKUP_BUFFER	1
> + #define HAVE_AF			1
> + 
> +-#define __inet_aton inet_aton
> +-
> + /* We are nscd, so we don't want to be talking to ourselves.  */
> + #undef	USE_NSCD
> + 
> +diff --git a/nss/digits_dots.c b/nss/digits_dots.c
> +index 39bff38865..5441bce16e 100644
> +--- a/nss/digits_dots.c
> ++++ b/nss/digits_dots.c
> +@@ -29,7 +29,6 @@
> + #include "nsswitch.h"
> + 
> + #ifdef USE_NSCD
> +-# define inet_aton __inet_aton
> + # include <nscd/nscd_proto.h>
> + #endif
> + 
> +@@ -160,7 +159,7 @@ __nss_hostname_digits_dots_context (struct resolv_context *ctx,
> + 		     255.255.255.255?  The test below will succeed
> + 		     spuriously... ???  */
> + 		  if (af == AF_INET)
> +-		    ok = __inet_aton (name, (struct in_addr *) host_addr);
> ++		    ok = __inet_aton_exact (name, (struct in_addr *) host_addr);
> + 		  else
> + 		    {
> + 		      assert (af == AF_INET6);
> +diff --git a/resolv/Makefile b/resolv/Makefile
> +index ea395ac3eb..d36eedd34a 100644
> +--- a/resolv/Makefile
> ++++ b/resolv/Makefile
> +@@ -34,6 +34,9 @@ routines := herror inet_addr inet_ntop inet_pton nsap_addr res_init \
> + tests = tst-aton tst-leaks tst-inet_ntop
> + xtests = tst-leaks2
> + 
> ++tests-internal += tst-inet_aton_exact
> ++
> ++
> + generate := mtrace-tst-leaks.out tst-leaks.mtrace tst-leaks2.mtrace
> + 
> + extra-libs := libresolv libnss_dns
> +@@ -54,8 +57,10 @@ tests += \
> +   tst-resolv-binary \
> +   tst-resolv-edns \
> +   tst-resolv-network \
> ++  tst-resolv-nondecimal \
> +   tst-resolv-res_init-multi \
> +   tst-resolv-search \
> ++  tst-resolv-trailing \
> + 
> + # These tests need libdl.
> + ifeq (yes,$(build-shared))
> +@@ -190,9 +195,11 @@ $(objpfx)tst-resolv-res_init-multi: $(objpfx)libresolv.so \
> +   $(shared-thread-library)
> + $(objpfx)tst-resolv-res_init-thread: $(libdl) $(objpfx)libresolv.so \
> +   $(shared-thread-library)
> ++$(objpfx)tst-resolv-nondecimal: $(objpfx)libresolv.so $(shared-thread-library)
> + $(objpfx)tst-resolv-qtypes: $(objpfx)libresolv.so $(shared-thread-library)
> + $(objpfx)tst-resolv-rotate: $(objpfx)libresolv.so $(shared-thread-library)
> + $(objpfx)tst-resolv-search: $(objpfx)libresolv.so $(shared-thread-library)
> ++$(objpfx)tst-resolv-trailing: $(objpfx)libresolv.so $(shared-thread-library)
> + $(objpfx)tst-resolv-threads: \
> +   $(libdl) $(objpfx)libresolv.so $(shared-thread-library)
> + $(objpfx)tst-resolv-canonname: \
> +diff --git a/resolv/Versions b/resolv/Versions
> +index b05778d965..9a82704af7 100644
> +--- a/resolv/Versions
> ++++ b/resolv/Versions
> +@@ -27,6 +27,7 @@ libc {
> +     __h_errno; __resp;
> + 
> +     __res_iclose;
> ++    __inet_aton_exact;
> +     __inet_pton_length;
> +     __resolv_context_get;
> +     __resolv_context_get_preinit;
> +diff --git a/resolv/inet_addr.c b/resolv/inet_addr.c
> +index 32f58b0e13..41b6166a5b 100644
> +--- a/resolv/inet_addr.c
> ++++ b/resolv/inet_addr.c
> +@@ -96,26 +96,14 @@
> + #include <limits.h>
> + #include <errno.h>
> + 
> +-/* ASCII IPv4 Internet address interpretation routine.  The value
> +-   returned is in network order.  */
> +-in_addr_t
> +-__inet_addr (const char *cp)
> +-{
> +-  struct in_addr val;
> +-
> +-  if (__inet_aton (cp, &val))
> +-    return val.s_addr;
> +-  return INADDR_NONE;
> +-}
> +-weak_alias (__inet_addr, inet_addr)
> +-
> + /* Check whether "cp" is a valid ASCII representation of an IPv4
> +    Internet address and convert it to a binary address.  Returns 1 if
> +    the address is valid, 0 if not.  This replaces inet_addr, the
> +    return value from which cannot distinguish between failure and a
> +-   local broadcast address.  */
> +-int
> +-__inet_aton (const char *cp, struct in_addr *addr)
> ++   local broadcast address.  Write a pointer to the first
> ++   non-converted character to *endp.  */
> ++static int
> ++inet_aton_end (const char *cp, struct in_addr *addr, const char **endp)
> + {
> +   static const in_addr_t max[4] = { 0xffffffff, 0xffffff, 0xffff, 0xff };
> +   in_addr_t val;
> +@@ -180,6 +168,7 @@ __inet_aton (const char *cp, struct in_addr *addr)
> + 
> +   if (addr != NULL)
> +     addr->s_addr = res.word | htonl (val);
> ++  *endp = cp;
> + 
> +   __set_errno (saved_errno);
> +   return 1;
> +@@ -188,6 +177,41 @@ __inet_aton (const char *cp, struct in_addr *addr)
> +   __set_errno (saved_errno);
> +   return 0;
> + }
> +-weak_alias (__inet_aton, inet_aton)
> +-libc_hidden_def (__inet_aton)
> +-libc_hidden_weak (inet_aton)
> ++
> ++int
> ++__inet_aton_exact (const char *cp, struct in_addr *addr)
> ++{
> ++  struct in_addr val;
> ++  const char *endp;
> ++  /* Check that inet_aton_end parsed the entire string.  */
> ++  if (inet_aton_end (cp, &val, &endp) != 0 && *endp == 0)
> ++    {
> ++      *addr = val;
> ++      return 1;
> ++    }
> ++  else
> ++    return 0;
> ++}
> ++libc_hidden_def (__inet_aton_exact)
> ++
> ++/* inet_aton ignores trailing garbage.  */
> ++int
> ++__inet_aton_ignore_trailing (const char *cp, struct in_addr *addr)
> ++{
> ++  const char *endp;
> ++  return  inet_aton_end (cp, addr, &endp);
> ++}
> ++weak_alias (__inet_aton_ignore_trailing, inet_aton)
> ++
> ++/* ASCII IPv4 Internet address interpretation routine.  The value
> ++   returned is in network order.  */
> ++in_addr_t
> ++__inet_addr (const char *cp)
> ++{
> ++  struct in_addr val;
> ++  const char *endp;
> ++  if (inet_aton_end (cp, &val, &endp))
> ++    return val.s_addr;
> ++  return INADDR_NONE;
> ++}
> ++weak_alias (__inet_addr, inet_addr)
> +diff --git a/resolv/res_init.c b/resolv/res_init.c
> +index f5e52cbbb9..94743a252e 100644
> +--- a/resolv/res_init.c
> ++++ b/resolv/res_init.c
> +@@ -399,8 +399,16 @@ res_vinit_1 (FILE *fp, struct resolv_conf_parser *parser)
> +               cp = parser->buffer + sizeof ("nameserver") - 1;
> +               while (*cp == ' ' || *cp == '\t')
> +                 cp++;
> ++
> ++              /* Ignore trailing contents on the name server line.  */
> ++              {
> ++                char *el;
> ++                if ((el = strpbrk (cp, " \t\n")) != NULL)
> ++                  *el = '\0';
> ++              }
> ++
> +               struct sockaddr *sa;
> +-              if ((*cp != '\0') && (*cp != '\n') && __inet_aton (cp, &a))
> ++              if ((*cp != '\0') && (*cp != '\n') && __inet_aton_exact (cp, &a))
> +                 {
> +                   sa = allocate_address_v4 (a, NAMESERVER_PORT);
> +                   if (sa == NULL)
> +@@ -410,9 +418,6 @@ res_vinit_1 (FILE *fp, struct resolv_conf_parser *parser)
> +                 {
> +                   struct in6_addr a6;
> +                   char *el;
> +-
> +-                  if ((el = strpbrk (cp, " \t\n")) != NULL)
> +-                    *el = '\0';
> +                   if ((el = strchr (cp, SCOPE_DELIMITER)) != NULL)
> +                     *el = '\0';
> +                   if ((*cp != '\0') && (__inet_pton (AF_INET6, cp, &a6) > 0))
> +@@ -472,7 +477,7 @@ res_vinit_1 (FILE *fp, struct resolv_conf_parser *parser)
> +                   char separator = *cp;
> +                   *cp = 0;
> +                   struct resolv_sortlist_entry e;
> +-                  if (__inet_aton (net, &a))
> ++                  if (__inet_aton_exact (net, &a))
> +                     {
> +                       e.addr = a;
> +                       if (is_sort_mask (separator))
> +@@ -484,7 +489,7 @@ res_vinit_1 (FILE *fp, struct resolv_conf_parser *parser)
> +                             cp++;
> +                           separator = *cp;
> +                           *cp = 0;
> +-                          if (__inet_aton (net, &a))
> ++                          if (__inet_aton_exact (net, &a))
> +                             e.mask = a.s_addr;
> +                           else
> +                             e.mask = net_mask (e.addr);
> +diff --git a/resolv/tst-aton.c b/resolv/tst-aton.c
> +index 08110a007a..eb734d7758 100644
> +--- a/resolv/tst-aton.c
> ++++ b/resolv/tst-aton.c
> +@@ -1,11 +1,29 @@
> ++/* Test legacy IPv4 text-to-address function inet_aton.
> ++   Copyright (C) 1998-2019 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#include <array_length.h>
> + #include <stdio.h>
> + #include <stdint.h>
> + #include <sys/socket.h>
> + #include <netinet/in.h>
> + #include <arpa/inet.h>
> + 
> +-
> +-static struct tests
> ++static const struct tests
> + {
> +   const char *input;
> +   int valid;
> +@@ -16,6 +34,7 @@ static struct tests
> +   { "-1", 0, 0 },
> +   { "256", 1, 0x00000100 },
> +   { "256.", 0, 0 },
> ++  { "255a", 0, 0 },
> +   { "256a", 0, 0 },
> +   { "0x100", 1, 0x00000100 },
> +   { "0200.0x123456", 1, 0x80123456 },
> +@@ -40,7 +59,12 @@ static struct tests
> +   { "1.2.256.4", 0, 0 },
> +   { "1.2.3.0x100", 0, 0 },
> +   { "323543357756889", 0, 0 },
> +-  { "10.1.2.3.4", 0, 0},
> ++  { "10.1.2.3.4", 0, 0 },
> ++  { "192.0.2.1", 1, 0xc0000201 },
> ++  { "192.0.2.2\nX", 1, 0xc0000202 },
> ++  { "192.0.2.3 Y", 1, 0xc0000203 },
> ++  { "192.0.2.3Z", 0, 0 },
> ++  { "192.000.002.010", 1, 0xc0000208 },
> + };
> + 
> + 
> +@@ -50,7 +74,7 @@ do_test (void)
> +   int result = 0;
> +   size_t cnt;
> + 
> +-  for (cnt = 0; cnt < sizeof (tests) / sizeof (tests[0]); ++cnt)
> ++  for (cnt = 0; cnt < array_length (tests); ++cnt)
> +     {
> +       struct in_addr addr;
> + 
> +@@ -73,5 +97,4 @@ do_test (void)
> +   return result;
> + }
> + 
> +-#define TEST_FUNCTION do_test ()
> +-#include "../test-skeleton.c"
> ++#include <support/test-driver.c>
> +diff --git a/resolv/tst-inet_aton_exact.c b/resolv/tst-inet_aton_exact.c
> +new file mode 100644
> +index 0000000000..0fdfa3d6aa
> +--- /dev/null
> ++++ b/resolv/tst-inet_aton_exact.c
> +@@ -0,0 +1,47 @@
> ++/* Test internal legacy IPv4 text-to-address function __inet_aton_exact.
> ++   Copyright (C) 2019 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#include <arpa/inet.h>
> ++#include <support/check.h>
> ++
> ++static int
> ++do_test (void)
> ++{
> ++  struct in_addr addr = { };
> ++
> ++  TEST_COMPARE (__inet_aton_exact ("192.0.2.1", &addr), 1);
> ++  TEST_COMPARE (ntohl (addr.s_addr), 0xC0000201);
> ++
> ++  TEST_COMPARE (__inet_aton_exact ("192.000.002.010", &addr), 1);
> ++  TEST_COMPARE (ntohl (addr.s_addr), 0xC0000208);
> ++  TEST_COMPARE (__inet_aton_exact ("0xC0000234", &addr), 1);
> ++  TEST_COMPARE (ntohl (addr.s_addr), 0xC0000234);
> ++
> ++  /* Trailing content is not accepted.  */
> ++  TEST_COMPARE (__inet_aton_exact ("192.0.2.2X", &addr), 0);
> ++  TEST_COMPARE (__inet_aton_exact ("192.0.2.3 Y", &addr), 0);
> ++  TEST_COMPARE (__inet_aton_exact ("192.0.2.4\nZ", &addr), 0);
> ++  TEST_COMPARE (__inet_aton_exact ("192.0.2.5\tT", &addr), 0);
> ++  TEST_COMPARE (__inet_aton_exact ("192.0.2.6 Y", &addr), 0);
> ++  TEST_COMPARE (__inet_aton_exact ("192.0.2.7\n", &addr), 0);
> ++  TEST_COMPARE (__inet_aton_exact ("192.0.2.8\t", &addr), 0);
> ++
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> +diff --git a/resolv/tst-resolv-nondecimal.c b/resolv/tst-resolv-nondecimal.c
> +new file mode 100644
> +index 0000000000..a0df6f332a
> +--- /dev/null
> ++++ b/resolv/tst-resolv-nondecimal.c
> +@@ -0,0 +1,139 @@
> ++/* Test name resolution behavior for octal, hexadecimal IPv4 addresses.
> ++   Copyright (C) 2019 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#include <netdb.h>
> ++#include <stdlib.h>
> ++#include <support/check.h>
> ++#include <support/check_nss.h>
> ++#include <support/resolv_test.h>
> ++#include <support/support.h>
> ++
> ++static void
> ++response (const struct resolv_response_context *ctx,
> ++          struct resolv_response_builder *b,
> ++          const char *qname, uint16_t qclass, uint16_t qtype)
> ++{
> ++  /* The tests are not supposed send any DNS queries.  */
> ++  FAIL_EXIT1 ("unexpected DNS query for %s/%d/%d", qname, qclass, qtype);
> ++}
> ++
> ++static void
> ++run_query_addrinfo (const char *query, const char *address)
> ++{
> ++  char *quoted_query = support_quote_string (query);
> ++
> ++  struct addrinfo *ai;
> ++  struct addrinfo hints =
> ++    {
> ++     .ai_socktype = SOCK_STREAM,
> ++     .ai_protocol = IPPROTO_TCP,
> ++    };
> ++
> ++  char *context = xasprintf ("getaddrinfo \"%s\" AF_INET", quoted_query);
> ++  char *expected = xasprintf ("address: STREAM/TCP %s 80\n", address);
> ++  hints.ai_family = AF_INET;
> ++  int ret = getaddrinfo (query, "80", &hints, &ai);
> ++  check_addrinfo (context, ai, ret, expected);
> ++  if (ret == 0)
> ++    freeaddrinfo (ai);
> ++  free (context);
> ++
> ++  context = xasprintf ("getaddrinfo \"%s\" AF_UNSPEC", quoted_query);
> ++  hints.ai_family = AF_UNSPEC;
> ++  ret = getaddrinfo (query, "80", &hints, &ai);
> ++  check_addrinfo (context, ai, ret, expected);
> ++  if (ret == 0)
> ++    freeaddrinfo (ai);
> ++  free (expected);
> ++  free (context);
> ++
> ++  context = xasprintf ("getaddrinfo \"%s\" AF_INET6", quoted_query);
> ++  expected = xasprintf ("flags: AI_V4MAPPED\n"
> ++                        "address: STREAM/TCP ::ffff:%s 80\n",
> ++                        address);
> ++  hints.ai_family = AF_INET6;
> ++  hints.ai_flags = AI_V4MAPPED;
> ++  ret = getaddrinfo (query, "80", &hints, &ai);
> ++  check_addrinfo (context, ai, ret, expected);
> ++  if (ret == 0)
> ++    freeaddrinfo (ai);
> ++  free (expected);
> ++  free (context);
> ++
> ++  free (quoted_query);
> ++}
> ++
> ++static void
> ++run_query (const char *query, const char *address)
> ++{
> ++  char *quoted_query = support_quote_string (query);
> ++  char *context = xasprintf ("gethostbyname (\"%s\")", quoted_query);
> ++  char *expected = xasprintf ("name: %s\n"
> ++                              "address: %s\n", query, address);
> ++  check_hostent (context, gethostbyname (query), expected);
> ++  free (context);
> ++
> ++  context = xasprintf ("gethostbyname_r \"%s\"", quoted_query);
> ++  struct hostent storage;
> ++  char buf[4096];
> ++  struct hostent *e = NULL;
> ++  TEST_COMPARE (gethostbyname_r (query, &storage, buf, sizeof (buf),
> ++                                 &e, &h_errno), 0);
> ++  check_hostent (context, e, expected);
> ++  free (context);
> ++
> ++  context = xasprintf ("gethostbyname2 (\"%s\", AF_INET)", quoted_query);
> ++  check_hostent (context, gethostbyname2 (query, AF_INET), expected);
> ++  free (context);
> ++
> ++  context = xasprintf ("gethostbyname2_r \"%s\" AF_INET", quoted_query);
> ++  e = NULL;
> ++  TEST_COMPARE (gethostbyname2_r (query, AF_INET, &storage, buf, sizeof (buf),
> ++                                  &e, &h_errno), 0);
> ++  check_hostent (context, e, expected);
> ++  free (context);
> ++  free (expected);
> ++
> ++  free (quoted_query);
> ++
> ++  /* The gethostbyname tests are always valid for getaddrinfo, but not
> ++     vice versa.  */
> ++  run_query_addrinfo (query, address);
> ++}
> ++
> ++static int
> ++do_test (void)
> ++{
> ++  struct resolv_test *aux = resolv_test_start
> ++    ((struct resolv_redirect_config)
> ++     {
> ++       .response_callback = response,
> ++     });
> ++
> ++  run_query ("192.000.002.010", "192.0.2.8");
> ++
> ++  /* Hexadecimal numbers are not accepted by gethostbyname.  */
> ++  run_query_addrinfo ("0xc0000210", "192.0.2.16");
> ++  run_query_addrinfo ("192.0x234", "192.0.2.52");
> ++
> ++  resolv_test_end (aux);
> ++
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> +diff --git a/resolv/tst-resolv-trailing.c b/resolv/tst-resolv-trailing.c
> +new file mode 100644
> +index 0000000000..7504bdae57
> +--- /dev/null
> ++++ b/resolv/tst-resolv-trailing.c
> +@@ -0,0 +1,136 @@
> ++/* Test name resolution behavior with trailing characters.
> ++   Copyright (C) 2019 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#include <array_length.h>
> ++#include <netdb.h>
> ++#include <support/check.h>
> ++#include <support/check_nss.h>
> ++#include <support/resolv_test.h>
> ++#include <support/support.h>
> ++
> ++static void
> ++response (const struct resolv_response_context *ctx,
> ++          struct resolv_response_builder *b,
> ++          const char *qname, uint16_t qclass, uint16_t qtype)
> ++{
> ++  /* The tests are not supposed send any DNS queries.  */
> ++  FAIL_EXIT1 ("unexpected DNS query for %s/%d/%d", qname, qclass, qtype);
> ++}
> ++
> ++static int
> ++do_test (void)
> ++{
> ++  struct resolv_test *aux = resolv_test_start
> ++    ((struct resolv_redirect_config)
> ++     {
> ++       .response_callback = response,
> ++     });
> ++
> ++  static const char *const queries[] =
> ++    {
> ++     "192.0.2.1 ",
> ++     "192.0.2.2\t",
> ++     "192.0.2.3\n",
> ++     "192.0.2.4 X",
> ++     "192.0.2.5\tY",
> ++     "192.0.2.6\nZ",
> ++     "192.0.2. ",
> ++     "192.0.2.\t",
> ++     "192.0.2.\n",
> ++     "192.0.2. X",
> ++     "192.0.2.\tY",
> ++     "192.0.2.\nZ",
> ++     "2001:db8::1 ",
> ++     "2001:db8::2\t",
> ++     "2001:db8::3\n",
> ++     "2001:db8::4 X",
> ++     "2001:db8::5\tY",
> ++     "2001:db8::6\nZ",
> ++    };
> ++  for (size_t query_idx = 0; query_idx < array_length (queries); ++query_idx)
> ++    {
> ++      const char *query = queries[query_idx];
> ++      struct hostent storage;
> ++      char buf[4096];
> ++      struct hostent *e;
> ++
> ++      h_errno = 0;
> ++      TEST_VERIFY (gethostbyname (query) == NULL);
> ++      TEST_COMPARE (h_errno, HOST_NOT_FOUND);
> ++
> ++      h_errno = 0;
> ++      e = NULL;
> ++      TEST_COMPARE (gethostbyname_r (query, &storage, buf, sizeof (buf),
> ++                                     &e, &h_errno), 0);
> ++      TEST_VERIFY (e == NULL);
> ++      TEST_COMPARE (h_errno, HOST_NOT_FOUND);
> ++
> ++      h_errno = 0;
> ++      TEST_VERIFY (gethostbyname2 (query, AF_INET) == NULL);
> ++      TEST_COMPARE (h_errno, HOST_NOT_FOUND);
> ++
> ++      h_errno = 0;
> ++      e = NULL;
> ++      TEST_COMPARE (gethostbyname2_r (query, AF_INET,
> ++                                      &storage, buf, sizeof (buf),
> ++                                     &e, &h_errno), 0);
> ++      TEST_VERIFY (e == NULL);
> ++      TEST_COMPARE (h_errno, HOST_NOT_FOUND);
> ++
> ++      h_errno = 0;
> ++      TEST_VERIFY (gethostbyname2 (query, AF_INET6) == NULL);
> ++      TEST_COMPARE (h_errno, HOST_NOT_FOUND);
> ++
> ++      h_errno = 0;
> ++      e = NULL;
> ++      TEST_COMPARE (gethostbyname2_r (query, AF_INET6,
> ++                                      &storage, buf, sizeof (buf),
> ++                                     &e, &h_errno), 0);
> ++      TEST_VERIFY (e == NULL);
> ++      TEST_COMPARE (h_errno, HOST_NOT_FOUND);
> ++
> ++      static const int gai_flags[] =
> ++        {
> ++         0,
> ++         AI_ADDRCONFIG,
> ++         AI_NUMERICHOST,
> ++         AI_IDN,
> ++         AI_IDN | AI_NUMERICHOST,
> ++         AI_V4MAPPED,
> ++         AI_V4MAPPED | AI_NUMERICHOST,
> ++        };
> ++      for (size_t gai_flags_idx; gai_flags_idx < array_length (gai_flags);
> ++             ++gai_flags_idx)
> ++        {
> ++          struct addrinfo hints = { .ai_flags = gai_flags[gai_flags_idx], };
> ++          struct addrinfo *ai;
> ++          hints.ai_family = AF_INET;
> ++          TEST_COMPARE (getaddrinfo (query, "80", &hints, &ai), EAI_NONAME);
> ++          hints.ai_family = AF_INET6;
> ++          TEST_COMPARE (getaddrinfo (query, "80", &hints, &ai), EAI_NONAME);
> ++          hints.ai_family = AF_UNSPEC;
> ++          TEST_COMPARE (getaddrinfo (query, "80", &hints, &ai), EAI_NONAME);
> ++        }
> ++    };
> ++
> ++  resolv_test_end (aux);
> ++
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> +diff --git a/sysdeps/posix/getaddrinfo.c b/sysdeps/posix/getaddrinfo.c
> +index 553833d1f2..c91b281e31 100644
> +--- a/sysdeps/posix/getaddrinfo.c
> ++++ b/sysdeps/posix/getaddrinfo.c
> +@@ -488,7 +488,7 @@ gaih_inet (const char *name, const struct gaih_service *service,
> + 	  malloc_name = true;
> + 	}
> + 
> +-      if (__inet_aton (name, (struct in_addr *) at->addr) != 0)
> ++      if (__inet_aton_exact (name, (struct in_addr *) at->addr) != 0)
> + 	{
> + 	  if (req->ai_family == AF_UNSPEC || req->ai_family == AF_INET)
> + 	    at->family = AF_INET;
> +-- 
> +2.20.1
> +
> +
> +From c533244b8e00ae701583ec50aeb43377d292452d Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Mon, 4 Feb 2019 20:07:18 +0100
> +Subject: [PATCH 4/4] nscd: Do not use __inet_aton_exact@GLIBC_PRIVATE [BZ
> + #20018]
> +
> +This commit avoids referencing the __inet_aton_exact@GLIBC_PRIVATE
> +symbol from nscd.  In master, the separately-compiled getaddrinfo
> +implementation in nscd needs it, however such an internal ABI change
> +is not desirable on a release branch if it can be avoided.
> +---
> + ChangeLog             | 10 ++++++++++
> + nscd/Makefile         |  2 +-
> + nscd/gai.c            |  6 ++++++
> + nscd/nscd-inet_addr.c | 32 ++++++++++++++++++++++++++++++++
> + 4 files changed, 49 insertions(+), 1 deletion(-)
> + create mode 100644 nscd/nscd-inet_addr.c
> +
> +diff --git a/nscd/Makefile b/nscd/Makefile
> +index b713a84c49..eb23c01a39 100644
> +--- a/nscd/Makefile
> ++++ b/nscd/Makefile
> +@@ -36,7 +36,7 @@ nscd-modules := nscd connections pwdcache getpwnam_r getpwuid_r grpcache \
> + 		getsrvbynm_r getsrvbypt_r servicescache \
> + 		dbg_log nscd_conf nscd_stat cache mem nscd_setup_thread \
> + 		xmalloc xstrdup aicache initgrcache gai res_hconf \
> +-		netgroupcache
> ++		netgroupcache nscd-inet_addr
> + 
> + ifeq ($(build-nscd)$(have-thread-library),yesyes)
> + 
> +diff --git a/nscd/gai.c b/nscd/gai.c
> +index f57f396f57..68a4abd30e 100644
> +--- a/nscd/gai.c
> ++++ b/nscd/gai.c
> +@@ -33,6 +33,12 @@
> + #define __getifaddrs getifaddrs
> + #define __freeifaddrs freeifaddrs
> + 
> ++/* We do not want to export __inet_aton_exact.  Get the prototype and
> ++   change its visibility to hidden.  */
> ++#include <arpa/inet.h>
> ++__typeof__ (__inet_aton_exact) __inet_aton_exact
> ++  __attribute__ ((visibility ("hidden")));
> ++
> + /* We are nscd, so we don't want to be talking to ourselves.  */
> + #undef  USE_NSCD
> + 
> +diff --git a/nscd/nscd-inet_addr.c b/nscd/nscd-inet_addr.c
> +new file mode 100644
> +index 0000000000..f366b9567d
> +--- /dev/null
> ++++ b/nscd/nscd-inet_addr.c
> +@@ -0,0 +1,32 @@
> ++/* Legacy IPv4 text-to-address functions.  Version for nscd.
> ++   Copyright (C) 2019 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#include <arpa/inet.h>
> ++
> ++/* We do not want to export __inet_aton_exact.  Get the prototype and
> ++   change the visibility to hidden.  */
> ++#include <arpa/inet.h>
> ++__typeof__ (__inet_aton_exact) __inet_aton_exact
> ++  __attribute__ ((visibility ("hidden")));
> ++
> ++/* Do not provide definitions of the public symbols exported from
> ++   libc.  */
> ++#undef weak_alias
> ++#define weak_alias(from, to)
> ++
> ++#include <resolv/inet_addr.c>
> +-- 
> +2.20.1


--------------2EA449D53ACDF3492EC8DF5F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 12/5/19 6:45 AM, Ross Burton wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20191205144551.26888-1-ross.burton@intel.com">
      <pre class="moz-quote-pre" wrap="">Somehow the patch for this CVE only included one of the four required patches.
</pre>
    </blockquote>
    <br>
    fails:<br>
    <pre>Applying patch CVE-2016-10739.patch
patching file resolv/inet_addr.c
patching file resolv/nss_dns/dns-host.c
patching file NEWS
Hunk #1 FAILED at 10.
Hunk #2 succeeded at 18 with fuzz 2 (offset -39 lines).
1 out of 2 hunks FAILED -- rejects in file NEWS
patching file include/arpa/inet.h
patching file nscd/gai.c
patching file nscd/gethstbynm3_r.c
patching file nss/digits_dots.c
patching file resolv/Makefile
patching file resolv/Versions
patching file resolv/inet_addr.c
patching file resolv/res_init.c
patching file resolv/tst-aton.c
patching file resolv/tst-inet_aton_exact.c
patching file resolv/tst-resolv-nondecimal.c
patching file resolv/tst-resolv-trailing.c
patching file sysdeps/posix/getaddrinfo.c
patching file nscd/Makefile
patching file nscd/gai.c
patching file nscd/nscd-inet_addr.c
Patch CVE-2016-10739.patch does not apply (enforce with -f)</pre>
    <br>
    <a class="moz-txt-link-freetext" href="https://errors.yoctoproject.org/Errors/Details/296402/">https://errors.yoctoproject.org/Errors/Details/296402/</a><br>
    <blockquote type="cite"
      cite="mid:20191205144551.26888-1-ross.burton@intel.com">
      <pre class="moz-quote-pre" wrap="">
Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>
---
 .../glibc/glibc/CVE-2016-10739.patch          | 932 +++++++++++++++++-
 1 file changed, 929 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/CVE-2016-10739.patch b/meta/recipes-core/glibc/glibc/CVE-2016-10739.patch
index 7eb55d6663d..871627da195 100644
--- a/meta/recipes-core/glibc/glibc/CVE-2016-10739.patch
+++ b/meta/recipes-core/glibc/glibc/CVE-2016-10739.patch
@@ -5,12 +5,12 @@ Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>
 From 8e92ca5dd7a7e38a4dddf1ebc4e1e8f0cb27e4aa Mon Sep 17 00:00:00 2001
 From: Florian Weimer <a class="moz-txt-link-rfc2396E" href="mailto:fweimer@redhat.com">&lt;fweimer@redhat.com&gt;</a>
 Date: Mon, 21 Jan 2019 08:59:42 +0100
-Subject: [PATCH] resolv: Reformat inet_addr, inet_aton to GNU style
+Subject: [PATCH 1/4] resolv: Reformat inet_addr, inet_aton to GNU style
 
 (cherry picked from commit 5e30b8ef0758763effa115634e0ed7d8938e4bc0)
 ---
  ChangeLog          |   5 ++
- resolv/inet_addr.c | 192 ++++++++++++++++++++++++++++-------------------------
+ resolv/inet_addr.c | 192 ++++++++++++++++++++++++---------------------
  2 files changed, 106 insertions(+), 91 deletions(-)
 
 diff --git a/resolv/inet_addr.c b/resolv/inet_addr.c
@@ -229,4 +229,930 @@ index 022f7ea084..32f58b0e13 100644
  weak_alias (__inet_aton, inet_aton)
  libc_hidden_def (__inet_aton)
 -- 
-2.11.0
+2.20.1
+
+
+From 37edf1d3f8ab9adefb61cc466ac52b53114fbd5b Mon Sep 17 00:00:00 2001
+From: Florian Weimer <a class="moz-txt-link-rfc2396E" href="mailto:fweimer@redhat.com">&lt;fweimer@redhat.com&gt;</a>
+Date: Mon, 21 Jan 2019 09:26:41 +0100
+Subject: [PATCH 2/4] resolv: Do not send queries for non-host-names in nss_dns
+ [BZ #24112]
+
+Before this commit, nss_dns would send a query which did not contain a
+host name as the query name (such as invalid\032name.example.com) and
+then reject the answer in getanswer_r and gaih_getanswer_slice, using
+a check based on res_hnok.  With this commit, no query is sent, and a
+host-not-found error is returned to NSS without network interaction.
+
+(cherry picked from commit 6ca53a2453598804a2559a548a08424fca96434a)
+---
+ ChangeLog                 |  9 +++++++++
+ resolv/nss_dns/dns-host.c | 24 ++++++++++++++++++++++--
+ 2 files changed, 31 insertions(+), 2 deletions(-)
+
+diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
+index 5dc2829cd1..99c3b61e1c 100644
+--- a/resolv/nss_dns/dns-host.c
++++ b/resolv/nss_dns/dns-host.c
+@@ -274,11 +274,26 @@ gethostbyname3_context (struct resolv_context *ctx,
+   return status;
+ }
+ 
++/* Verify that the name looks like a host name.  There is no point in
++   sending a query which will not produce a usable name in the
++   response.  */
++static enum nss_status
++check_name (const char *name, int *h_errnop)
++{
++  if (res_hnok (name))
++    return NSS_STATUS_SUCCESS;
++  *h_errnop = HOST_NOT_FOUND;
++  return NSS_STATUS_NOTFOUND;
++}
++
+ enum nss_status
+ _nss_dns_gethostbyname2_r (const char *name, int af, struct hostent *result,
+ 			   char *buffer, size_t buflen, int *errnop,
+ 			   int *h_errnop)
+ {
++  enum nss_status status = check_name (name, h_errnop);
++  if (status != NSS_STATUS_SUCCESS)
++    return status;
+   return _nss_dns_gethostbyname3_r (name, af, result, buffer, buflen, errnop,
+ 				    h_errnop, NULL, NULL);
+ }
+@@ -289,6 +304,9 @@ _nss_dns_gethostbyname_r (const char *name, struct hostent *result,
+ 			  char *buffer, size_t buflen, int *errnop,
+ 			  int *h_errnop)
+ {
++  enum nss_status status = check_name (name, h_errnop);
++  if (status != NSS_STATUS_SUCCESS)
++    return status;
+   struct resolv_context *ctx = __resolv_context_get ();
+   if (ctx == NULL)
+     {
+@@ -296,7 +314,7 @@ _nss_dns_gethostbyname_r (const char *name, struct hostent *result,
+       *h_errnop = NETDB_INTERNAL;
+       return NSS_STATUS_UNAVAIL;
+     }
+-  enum nss_status status = NSS_STATUS_NOTFOUND;
++  status = NSS_STATUS_NOTFOUND;
+   if (res_use_inet6 ())
+     status = gethostbyname3_context (ctx, name, AF_INET6, result, buffer,
+ 				     buflen, errnop, h_errnop, NULL, NULL);
+@@ -313,6 +331,9 @@ _nss_dns_gethostbyname4_r (const char *name, struct gaih_addrtuple **pat,
+ 			   char *buffer, size_t buflen, int *errnop,
+ 			   int *herrnop, int32_t *ttlp)
+ {
++  enum nss_status status = check_name (name, herrnop);
++  if (status != NSS_STATUS_SUCCESS)
++    return status;
+   struct resolv_context *ctx = __resolv_context_get ();
+   if (ctx == NULL)
+     {
+@@ -347,7 +368,6 @@ _nss_dns_gethostbyname4_r (const char *name, struct gaih_addrtuple **pat,
+   int ans2p_malloced = 0;
+ 
+   int olderr = errno;
+-  enum nss_status status;
+   int n = __res_context_search (ctx, name, C_IN, T_QUERY_A_AND_AAAA,
+ 				host_buffer.buf-&gt;buf, 2048, &amp;host_buffer.ptr,
+ 				&amp;ans2p, &amp;nans2p, &amp;resplen2, &amp;ans2p_malloced);
+-- 
+2.20.1
+
+
+From 2373941bd73cb288c8a42a33e23e7f7bb81151e7 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <a class="moz-txt-link-rfc2396E" href="mailto:fweimer@redhat.com">&lt;fweimer@redhat.com&gt;</a>
+Date: Mon, 21 Jan 2019 21:26:03 +0100
+Subject: [PATCH 3/4] CVE-2016-10739: getaddrinfo: Fully parse IPv4 address
+ strings [BZ #20018]
+
+The IPv4 address parser in the getaddrinfo function is changed so that
+it does not ignore trailing whitespace and all characters after it.
+For backwards compatibility, the getaddrinfo function still recognizes
+legacy name syntax, such as 192.000.002.010 interpreted as 192.0.2.8
+(octal).
+
+This commit does not change the behavior of inet_addr and inet_aton.
+gethostbyname already had additional sanity checks (but is switched
+over to the new __inet_aton_exact function for completeness as well).
+
+To avoid sending the problematic query names over DNS, commit
+6ca53a2453598804a2559a548a08424fca96434a ("resolv: Do not send queries
+for non-host-names in nss_dns [BZ #24112]") is needed.
+
+(cherry picked from commit 108bc4049f8ae82710aec26a92ffdb4b439c83fd)
+---
+ ChangeLog                      |  33 ++++++++
+ NEWS                           |   4 +
+ include/arpa/inet.h            |   6 +-
+ nscd/gai.c                     |   1 -
+ nscd/gethstbynm3_r.c           |   2 -
+ nss/digits_dots.c              |   3 +-
+ resolv/Makefile                |   7 ++
+ resolv/Versions                |   1 +
+ resolv/inet_addr.c             |  62 ++++++++++-----
+ resolv/res_init.c              |  17 ++--
+ resolv/tst-aton.c              |  35 +++++++--
+ resolv/tst-inet_aton_exact.c   |  47 +++++++++++
+ resolv/tst-resolv-nondecimal.c | 139 +++++++++++++++++++++++++++++++++
+ resolv/tst-resolv-trailing.c   | 136 ++++++++++++++++++++++++++++++++
+ sysdeps/posix/getaddrinfo.c    |   2 +-
+ 15 files changed, 455 insertions(+), 40 deletions(-)
+ create mode 100644 resolv/tst-inet_aton_exact.c
+ create mode 100644 resolv/tst-resolv-nondecimal.c
+ create mode 100644 resolv/tst-resolv-trailing.c
+
+diff --git a/NEWS b/NEWS
+index 0e58ca8904..a1af88e193 100644
+--- a/NEWS
++++ b/NEWS
+@@ -10,6 +10,7 @@ Version 2.28.1
+ The following bugs are resolved with this release:
+ 
+   [19444] build failures with -O1 due to -Wmaybe-uninitialized
++  [20018] getaddrinfo should reject IP addresses with trailing characters
+   [20209] localedata: Spelling mistake for Sunday in Greenlandic kl_GL
+   [22927] libanl: properly cleanup if first helper thread creation failed
+   [23400] stdlib/test-bz22786.c creates temporary files in glibc source tree
+@@ -57,6 +58,9 @@ Security related changes:
+   memcmp gave the wrong result since it treated the size argument as
+   zero.  Reported by H.J. Lu.
+ 
++  CVE-2016-10739: The getaddrinfo function could successfully parse IPv4
++  addresses with arbitrary trailing characters, potentially leading to data
++  or command injection issues in applications.
+ 
+ Version 2.28
+ 
+diff --git a/include/arpa/inet.h b/include/arpa/inet.h
+index c3f28f2baa..19aec74275 100644
+--- a/include/arpa/inet.h
++++ b/include/arpa/inet.h
+@@ -1,10 +1,10 @@
+ #include &lt;inet/arpa/inet.h&gt;
+ 
+ #ifndef _ISOMAC
+-extern int __inet_aton (const char *__cp, struct in_addr *__inp);
+-libc_hidden_proto (__inet_aton)
++/* Variant of inet_aton which rejects trailing garbage.  */
++extern int __inet_aton_exact (const char *__cp, struct in_addr *__inp);
++libc_hidden_proto (__inet_aton_exact)
+ 
+-libc_hidden_proto (inet_aton)
+ libc_hidden_proto (inet_ntop)
+ libc_hidden_proto (inet_pton)
+ extern __typeof (inet_pton) __inet_pton;
+diff --git a/nscd/gai.c b/nscd/gai.c
+index 24bdfee1db..f57f396f57 100644
+--- a/nscd/gai.c
++++ b/nscd/gai.c
+@@ -19,7 +19,6 @@
+ 
+ /* This file uses the getaddrinfo code but it compiles it without NSCD
+    support.  We just need a few symbol renames.  */
+-#define __inet_aton inet_aton
+ #define __ioctl ioctl
+ #define __getsockname getsockname
+ #define __socket socket
+diff --git a/nscd/gethstbynm3_r.c b/nscd/gethstbynm3_r.c
+index 7beb9dce9f..f792c4fcd0 100644
+--- a/nscd/gethstbynm3_r.c
++++ b/nscd/gethstbynm3_r.c
+@@ -38,8 +38,6 @@
+ #define HAVE_LOOKUP_BUFFER	1
+ #define HAVE_AF			1
+ 
+-#define __inet_aton inet_aton
+-
+ /* We are nscd, so we don't want to be talking to ourselves.  */
+ #undef	USE_NSCD
+ 
+diff --git a/nss/digits_dots.c b/nss/digits_dots.c
+index 39bff38865..5441bce16e 100644
+--- a/nss/digits_dots.c
++++ b/nss/digits_dots.c
+@@ -29,7 +29,6 @@
+ #include "nsswitch.h"
+ 
+ #ifdef USE_NSCD
+-# define inet_aton __inet_aton
+ # include &lt;nscd/nscd_proto.h&gt;
+ #endif
+ 
+@@ -160,7 +159,7 @@ __nss_hostname_digits_dots_context (struct resolv_context *ctx,
+ 		     255.255.255.255?  The test below will succeed
+ 		     spuriously... ???  */
+ 		  if (af == AF_INET)
+-		    ok = __inet_aton (name, (struct in_addr *) host_addr);
++		    ok = __inet_aton_exact (name, (struct in_addr *) host_addr);
+ 		  else
+ 		    {
+ 		      assert (af == AF_INET6);
+diff --git a/resolv/Makefile b/resolv/Makefile
+index ea395ac3eb..d36eedd34a 100644
+--- a/resolv/Makefile
++++ b/resolv/Makefile
+@@ -34,6 +34,9 @@ routines := herror inet_addr inet_ntop inet_pton nsap_addr res_init \
+ tests = tst-aton tst-leaks tst-inet_ntop
+ xtests = tst-leaks2
+ 
++tests-internal += tst-inet_aton_exact
++
++
+ generate := mtrace-tst-leaks.out tst-leaks.mtrace tst-leaks2.mtrace
+ 
+ extra-libs := libresolv libnss_dns
+@@ -54,8 +57,10 @@ tests += \
+   tst-resolv-binary \
+   tst-resolv-edns \
+   tst-resolv-network \
++  tst-resolv-nondecimal \
+   tst-resolv-res_init-multi \
+   tst-resolv-search \
++  tst-resolv-trailing \
+ 
+ # These tests need libdl.
+ ifeq (yes,$(build-shared))
+@@ -190,9 +195,11 @@ $(objpfx)tst-resolv-res_init-multi: $(objpfx)libresolv.so \
+   $(shared-thread-library)
+ $(objpfx)tst-resolv-res_init-thread: $(libdl) $(objpfx)libresolv.so \
+   $(shared-thread-library)
++$(objpfx)tst-resolv-nondecimal: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-qtypes: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-rotate: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-search: $(objpfx)libresolv.so $(shared-thread-library)
++$(objpfx)tst-resolv-trailing: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-threads: \
+   $(libdl) $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-canonname: \
+diff --git a/resolv/Versions b/resolv/Versions
+index b05778d965..9a82704af7 100644
+--- a/resolv/Versions
++++ b/resolv/Versions
+@@ -27,6 +27,7 @@ libc {
+     __h_errno; __resp;
+ 
+     __res_iclose;
++    __inet_aton_exact;
+     __inet_pton_length;
+     __resolv_context_get;
+     __resolv_context_get_preinit;
+diff --git a/resolv/inet_addr.c b/resolv/inet_addr.c
+index 32f58b0e13..41b6166a5b 100644
+--- a/resolv/inet_addr.c
++++ b/resolv/inet_addr.c
+@@ -96,26 +96,14 @@
+ #include &lt;limits.h&gt;
+ #include &lt;errno.h&gt;
+ 
+-/* ASCII IPv4 Internet address interpretation routine.  The value
+-   returned is in network order.  */
+-in_addr_t
+-__inet_addr (const char *cp)
+-{
+-  struct in_addr val;
+-
+-  if (__inet_aton (cp, &amp;val))
+-    return val.s_addr;
+-  return INADDR_NONE;
+-}
+-weak_alias (__inet_addr, inet_addr)
+-
+ /* Check whether "cp" is a valid ASCII representation of an IPv4
+    Internet address and convert it to a binary address.  Returns 1 if
+    the address is valid, 0 if not.  This replaces inet_addr, the
+    return value from which cannot distinguish between failure and a
+-   local broadcast address.  */
+-int
+-__inet_aton (const char *cp, struct in_addr *addr)
++   local broadcast address.  Write a pointer to the first
++   non-converted character to *endp.  */
++static int
++inet_aton_end (const char *cp, struct in_addr *addr, const char **endp)
+ {
+   static const in_addr_t max[4] = { 0xffffffff, 0xffffff, 0xffff, 0xff };
+   in_addr_t val;
+@@ -180,6 +168,7 @@ __inet_aton (const char *cp, struct in_addr *addr)
+ 
+   if (addr != NULL)
+     addr-&gt;s_addr = res.word | htonl (val);
++  *endp = cp;
+ 
+   __set_errno (saved_errno);
+   return 1;
+@@ -188,6 +177,41 @@ __inet_aton (const char *cp, struct in_addr *addr)
+   __set_errno (saved_errno);
+   return 0;
+ }
+-weak_alias (__inet_aton, inet_aton)
+-libc_hidden_def (__inet_aton)
+-libc_hidden_weak (inet_aton)
++
++int
++__inet_aton_exact (const char *cp, struct in_addr *addr)
++{
++  struct in_addr val;
++  const char *endp;
++  /* Check that inet_aton_end parsed the entire string.  */
++  if (inet_aton_end (cp, &amp;val, &amp;endp) != 0 &amp;&amp; *endp == 0)
++    {
++      *addr = val;
++      return 1;
++    }
++  else
++    return 0;
++}
++libc_hidden_def (__inet_aton_exact)
++
++/* inet_aton ignores trailing garbage.  */
++int
++__inet_aton_ignore_trailing (const char *cp, struct in_addr *addr)
++{
++  const char *endp;
++  return  inet_aton_end (cp, addr, &amp;endp);
++}
++weak_alias (__inet_aton_ignore_trailing, inet_aton)
++
++/* ASCII IPv4 Internet address interpretation routine.  The value
++   returned is in network order.  */
++in_addr_t
++__inet_addr (const char *cp)
++{
++  struct in_addr val;
++  const char *endp;
++  if (inet_aton_end (cp, &amp;val, &amp;endp))
++    return val.s_addr;
++  return INADDR_NONE;
++}
++weak_alias (__inet_addr, inet_addr)
+diff --git a/resolv/res_init.c b/resolv/res_init.c
+index f5e52cbbb9..94743a252e 100644
+--- a/resolv/res_init.c
++++ b/resolv/res_init.c
+@@ -399,8 +399,16 @@ res_vinit_1 (FILE *fp, struct resolv_conf_parser *parser)
+               cp = parser-&gt;buffer + sizeof ("nameserver") - 1;
+               while (*cp == ' ' || *cp == '\t')
+                 cp++;
++
++              /* Ignore trailing contents on the name server line.  */
++              {
++                char *el;
++                if ((el = strpbrk (cp, " \t\n")) != NULL)
++                  *el = '\0';
++              }
++
+               struct sockaddr *sa;
+-              if ((*cp != '\0') &amp;&amp; (*cp != '\n') &amp;&amp; __inet_aton (cp, &amp;a))
++              if ((*cp != '\0') &amp;&amp; (*cp != '\n') &amp;&amp; __inet_aton_exact (cp, &amp;a))
+                 {
+                   sa = allocate_address_v4 (a, NAMESERVER_PORT);
+                   if (sa == NULL)
+@@ -410,9 +418,6 @@ res_vinit_1 (FILE *fp, struct resolv_conf_parser *parser)
+                 {
+                   struct in6_addr a6;
+                   char *el;
+-
+-                  if ((el = strpbrk (cp, " \t\n")) != NULL)
+-                    *el = '\0';
+                   if ((el = strchr (cp, SCOPE_DELIMITER)) != NULL)
+                     *el = '\0';
+                   if ((*cp != '\0') &amp;&amp; (__inet_pton (AF_INET6, cp, &amp;a6) &gt; 0))
+@@ -472,7 +477,7 @@ res_vinit_1 (FILE *fp, struct resolv_conf_parser *parser)
+                   char separator = *cp;
+                   *cp = 0;
+                   struct resolv_sortlist_entry e;
+-                  if (__inet_aton (net, &amp;a))
++                  if (__inet_aton_exact (net, &amp;a))
+                     {
+                       e.addr = a;
+                       if (is_sort_mask (separator))
+@@ -484,7 +489,7 @@ res_vinit_1 (FILE *fp, struct resolv_conf_parser *parser)
+                             cp++;
+                           separator = *cp;
+                           *cp = 0;
+-                          if (__inet_aton (net, &amp;a))
++                          if (__inet_aton_exact (net, &amp;a))
+                             e.mask = a.s_addr;
+                           else
+                             e.mask = net_mask (e.addr);
+diff --git a/resolv/tst-aton.c b/resolv/tst-aton.c
+index 08110a007a..eb734d7758 100644
+--- a/resolv/tst-aton.c
++++ b/resolv/tst-aton.c
+@@ -1,11 +1,29 @@
++/* Test legacy IPv4 text-to-address function inet_aton.
++   Copyright (C) 1998-2019 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <a class="moz-txt-link-rfc2396E" href="http://www.gnu.org/licenses/">&lt;http://www.gnu.org/licenses/&gt;</a>.  */
++
++#include &lt;array_length.h&gt;
+ #include &lt;stdio.h&gt;
+ #include &lt;stdint.h&gt;
+ #include &lt;sys/socket.h&gt;
+ #include &lt;netinet/in.h&gt;
+ #include &lt;arpa/inet.h&gt;
+ 
+-
+-static struct tests
++static const struct tests
+ {
+   const char *input;
+   int valid;
+@@ -16,6 +34,7 @@ static struct tests
+   { "-1", 0, 0 },
+   { "256", 1, 0x00000100 },
+   { "256.", 0, 0 },
++  { "255a", 0, 0 },
+   { "256a", 0, 0 },
+   { "0x100", 1, 0x00000100 },
+   { "0200.0x123456", 1, 0x80123456 },
+@@ -40,7 +59,12 @@ static struct tests
+   { "1.2.256.4", 0, 0 },
+   { "1.2.3.0x100", 0, 0 },
+   { "323543357756889", 0, 0 },
+-  { "10.1.2.3.4", 0, 0},
++  { "10.1.2.3.4", 0, 0 },
++  { "192.0.2.1", 1, 0xc0000201 },
++  { "192.0.2.2\nX", 1, 0xc0000202 },
++  { "192.0.2.3 Y", 1, 0xc0000203 },
++  { "192.0.2.3Z", 0, 0 },
++  { "192.000.002.010", 1, 0xc0000208 },
+ };
+ 
+ 
+@@ -50,7 +74,7 @@ do_test (void)
+   int result = 0;
+   size_t cnt;
+ 
+-  for (cnt = 0; cnt &lt; sizeof (tests) / sizeof (tests[0]); ++cnt)
++  for (cnt = 0; cnt &lt; array_length (tests); ++cnt)
+     {
+       struct in_addr addr;
+ 
+@@ -73,5 +97,4 @@ do_test (void)
+   return result;
+ }
+ 
+-#define TEST_FUNCTION do_test ()
+-#include "../test-skeleton.c"
++#include &lt;support/test-driver.c&gt;
+diff --git a/resolv/tst-inet_aton_exact.c b/resolv/tst-inet_aton_exact.c
+new file mode 100644
+index 0000000000..0fdfa3d6aa
+--- /dev/null
++++ b/resolv/tst-inet_aton_exact.c
+@@ -0,0 +1,47 @@
++/* Test internal legacy IPv4 text-to-address function __inet_aton_exact.
++   Copyright (C) 2019 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <a class="moz-txt-link-rfc2396E" href="http://www.gnu.org/licenses/">&lt;http://www.gnu.org/licenses/&gt;</a>.  */
++
++#include &lt;arpa/inet.h&gt;
++#include &lt;support/check.h&gt;
++
++static int
++do_test (void)
++{
++  struct in_addr addr = { };
++
++  TEST_COMPARE (__inet_aton_exact ("192.0.2.1", &amp;addr), 1);
++  TEST_COMPARE (ntohl (addr.s_addr), 0xC0000201);
++
++  TEST_COMPARE (__inet_aton_exact ("192.000.002.010", &amp;addr), 1);
++  TEST_COMPARE (ntohl (addr.s_addr), 0xC0000208);
++  TEST_COMPARE (__inet_aton_exact ("0xC0000234", &amp;addr), 1);
++  TEST_COMPARE (ntohl (addr.s_addr), 0xC0000234);
++
++  /* Trailing content is not accepted.  */
++  TEST_COMPARE (__inet_aton_exact ("192.0.2.2X", &amp;addr), 0);
++  TEST_COMPARE (__inet_aton_exact ("192.0.2.3 Y", &amp;addr), 0);
++  TEST_COMPARE (__inet_aton_exact ("192.0.2.4\nZ", &amp;addr), 0);
++  TEST_COMPARE (__inet_aton_exact ("192.0.2.5\tT", &amp;addr), 0);
++  TEST_COMPARE (__inet_aton_exact ("192.0.2.6 Y", &amp;addr), 0);
++  TEST_COMPARE (__inet_aton_exact ("192.0.2.7\n", &amp;addr), 0);
++  TEST_COMPARE (__inet_aton_exact ("192.0.2.8\t", &amp;addr), 0);
++
++  return 0;
++}
++
++#include &lt;support/test-driver.c&gt;
+diff --git a/resolv/tst-resolv-nondecimal.c b/resolv/tst-resolv-nondecimal.c
+new file mode 100644
+index 0000000000..a0df6f332a
+--- /dev/null
++++ b/resolv/tst-resolv-nondecimal.c
+@@ -0,0 +1,139 @@
++/* Test name resolution behavior for octal, hexadecimal IPv4 addresses.
++   Copyright (C) 2019 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <a class="moz-txt-link-rfc2396E" href="http://www.gnu.org/licenses/">&lt;http://www.gnu.org/licenses/&gt;</a>.  */
++
++#include &lt;netdb.h&gt;
++#include &lt;stdlib.h&gt;
++#include &lt;support/check.h&gt;
++#include &lt;support/check_nss.h&gt;
++#include &lt;support/resolv_test.h&gt;
++#include &lt;support/support.h&gt;
++
++static void
++response (const struct resolv_response_context *ctx,
++          struct resolv_response_builder *b,
++          const char *qname, uint16_t qclass, uint16_t qtype)
++{
++  /* The tests are not supposed send any DNS queries.  */
++  FAIL_EXIT1 ("unexpected DNS query for %s/%d/%d", qname, qclass, qtype);
++}
++
++static void
++run_query_addrinfo (const char *query, const char *address)
++{
++  char *quoted_query = support_quote_string (query);
++
++  struct addrinfo *ai;
++  struct addrinfo hints =
++    {
++     .ai_socktype = SOCK_STREAM,
++     .ai_protocol = IPPROTO_TCP,
++    };
++
++  char *context = xasprintf ("getaddrinfo \"%s\" AF_INET", quoted_query);
++  char *expected = xasprintf ("address: STREAM/TCP %s 80\n", address);
++  hints.ai_family = AF_INET;
++  int ret = getaddrinfo (query, "80", &amp;hints, &amp;ai);
++  check_addrinfo (context, ai, ret, expected);
++  if (ret == 0)
++    freeaddrinfo (ai);
++  free (context);
++
++  context = xasprintf ("getaddrinfo \"%s\" AF_UNSPEC", quoted_query);
++  hints.ai_family = AF_UNSPEC;
++  ret = getaddrinfo (query, "80", &amp;hints, &amp;ai);
++  check_addrinfo (context, ai, ret, expected);
++  if (ret == 0)
++    freeaddrinfo (ai);
++  free (expected);
++  free (context);
++
++  context = xasprintf ("getaddrinfo \"%s\" AF_INET6", quoted_query);
++  expected = xasprintf ("flags: AI_V4MAPPED\n"
++                        "address: STREAM/TCP ::ffff:%s 80\n",
++                        address);
++  hints.ai_family = AF_INET6;
++  hints.ai_flags = AI_V4MAPPED;
++  ret = getaddrinfo (query, "80", &amp;hints, &amp;ai);
++  check_addrinfo (context, ai, ret, expected);
++  if (ret == 0)
++    freeaddrinfo (ai);
++  free (expected);
++  free (context);
++
++  free (quoted_query);
++}
++
++static void
++run_query (const char *query, const char *address)
++{
++  char *quoted_query = support_quote_string (query);
++  char *context = xasprintf ("gethostbyname (\"%s\")", quoted_query);
++  char *expected = xasprintf ("name: %s\n"
++                              "address: %s\n", query, address);
++  check_hostent (context, gethostbyname (query), expected);
++  free (context);
++
++  context = xasprintf ("gethostbyname_r \"%s\"", quoted_query);
++  struct hostent storage;
++  char buf[4096];
++  struct hostent *e = NULL;
++  TEST_COMPARE (gethostbyname_r (query, &amp;storage, buf, sizeof (buf),
++                                 &amp;e, &amp;h_errno), 0);
++  check_hostent (context, e, expected);
++  free (context);
++
++  context = xasprintf ("gethostbyname2 (\"%s\", AF_INET)", quoted_query);
++  check_hostent (context, gethostbyname2 (query, AF_INET), expected);
++  free (context);
++
++  context = xasprintf ("gethostbyname2_r \"%s\" AF_INET", quoted_query);
++  e = NULL;
++  TEST_COMPARE (gethostbyname2_r (query, AF_INET, &amp;storage, buf, sizeof (buf),
++                                  &amp;e, &amp;h_errno), 0);
++  check_hostent (context, e, expected);
++  free (context);
++  free (expected);
++
++  free (quoted_query);
++
++  /* The gethostbyname tests are always valid for getaddrinfo, but not
++     vice versa.  */
++  run_query_addrinfo (query, address);
++}
++
++static int
++do_test (void)
++{
++  struct resolv_test *aux = resolv_test_start
++    ((struct resolv_redirect_config)
++     {
++       .response_callback = response,
++     });
++
++  run_query ("192.000.002.010", "192.0.2.8");
++
++  /* Hexadecimal numbers are not accepted by gethostbyname.  */
++  run_query_addrinfo ("0xc0000210", "192.0.2.16");
++  run_query_addrinfo ("192.0x234", "192.0.2.52");
++
++  resolv_test_end (aux);
++
++  return 0;
++}
++
++#include &lt;support/test-driver.c&gt;
+diff --git a/resolv/tst-resolv-trailing.c b/resolv/tst-resolv-trailing.c
+new file mode 100644
+index 0000000000..7504bdae57
+--- /dev/null
++++ b/resolv/tst-resolv-trailing.c
+@@ -0,0 +1,136 @@
++/* Test name resolution behavior with trailing characters.
++   Copyright (C) 2019 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <a class="moz-txt-link-rfc2396E" href="http://www.gnu.org/licenses/">&lt;http://www.gnu.org/licenses/&gt;</a>.  */
++
++#include &lt;array_length.h&gt;
++#include &lt;netdb.h&gt;
++#include &lt;support/check.h&gt;
++#include &lt;support/check_nss.h&gt;
++#include &lt;support/resolv_test.h&gt;
++#include &lt;support/support.h&gt;
++
++static void
++response (const struct resolv_response_context *ctx,
++          struct resolv_response_builder *b,
++          const char *qname, uint16_t qclass, uint16_t qtype)
++{
++  /* The tests are not supposed send any DNS queries.  */
++  FAIL_EXIT1 ("unexpected DNS query for %s/%d/%d", qname, qclass, qtype);
++}
++
++static int
++do_test (void)
++{
++  struct resolv_test *aux = resolv_test_start
++    ((struct resolv_redirect_config)
++     {
++       .response_callback = response,
++     });
++
++  static const char *const queries[] =
++    {
++     "192.0.2.1 ",
++     "192.0.2.2\t",
++     "192.0.2.3\n",
++     "192.0.2.4 X",
++     "192.0.2.5\tY",
++     "192.0.2.6\nZ",
++     "192.0.2. ",
++     "192.0.2.\t",
++     "192.0.2.\n",
++     "192.0.2. X",
++     "192.0.2.\tY",
++     "192.0.2.\nZ",
++     "2001:db8::1 ",
++     "2001:db8::2\t",
++     "2001:db8::3\n",
++     "2001:db8::4 X",
++     "2001:db8::5\tY",
++     "2001:db8::6\nZ",
++    };
++  for (size_t query_idx = 0; query_idx &lt; array_length (queries); ++query_idx)
++    {
++      const char *query = queries[query_idx];
++      struct hostent storage;
++      char buf[4096];
++      struct hostent *e;
++
++      h_errno = 0;
++      TEST_VERIFY (gethostbyname (query) == NULL);
++      TEST_COMPARE (h_errno, HOST_NOT_FOUND);
++
++      h_errno = 0;
++      e = NULL;
++      TEST_COMPARE (gethostbyname_r (query, &amp;storage, buf, sizeof (buf),
++                                     &amp;e, &amp;h_errno), 0);
++      TEST_VERIFY (e == NULL);
++      TEST_COMPARE (h_errno, HOST_NOT_FOUND);
++
++      h_errno = 0;
++      TEST_VERIFY (gethostbyname2 (query, AF_INET) == NULL);
++      TEST_COMPARE (h_errno, HOST_NOT_FOUND);
++
++      h_errno = 0;
++      e = NULL;
++      TEST_COMPARE (gethostbyname2_r (query, AF_INET,
++                                      &amp;storage, buf, sizeof (buf),
++                                     &amp;e, &amp;h_errno), 0);
++      TEST_VERIFY (e == NULL);
++      TEST_COMPARE (h_errno, HOST_NOT_FOUND);
++
++      h_errno = 0;
++      TEST_VERIFY (gethostbyname2 (query, AF_INET6) == NULL);
++      TEST_COMPARE (h_errno, HOST_NOT_FOUND);
++
++      h_errno = 0;
++      e = NULL;
++      TEST_COMPARE (gethostbyname2_r (query, AF_INET6,
++                                      &amp;storage, buf, sizeof (buf),
++                                     &amp;e, &amp;h_errno), 0);
++      TEST_VERIFY (e == NULL);
++      TEST_COMPARE (h_errno, HOST_NOT_FOUND);
++
++      static const int gai_flags[] =
++        {
++         0,
++         AI_ADDRCONFIG,
++         AI_NUMERICHOST,
++         AI_IDN,
++         AI_IDN | AI_NUMERICHOST,
++         AI_V4MAPPED,
++         AI_V4MAPPED | AI_NUMERICHOST,
++        };
++      for (size_t gai_flags_idx; gai_flags_idx &lt; array_length (gai_flags);
++             ++gai_flags_idx)
++        {
++          struct addrinfo hints = { .ai_flags = gai_flags[gai_flags_idx], };
++          struct addrinfo *ai;
++          hints.ai_family = AF_INET;
++          TEST_COMPARE (getaddrinfo (query, "80", &amp;hints, &amp;ai), EAI_NONAME);
++          hints.ai_family = AF_INET6;
++          TEST_COMPARE (getaddrinfo (query, "80", &amp;hints, &amp;ai), EAI_NONAME);
++          hints.ai_family = AF_UNSPEC;
++          TEST_COMPARE (getaddrinfo (query, "80", &amp;hints, &amp;ai), EAI_NONAME);
++        }
++    };
++
++  resolv_test_end (aux);
++
++  return 0;
++}
++
++#include &lt;support/test-driver.c&gt;
+diff --git a/sysdeps/posix/getaddrinfo.c b/sysdeps/posix/getaddrinfo.c
+index 553833d1f2..c91b281e31 100644
+--- a/sysdeps/posix/getaddrinfo.c
++++ b/sysdeps/posix/getaddrinfo.c
+@@ -488,7 +488,7 @@ gaih_inet (const char *name, const struct gaih_service *service,
+ 	  malloc_name = true;
+ 	}
+ 
+-      if (__inet_aton (name, (struct in_addr *) at-&gt;addr) != 0)
++      if (__inet_aton_exact (name, (struct in_addr *) at-&gt;addr) != 0)
+ 	{
+ 	  if (req-&gt;ai_family == AF_UNSPEC || req-&gt;ai_family == AF_INET)
+ 	    at-&gt;family = AF_INET;
+-- 
+2.20.1
+
+
+From c533244b8e00ae701583ec50aeb43377d292452d Mon Sep 17 00:00:00 2001
+From: Florian Weimer <a class="moz-txt-link-rfc2396E" href="mailto:fweimer@redhat.com">&lt;fweimer@redhat.com&gt;</a>
+Date: Mon, 4 Feb 2019 20:07:18 +0100
+Subject: [PATCH 4/4] nscd: Do not use __inet_aton_exact@GLIBC_PRIVATE [BZ
+ #20018]
+
+This commit avoids referencing the __inet_aton_exact@GLIBC_PRIVATE
+symbol from nscd.  In master, the separately-compiled getaddrinfo
+implementation in nscd needs it, however such an internal ABI change
+is not desirable on a release branch if it can be avoided.
+---
+ ChangeLog             | 10 ++++++++++
+ nscd/Makefile         |  2 +-
+ nscd/gai.c            |  6 ++++++
+ nscd/nscd-inet_addr.c | 32 ++++++++++++++++++++++++++++++++
+ 4 files changed, 49 insertions(+), 1 deletion(-)
+ create mode 100644 nscd/nscd-inet_addr.c
+
+diff --git a/nscd/Makefile b/nscd/Makefile
+index b713a84c49..eb23c01a39 100644
+--- a/nscd/Makefile
++++ b/nscd/Makefile
+@@ -36,7 +36,7 @@ nscd-modules := nscd connections pwdcache getpwnam_r getpwuid_r grpcache \
+ 		getsrvbynm_r getsrvbypt_r servicescache \
+ 		dbg_log nscd_conf nscd_stat cache mem nscd_setup_thread \
+ 		xmalloc xstrdup aicache initgrcache gai res_hconf \
+-		netgroupcache
++		netgroupcache nscd-inet_addr
+ 
+ ifeq ($(build-nscd)$(have-thread-library),yesyes)
+ 
+diff --git a/nscd/gai.c b/nscd/gai.c
+index f57f396f57..68a4abd30e 100644
+--- a/nscd/gai.c
++++ b/nscd/gai.c
+@@ -33,6 +33,12 @@
+ #define __getifaddrs getifaddrs
+ #define __freeifaddrs freeifaddrs
+ 
++/* We do not want to export __inet_aton_exact.  Get the prototype and
++   change its visibility to hidden.  */
++#include &lt;arpa/inet.h&gt;
++__typeof__ (__inet_aton_exact) __inet_aton_exact
++  __attribute__ ((visibility ("hidden")));
++
+ /* We are nscd, so we don't want to be talking to ourselves.  */
+ #undef  USE_NSCD
+ 
+diff --git a/nscd/nscd-inet_addr.c b/nscd/nscd-inet_addr.c
+new file mode 100644
+index 0000000000..f366b9567d
+--- /dev/null
++++ b/nscd/nscd-inet_addr.c
+@@ -0,0 +1,32 @@
++/* Legacy IPv4 text-to-address functions.  Version for nscd.
++   Copyright (C) 2019 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <a class="moz-txt-link-rfc2396E" href="http://www.gnu.org/licenses/">&lt;http://www.gnu.org/licenses/&gt;</a>.  */
++
++#include &lt;arpa/inet.h&gt;
++
++/* We do not want to export __inet_aton_exact.  Get the prototype and
++   change the visibility to hidden.  */
++#include &lt;arpa/inet.h&gt;
++__typeof__ (__inet_aton_exact) __inet_aton_exact
++  __attribute__ ((visibility ("hidden")));
++
++/* Do not provide definitions of the public symbols exported from
++   libc.  */
++#undef weak_alias
++#define weak_alias(from, to)
++
++#include &lt;resolv/inet_addr.c&gt;
+-- 
+2.20.1
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------2EA449D53ACDF3492EC8DF5F--
