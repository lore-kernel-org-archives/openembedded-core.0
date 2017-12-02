Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 936D278416
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Dec 2017 00:41:02 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 64so5999360wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 16:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BKaJXLlKHCS25JbkwxK1rxx9w+K0FefCM2AZGAMnpWM=;
	b=hZuCJ3tw4G/gb442+TG6vOGFmQUnPDQPuZ1f3Pav/Yc159xuE96S3n1EKC6GxP2uPk
	rSTQa3zLL8XXGXEn2jsvEMvicKSWa5cn9Tmo60Q+pw3YsV2hm0s+aVP1utevh6BvOM/b
	4JQ8b8jMhyPSVsG54Rz/MXre8o7CwWEbOvdmY+P/olGgDikuAicIwU+FZIXIhv75Izgj
	dVCLSwVUYJk56jp+3KUSLqiE6I9KDg6t5gRch0jljH+Xe36oOB7o2wVXZxhj+Y268kPx
	nqeiPsnrKyiIfsjktP9T+KQ9SJLXvPJ+c9aIDbpeH575xTrMCxTc3YDslsKn+Q2qosYQ
	CnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BKaJXLlKHCS25JbkwxK1rxx9w+K0FefCM2AZGAMnpWM=;
	b=h1nb+Xl27pf87jmpLWcfN8KYiZKZbI4OnqY8ZIJezf9vAJoOxNtHqaSW+u7yoOICjH
	/g2Sa56UjkTwRJIF1v8CidWOZF4EGdCCVYQeYJOUpLRHMv5MTqWlySY1ZDJFae/GtiGi
	n0aYIOpQWxuYiwZZDOoikpa9CcrYz+/Tc3kpTtvpJB+RcXTN7Wc/xrqvwf6N6RaALFAZ
	4QKVKkn+76QWlfI9s8G63gYJgDDHTlagvLGbeAUaM3JXqkCEQ68FgrnTNDT+cFCyf4++
	/W5+vyRGczg7TRjMoFmnOfvTkK1NgcgbzoRfI1bbGUE7pVtF+mz64oC5WCSrLt6uegXS
	Kp4A==
X-Gm-Message-State: AKGB3mItoQdc21V6J+q0HSZSPBgbZytcmARZ5qupU/l32y9H2QT2wxHZ
	uXwEoYdwgQtcXH4Cu5kNptUUaNYgI9QcOSjZB8A=
X-Google-Smtp-Source: AGs4zMbBWB62SQ/5bF+AF0QJ89icEZLBVxN3JjvvRDXgiEvnhseu+m/pX918yQt+1m7Qrucq176WwAcPIDsztcaYXiU=
X-Received: by 10.28.199.75 with SMTP id x72mr2221222wmf.87.1512175263518;
	Fri, 01 Dec 2017 16:41:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Fri, 1 Dec 2017 16:41:03 -0800 (PST)
In-Reply-To: <CAMKF1srPGiyC3YfwyZBKW7+Ttm037dCoOg8D9i=m3qq04Og1_w@mail.gmail.com>
References: <cover.1510192517.git.raj.khem@gmail.com>
	<826373113902dd8d6284ec49a2ea2076c7e298c0.1510192517.git.raj.khem@gmail.com>
	<CAJ86T=VKWCdmAXRMV8dqSnQS=MdHX=H3odPHKtydB6SCEFyrMQ@mail.gmail.com>
	<CAMKF1srPGiyC3YfwyZBKW7+Ttm037dCoOg8D9i=m3qq04Og1_w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 1 Dec 2017 16:41:03 -0800
Message-ID: <CAJ86T=Wegev0YRi8DNvUwJ4ry+BP=UY_tiQce9TEqmHu6Q+O_Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] musl: Update to 1.1.18
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
X-List-Received-Date: Sat, 02 Dec 2017 00:41:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 1, 2017 at 4:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Dec 1, 2017 at 4:31 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Wed, Nov 8, 2017 at 5:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Rich Felker (9):
>>>       fix access by setjmp and longjmp to __hwcap on arm built as thumb2
>>>       for executing init array functions, use function type with prototype
>>>       fix read-after-free type error in pthread_detach
>>>       fix incorrect base name offset from nftw when pathname ends in slash(es)
>>>       in dns parsing callback, enforce MAXADDRS to preclude overflow
>>>       release 1.1.17
>>>       fix regression in glob with literal . or .. path component
>>>       fix build regression on ARM for ISA levels less than v5
>>>       release 1.1.18
>>>
>>> Szabolcs Nagy (1):
>>>       math: rewrite fma with mostly int arithmetics
>>>
>>> Will Dietz (1):
>>>       posix_spawn: use larger stack to cover worst-case in execvpe
>>
>> With the version of musl currently included in rocko, various apps
>> (including bash) segfault at startup when compiled as Thumb2. The "fix
>> access by setjmp and longjmp to __hwcap on arm built as thumb2" commit
>> from musl 1.1.18 fixes that.
>>
>> However the other changes in musl 1.1.18 look pretty useful too, so
>> unless there's strong objection, I'd like to suggest aligning rocko
>> with the musl 1.1.18 release. ie cherry-picking the following two
>> commits from oe-core master to rocko:
>>
>>   c3f0a70 musl: Update to 1.1.18
>>   3953c54 musl: Update to latest
>
> It seems good to me. Please send a pull and CC Armin

Armin, please consider the following two commits for rocko:

  c3f0a70 musl: Update to 1.1.18
  3953c54 musl: Update to latest

>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  meta/recipes-core/musl/musl_git.bb | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
>>> index 671de326fb..932c9a27a0 100644
>>> --- a/meta/recipes-core/musl/musl_git.bb
>>> +++ b/meta/recipes-core/musl/musl_git.bb
>>> @@ -3,9 +3,9 @@
>>>
>>>  require musl.inc
>>>
>>> -SRCREV = "48be5b6313d7b827acf555769e93b389fa9f6307"
>>> +SRCREV = "eb03bde2f24582874cb72b56c7811bf51da0c817"
>>>
>>> -PV = "1.1.16+git${SRCPV}"
>>> +PV = "1.1.18+git${SRCPV}"
>>>
>>>  # mirror is at git://github.com/kraj/musl.git
>>>
>>> --
>>> 2.15.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

