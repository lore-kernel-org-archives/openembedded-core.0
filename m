Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6A15760721
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2016 20:17:15 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id zy2so15072822pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2016 13:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=JA1r5SGGNiyfGBgJVstGJI1dsg0E3FMRt2qVtBW4I2k=;
	b=rJv6XifV234JGZHh3iNN6xOLCYXbCuG7/5R3BzEuUdX0Eya8BrolaPJ9HCWcdNKUQm
	b6MYtK7zw2JHSYDhBlgmWWWvoNWehtr5vyJGceCiqtzzZajFztu34VDHxgaeC7NabJnc
	8utDgxjLqwHV0lcDFyJki/dFVxNP+J6IESlCaa+3FJVz/aw3IqHFA+yZtHoTzeRnV+Ut
	gn31goQjNWKdcQle+vtyWsaNs7sVQH0o73yEtFPdi+0W9sSX4GpQsQWyxkzx9gsXekm3
	qHrVLmWu5l0uiWzUhl1Kaw5ToDqJ+KgqV3FoycHGW3VxeBJSCk5hvJDJqQhEH8QQ1pnl
	lsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=JA1r5SGGNiyfGBgJVstGJI1dsg0E3FMRt2qVtBW4I2k=;
	b=g13e8KVhccN+NHXYsnLtDISSR8PDQYVvlEYErHjD+HGS97wn9/Y034frpat0hFRV4H
	L6DCajoUzPOv8nuDgp46RX7OLxqarUGeMvvn43r1KQPef5bcK9W92fRkn7UnYZNFJSkX
	DAuVeHEKXBKZ1DM1wx19QcQmxnufJDtxT93GoAgxPojCrGzRds1+nGHGPEiLx6ltJMz/
	NZ5IbHwnOXORXWRmJE8+fcTiN/9xTEy2T7terAEEx+kZ7fTn0n4gBQ8DyE2zRdi51NMo
	/Vkms1Oza3Cczw8N9hkkE90c7y2ZjUXiEZamq9yiplU9DTnwVmbqBm7mavW6v1aotTwi
	kUKg==
X-Gm-Message-State: AOPr4FV5K07869381VLgoCxuSDKwzmgtTzIW62KaId1C4/GHzWTof7BcAboLlJtz70rWMw==
X-Received: by 10.66.65.235 with SMTP id a11mr39624641pat.155.1463343435431;
	Sun, 15 May 2016 13:17:15 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:f5f1:87e:967f:8dba?
	([2601:202:4000:1239:f5f1:87e:967f:8dba])
	by smtp.googlemail.com with ESMTPSA id
	t8sm42228179paw.16.2016.05.15.13.17.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 May 2016 13:17:14 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <1462319165-24307-1-git-send-email-akuster808@gmail.com>
	<5732CFA3.7080302@windriver.com> <57330B87.5080300@gmail.com>
	<20160513143139.GA2565@jama> <20160513161955.GB2565@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5738D949.5050001@gmail.com>
Date: Sun, 15 May 2016 13:17:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160513161955.GB2565@jama>
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
X-List-Received-Date: Sun, 15 May 2016 20:17:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 05/13/2016 09:19 AM, Martin Jansa wrote:
> On Fri, May 13, 2016 at 04:31:39PM +0200, Martin Jansa wrote:
>> On Wed, May 11, 2016 at 03:37:59AM -0700, akuster808 wrote:
>>> Robert,
>>>
>>>
>>> On 05/10/2016 11:22 PM, Robert Yang wrote:
>>>>
>>>>
>>>> On 05/04/2016 07:46 AM, Armin Kuster wrote:
>>>>> From: Armin Kuster <akuster@mvista.com>
>>>>>
>>>>> CVE-2016-2105
>>>>> CVE-2016-2106
>>>>> CVE-2016-2109
>>>>> CVE-2016-2176
>>>>>
>>>>> https://www.openssl.org/news/secadv/20160503.txt
>>>>>
>>>>> fixup openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>>>>>
>>>>> drop crypto_use_bigint_in_x86-64_perl.patch as that fix is in latest.
>>>>
>>>> After I looked into the code, it seems that this patch is not in latest
>>>> code ?
>>>
>>> hmm, my old eyes deceive me.
>>>
>>> thanks for checking.
>>>
>>> I will send a correcting.
>>
>> 1.0.2h is already in fido, jethro and master, can we quickly get it to krogoth
>> which is still using older version 1.0.2g?
>>
>> It's always strange to see recipe version downgrades when upgrading to
>> newer Yocto release.
> 
> It also seems to break python-cryptography again:
> http://errors.yoctoproject.org/Errors/Details/62854/

