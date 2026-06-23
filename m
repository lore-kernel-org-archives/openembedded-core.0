Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50061CDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 09:53:02 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17273.1782208376856382667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 02:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Sa+9eSqH;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4924944fe6bso20290625e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 02:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782208375; x=1782813175; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oxw6gD8kVlIiqChifI9qfPGy/LObrPVWwzFvuRBUqwQ=;
        b=Sa+9eSqHLb8AKZw5rceQc2BSqk2JjqVZfOwdcCFULYesPO/F4hGVKFkAZBrEJkFfkS
         Fkt4+TR1+9yuR3FstUXw1gRbZUuccl1EDfTKS0SDq/T1FVozRx33xgFoTu4te12bMdw/
         Cwd/kDO7XRatZNhLOJ2PSlWaFu6vrcqXGUDbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782208375; x=1782813175;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oxw6gD8kVlIiqChifI9qfPGy/LObrPVWwzFvuRBUqwQ=;
        b=AmvyZC+tUtfnNVhQMcObuIhNyOw/aOgsme8OwSdAI5cCn7gADI8PnmD0gkbWqN3Y7j
         A1uJnIuhCzYCb/bGf0el25VaoHMsFjdeF79PI033J0idKR2IwEpjAqXITND/J4epWhJf
         3rNgEbpA1qErbit9LdaRCIZ2ddKdh8+mkd2DVudq0+jtui2LOAfK2RIyRpr3IpGpFbXU
         gpCLZoF6HqS5D9IH6UB+OWGJ1UTXskXTI28Arv9zWxJ6CCTF9N/Cff+rJoUbupaLk7Sf
         IZHTNa+uI2tyQ3m4Mkk9JJpsDR40+HR02RKuvLFYYQLg2G9c/jsapULddrTOqPLdXh4u
         92Kg==
X-Forwarded-Encrypted: i=1; AFNElJ9JW0WuAmBzbXMaKLj4BDQ2WiW9m/dSTEAlYIN7kIptHw+Zt/htUD8h1kvmYcPSiN2YSI5yDE3xsvtmk6xPts6qAQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx6CLzJlz/L/SscgEn+0sZqpdJXvYODN7YEtTBq6TYQSgdCqwhX
	l+K5qACJAZllxPDfQlvJ/NkjheiQoZHjxSFNZMdzr6Xmxh3LiFGPT3lWekW7lXwqjw8=
X-Gm-Gg: AfdE7cmOTtVMZhNgoA6WrVY/OL5qtXLYeZ/DkbHLhrjOB5mRykdtHdmN8fi7q62IX1T
	ldXPRAFudA2EYHvYv1lDNMFHjeBSEfPduJsqeGf1RdXrlz0fA9nwMXb6WGpdNG5zjwxlhHxaQOt
	ZGGcJ2gxonuv1qQy+z6lyhwkq5JjHXrFvMRjm9xyP8YNC2D70Hrug+R1m3OpP4sYj2d+k4SCvlV
	vBKhm2OkxC48vSr1glaqtWGG3lH10CO03b8kt64/297yNWQt0FvEm23CZeOY+BV0T0gyNgx2yaq
	DuAA8h9WesgDH3fR84deStvylJ6DT9hW8llqnRdvdzifxVMIfwRgn3/uzXBLHoRnLsZxpZOVXHg
	Gz5sH9pT7obfbkFlPUMqzYmh3eRRw2TJctZXoPWaSIP2+AWTEmE7pyWa8x0v1zlnSwT3OPa4zQx
	DP74fP+w5Qxa18WP7jW6ENjG79N1pbJLZU9sI0hr4wJ6D25HraLkrcl4iDDEC0OzGNYu5X+kht9
	7QCMBwGH6yjuIxV
X-Received: by 2002:a05:600c:5493:b0:490:e89a:b221 with SMTP id 5b1f17b1804b1-49240e7bbf5mr307304365e9.35.1782208374911;
        Tue, 23 Jun 2026 02:52:54 -0700 (PDT)
Received: from localhost (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c4f01sm35859043f8f.9.2026.06.23.02.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:52:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 11:52:47 +0200
Message-Id: <DJGC511P61AE.E73L7KON0I4V@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] curl: Fix CVE-2026-5773 - SMB
 connection reuse across shares
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260623074847.3424-1-jaipaul.cheernam@est.tech>
 <DJG9WMVQMIFF.3TZSO15OKI2BQ@smile.fr>
 <DU7PPF66507B2D7869F7C42A97DF6B1B6D5F3EE2@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <DU7PPF66507B2D7869F7C42A97DF6B1B6D5F3EE2@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 09:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239343

On Tue Jun 23, 2026 at 11:15 AM CEST, Jaipaul Cheernam wrote:
> Hi Yoann,
>
> I am thinking about curl uplift from 8.19.0 to 8.20.0 in wrynose which wi=
ll fix below CVEs as well.
>
> Let me know if you have any comment on uplift ?
>
> 8.20.0 is a security release fixing 7 CVEs [1]:
>
> * CVE-2026-5773: wrong reuse of SMB connection
> * CVE-2026-5545: wrong reuse of HTTP Negotiate connection
> * CVE-2026-6253: proxy credentials leak over redirect-to proxy
> * CVE-2026-6276: UPLOAD_BUFFERSIZE buffer overflow
> * CVE-2026-4873: connection reuse ignores TLS requirement
> * CVE-2026-7168: cross-proxy Digest auth state leak
> * CVE-2026-6429: netrc credential leak with reused proxy connection
>
> ABI compatible as well.

