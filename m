Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3C75A7780E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 00:33:14 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id y43so7164455wrd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 17:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VXeDVKTB7lMXhDeCn1LpzamNSN5aKgtw8HL6UQUE0+8=;
	b=KAGnkbEEmJoACzpAG2D7G2kTU754kcusyUNd/9j2xrAfrD+f53sIfjs2DLrJcjtd/G
	IfvpSoGZWSpJwU/C8nDHMrumuCpBvBxwHHj8gRyqpu9auT7FKQVcOSJTXq2uzFkJ7irg
	ZpuLNauD+7gzvF95EbPX+vm9P7qDj2rgeMpNx7Ypt/VwTcyZHRLH/AICfow8H+LFB7xX
	TjuM1vJw668YnNPBO0FNjsrDuNb0otjjLPQQeTszlpDUngBukbhh+HEEfh4f/dV1iwmc
	5/UA1hw+xPChGT6v/QYE9ILywTbwZZQBPTZzC3ZMhd6aSxaOVXr19qM2OkvdN1V0d9+t
	zfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VXeDVKTB7lMXhDeCn1LpzamNSN5aKgtw8HL6UQUE0+8=;
	b=JQTqrrr1NGSSezvsrdB2lPM++6yhPmU9wjyUJqKwodh1kZNsFjvmYk3sNGY6cEQFxX
	kDR1GUr0COilySSyaMO5A41GMrB0vvRaKq19dYVJPz1rmEdrPRJQR1N/XcJozR9E1bqR
	1dAsNDNeypyh0NL8O1OlJXMFkh2e8G0HpDbfC06o3DBOxcAiM7a9jPrY8zoG3eEwwVfx
	g25mKtGQsnARapYvLAFCHOJaFxPpP3mbo4ZZSgTornNF4mssYClhK85GW3xMQoslU21B
	cvBwb+g7XuPzDH1iOulKcjyk6SprEGEHhW09D8eQLfobtrDYQl9JFTubdR7Z1ZzJdGBI
	T3Pw==
X-Gm-Message-State: AIVw113fimk8YVbLdA3FjzW7KVl3ULhuoO8OS6za9f8u2ru3rOO7GqfT
	S1v32RHe6XuhlaYqN1itjVEtWG24Hg==
X-Received: by 10.223.136.78 with SMTP id e14mr2709439wre.84.1500424395990;
	Tue, 18 Jul 2017 17:33:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Tue, 18 Jul 2017 17:33:15 -0700 (PDT)
In-Reply-To: <CAMKF1spivq5cRcMDz-uehbqWRUzXyJf6TQ53sOtmFJu+_i1iqw@mail.gmail.com>
References: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spivq5cRcMDz-uehbqWRUzXyJf6TQ53sOtmFJu+_i1iqw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 18 Jul 2017 17:33:15 -0700
Message-ID: <CAJ86T=XT9yufogwxMbV-0dW1ooYdvy5DOequ_X4fRQ7=nFWdOQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-7.inc: add new warning "Wnot-cross-compiler"
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
X-List-Received-Date: Wed, 19 Jul 2017 00:33:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 18, 2017 at 5:12 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Jul 18, 2017 at 6:45 PM Juro Bystricky <juro.bystricky@intel.com>
> wrote:
>>
>> Suppose we have an autotools project that looks like it is using the cross
>> compiler but is actually reaching out to the host compiler instead.
>> On an x86-64 build, you may not even notice.
>> To be able to prevent this, this patch implements a new gcc warning
>> "Wnot-cross-compiler". The intention here is to intentionally break a
>> build
>> if we are not using a cross-compiler when one is expected to be used.
>>
>> Expected usage: " -Wnot-cross-compiler -Werror=not-cross-compiler "will
>
> Shouldn't this patch get applied to native gcc on build hosts ?

Isn't the intention that native gcc won't recognise the new options
and will therefore fail if they're accidentally passed to it?

> And I would suggest to sent it to gcc mailing lists before we apply it to oe
>>
>> [YOCTO #11587]
>>
>> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-7.1.inc              |  1 +
>>  .../gcc/gcc-7.1/0051-warn-not-cross-compiler.patch | 39
>> ++++++++++++++++++++++
>>  2 files changed, 40 insertions(+)
>>  create mode 100644
>> meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-7.1.inc
>> b/meta/recipes-devtools/gcc/gcc-7.1.inc
>> index 3f1c06d..e9b1f21 100644
>> --- a/meta/recipes-devtools/gcc/gcc-7.1.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-7.1.inc
>> @@ -75,6 +75,7 @@ SRC_URI = "\
>>             file://0048-gcc-Enable-static-PIE.patch \
>>
>> file://0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch \
>>             file://0050-replace-struct-ucontext-with-ucontext_t.patch \
>> +           file://0051-warn-not-cross-compiler.patch \
>>             ${BACKPORTS} \
>>  "
>>  BACKPORTS = "\
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch
>> b/meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch
>> new file mode 100644
>> index 0000000..78671ed
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch
>> @@ -0,0 +1,39 @@
>> +
>> +This patch implements an additional gcc command line option warning
>> +"Wnot-cross-compiler". The option (if specified) will simply generate
>> +a warning if gcc being used is not a cross-compiler.
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>> +
>> +
>> +diff --git a/gcc/common.opt b/gcc/common.opt
>> +--- a/gcc/common.opt
>> ++++ b/gcc/common.opt
>> +@@ -801,6 +801,10 @@
>> + Common Var(warn_vector_operation_performance) Warning
>> + Warn when a vector operation is compiled outside the SIMD.
>> +
>> ++Wnot-cross-compiler
>> ++Common Warning
>> ++Warn when not-cross-compiling.
>> ++
>> + Xassembler
>> + Driver Separate
>> +
>> +diff --git a/gcc/opts.c b/gcc/opts.c
>> +--- a/gcc/opts.c
>> ++++ b/gcc/opts.c
>> +@@ -2334,6 +2334,12 @@
>> +       opts->x_flag_ipa_icf_variables = value;
>> +       break;
>> +
>> ++    case OPT_Wnot_cross_compiler:
>> ++#ifndef CROSS_DIRECTORY_STRUCTURE
>> ++      warning (OPT_Wnot_cross_compiler, "Not using cross-compiler!");
>> ++#endif
>> ++      break;
>> ++
>> +     default:
>> +       /* If the flag was handled in a standard way, assume the lack of
>> +        processing here is intentional.  */
>> --
>> 2.7.4
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

