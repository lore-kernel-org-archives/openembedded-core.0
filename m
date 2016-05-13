Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 38BFB6072C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 20:07:43 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y7so10018779pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 13:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=qTni7UmZYHjSMpK353jB6dKgBb+wKWtiWRnMfJ8Lux0=;
	b=y2R+/8N2dgvGPF2ggZAHGbBq3gUQ9+Evq1x3OxC97FKgXxRXho8zhLwMM82roEKNhJ
	C3aU0wDUYi3I+dbUFzzqm/ih3m47Je9/KnPKcB2X041OksZncvhBQy20bNziWn9Pom4n
	rTltYWqfIZ5N2pZgVPbrU7U0n28j8Hxk4zS+Uh2GI+snoHESNcAB9nokQV00VgxU6hbn
	+VO8/X4h1lRCKWf6LZdJvZ7/bFteRSsnif5rEJyJ6C9bG7oJaNPzHxNjiaRPSn9cZkw3
	YAZC21X9dgSX/dcEkmmIrq9lVNcj8jjeGH8xJsDHHC+jXLI06WryOxYUbzVwsydaBCB+
	R1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=qTni7UmZYHjSMpK353jB6dKgBb+wKWtiWRnMfJ8Lux0=;
	b=lfomOQyV0PZVsadU/RtEU0V5yoMRJ17T29QIO+mzu7cboglfmU0hhqecZjfnJgmQcL
	zvKfXiuymtClv7jE2PSoZNQFxtXxPVE6ool0icLKgvnFuwkAj8V4lTYgjcPzDIbhcNP6
	dPiTcRbRHBvPNtSkp4ZTEZzOMiM1GzSV3c2YHf8innBusJfQDss3dBFWexZd/1Y2a8VT
	Jq0jIFI3guw8vKCmwpMEhuaUXx1ylGVVr6SRFigvHpFd5BXNefJq/lIHfOML7AOIk3gq
	/eQAxGudlDXgE7EwknKxg22WVmMenZvf4o7EmxTLNvIxnyfVcuA40t1fFvPanxPQonjV
	OP7w==
X-Gm-Message-State: AOPr4FUS01Ll9nFx3jZxP3yVczzr4tS7l9fJwNMQLf1qWuQNZOfzjnLofCAqcezF3YLwgA==
X-Received: by 10.98.65.90 with SMTP id o87mr25699038pfa.151.1463170064823;
	Fri, 13 May 2016 13:07:44 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:c53a:7e08:2482:8461?
	([2601:202:4000:1239:c53a:7e08:2482:8461])
	by smtp.googlemail.com with ESMTPSA id
	m12sm29396206pfi.5.2016.05.13.13.07.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2016 13:07:43 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <1462319165-24307-1-git-send-email-akuster808@gmail.com>
	<5732CFA3.7080302@windriver.com> <57330B87.5080300@gmail.com>
	<20160513143139.GA2565@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5736340E.1010401@gmail.com>
Date: Fri, 13 May 2016 13:07:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160513143139.GA2565@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][krogoth][PATCH] openssl: Security fix via update to 1.0.2h
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
X-List-Received-Date: Fri, 13 May 2016 20:07:45 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 05/13/2016 07:31 AM, Martin Jansa wrote:
> On Wed, May 11, 2016 at 03:37:59AM -0700, akuster808 wrote:
>> Robert,
>>
>>
>> On 05/10/2016 11:22 PM, Robert Yang wrote:
>>>
>>>
>>> On 05/04/2016 07:46 AM, Armin Kuster wrote:
>>>> From: Armin Kuster <akuster@mvista.com>
>>>>
>>>> CVE-2016-2105
>>>> CVE-2016-2106
>>>> CVE-2016-2109
>>>> CVE-2016-2176
>>>>
>>>> https://www.openssl.org/news/secadv/20160503.txt
>>>>
>>>> fixup openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>>>>
>>>> drop crypto_use_bigint_in_x86-64_perl.patch as that fix is in latest.
>>>
>>> After I looked into the code, it seems that this patch is not in latest
>>> code ?
>>
>> hmm, my old eyes deceive me.
>>
>> thanks for checking.
>>
>> I will send a correcting.
> 
> 1.0.2h is already in fido, jethro and master, can we quickly get it to krogoth
> which is still using older version 1.0.2g?

