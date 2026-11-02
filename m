Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11723.1793623488292854397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 04:44:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=FHjXCNY8;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so33842475e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 04:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793623486; x=1794228286; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYmkexU5qByG1qwQv6QQnKQLArhVEnmyCoGs2Zpirk4=;
        b=FHjXCNY8sYISSUwY19/UP4XazNqcvkzpjE4329x7O97JNqGP72cZG3M5ZbPZvm87Dd
         NMUH/WcoHnvB4SeKKJ4tBg1ti8u+T01rRf5/Xb5CMkLgGQHvDmEv8+2NsFth1e22NVIE
         HYacoCAFUo0OX4Vomb4ozo7HP1lzQtbL7ol0aEukCqN2jKvPdOhg68SWN06WBL1lp8DP
         uo5PjYKHYvYE6yti/s0tUNPPQQ6oAHPaQjBqppS1Gza+AHT8mMi3u0pCkQEwfOTHs8lA
         8BGszdOUyp+SIornIXfAs9kQNK4JpwkciLPWWQ3JWfXJMELz/0Cewz3xlQT8SthPVJgo
         cazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623486; x=1794228286;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JYmkexU5qByG1qwQv6QQnKQLArhVEnmyCoGs2Zpirk4=;
        b=D4lz1t1+tNHiEq/tQQW1XroyAsTJY3UCNRaUCSsyMYxZ/UOyDSc0QwkeTplJNCAHeK
         b4/lT1me4HeA9supDNo4o8rjlnQSEZFoyIe9bR6gJOdSbGyrjTLmNr4g7NWLBtFXlQJZ
         BkkLiyLPGgN2V2B8QsjvcghtGKk2crxBFSZEzGe1dU9lIJhyk+/99v7hbgVBvX/2KuHV
         CGeDPpl72pyAl+kyb4zQ/BZiFQ4yKb9zIfgRf+VPOr9cEc7qhyssROLS3XPdnio2LSP+
         JzsId35CXAm+qZNfO+L8PD+Gs4V+TX2lx3aCiAe1LJv6DFEJWzNu3QDIEoCpaKQTymdl
         817A==
X-Forwarded-Encrypted: i=1; AKwUvBwSU4a6QQImL3U4dXSDE3+xOdyz3akf6XjLRPRoD/R00JSJIQamBWzLiNsVIFSzI7bnCTDyJ54MUfHDqbpaWX2bfQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIeDJXToD59YPpcBMYEsecCTsF27ForxGgogUg+QS8KjfjaeZ9m
	wPy25pruzyNTjNAg62ZQEPmFXACM9Bw0H7zixXUwLwPzqJHDApb5dGqjXl7SnQ7bWHc=
X-Gm-Gg: AYBFou0JU6BXUnmpHJnpkp4YxZGNrFKsdO2yBtkSnmBQW4baQSQl5ebXasWxNRLAuo5
	PFm2+E89DTD1rKv1CkoM1CyFc1PDfFg5/Tm/QLL9Ide8X3881uIEh9003dlGEvfKTEdJx60zIXb
	UtzoOjfcIRumaDXMr5fy7pmYfHTAC9+kFHd43Am44TmC4BhGGXyDhUjj9oe7v/3jpwD9kC8cWSP
	Z4SWjBhEFWcTOB+El989+uNow5ZVo1lX6vnQvWIo9UG+WwBsUx2Oywb86zNZxLd3f2Y6jCpGaSa
	+BSRzWs8SVmNP7QQd5rSxBLxQ37WH0mIXOFtk2hpqzKX5QXgAjwpcnhvT/N9NiyKPHX+OY0zaQ5
	WahY7uj6pjlSHFvMJrRsca3oFUU+t1A6uaRecaRGgOMM7l+5H1lj9QZScm7l3m25c1gkkmzufNW
	lyC7vh+0yuNP4zjoWMZ9e9LZtGJ8hanpj/mPwQlsOV2uICSfzKh3DJ8xSc7kCeTzUyH6o+g7c60
	Syl8+T7MWYZPnLuecGBUl9AxJiSWhfnvXSUvxhh3IQR7qO3a44Q+TPaHWgybtm3+CdTtZ+kt4zX
	BAvwgfjo764Sf531fGGFWQM0svFD/oXY3ttlKHUGHZTUA54/ZJd4DVi1ay1C08x8sKv50cdEdeC
	q7PF630XwlTwPPg==
