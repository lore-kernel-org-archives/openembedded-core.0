Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14262.1794909251619123069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 01:54:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=TE3zW4Gv;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so13582415e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 01:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794909250; x=1795514050; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rumP5lJcMiU7HtFL32eJWb4QCNa02kFn+tKnieuCO+Q=;
        b=TE3zW4Gv8daATLqXbbxBPbFhIqALEEducu1Pmrqbyr0LlW6qByQSIx9b7tFuAvXgrn
         Y8wYdljURybL2vyDakOHvNoSufIu3RqIZekat8bJH0cwqLZEMtTRgaqUiX2LiG4vcRNG
         f47OsWI1iD2swMfFP2d623slcRlRImq6EU1spPyvd2nz9DnlktrbOLNUw9eMIWfs15nb
         r+yZO7qDdFwZ/owJt3ewOYkHjBvcIBbgI8IyGBH7kXRp8IYK0okyAK0XAD7XUQWv4vk4
         jUiA69U2RXez9UhKadSIAjB31h6BsECcwM3+XM/V+xUsh9Kqq+u9p9jWkqYYDhHEgKlO
         Nk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794909250; x=1795514050;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rumP5lJcMiU7HtFL32eJWb4QCNa02kFn+tKnieuCO+Q=;
        b=hGsNB7XPEfraaZBeoVagocTm2ASbwCWkkBbOcxcxUeJG9CwCTAD6tdPW/vhfmWiWl2
         +AVbHjnMi+rWt3LYcAOC07N3j+J9dTq9o+sGtK544uhV/ch89W9ZWV5mvmg5qtPA82jQ
         A6rThnc4gMvt4tnmsrwT2KAjgJIV2MGT21hk4XGOjL+qbQzvprZrqfZTeli+hloCX8sy
         KJgFtwFGX4Z49WNTubmQa9tSHCMfHY3PkAT5rROOkrEwEppaifLiGD9WgM9IFjpBGk0u
         J/P06LebTiJEaZxKKGOAXFDPKE/8PTa3whbYCRXilCMOT69ZW3d0J28kHA/C+xnLkGNm
         GWBw==
X-Forwarded-Encrypted: i=1; AL+hErFFR+DWfvXROFjdl0bgNpLZrClZAyldBi0TCTdwV+41MtgdrdsGILwQYTwYdi/dnERoKYhzP7g0XOasEuopCYg6VA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+u+7mh8856la2bZLgxKIlk0RS9XBwi286qFD6CIILStJHkLODl
	ZwZc4tpAnQdCsvOtsXceE8K1p8ts88gejmO8ysLze0aBZn5MDI21+K3J0hmHPpzFRkI=
X-Gm-Gg: AYBFou1D3JCwQDBnupIh90RcvEMEyqAUaqSEtViGmo1zSJ5KvcHAb+3D96YUHVL+2NB
	Jq+XCxwZClCtzSXxaTYp2TkfTjyqdpbBWP1Hp1PnXQqu5IWuvcUysWKaSOm+ZBVMLDhqsxV4Iws
	fqJBIdxGG/e93d3MBVqAHxRyJZxFxuamcceHSa2O3JkkwP5otGDlonWnaDKS7YtUqBVbIXeSd7L
	7zdTX2PS9SnEpiafPA7EzLw+I4WXrwSaZBZTb6sBOibUusBQP3Dyy8jN4r8zmSQzQ/Lzj5h2ryX
	pCfzcOZxC6CQoQrxHdjhrOWAoVpo/6iolvSvNN9JkIvNTUS2waJki4pGLBIURQwIrI5PMVoIzKb
	Gbt6qELVhJOfpRAlQgHuOR7cIfEdbVPNxUcxBYgU9S+Z1tYoHrIHVoxbN9BT/boXSp8PE0A8ifs
	kX0NZY1DcxN5t6jqI9RlOSJtdYeS7gK0Rh1t9V8CiNU6+K9x+YFkhiWT9NZ22d/Gu4QPH7pkwxl
	mR9omdBS+5+hAnQKdR1r6ZKAKE4KiVzZW99/PmO7koETCVoisaoYoCGjBmJ5vrEnuDtOoPjzN+F
	AzVB0BFlcSjCCR2mbcYU1u2sgVUoqMN5tKRh5JzgfEBkAEUR7KmUAjJ5OicNwiipqZsUjU42fXe
	YW9HUABlmOYm+yxVb