this hit master 2 days ago. I just sync'd changes over to krogth and am
doing sanity checks.  The last time I backported something before master
folks got the shorts-in-a-twist.

> 
> It's always strange to see recipe version downgrades when upgrading to
> newer Yocto release.

yes it is. I have no control when the other maintainers do their merges.

- armin
> 
>> - armin
>>> It is a backported patch from gentoo.
>>>
>>> // Robert
>>>
>>>>
>>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>> ---
>>>>   ...oid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch | 14
>>>> +++++++-------
>>>>   .../openssl/{openssl_1.0.2g.bb => openssl_1.0.2h.bb}       |  6 ++----
>>>>   2 files changed, 9 insertions(+), 11 deletions(-)
>>>>   rename meta/recipes-connectivity/openssl/{openssl_1.0.2g.bb =>
>>>> openssl_1.0.2h.bb} (91%)
>>>>
>>>> diff --git
>>>> a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>>>> b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>>>>
>>>> index cebc8cf..f736e5c 100644
>>>> ---
>>>> a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>>>>
>>>> +++
>>>> b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>>>>
>>>> @@ -8,16 +8,16 @@
>>>> http://www.mail-archive.com/openssl-dev@openssl.org/msg32860.html
>>>>
>>>>   Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
>>>>   ---
>>>> -Index: openssl-1.0.2/crypto/evp/digest.c
>>>> +Index: openssl-1.0.2h/crypto/evp/digest.c
>>>>   ===================================================================
>>>> ---- openssl-1.0.2.orig/crypto/evp/digest.c
>>>> -+++ openssl-1.0.2/crypto/evp/digest.c
>>>> -@@ -208,7 +208,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
>>>> -         return 0;
>>>> +--- openssl-1.0.2h.orig/crypto/evp/digest.c
>>>> ++++ openssl-1.0.2h/crypto/evp/digest.c
>>>> +@@ -211,7 +211,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
>>>> +         type = ctx->digest;
>>>>        }
>>>>    #endif
>>>>   -    if (ctx->digest != type) {
>>>>   +    if (type && (ctx->digest != type)) {
>>>> -         if (ctx->digest && ctx->digest->ctx_size)
>>>> +         if (ctx->digest && ctx->digest->ctx_size) {
>>>>                OPENSSL_free(ctx->md_data);
>>>> -         ctx->digest = type;
>>>> +             ctx->md_data = NULL;
>>>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
>>>> b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
>>>> similarity index 91%
>>>> rename from meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
>>>> rename to meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
>>>> index 290f129..ae65992 100644
>>>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
>>>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
>>>> @@ -34,15 +34,13 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
>>>>               file://openssl-fix-des.pod-error.patch \
>>>>               file://Makefiles-ptest.patch \
>>>>               file://ptest-deps.patch \
>>>> -            file://crypto_use_bigint_in_x86-64_perl.patch \
>>>>               file://openssl-1.0.2a-x32-asm.patch \
>>>>               file://ptest_makefile_deps.patch  \
>>>>               file://configure-musl-target.patch \
>>>>               file://parallel.patch \
>>>>              "
>>>> -
>>>> -SRC_URI[md5sum] = "f3c710c045cdee5fd114feb69feba7aa"
>>>> -SRC_URI[sha256sum] =
>>>> "b784b1b3907ce39abf4098702dade6365522a253ad1552e267a9a0e89594aa33"
>>>> +SRC_URI[md5sum] = "9392e65072ce4b614c1392eefc1f23d0"
>>>> +SRC_URI[sha256sum] =
>>>> "1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919"
>>>>
>>>>   PACKAGES =+ "${PN}-engines"
>>>>   FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
>>>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