In https://curl.se/ch/8.20.0.html I see:
>  Changes:
>  * async-thrdd: use thread queue for resolving
>  * build: make NTLM disabled by default
>  * cmake: drop support for CMake 3.17 and older
>  * lib: add thread pool and queue
>  * lib: drop support for < c-ares 1.16.0
>  * lib: make SMB support opt-in
>  * multi.h: add CURLMNWC_CLEAR_ALL
>  * rtmp: drop support

Quickly glancing at it, that look like changes not allowed under our
stable policy. Sorry.


>
>
> Regards,
> Jaipaul Cheernam
>
> =F0=9F=94=97 EST Website<https://www.est.tech/>
> =F0=9F=94=97 EST LinkedIn<https://www.linkedin.com/company/ericsson-softw=
are-technology/>
>
> From: Yoann Congal <yoann.congal@smile.fr>
> Date: Tuesday, 23 June 2026 at 10:07
> To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>; openembedded-core@lists=
.openembedded.org <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [scarthgap][PATCH] curl: Fix CVE-2026-5773 - SMB c=
onnection reuse across shares
>
> On Tue Jun 23, 2026 at 9:48 AM CEST, Jaipaul Cheernam via lists.openembed=
ded.org wrote:
>> libcurl's SMB handler marks connections for reuse (connkeep) without
>> verifying that subsequent requests target the same share. This allows
>> a second SMB request to the same host to reuse a connection
>> authenticated for a different share, potentially accessing data
>> without proper authorization.
>>
>> The upstream fix removes connection reuse for SMB entirely in
>> lib/protocol.c, a file introduced in curl 8.20.0. For 8.7.1, the
>> equivalent fix is changing connkeep() to connclose() in lib/smb.c,
>> which prevents the connection from being returned to the pool.
>>
>> Tested with SMBv1 server (Docker dperson/samba):
>>   Without patch: "Re-using existing connection" for different shares
>>   With patch: New connection per request, no reuse
>>
>> Binary verified: Curl_conncontrol arg changes from 0 (KEEP) to 1 (CLOSE)
>>
>> Reference: https://curl.se/docs/CVE-2026-5773.html
>>
>> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>> ---
>
> Hello,
>
> The backported commit is in curl 8.20 but wrynose is only in 8.19. Can
> you check if the fix is needed for wrynose (and send it there if that is
> the case)?
>
> Thanks!
>
>>  .../curl/curl/CVE-2026-5773.patch             | 30 +++++++++++++++++++
>>  meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
>>  2 files changed, 31 insertions(+)
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch
>>
>> diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-5773.patch
>> new file mode 100644
>> index 0000000000..a62b389d62
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
>> @@ -0,0 +1,30 @@
>> +From 74a169575d6412dc0ff532acdf94de35a6c2a571 Mon Sep 17 00:00:00 2001
>> +From: Daniel Stenberg <daniel@haxx.se>
>> +Date: Sun, 5 Apr 2026 18:23:35 +0200
>> +Subject: [PATCH] smb: disable connection reuse
>> +
>> +Signed-off-by: Daniel Stenberg <daniel@haxx.se>
>> +
>> +CVE: CVE-2026-5773
>> +Upstream-Status: Backport [https://github.com/curl/curl/commit/74a16957=
5d6412dc0ff532acdf94de35a6c2a571]
>> +
>> +(cherry picked from commit 74a169575d6412dc0ff532acdf94de35a6c2a571)
>> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>> +---
>> + lib/smb.c | 3 +--
>> + 1 file changed, 1 insertion(+), 2 deletions(-)
>> +
>> +diff --git a/lib/smb.c b/lib/smb.c
>> +index 7c73cbcec..a1f5c9b31 100644
>> +--- a/lib/smb.c
>> ++++ b/lib/smb.c
>> +@@ -461,8 +461,7 @@ static CURLcode smb_connect(struct Curl_easy *data,=
 bool *done)
>> +   if(!smbc->send_buf)
>> +     return CURLE_OUT_OF_MEMORY;
>> +
>> +-  /* Multiple requests are allowed with this connection */
>> +-  connkeep(conn, "SMB default");
>> ++  connclose(conn, "SMB default");
>> +
>> +   /* Parse the username, domain, and password */
>> +   slash =3D strchr(conn->user, '/');
>> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-supp=
ort/curl/curl_8.7.1.bb
>> index 14d63d6373..d026731751 100644
>> --- a/meta/recipes-support/curl/curl_8.7.1.bb
>> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
>> @@ -36,6 +36,7 @@ SRC_URI =3D " \
>>      file://CVE-2026-1965-2.patch \
>>      file://CVE-2026-3783.patch \
>>      file://CVE-2026-3784.patch \
>> +    file://CVE-2026-5773.patch \
>>  "
>>
>>  SRC_URI:append:class-nativesdk =3D " \
>
>
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