X-Received: by 2002:a05:600c:6089:b0:4bb:76d9:f81a with SMTP id 5b1f17b1804b1-4bb76d9f83amr66619145e9.34.1794909249644;
        Tue, 17 Nov 2026 01:54:09 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm20696085e9.15.2026.11.17.01.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:54:08 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 10:54:08 +0100
Message-Id: <DMXE85B25SK0.3VK8FVR2RZ6AI@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH v2 3/5] curl: fix CVE-2026-80255
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261023093331.1886272-1-dkelaiya@cisco.com>
 <20261023093331.1886272-4-dkelaiya@cisco.com>
In-Reply-To: <20261023093331.1886272-4-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 09:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250417

On Fri Oct 23, 2026 at 11:33 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCH=
IPS PRIVATE LIMITED at Cisco) wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> Apply prerequisite [3] to reject TABs in attribute values, then
> prerequisite [4] for per-attribute name/value validation. Carry them
> as separate dependent_p1 and dependent_p2 patches before the main
> TAB-handling fix. Preserve test 1685 and the invalid_octets()
> adaptation required by the older parser.
>
> Keep test 2885's Secure<TAB>HttpOnly regression case alongside the
> upstream TAB-before-Secure case and normal Secure control.
>
> [1] https://github.com/curl/curl/commit/4f6aa41a0145e930e766775dbe860883d=
350aa0a
> [2] https://curl.se/docs/CVE-2026-80255.html
> [3] https://github.com/curl/curl/commit/8e8bdd36048c146fe843d8948a912fbd3=
98d1c5d
> [4] https://github.com/curl/curl/commit/67300814294ab0aa311b8568b460619ec=
c522949
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
> Changes in v2:
> - Reject malformed attribute names/values before dispatch so a cookie
>   cannot lose its Secure flag.
> - Carry the TAB-value fix and adapted validation in separate
>   dependent_p1 and dependent_p2 patches before the main fix.
> - Extend test 2885 with the malformed attribute case, retaining the
>   TAB-before-Secure and normal Secure controls.
> ---
>  .../curl/CVE-2026-80255-dependent_p1.patch    | 139 ++++++++++++++++++
>  .../curl/CVE-2026-80255-dependent_p2.patch    |  81 ++++++++++
>  .../curl/curl/CVE-2026-80255.patch            | 115 +++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   3 +
>  4 files changed, 338 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255-depende=
nt_p1.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255-depende=
nt_p2.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-80255-dependent_p1.p=
atch b/meta/recipes-support/curl/curl/CVE-2026-80255-dependent_p1.patch
> new file mode 100644
> index 0000000000..ca7737e5dd
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-80255-dependent_p1.patch
> @@ -0,0 +1,139 @@
> +From 8e8bdd36048c146fe843d8948a912fbd398d1c5d Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Wed, 1 Apr 2026 08:09:47 +0200
> +Subject: [PATCH] cookie: fix rejection when tabs in value
> +
> +A previous refactor changed the TAB check so that the octet could be
> +accepted in the 'path', which would cause an invalid line in the saved
> +cookie file so not possible to read the cookie back. Not terrible
> +because the path cannot contain a raw tab anyway so it would never match
> +anyway.
> +
> +Add test 1685 to verify
> +
> +Reported-by: Izan on hackerone
> +
> +Closes #21185
> +
> +CVE: CVE-2026-80255
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/8e8bdd360=
48c146fe843d8948a912fbd398d1c5d]
> +
> +Backport Changes:
> +- Registered test 1685 in the older curl 8.19.0 test-list row.
> +
> +(cherry picked from commit 8e8bdd36048c146fe843d8948a912fbd398d1c5d)
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> +---
> + lib/cookie.c           | 14 ++++++-------
> + tests/data/Makefile.am |  2 +-
> + tests/data/test1685    | 57 +++++++++++++++++++++++++++++++++++++++++++=
+++++++
> + 3 files changed, 65 insertions(+), 8 deletions(-)
> +
> +diff --git a/lib/cookie.c b/lib/cookie.c
> +index 4d53cc4..cd95130 100644
> +--- a/lib/cookie.c
> ++++ b/lib/cookie.c
> +@@ -461,6 +461,13 @@ parse_cookie_header(struct Curl_easy *data,
> +         sep =3D TRUE; /* a '=3D' was used */
> +         if(!curlx_str_cspn(&ptr, &val, ";\r\n"))
> +           curlx_str_trimblanks(&val);
> ++
> ++        /* Reject cookies with a TAB inside the value */
> ++        if(curlx_strlen(&val) &&
> ++           memchr(curlx_str(&val), '\t', curlx_strlen(&val))) {
> ++          infof(data, "cookie contains TAB, dropping");
> ++          return CURLE_OK;
> ++        }
> +       }
> +       else
> +         curlx_str_init(&val);
> +@@ -489,13 +496,6 @@ parse_cookie_header(struct Curl_easy *data,
> +           return CURLE_OK;
> +         }
> +=20
> +-        /* Reject cookies with a TAB inside the value */
> +-        if(curlx_strlen(&val) &&
> +-           memchr(curlx_str(&val), '\t', curlx_strlen(&val))) {
> +-          infof(data, "cookie contains TAB, dropping");
> +-          return CURLE_OK;
> +-        }
> +-
> +         /* Check if we have a reserved prefix set. */
> +         if(!strncmp("__Secure-", curlx_str(&name), 9))
> +           co->prefix_secure =3D TRUE;
> +diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
> +index ea700cd..5bb4f7e 100644
> +--- a/tests/data/Makefile.am
> ++++ b/tests/data/Makefile.am
> +@@ -226,7 +226,7 @@ test1660 test1661 test1662 test1663 test1664 test166=
5 \
> + \
> + test1670 test1671 \
> + \
> +-test1680 test1681 test1682 test1683 \
> ++test1680 test1681 test1682 test1683 test1685 \
> + \
> + test1700 test1701 test1702 test1703 test1704 test1705 test1706 test1707=
 \
