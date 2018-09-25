Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id BE37B79751
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 23:15:27 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id v133-v6so5128026pgb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 16:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=LIX68uvO1q9L0d5iIsTN17dG49GSR0XTFlkJBCRk2bQ=;
	b=dxjNaesgvtoWlcftZ/JetM5CTUy+5zIuX5WEP0aAOKWQURF1dnBDi8QZPh9aBpTdgr
	zFRmkwzOpK3fPodkGKVF1oZFR3FkBgQV847GJp2mxHJ686cMdMLz5UUCtbM4F54BZPQi
	13XVQ0xe/QS6CkA7BTCrYTSd9N9heAMucRWxaVX5hEbL22GrL+zAIIuap0v+d4hWbRs5
	EVGQENZJ61Nn/X6mexb2nMEXz+Vzryivm+HnYlCObO87o99Tv8TFkN7DC/U8f9dB5fn5
	FWALgfclr1aGCm4JTaEqsPfXfx9Y2gLWhekjNceKSubWgHTDCka3Yo1QUABHhA3mfgti
	hgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=LIX68uvO1q9L0d5iIsTN17dG49GSR0XTFlkJBCRk2bQ=;
	b=R85mFlA1fKAKGKuyY/UmNtiCTvHGu9QfvQ7XmVF6b7fsEdYiCybgX70QgVdKsXMWwv
	CmHj+Mun+SAp2Ji8dVecwzacV9BtY2nSiqFjkvXvTzZ7Zhx9fffFXVkcQy/wK+XPsx+L
	iGJ0NJGUzlkwRY4okEE1rNRN7duzHcKnt6ymRt/CgdtlwNMx8sNAGO040NlxqBGxnxMc
	EziDWGHzHvEH/1jMCsXKmN93z5qbnmTmpo2AH7AReH3sSf2vza/9e0pppxhNmR9vC7yh
	VY2ph4Elan3LwmeMs3uXtgWJJhz3NfEQMbi5SeQK8Ofbp1hOcIrC8TrEgB/TkfaemV2X
	AR/w==
X-Gm-Message-State: ABuFfojpUwHFJpJmy3FfMhuD6OZ3h4GFdTypmfeFdzvVLdrmVP04VhRl
	Vvt2ATDX55DvuBGEuWculiQkdE7c
X-Google-Smtp-Source: ACcGV62NHw9cOHs0rj95kUOLuxmFpNcBEN/NNGgAFssGfIokbYu0XUqMLoS6b15YL/qEODy3pgLOWQ==
X-Received: by 2002:a63:fd06:: with SMTP id
	d6-v6mr2990355pgh.348.1537917328832; 
	Tue, 25 Sep 2018 16:15:28 -0700 (PDT)
