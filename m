Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id C2F6974C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 17:33:07 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id p22-v6so947021uao.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 10:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bDl1rg48yBkRKuJM7/TPjk7HuhNCtXd4qljJEPvcQPw=;
	b=KPTrIVFvvTS0DJX6ajQxQgtQwx4kfcaTUzN8RmZymUkQPisqkevRZ9u0fKJuRFYINN
	P37lGLZoXz74mVEv79qiNXGy39lsalOnTVVpIzExLhcQ+BhsWAufB4S9zxCNdik0duJD
	/RT7UkgDS/M4TECiEFJQooSmnLb378ofNvPEdCyJDEBYmXywlEi7RJpBecig69kUxUGr
	NiN5mw57Zq47tKtt6zaWaVfdbWldmzgNTReDpO5qUVN9qrs/zxwQssWQl0KE87W41frG
	wMFcKUgIMxJKv2d8OG4LuL1fSgIRZofmZ+2pgctbft+RnHDdgnZk5RPJQeyRaUqM4uHK
	dqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bDl1rg48yBkRKuJM7/TPjk7HuhNCtXd4qljJEPvcQPw=;
	b=oLqhNI3rh3tw4QAyd29PXXTEbSwrchaaCuKIRYmln55zpmR/I/2TGQ50WMop/NHJsB
	gp615Po/vpxSJBGj29qH1YKmvqAkC5De0egTOlN0NHW4lJlHMnkuY05fBpxyaLMnN3wC
	IQzj9HWRlQEHn+kwHqxvj7Ud1aJjv8lDC4EE2nWTf7UfYF2U0fxEgTnhTL6/bsuwE2uu
	noCQV8cFwWpQiPf0XV9UWUkXSefgixo+EcxzXfw2fw1vcUCGE2u7paJSD6PMtvwmuqZp
	lIVCIItMlwZZ5fxqSUuRDT7PSe7PHMZU+3bNdUn/6uNTCZTS177N912gydDPn16gdI/2
	O68Q==
X-Gm-Message-State: AOUpUlFdkxCwLBA+e3Kn4CNWUvbauVodw0gM4tmAjRKYUGM1OMI3R6Tz
	IG9GOtEgVe9r2pe2ft+P5WM04cSEBXipHdYmvFE=
X-Google-Smtp-Source: AAOMgpfoLFR5HbiFlqP35x2394tiIhWG2hFRZDYlOZZBrNc91V7/k7JISRlw6pkIg/UH8rKWaYRRVKZpnaux3A3rgHo=
X-Received: by 2002:ab0:1544:: with SMTP id p4-v6mr9390148uae.81.1532367188585;
	Mon, 23 Jul 2018 10:33:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Mon, 23 Jul 2018 10:33:08 -0700 (PDT)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B64E54169C@ORSMSX112.amr.corp.intel.com>
References: <1520710049-85318-1-git-send-email-juro.bystricky@intel.com>
	<CAJ86T=WQy=Zn5Nmy5n6voqw4vhgwJt6+vskX4R8ZdiB5HG4FJQ@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B64E54169C@ORSMSX112.amr.corp.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 23 Jul 2018 10:33:08 -0700
Message-ID: <CAJ86T=VVVwSTF80=ye70-7xe4yUEnGQcrHxYaE6pFUXshX=1bQ@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl_1.0.2n: improve reproducibility
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
X-List-Received-Date: Mon, 23 Jul 2018 17:33:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 22, 2018 at 9:46 AM, Bystricky, Juro
<juro.bystricky@intel.com> wrote:
> No, not on purpose, the word "prepend" should be taken out.
> Although running "make" the second time does no harm (should do nothing, in fact) it needs to be fixed,
> I'll send in a fix.

I have a fix too, as part of a series of other minor openssl recipe
fixes. So maybe you could review my fix when it's sent rather than
working on your own version? Up to you.

> Thanks
> Juro
> ________________________________________
> From: Andre McCurdy [armccurdy@gmail.com]
> Sent: Friday, July 20, 2018 2:08 PM
> To: Bystricky, Juro
> Cc: OE Core mailing list; Juro Bystricky
> Subject: Re: [OE-core] [PATCH] openssl_1.0.2n: improve reproducibility
>
> On Sat, Mar 10, 2018 at 11:27 AM, Juro Bystricky
> <juro.bystricky@intel.com> wrote:
>> Improve reproducible build of:
>>
>> openssl-staticdev
>> openssl-dbg
>> libcrypto
>>
>> There are two main causes that prevent reproducible build, both related to
>> the generated file "buildinf.h":
>>
>> 1. "buildinf.h" contains build host CFLAGS, containing various build
>>    host references.  We need to pass sanitized CFLAGS to the script
>>    generating this file ("mkbuildinf.pl". )
>>
>> 2. We also need to modify the script "mkbuildinf.pl" itsel in order to
>>    generate a build timestamp based on SOURCE_DATE_EPOCH, if present in
>>    the environment.
>>
>> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>> ---
>>  .../openssl-1.0.2n/reproducible-cflags.patch        | 20 ++++++++++++++++++++
>>  .../openssl-1.0.2n/reproducible-mkbuildinf.patch    | 21 +++++++++++++++++++++
>>  meta/recipes-connectivity/openssl/openssl10.inc     |  3 +++
>>  meta/recipes-connectivity/openssl/openssl_1.0.2n.bb |  5 +++++
>>  4 files changed, 49 insertions(+)
>>  create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2n/reproducible-cflags.patch
>>  create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2n/reproducible-mkbuildinf.patch
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
>> index 02a0e16..0598195 100644
>> --- a/meta/recipes-connectivity/openssl/openssl10.inc
>> +++ b/meta/recipes-connectivity/openssl/openssl10.inc
>> @@ -162,6 +162,9 @@ do_configure () {
>>
>>  do_compile_prepend_class-target () {
>>      sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
>> +    oe_runmake depend
>> +       cc_sanitized=`echo "${CC} ${CFLAG}" | sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' -e 's|${DEBUG_PREFIX_MAP}||g'`
>> +       oe_runmake CC_INFO="${cc_sanitized}"
>
> Here calls to "oe_runmake depend" and "oe_runmake" are made from the
> target specific do_compile_prepend(), but the original calls (without
> sanitised CC_INFO) are then run again from do_compile(), ie:
>
>   do_compile() {
>     sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
>     oe_runmake depend
>     cc_sanitized=`echo ...`
>     oe_runmake CC_INFO="${cc_sanitized}"
>     oe_runmake depend
>     oe_runmake
>   }
>
> Is the intention really to run "oe_runmake depend" and "oe_runmake" twice?
>
>>  }
>>
>>  do_compile () {
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
>> index 32444c6..f07289d 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
>> @@ -43,6 +43,11 @@ SRC_URI += "file://find.pl;subdir=openssl-${PV}/util/ \
>>             file://0001-Fix-build-with-clang-using-external-assembler.patch \
>>             file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
>>             "
>> +
>> +SRC_URI_append_class-target = "\
>> +           file://reproducible-cflags.patch \
>> +           file://reproducible-mkbuildinf.patch \
>> +           "
>>  SRC_URI[md5sum] = "13bdc1b1d1ff39b6fd42a255e74676a4"
>>  SRC_URI[sha256sum] = "370babb75f278c39e0c50e8c4e7493bc0f18db6867478341a832a982fd15a8fe"
>>

