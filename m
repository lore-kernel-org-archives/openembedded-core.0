Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8478.1792505565958186893
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 07:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d7iJv0iF;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso23457265e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792505564; x=1793110364; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1H+1Q4Ft+3BHiqXk1YCdTNoPWSRB4mmFKSOHgu2breA=;
        b=d7iJv0iFWjN7ztAtqvniKhNxJJqMIxTfZVIq4jXM0ONvd0p34XXqIz3BRAbVcb2/8j
         gWyqtm4lNZlNs1+Gr17Ry0y0f6Q91qFVJNjqZ5AQUNyzdlT8kMNXqP/yxOUuhiQjg/1h
         tDZTJB+xukA/Ka/768Su2knJSQwZk70YGYipQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505564; x=1793110364;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1H+1Q4Ft+3BHiqXk1YCdTNoPWSRB4mmFKSOHgu2breA=;
        b=ztWnf3F5yRDJcomPmEolgKkJ/7H9QdV5BtPmvU2o0aLnKBqgKtCtcsWqMhfo3swfKl
         X4iYVcVMibjseyHeVMHJyiZATIAGqSjpwNnQHpBxyEp1HDlBJtigj94l01v/rGJbZHSI
         YKkxydg2FIXDsb71HP8BMaqRY+EdJxZAW8jcOIIP+VFU3jZxcM9lkEhLWcV3E/ompWJx
         t233EcmLTzuuZZK/iyAyTmALq10l67DskzLMudEmJ6p7ZGWeY58dihLKANPIvYbN2zdo
         HGLeE6G1IN13KceBKg/iSR4mAob+IIAQskVJQFu9iR4lmh17zFsCiKuuvTVMgmRVFlv+
         sGkQ==
X-Forwarded-Encrypted: i=1; AKwUvByyS1MRPOQDALlAdeu/tfuQ/Az3tH1XHHAocvxd1xyHHG+tJPlDUk8GihqF42iQyUfNVFKprfCMPcIhCXK9zXm97w==@lists.openembedded.org
X-Gm-Message-State: AFq9FYId0qxDTcBlSYKJUntL/EYvczCHdGmFILRn212lhFCaB96fJpUa
	WJt2ipSBlMLorAwoejpSXxqe/JVn0mlslC4u6KCkDJyRxTA2SBRKYYnOTpM3BHqjCTA=
X-Gm-Gg: AYBFou2avhqWHHtTpAQa6c/CVaOEGgeTMZCoL1sZog5IT5i9a120Pw0WP8mMjHHxngN
	Fy+kefo8NFUv6TW/Z5FcEuoOLjVmM4aFcuW6NysZKHtkYxZKwiEYrK2DApHAjCaaYygnk3WMsfQ
	OvA+WSs8PsekNRTft+BrEslZE7m7vCV6EP+1MBE/jEmS14V/JUDUOd48sKVAqZJbZTDK+vZ4+bS
	HuqXJN7GmB4ii3mRV+4CRPyRhIzyQWn3kH+wjJpp8NXesIxNVh7ezbSWMF52yMegk55Dg25nLS1
	QFquvN7/+FflKaD5a3DeeiuagGeS10UnS7XlyuJo5UDP1T3FZ0fkWqeWY3TefcVOKbD5MrWb+Ye
	Uoc+WpvwLVYnXss6CcnwKYymBQ6xRCfS3MZF0HleiuSqrGya6a19TfFW6ktqkP7BfTQECmHSWIW
	CAZvU9pj4MqGTmq+1R7dn6TxNGtuUTqyrlUrhOztqO0ithXXY/H7QXzwWr7KktGG7VNyLWhReQz
	NG49yXn4xPpiSBg4NYr16D0KpBZIRpmKz1wakjr2+SIW4nqd+6N8PUNUxI=
