Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 931CC71B50
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 00:52:44 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p204so1203949wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 17:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gJe94HAydeBoneHomoFJJdAR+U6gQPUVGd/af3G1ioc=;
	b=KukwZP/x6rQJPIrnEDBerAPZO1IQvF+MYs8lb/LTSoQCJyUn8CHfJplYGkGF6TsHrL
	2TZaIRHeZPALh9RiB03iEaLLoN6BbzZ5dXHnlpM2Vjc1fRt6GjNkOrD4cVMcIO6sWglG
	AQrF2JlCFRR+V1icOgDqODKjCQXUMc72UoO7+2FbqkjQRbMt2njVO1wWhZPcQfJMONEZ
	jOsJVYvZtvpMINxP4vzaYLYCXURxTg/CEKgtxudh8oMV/Wd3rBrI1MiV1SLMQoOHJxgk
	xxSzQkESP2DNs9TELHDSLpxNj2kp3CIpBEXHfFAxCA71DGcBwOd+Ta7FY9BGC0N4emYG
	WVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gJe94HAydeBoneHomoFJJdAR+U6gQPUVGd/af3G1ioc=;
	b=frUL3NgeAIwj2WZBjp6BJunL8XlK0rdye60lbWwUcWnxv4ow/lhY1S78/pNYCowY/A
	+3n05YUG8BArbEexU8JPSvPG+1+NtG7PiP/d/Q8dbICerbA80refqS8UlWXK0Hzr3P64
	ygqqoLdqsU1aiOo+tbmPDikanIgTX/mYKq8jwg0l3Q49N9o9Ob9tjQeHB3UzptNQctuz
	VNC+Eu3XoNbcqsHzDhiy1JvIQIjjXcG1UlAUmZWbP9GCnTkLOA8pNDuNNgP9exqZO2ri
	YviKGpZSPBjm3VwN0DAXw3VW/p3Zb3LfqFXDSIH+nVx5LcEZzdgvKcbEyxBsrIDeHORq
	I9ow==
X-Gm-Message-State: AIVw113g/nI4caFfzbU+Tm6OFwcyKqT1l0xJCt65hzOB7jUerPucVhpR
	BIy8Vh0r1WVx4qZCYCkAwfPiXfErlw==
X-Received: by 10.80.170.218 with SMTP id r26mr3839400edc.113.1500425565192;
	Tue, 18 Jul 2017 17:52:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.173 with HTTP; Tue, 18 Jul 2017 17:52:14 -0700 (PDT)
In-Reply-To: <CAJ86T=XT9yufogwxMbV-0dW1ooYdvy5DOequ_X4fRQ7=nFWdOQ@mail.gmail.com>
References: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spivq5cRcMDz-uehbqWRUzXyJf6TQ53sOtmFJu+_i1iqw@mail.gmail.com>
	<CAJ86T=XT9yufogwxMbV-0dW1ooYdvy5DOequ_X4fRQ7=nFWdOQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jul 2017 20:52:14 -0400
Message-ID: <CAMKF1soRVeHPLh_LFSxpcGG=1u1OcKvMv3yEifihP_Y7Y-eXUw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Wed, 19 Jul 2017 00:52:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 18, 2017 at 8:33 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Jul 18, 2017 at 5:12 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Tue, Jul 18, 2017 at 6:45 PM Juro Bystricky <juro.bystricky@intel.com>
>> wrote:
>>>
>>> Suppose we have an autotools project that looks like it is using the cross
>>> compiler but is actually reaching out to the host compiler instead.
>>> On an x86-64 build, you may not even notice.
>>> To be able to prevent this, this patch implements a new gcc warning
>>> "Wnot-cross-compiler". The intention here is to intentionally break a
>>> build
>>> if we are not using a cross-compiler when one is expected to be used.
>>>
>>> Expected usage: " -Wnot-cross-compiler -Werror=not-cross-compiler "will
>>
>> Shouldn't this patch get applied to native gcc on build hosts ?
>
> Isn't the intention that native gcc won't recognise the new options
> and will therefore fail if they're accidentally passed to it?

precisely, the problem is that some host compiler may silently ignore
unknown warnings and some host may not be using gcc as default system
compiler at all e.g. mageia distro and may be more in future.

>
>> And I would suggest to sent it to gcc mailing lists before we apply it to oe
>>>
>>> [YOCTO #11587]
>>>
>>> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>>> ---
>>>  meta/recipes-devtools/gcc/gcc-7.1.inc              |  1 +
>>>  .../gcc/gcc-7.1/0051-warn-not-cross-compiler.patch | 39
>>> ++++++++++++++++++++++
>>>  2 files changed, 40 insertions(+)
>>>  create mode 100644
>>> meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch
>>>
>>> diff --git a/meta/recipes-devtools/gcc/gcc-7.1.inc
>>> b/meta/recipes-devtools/gcc/gcc-7.1.inc
>>> index 3f1c06d..e9b1f21 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-7.1.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-7.1.inc
>>> @@ -75,6 +75,7 @@ SRC_URI = "\
>>>             file://0048-gcc-Enable-static-PIE.patch \
>>>
>>> file://0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch \
>>>             file://0050-replace-struct-ucontext-with-ucontext_t.patch \
>>> +           file://0051-warn-not-cross-compiler.patch \
>>>             ${BACKPORTS} \
>>>  "
>>>  BACKPORTS = "\
>>> diff --git
>>> a/meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch
>>> b/meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch
>>> new file mode 100644
>>> index 0000000..78671ed
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch
>>> @@ -0,0 +1,39 @@
>>> +
>>> +This patch implements an additional gcc command line option warning
>>> +"Wnot-cross-compiler". The option (if specified) will simply generate
>>> +a warning if gcc being used is not a cross-compiler.
>>> +
>>> +Upstream-Status: Pending
>>> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>>> +
>>> +
>>> +diff --git a/gcc/common.opt b/gcc/common.opt
>>> +--- a/gcc/common.opt
>>> ++++ b/gcc/common.opt
>>> +@@ -801,6 +801,10 @@
>>> + Common Var(warn_vector_operation_performance) Warning
>>> + Warn when a vector operation is compiled outside the SIMD.
>>> +
>>> ++Wnot-cross-compiler
>>> ++Common Warning
>>> ++Warn when not-cross-compiling.
>>> ++
>>> + Xassembler
>>> + Driver Separate
>>> +
>>> +diff --git a/gcc/opts.c b/gcc/opts.c
>>> +--- a/gcc/opts.c
>>> ++++ b/gcc/opts.c
>>> +@@ -2334,6 +2334,12 @@
>>> +       opts->x_flag_ipa_icf_variables = value;
>>> +       break;
>>> +
>>> ++    case OPT_Wnot_cross_compiler:
>>> ++#ifndef CROSS_DIRECTORY_STRUCTURE
>>> ++      warning (OPT_Wnot_cross_compiler, "Not using cross-compiler!");
>>> ++#endif
>>> ++      break;
>>> ++
>>> +     default:
>>> +       /* If the flag was handled in a standard way, assume the lack of
>>> +        processing here is intentional.  */
>>> --
>>> 2.7.4
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>