X-Received: by 2002:a05:600c:34d1:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4ac183d136dmr221230015e9.24.1793623486409;
        Mon, 02 Nov 2026 04:44:46 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf723b5dcsm272956675e9.14.2026.11.02.04.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:44:45 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 13:44:45 +0100
Message-Id: <DMKQGM0OK34J.11PEY49EZB5M7@smile.fr>
To: "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap 19/55] python3-urllib3: Fix CVE-2026-97689
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <cover.1793405493.git.yoann.congal@smile.fr>
 <a24491466f8796015bd1146d874f4be52f10ad42.1793405493.git.yoann.congal@smile.fr> <64d8e8dcb939b38d9a3fb4999000a56138aa4f79.camel@pbarker.dev>
In-Reply-To: <64d8e8dcb939b38d9a3fb4999000a56138aa4f79.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 12:44:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249204

On Mon Nov 2, 2026 at 12:02 PM CET, Paul Barker wrote:
> On Sat, 2026-10-31 at 01:14 +0100, Yoann Congal wrote:
>> From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>>=20
>> Backport the upstream fix [1] as mentioned in [2]
>>=20
>> [1] https://github.com/urllib3/urllib3/commit/cd770b059b543be29298ea5c52=
afb0b1b090f5ed
>> [2] https://nvd.nist.gov/vuln/detail/cve-2026-97689
>>=20
>> Testing:
>>   - test_response.py::test_chunk_size_line_too_long - passed
>>   - test_response.py::test_chunk_trailer_line_length (6 cases) - passed
>>   - test_socketlevel.py::test_chunked_size_line_too_long_does_not_buffer=
 - passed
>>   - Full test_response.py: 161 passed, 45 skipped (no regressions)
>>=20
>> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>>  .../python3-urllib3/CVE-2026-97689.patch      | 251 ++++++++++++++++++
>>  .../python/python3-urllib3_2.2.2.bb           |  14 +-
>>  2 files changed, 258 insertions(+), 7 deletions(-)
>>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-202=
6-97689.patch
>>=20
>> diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689=
.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch
>> new file mode 100644
>> index 00000000000..98b007324cf
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch
>> @@ -0,0 +1,251 @@
>> +From 5d5fac45ff18a8159c5a4aa973ed9fc2f5dd35ad Mon Sep 17 00:00:00 2001
>> +From: Quentin Pradet <quentin.pradet@gmail.com>
>> +Date: Tue, 15 Sep 2026 22:33:41 +0400
>> +Subject: [PATCH] Merge commit from fork
>> +
>> +* Bound chunk-size line reads to prevent memory exhaustion DoS
>> +
>> +The streaming chunked path (HTTPResponse.stream() / read_chunked()) rea=
d
>> +each chunk-size line with an unbounded readline(), unlike the plain rea=
d()
>> +path which delegates to http.client's _MAXLINE-capped reader. A malicio=
us
>> +server could advertise Transfer-Encoding: chunked and then send a very =
long
>> +run of bytes with no newline, forcing the client to buffer the entire r=
un
>> +before the chunk size could be rejected.
>> +
>> +This caps the chunk-size line (and the trailing CRLF line) at _MAXLINE,
>> +raising ProtocolError when exceeded, matching the behaviour read() alre=
ady
>> +had. Only the size line is bounded; chunk bodies still go through the s=
ized
>> +_safe_read(), so legitimate large chunks are unaffected.
>> +
>> +Verified with a local malicious server streaming a 200 MiB unterminated
>> +size line: stream() previously grew RSS by ~530 MB, now stays at ~1 MB =
and
>> +fails fast, matching read(). A 5 MiB chunk body still streams correctly=
.
>> +
>> +* Fix a black formatting issue
>> +
>> +* Test chunked response trailer length limits
>> +
>> +* Fix number in the changelog entry
>> +
>> +---------
>> +
>> +Co-authored-by: Illia Volochii <illia.volochii@gmail.com>
>> +
>> +CVE: CVE-2026-97689
>> +Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/cd=
770b059b543be29298ea5c52afb0b1b090f5ed]
>> +
>> +Note:
>> + - changeLog change is not backported
>> + - Adjusted commit change as per current version
>
> Do we need more detail on the adjustments made during backporting?

I did not need more infos for this one, changes were obvious enough. And
the resulting code is the same as upstream's.

>
> Best regards,


--=20
Yoann Congal
Smile ECS