X-Received: by 2002:a05:600c:8483:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4a1fae5f41bmr7854775e9.4.1792505563900;
        Tue, 20 Oct 2026 07:12:43 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm300187455e9.5.2026.10.20.07.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:12:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 16:12:43 +0200
Message-Id: <DM9Q6VMZ61CV.2Q07W9Z32K7Q0@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 3/5] curl: fix CVE-2026-80255
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261019064320.3978613-1-dkelaiya@cisco.com>
 <20261019064320.3978613-4-dkelaiya@cisco.com>
In-Reply-To: <20261019064320.3978613-4-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 14:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248294

On Mon Oct 19, 2026 at 8:43 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> Apply prerequisite [3] to reject TABs in cookie attribute values.
> Retain test 1685 alongside the main fix and test 2885. Keep the
> 8.19.0 invalid_octets() adaptation that prevents test 1105 regressions.
>
> [1] https://github.com/curl/curl/commit/4f6aa41a0145e930e766775dbe860883d=
350aa0a
> [2] https://curl.se/docs/CVE-2026-80255.html
> [3] https://github.com/curl/curl/commit/8e8bdd36048c146fe843d8948a912fbd3=
98d1c5d
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../curl/curl/CVE-2026-80255-dependent.patch  | 139 ++++++++++++++++++
>  .../curl/curl/CVE-2026-80255.patch            | 125 ++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
>  3 files changed, 266 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255-depende=
nt.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-80255-dependent.patc=
h b/meta/recipes-support/curl/curl/CVE-2026-80255-dependent.patch
> new file mode 100644
> index 0000000000..ca7737e5dd
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-80255-dependent.patch
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
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-80255.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-80255.patch
> new file mode 100644
> index 0000000000..50af08fc3c
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-80255.patch
> @@ -0,0 +1,125 @@
> +From 4f6aa41a0145e930e766775dbe860883d350aa0a Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Thu, 27 Aug 2026 08:33:30 +0200
> +Subject: [PATCH] cookie: improve TAB handling
> +
> +For entries with a leading tab. Verified in test 2885.
> +
> +Reported-by: Stanislav Fort
> +Closes #22699
> +
> +CVE: CVE-2026-80255
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/4f6aa41a0=
145e930e766775dbe860883d350aa0a]
> +
> +Backport Changes:
> +- Made invalid_octets() reject TAB as required by the curl 8.19.0
> +  parser; without this adaptation, upstream test 1105 regresses.
> +- Registered test 2885 in the older test-list layout.
> +
> +(cherry picked from commit 4f6aa41a0145e930e766775dbe860883d350aa0a)
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> +---
> + lib/cookie.c           |  6 ++---
> + tests/data/Makefile.am |  2 +-
> + tests/data/test2885    | 52 ++++++++++++++++++++++++++++++++++++++++++
> + 3 files changed, 56 insertions(+), 4 deletions(-)
> + create mode 100644 tests/data/test2885
> +
> +diff --git a/lib/cookie.c b/lib/cookie.c
> +index 4d53cc4..c3adf1d 100644
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
> +@@ -453,7 +453,7 @@ parse_cookie_header(struct Curl_easy *data,
> +     struct Curl_str val;
> +=20
> +     /* we have a <name>=3D<value> pair or a stand-alone word here */
> +-    if(!curlx_str_cspn(&ptr, &name, ";\t\r\n=3D")) {
> ++    if(!curlx_str_cspn(&ptr, &name, ";\r\n=3D")) {
> +       bool sep =3D FALSE;
> +       curlx_str_trimblanks(&name);
> +=20
> +diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
> +index 13e47a3..18e7730 100644
> +--- a/tests/data/Makefile.am
> ++++ b/tests/data/Makefile.am
> +@@ -272,7 +272,7 @@ test2600 test2601 test2602 test2603 test2604 test260=
5 \
> + test2700 test2701 test2702 test2703 test2704 test2705 test2706 test2707=
 \
> + test2708 test2709 test2710 test2711 test2712 test2713 test2714 test2715=
 \
> + test2716 test2717 test2718 test2719 test2720 test2721 test2722 test2723=
 \
> +-\
> ++test2885 \
> + test3000 test3001 test3002 test3003 test3004 test3005 test3006 test3007=
 \
> + test3008 test3009 test3010 test3011 test3012 test3013 test3014 test3015=
 \
> + test3016 test3017 test3018 test3019 test3020 test3021 test3022 test3023=
 \
> +diff --git a/tests/data/test2885 b/tests/data/test2885
> +new file mode 100644
> +index 0000000..456224f
> +--- /dev/null
> ++++ b/tests/data/test2885
> +@@ -0,0 +1,52 @@
> ++<?xml version=3D"1.0" encoding=3D"US-ASCII"?>
> ++<testcase>
> ++<info>
> ++<keywords>
> ++HTTP
> ++cookies
> ++</keywords>
> ++</info>
> ++
> ++<reply>
> ++<data crlf=3D"headers">
> ++HTTP/1.1 200 OK
> ++Content-Length: 0
> ++Set-Cookie: thisis=3DSECRET;%TABSecure
> ++Set-Cookie: also=3Dnotab; Secure
> ++
> ++</data>
> ++</reply>
> ++
> ++<client>
> ++<features>
> ++cookies
> ++</features>
> ++<server>
> ++https
> ++</server>
> ++<name>
> ++Cookies with TAB before 'secure'
> ++</name>
> ++<command>
> ++https://cookie.example:%HTTPSPORT/%TESTNUMBER -c %LOGDIR/cookies.txt --=
resolve cookie.example:%HTTPSPORT:%HOSTIP --insecure
> ++</command>
> ++</client>
> ++
> ++<verify>
> ++<protocol crlf=3D"headers">
> ++GET /%TESTNUMBER HTTP/1.1
> ++Host: cookie.example:%HTTPSPORT
> ++User-Agent: curl/%VERSION
> ++Accept: */*
> ++
> ++</protocol>
> ++<file name=3D"%LOGDIR/cookies.txt" mode=3D"text">
> ++# Netscape HTTP Cookie File
> ++# https://curl.se/docs/http-cookies.html
> ++# This file was generated by libcurl! Edit at your own risk.
> ++
> ++cookie.example%TABFALSE%TAB/%TABTRUE%TAB0%TABalso%TABnotab
> ++cookie.example%TABFALSE%TAB/%TABTRUE%TAB0%TABthisis%TABSECRET
> ++</file>
> ++</verify>
> ++</testcase>
> +--=20
> +2.35.6
> diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-supp=
ort/curl/curl_8.19.0.bb
> index 322304f47d..33954465f7 100644
> --- a/meta/recipes-support/curl/curl_8.19.0.bb
> +++ b/meta/recipes-support/curl/curl_8.19.0.bb
> @@ -42,6 +42,8 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
>             file://CVE-2026-8926_p1.patch \
>             file://CVE-2026-8926_p2.patch \
>             file://CVE-2026-11564.patch \
> +           file://CVE-2026-80255-dependent.patch \
> +           file://CVE-2026-80255.patch \
>             file://CVE-2026-80230.patch \
>             "
> =20

My LLM thinks there is a part of the backport missing:
Secure<TAB>HttpOnly now loses the Secure flag.
- Upstream drops \t from the cookie-name scanner. That is safe upstream
  only because 6730081429 also runs invalid_octets() on every attribute
  name.
- The backport takes only the TAB part of invalid_octets(), not the
  per-name check (upstream 4f6aa41a01:lib/cookie.c:619-622).
- Result for a=3DSECRET; Secure<TAB>HttpOnly: 8.19.0 stored it with
  Secure, the series stores it without Secure, and upstream drops the
  cookie.

Can you look into it?

Regards,
--=20
Yoann Congal
Smile ECS

