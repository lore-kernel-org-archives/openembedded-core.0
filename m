Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 590D260797
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:38:11 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id g132so3481173pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 03:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=qMB1muLLJFBzqJ1Wy5/HtH26tuLjIKSeR15GJuixGhY=;
	b=fWtO6QaPOgKeiFbDeynS+XiX4hXDxRTQWcJyuvfHdYVJq/JJZ8yqXr3E+Otpb2NQut
	m0KMMgewJoOiBOLdn1O/dSmwybjkoVQHTBXJthU+VW+uMVbKYqB3kkk4H4F6HdC2bKlq
	ZqbSTlyIHCg/9PJY2LNSlmh3sSnoX5qUphGslosK8TJRWfBC//sM277xFpdxulVoUWQU
	g0KHEq422EL1ngCIWsD1tsPikN4TnLVYWzTFAdRa3vqgGI62aGXgZWIfnzB0O5Qrpxaz
	qRGb3mpwkIRjiFseVgSpolLvf1Pp+reQQeBjTkrvnfRqBsrjRKGZlBgsCG05rMYMadC0
	5B1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=qMB1muLLJFBzqJ1Wy5/HtH26tuLjIKSeR15GJuixGhY=;
	b=Tm69ZxZoHQGsmFUplaqRbcZm4tQo12yuJaq4yGX8zMkk/OvITsvKhvUttMMxEC6pCN
	n++DwVezqCRkxrvh+9N1M/Bh3j33U/i30CzzJz2dShDFJfoUM/x5W1NgXof/SqJu/d4W
	0j31JRgwRykoormZWVZkcYl6Bs4QC6mrh/KTo7QMN84SbVXuQp2PEg1xVYi0Y/NuteJN
	ZNq5vVWCFYt7NepOKzghaLo6nAD9XYadDBivHhFrvdgwZ6CBpCM1SOZhXyEBqyWhb7JE
	aVB5UhQhVrF4suvLGiH6MCGQH5/LYIU2WvQa3IO0YPW22sMtB2MxtB8K1X0CZxFfzd0P
	TVOg==
X-Gm-Message-State: AOPr4FW+6g/xzDs9RKh03wbLQHBhFg4VNIOSuI4rfVGcE/qSbTIgHeTlTOt1Wm2lEFKHMQ==
X-Received: by 10.98.35.12 with SMTP id j12mr3690685pfj.73.1462963092238;
	Wed, 11 May 2016 03:38:12 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:d479:c1c3:6c29:187a?
	([2601:202:4000:1239:d479:c1c3:6c29:187a])
	by smtp.googlemail.com with ESMTPSA id
	x89sm11054109pfa.87.2016.05.11.03.38.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2016 03:38:11 -0700 (PDT)
To: Robert Yang <liezhi.yang@windriver.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1462319165-24307-1-git-send-email-akuster808@gmail.com>
	<5732CFA3.7080302@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57330B87.5080300@gmail.com>
Date: Wed, 11 May 2016 03:37:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <5732CFA3.7080302@windriver.com>
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
X-List-Received-Date: Wed, 11 May 2016 10:38:14 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Robert,


On 05/10/2016 11:22 PM, Robert Yang wrote:
> 
> 
> On 05/04/2016 07:46 AM, Armin Kuster wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>
>> CVE-2016-2105
>> CVE-2016-2106
>> CVE-2016-2109
>> CVE-2016-2176
>>
>> https://www.openssl.org/news/secadv/20160503.txt
>>
>> fixup openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>>
>> drop crypto_use_bigint_in_x86-64_perl.patch as that fix is in latest.
> 
> After I looked into the code, it seems that this patch is not in latest
> code ?

hmm, my old eyes deceive me.

thanks for checking.

I will send a correcting.

- armin
> It is a backported patch from gentoo.
> 
> // Robert
> 
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>   ...oid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch | 14
>> +++++++-------
>>   .../openssl/{openssl_1.0.2g.bb => openssl_1.0.2h.bb}       |  6 ++----
>>   2 files changed, 9 insertions(+), 11 deletions(-)
>>   rename meta/recipes-connectivity/openssl/{openssl_1.0.2g.bb =>
>> openssl_1.0.2h.bb} (91%)
>>
>> diff --git
>> a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>> b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>>
>> index cebc8cf..f736e5c 100644
>> ---
>> a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>>
>> +++
>> b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>>
>> @@ -8,16 +8,16 @@
>> http://www.mail-archive.com/openssl-dev@openssl.org/msg32860.html
>>
>>   Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
>>   ---
>> -Index: openssl-1.0.2/crypto/evp/digest.c
>> +Index: openssl-1.0.2h/crypto/evp/digest.c
>>   ===================================================================
>> ---- openssl-1.0.2.orig/crypto/evp/digest.c
>> -+++ openssl-1.0.2/crypto/evp/digest.c
>> -@@ -208,7 +208,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
>> -         return 0;
>> +--- openssl-1.0.2h.orig/crypto/evp/digest.c
>> ++++ openssl-1.0.2h/crypto/evp/digest.c
>> +@@ -211,7 +211,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
>> +         type = ctx->digest;
>>        }
>>    #endif
>>   -    if (ctx->digest != type) {
>>   +    if (type && (ctx->digest != type)) {
>> -         if (ctx->digest && ctx->digest->ctx_size)
>> +         if (ctx->digest && ctx->digest->ctx_size) {
>>                OPENSSL_free(ctx->md_data);
>> -         ctx->digest = type;
>> +             ctx->md_data = NULL;
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
>> b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
>> similarity index 91%
>> rename from meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
>> rename to meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
>> index 290f129..ae65992 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
>> @@ -34,15 +34,13 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
>>               file://openssl-fix-des.pod-error.patch \
>>               file://Makefiles-ptest.patch \
>>               file://ptest-deps.patch \
>> -            file://crypto_use_bigint_in_x86-64_perl.patch \
>>               file://openssl-1.0.2a-x32-asm.patch \
>>               file://ptest_makefile_deps.patch  \
>>               file://configure-musl-target.patch \
>>               file://parallel.patch \
>>              "
>> -
>> -SRC_URI[md5sum] = "f3c710c045cdee5fd114feb69feba7aa"
>> -SRC_URI[sha256sum] =
>> "b784b1b3907ce39abf4098702dade6365522a253ad1552e267a9a0e89594aa33"
>> +SRC_URI[md5sum] = "9392e65072ce4b614c1392eefc1f23d0"
>> +SRC_URI[sha256sum] =
>> "1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919"
>>
>>   PACKAGES =+ "${PN}-engines"
>>   FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
>>