> + test1708 test1709 test1710 test1711 test1712 \
> +diff --git a/tests/data/test1685 b/tests/data/test1685
> +new file mode 100644
> +index 0000000..b98dc20
> +--- /dev/null
> ++++ b/tests/data/test1685
> +@@ -0,0 +1,57 @@
> ++<?xml version=3D"1.0" encoding=3D"US-ASCII"?>
> ++<testcase>
> ++<info>
> ++<keywords>
> ++HTTP
> ++cookies
> ++</keywords>
> ++</info>
> ++
> ++# Server-side
> ++<reply>
> ++<data crlf=3D"headers">
> ++HTTP/1.0 200 OK swsclose
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Content-Type: text/html
> ++Set-Cookie: name=3Dcontent; path=3D/we%TABwant
> ++Set-Cookie: accept=3Dthis; path=3D/only/this
> ++
> ++boo
> ++</data>
> ++</reply>
> ++
> ++# Client-side
> ++<client>
> ++<server>
> ++http
> ++</server>
> ++<name>
> ++HTTP, reject cookie with tab in path
> ++</name>
> ++<command>
> ++http://%HOSTIP:%HTTPPORT/ -c %LOGDIR/jar%TESTNUMBER.txt
> ++</command>
> ++
> ++<features>
> ++cookies
> ++</features>
> ++</client>
> ++
> ++# Verify data after the test has been "shot"
> ++<verify>
> ++<protocol crlf=3D"headers">
> ++GET / HTTP/1.1
> ++Host: %HOSTIP:%HTTPPORT
> ++User-Agent: curl/%VERSION
> ++Accept: */*
> ++
> ++</protocol>
> ++<file name=3D"%LOGDIR/jar%TESTNUMBER.txt" mode=3D"text">
> ++# Netscape HTTP Cookie File
> ++# https://curl.se/docs/http-cookies.html
> ++# This file was generated by libcurl! Edit at your own risk.
> ++
> ++127.0.0.1%TABFALSE%TAB/only/this%TABFALSE%TAB0%TABaccept%TABthis
> ++</file>
> ++</verify>
> ++</testcase>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-80255-dependent_p2.p=
atch b/meta/recipes-support/curl/curl/CVE-2026-80255-dependent_p2.patch
> new file mode 100644
> index 0000000000..8950b28784
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-80255-dependent_p2.patch
> @@ -0,0 +1,81 @@
> +From 67300814294ab0aa311b8568b460619ecc522949 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Wed, 3 Jun 2026 08:10:14 +0200
> +Subject: [PATCH] cookie: refactor parse_cookie_header
> +
> +- introduce a few static helper functions
> +- simplify the bad octet checks
> +- simplify the too long cookie/value check
> +
> +Closes #21854
> +
> +CVE: CVE-2026-80255
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/673008142=
94ab0aa311b8568b460619ecc522949]
> +
> +Backport Changes:
> +- Kept parse_cookie_header() in its curl 8.19.0 form instead of
> +  extracting parse_first_pair(), parse_flag(), parse_domain(),
> +  parse_maxage() and parse_expires().
> +- Applied the control-octet checks to that existing parser: reject
> +  TAB in invalid_octets(), validate every attribute name/value,
> +  and remove the duplicate first-pair checks.
> +- Kept the older cookie name/value length limits; omitted upstream's
> +  separate simplification of those limits.
> +
> +(cherry picked from commit 67300814294ab0aa311b8568b460619ecc522949)
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> +---
> + lib/cookie.c | 17 +++++++++--------
> + 1 file changed, 9 insertions(+), 8 deletions(-)
> +
> +diff --git a/lib/cookie.c b/lib/cookie.c
> +index cd95130..b3b1ebd 100644
> +--- a/lib/cookie.c
> ++++ b/lib/cookie.c
> +@@ -354,9 +354,9 @@ static bool bad_domain(const char *domain, size_t le=
n)
> + static bool invalid_octets(const char *ptr, size_t len)
> + {
> +   const unsigned char *p =3D (const unsigned char *)ptr;
> +-  /* Reject all bytes \x01 - \x1f (*except* \x09, TAB) + \x7f */
> ++  /* Reject all bytes \x01 - \x1f + \x7f */
> +   while(len && *p) {
> +-    if(((*p !=3D 9) && (*p < 0x20)) || (*p =3D=3D 0x7f))
> ++    if((*p < 0x20) || (*p =3D=3D 0x7f))
> +       return TRUE;
> +     p++;
> +     len--;
> +@@ -457,15 +457,18 @@ parse_cookie_header(struct Curl_easy *data,
> +       bool sep =3D FALSE;
> +       curlx_str_trimblanks(&name);
> +=20
> ++      if(invalid_octets(curlx_str(&name), curlx_strlen(&name))) {
> ++        infof(data, "invalid octets in name, cookie dropped");
> ++        return CURLE_OK;
> ++      }
> ++
> +       if(!curlx_str_single(&ptr, '=3D')) {
> +         sep =3D TRUE; /* a '=3D' was used */
> +         if(!curlx_str_cspn(&ptr, &val, ";\r\n"))
> +           curlx_str_trimblanks(&val);
> +=20
> +-        /* Reject cookies with a TAB inside the value */
> +-        if(curlx_strlen(&val) &&
> +-           memchr(curlx_str(&val), '\t', curlx_strlen(&val))) {
> +-          infof(data, "cookie contains TAB, dropping");
> ++        if(invalid_octets(curlx_str(&val), curlx_strlen(&val))) {
> ++          infof(data, "invalid octets in value, cookie dropped");
> +           return CURLE_OK;
> +         }
> +       }
> +@@ -476,8 +479,6 @@ parse_cookie_header(struct Curl_easy *data,
> +         /* The first name/value pair is the actual cookie name */
> +         if(!sep ||
> +            /* Bad name/value pair. */
> +-           invalid_octets(curlx_str(&name), curlx_strlen(&name)) ||
> +-           invalid_octets(curlx_str(&val), curlx_strlen(&val)) ||
> +            !curlx_strlen(&name)) {
> +           infof(data, "invalid octets in name/value, cookie dropped");
                           ^ That message does not apply anymore. This
						   is only verbose/debug code but that makes me
						   wonder if that doesn't hide more something
						   more serious...

I know refactors are usually unacceptable from stables. But, in this
case, I wonder if taking the whole commit would make this fix more easy
to review (an upstream-vetted refactor might be preferable over me
checking if a partial backport has all the right pieces)

What do you think?

Regards,
--=20
Yoann Congal
Smile ECS