Received: from [10.43.100.234] (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	p75-v6sm5993449pfi.22.2018.09.25.16.15.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Sep 2018 16:15:26 -0700 (PDT)
To: Sinan Kaya <okaya@kernel.org>, openembedded-core@lists.openembedded.org
References: <20180925171828.8655-1-okaya@kernel.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <1e105b39-ed1e-15d0-296a-42c0deb785ac@gmail.com>
Date: Tue, 25 Sep 2018 16:15:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180925171828.8655-1-okaya@kernel.org>
Subject: Re: [sumo] [PATCH v1 1/2] libice: CVE-2017-2626
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
X-List-Received-Date: Tue, 25 Sep 2018 23:15:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/25/2018 10:18 AM, Sinan Kaya wrote:
> * CVE-2017-2626
> It was discovered that libICE before 1.0.9-8 used a weak entropy to
> generate keys. A local attacker could potentially use this flaw for
> session hijacking using the information available from the process list.
>
> Affects libice < 1.0.9-8
>
> CVE: CVE-2017-2626
> Ref: https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-2626
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  .../xorg-lib/libice/CVE-2017-2626.patch       | 144 ++++++++++++++++++
>  .../recipes-graphics/xorg-lib/libice_1.0.9.bb |   4 +
>  2 files changed, 148 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libice/CVE-2017-2626.patch
>
> diff --git a/meta/recipes-graphics/xorg-lib/libice/CVE-2017-2626.patch b/meta/recipes-graphics/xorg-lib/libice/CVE-2017-2626.patch
> new file mode 100644
> index 0000000000..382e0428c0
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libice/CVE-2017-2626.patch
> @@ -0,0 +1,144 @@
> +From da5dc9e3a7a7e96284512f976f864f7ef13755b7 Mon Sep 17 00:00:00 2001
> +From: Benjamin Tissoires <benjamin.tissoires@gmail.com>
> +Date: Tue, 4 Apr 2017 19:12:53 +0200
> +Subject: [PATCH] Use getentropy() if arc4random_buf() is not available
> +
> +This allows to fix CVE-2017-2626 on Linux platforms without pulling in
> +libbsd.
> +The libc getentropy() is available since glibc 2.25 but also on OpenBSD.
> +For Linux, we need at least a v3.17 kernel. If the recommended
> +arc4random_buf() function is not available, emulate it by first trying
> +to use getentropy() on a supported glibc and kernel. If the call fails,
> +fall back to the current (partly vulnerable) code.
> +
> +Signed-off-by: Benjamin Tissoires <benjamin.tissoires@gmail.com>
> +Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
> +Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/lib/libICE/commit/?id=ff5e59f32255913bb1cdf51441b98c9107ae165b]
please add
CVE: CVE-2017-2626
> +Signed-off-by: Sinan Kaya <okaya@kernel.org>
> +---
> + configure.ac  |  2 +-
> + src/iceauth.c | 65 ++++++++++++++++++++++++++++++++++++---------------
> + 2 files changed, 47 insertions(+), 20 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 458882a..c971ab6 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -38,7 +38,7 @@ AC_DEFINE(ICE_t, 1, [Xtrans transport type])
> + 
> + # Checks for library functions.
> + AC_CHECK_LIB([bsd], [arc4random_buf])
> +-AC_CHECK_FUNCS([asprintf arc4random_buf])
> ++AC_CHECK_FUNCS([asprintf arc4random_buf getentropy])
> + 
> + # Allow checking code with lint, sparse, etc.
> + XORG_WITH_LINT
> +diff --git a/src/iceauth.c b/src/iceauth.c
> +index ef66626..9b77eac 100644
> +--- a/src/iceauth.c
> ++++ b/src/iceauth.c
> +@@ -42,31 +42,19 @@ Author: Ralph Mor, X Consortium
> + 
> + static int was_called_state;
> + 
> +-/*
> +- * MIT-MAGIC-COOKIE-1 is a sample authentication method implemented by
> +- * the SI.  It is not part of standard ICElib.
> +- */
> ++#ifndef HAVE_ARC4RANDOM_BUF
> + 
> +-
> +-char *
> +-IceGenerateMagicCookie (
> ++static void
> ++emulate_getrandom_buf (
> ++	char *auth,
> + 	int len
> + )
> + {
> +-    char    *auth;
> +-#ifndef HAVE_ARC4RANDOM_BUF
> +     long    ldata[2];
> +     int	    seed;
> +     int	    value;
> +     int	    i;
> +-#endif
> + 
> +-    if ((auth = malloc (len + 1)) == NULL)
> +-	return (NULL);
> +-
> +-#ifdef HAVE_ARC4RANDOM_BUF
> +-    arc4random_buf(auth, len);
> +-#else
> + #ifdef ITIMER_REAL
> +     {
> + 	struct timeval  now;
> +@@ -74,13 +62,13 @@ IceGenerateMagicCookie (
> + 	ldata[0] = now.tv_sec;
> + 	ldata[1] = now.tv_usec;
> +     }
> +-#else
> ++#else /* ITIMER_REAL */
> +     {
> + 	long    time ();
> + 	ldata[0] = time ((long *) 0);
> + 	ldata[1] = getpid ();
> +     }
> +-#endif
> ++#endif /* ITIMER_REAL */
> +     seed = (ldata[0]) + (ldata[1] << 16);
> +     srand (seed);
> +     for (i = 0; i < len; i++)
> +@@ -88,7 +76,46 @@ IceGenerateMagicCookie (
> + 	value = rand ();
> + 	auth[i] = value & 0xff;
> +     }
> +-#endif
> ++}
> ++
> ++static void
> ++arc4random_buf (
> ++	char *auth,
> ++	int len
> ++)
> ++{
> ++    int	    ret;
> ++
> ++#if HAVE_GETENTROPY
> ++    /* weak emulation of arc4random through the entropy libc */
> ++    ret = getentropy (auth, len);
> ++    if (ret == 0)
> ++	return;
> ++#endif /* HAVE_GETENTROPY */
> ++
> ++    emulate_getrandom_buf (auth, len);
> ++}
> ++
> ++#endif /* !defined(HAVE_ARC4RANDOM_BUF) */
> ++
> ++/*
> ++ * MIT-MAGIC-COOKIE-1 is a sample authentication method implemented by
> ++ * the SI.  It is not part of standard ICElib.
> ++ */
> ++
> ++
> ++char *
> ++IceGenerateMagicCookie (
> ++	int len
> ++)
> ++{
> ++    char    *auth;
> ++
> ++    if ((auth = malloc (len + 1)) == NULL)
> ++	return (NULL);
> ++
> ++    arc4random_buf (auth, len);
> ++
> +     auth[len] = '\0';
> +     return (auth);
> + }
> +-- 
> +2.19.0
> +
> diff --git a/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb b/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
> index f069749ce0..4962815ae3 100644
> --- a/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
> +++ b/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
> @@ -8,6 +8,10 @@ negotiating versions, and for reporting errors. "
>  
>  require xorg-lib-common.inc
>  
> +SRC_URI += "\
> +            file://CVE-2017-2626.patch \
> +"
> +
>  LICENSE = "MIT-style"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d162b1b3c6fa812da9d804dcf8584a93"
>  