yeah. just hit this in krogoth-next after looking at the logs again.
There is an upstream fix I am bac porting. There are a version 1.4 for
this package we should update master if possible. I will send a patch
later today.

- armin

> 
> You have fixed compatibility with 1.0.2g in:
> http://git.openembedded.org/meta-openembedded/commit/?id=44f0e74954628d6a3d04fa5249dbe0c94f6dff59
> 
> Maybe it needs another update for 1.0.2h and the same fix should be
> backported to fido and jethro, now when they all have newer openssl as
> well?
> 
>>> - armin
>>>> It is a backported patch from gentoo.
>>>>
>>>> // Robert
>>>>
>>>>>
>>>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>>> ---
>>>>>   ...oid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch | 14
>>>>> +++++++-------
>>>>>   .../openssl/{openssl_1.0.2g.bb => openssl_1.0.2h.bb}       |  6 ++----
>>>>>   2 files changed, 9 insertions(+), 11 deletions(-)
>>>>>   rename meta/recipes-connectivity/openssl/{openssl_1.0.2g.bb =>
>>>>> openssl_1.0.2h.bb} (91%)
>>>>>
>>>>> diff --git
>>>>> a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>>>>> b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>>>>>
>>>>> index cebc8cf..f736e5c 100644
>>>>> ---
>>>>> a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>>>>>
>>>>> +++
>>>>> b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>>>>>
>>>>> @@ -8,16 +8,16 @@
>>>>> http://www.mail-archive.com/openssl-dev@openssl.org/msg32860.html
>>>>>
>>>>>   Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
>>>>>   ---
>>>>> -Index: openssl-1.0.2/crypto/evp/digest.c
>>>>> +Index: openssl-1.0.2h/crypto/evp/digest.c
>>>>>   ===================================================================
>>>>> ---- openssl-1.0.2.orig/crypto/evp/digest.c
>>>>> -+++ openssl-1.0.2/crypto/evp/digest.c
>>>>> -@@ -208,7 +208,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
>>>>> -         return 0;
>>>>> +--- openssl-1.0.2h.orig/crypto/evp/digest.c
>>>>> ++++ openssl-1.0.2h/crypto/evp/digest.c
>>>>> +@@ -211,7 +211,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
>>>>> +         type = ctx->digest;
>>>>>        }
>>>>>    #endif
>>>>>   -    if (ctx->digest != type) {
>>>>>   +    if (type && (ctx->digest != type)) {
>>>>> -         if (ctx->digest && ctx->digest->ctx_size)
>>>>> +         if (ctx->digest && ctx->digest->ctx_size) {
>>>>>                OPENSSL_free(ctx->md_data);
>>>>> -         ctx->digest = type;
>>>>> +             ctx->md_data = NULL;
>>>>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
>>>>> b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
>>>>> similarity index 91%
>>>>> rename from meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
>>>>> rename to meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
>>>>> index 290f129..ae65992 100644
>>>>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
>>>>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
>>>>> @@ -34,15 +34,13 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
>>>>>               file://openssl-fix-des.pod-error.patch \
>>>>>               file://Makefiles-ptest.patch \
>>>>>               file://ptest-deps.patch \
>>>>> -            file://crypto_use_bigint_in_x86-64_perl.patch \
>>>>>               file://openssl-1.0.2a-x32-asm.patch \
>>>>>               file://ptest_makefile_deps.patch  \
>>>>>               file://configure-musl-target.patch \
>>>>>               file://parallel.patch \
>>>>>              "
>>>>> -
>>>>> -SRC_URI[md5sum] = "f3c710c045cdee5fd114feb69feba7aa"
>>>>> -SRC_URI[sha256sum] =
>>>>> "b784b1b3907ce39abf4098702dade6365522a253ad1552e267a9a0e89594aa33"
>>>>> +SRC_URI[md5sum] = "9392e65072ce4b614c1392eefc1f23d0"
>>>>> +SRC_URI[sha256sum] =
>>>>> "1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919"
>>>>>
>>>>>   PACKAGES =+ "${PN}-engines"
>>>>>   FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
>>>>>
>>> -- 
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>> -- 
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> 
> 
> 

