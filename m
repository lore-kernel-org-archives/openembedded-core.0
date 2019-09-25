Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1FA597E5FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 18:34:27 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id b19so1414757iob.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 11:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=W2cG3kut5KYKLAHExcTPySI6D5sfqxilNyGDItGI6Yk=;
	b=Rjhnvc8MADwYjpi7BpVvASJv+NggeHusm8QuZoDgm7IXPdj9xapKIHpYUGEvWw1Nnx
	YR4xEfQghu2NG9paH5ziLcNRibjVc7s/xOGs9fmdg1gH08tpJVCYSIEeH6UWjmxe5Goh
	k4KlBp9QVgS4H7EHiNfp1Lzozr4B8R9zXeGurM3Xc4MxDsQArIp9b1JazpTkuMkIjmYo
	CbLZ6hI+Ym4pMssrbu76XKNLw8pC0QLWdDUTiqeMNpg9e5cL4io+1j7QviFyog4XGX+3
	Oz7IZ3KQjGbkTBM55zPCTyMvfBwvsqaQsnEpzg6JmqO9AFVxy5cVXgIZxiu72m7aNyOk
	RXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=W2cG3kut5KYKLAHExcTPySI6D5sfqxilNyGDItGI6Yk=;
	b=UWnVQUEpkNBEcc06AfjTrX9rv7aveYLDdn3hSxZNaqo6fU66Ri4cPz5NpIWT7w58S5
	fxndsL6YyDCiblp8QNTcEDVljCbf26JkuhKEnukr27gGtx8Bwt/bnBdWTO285jI0kcvQ
	XEZx03gyGIuIGHOtwEA38kLRJUAhmTYegUMl8qICpnIFQz1lCIm26ob/711FtbgBcCNE
	cmkqElPdYnSX3rfit9+J9OsCmFnmveoAJfaLgxSReX0im0x68vd2OW8bPyMfw+wJE0ta
	aZDttLK+ns5i7t9bDHqncJe7nBqR79UBbTEllF6nJuRlxgOs/MEzgwEJIiGf77cpAxWl
	l/wg==
X-Gm-Message-State: APjAAAV4aV+/8dKgxYPgtb3fJB1ikLuu2L+PTJGHGbZyTN3fDw//+HOD
	37OP/tTMPMck5E4mV+yaTGxi65WaASU=
X-Google-Smtp-Source: APXvYqzL9MGQdCwPufJLvn4jUbOp6oL6f7cfSyB2t7IOZ3tpIUEiZlZeAzVX1UV+JcolDiWzNCsKfA==
X-Received: by 2002:a92:aa0d:: with SMTP id j13mr1360494ili.182.1569436466995; 
	Wed, 25 Sep 2019 11:34:26 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:1c20:c983:8b24:7943:f99?
	([2601:646:8500:1c20:c983:8b24:7943:f99])
	by smtp.gmail.com with ESMTPSA id a26sm387773iot.46.2019.09.25.11.34.25
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 25 Sep 2019 11:34:25 -0700 (PDT)
To: George McCollister <george.mccollister@gmail.com>
References: <20190925115259.26437-1-george.mccollister@gmail.com>
	<20190925115259.26437-2-george.mccollister@gmail.com>
	<39e9c9c3-dc27-03da-2149-fe173e5680f9@kernel.crashing.org>
	<CAFSKS=MfvSSzyhn0HmcwFJgNq2Tj=f+Fr+VWrsQCYnbH3f2tjQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <95bec5ac-7a79-d302-303c-28251f10ec3f@gmail.com>
Date: Wed, 25 Sep 2019 11:34:24 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
	Gecko/20100101 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFSKS=MfvSSzyhn0HmcwFJgNq2Tj=f+Fr+VWrsQCYnbH3f2tjQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] openssl: make OPENSSL_ENGINES match install path
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
X-List-Received-Date: Wed, 25 Sep 2019 18:34:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 9/25/19 11:13 AM, George McCollister wrote:
> On Wed, Sep 25, 2019 at 11:08 AM Mark Hatle
> <mark.hatle@kernel.crashing.org> wrote:
>>
>> On 9/25/19 6:52 AM, George McCollister wrote:
>>> Set OPENSSL_ENGINES to the path where engines are actually installed.
>>>
>>> Signed-off-by: George McCollister <george.mccollister@gmail.com>
>>> ---
>>>   meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
>>> index 072f727e0b..8819e19ec4 100644
>>> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
>>> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
>>> @@ -148,7 +148,7 @@ do_install_append_class-native () {
>>>            OPENSSL_CONF=${libdir}/ssl-1.1/openssl.cnf \
>>>            SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
>>>            SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
>>> -         OPENSSL_ENGINES=${libdir}/ssl-1.1/engines
>>> +         OPENSSL_ENGINES=${libdir}/engines-1.1
>>
>> Is this a bug in the openssl recipe (it's placing engines in the wrong place),
>> or a bug in the recipes providing acceleration engines and THEY are going into
>> the wrong place?
> 
> This recipe installs:
> packages-split/openssl-engines/usr/lib/engines-1.1/afalg.so
> packages-split/openssl-engines/usr/lib/engines-1.1/padlock.so
> packages-split/openssl-engines/usr/lib/engines-1.1/capi.so
> 
> libp11 in meta-oe installs these:
> packages-split/libp11/usr/lib/engines-1.1
> packages-split/libp11/usr/lib/engines-1.1/pkcs11.so
> packages-split/libp11-dev/usr/lib/engines-1.1
> packages-split/libp11-dev/usr/lib/engines-1.1/libpkcs11.so
> 
>>
>> The ssl-1.1/engines makes more sense to me..  as /usr/lib/engines-1.1 obscures
>> that they are OpenSSL related.
> 
> I don't have a strong opinion either way but ssl-1.1/engines does make
> a bit more sense.
> Debian appears to install them in engines-1.1 though:
>   https://packages.debian.org/buster/amd64/libssl1.1/filelist
> 
> I do need this fixed in warrior though and wonder if anyone would
> gripe about changing where they are installed post release.
> 
> How shall we proceed? Does anyone else want to chime in?
> 

Using /usr/lib/<package> is known jargon and lets use it. I think doing 
it the way other distros are doing it and how upstream defaults are is 
also helpful. it reduced one more thing to worry about. Release branches 
should not be an issue as long as we have them packages in same output 
package.

>>
>> --Mark
>>
>>>   }
>>>
>>>   do_install_append_class-nativesdk () {
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> -George
> 


