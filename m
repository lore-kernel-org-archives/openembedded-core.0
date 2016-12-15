Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5974771C86
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 09:28:13 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a20so5177461wme.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 01:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LWpEW4pqhwkJQSFYdNt1HGMVMg/cKg5qrwpLytVr+OA=;
	b=juO0sELZj2sZw/o98W3XX0jLRo4YU361X6jFUDq2kPxjZfmN/g883klUGuFe/IyNph
	+qkhb/cZLKqQHC6kkdR56m0z9T1oMa6zjSU8kUwrN29KTzsrA28kELAY/ohR0BHHUpQn
	ebFaMzPCJ8mMZHGEQPRpG3UqL+52Gt0WN4ESuDlEHvsbBKv3vLLJUx4OfoUlKA7Dw2hi
	aai5Bq0Og/MbDCd05pzhEJ6aCcC8ZjlpqWNCENPjyY4ZvImsrtNlEjBwVUgHRuwGDb7K
	LKpsYbSnH6HvDmKuWsZvH3vmGwXy3MfJn+PqZmHUKnFDA610Qp69H4gNhvof0YrVZQaT
	ILlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LWpEW4pqhwkJQSFYdNt1HGMVMg/cKg5qrwpLytVr+OA=;
	b=AZE7Er4gEk/6/iFfOpqhHZbkOryObmnjSrtSRUcxFBM+3FhXoyFVZsQA+8EtnGwmAU
	cCL31+i7zcdj6AG6s8gyR8AbW8vv1HFpYeOpXXIUK3BzpjwR+VK1IXdVffiPfjR4ksld
	CXoCigoYvE27omaXhmMBBOg3PA5sqmtJGycyttzZ3g3quDqx/xSSzNNhrPV3sffWPGvY
	ZC3n5EFWV+VvrpzkG/shSK2pwltNgzvGp9ZflxzqSzmN3RtjWsV1ccbPqktjV9qjgslh
	9kXmAozmX3hp2lN/Rj/zDOZAHGtMTNbpTu5xBeCgI0Q/uSKSGFHOWKEVjboXkGl51hBr
	Jesw==
X-Gm-Message-State: AIkVDXIprJx6x97fmtUOxL0OS5Xh4ZICy6BufDWNbAH0gqcpBfRRBvTvya9TLLhTeJdqheOsjpeibRn1l+qDSQ==
X-Received: by 10.28.144.70 with SMTP id s67mr396386wmd.138.1481794094681;
	Thu, 15 Dec 2016 01:28:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.162.33 with HTTP; Thu, 15 Dec 2016 01:28:14 -0800 (PST)
In-Reply-To: <00b0154b-3278-87e2-a8f0-48e8be3c309d@windriver.com>
References: <20161212054215.20513-1-jackie.huang@windriver.com>
	<CAMKF1sqm-YotzrkeqvvLr5MQsPNoiN6W2y_UhfYkx-dJWR66Fw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA013DE49043@ALA-MBA.corp.ad.wrs.com>
	<CAJ86T=Ux+uT-PgJ+H+-i60iABaQ3iuUB8gz6iLF-+vtMycZdWw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA013DE4A0F6@ALA-MBA.corp.ad.wrs.com>
	<CAJ86T=Xw9JAQDE+qPKX3T00VYHP0Kt7s47Yh3cNxzpZpc5Pp0w@mail.gmail.com>
	<00b0154b-3278-87e2-a8f0-48e8be3c309d@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 15 Dec 2016 01:28:14 -0800
Message-ID: <CAJ86T=UES6rhHtLSBa+hHvQ5RkcS25H6uw9i6_FWmhg48z-z7g@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add -fno-builtin-strlen when not using -O2
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
X-List-Received-Date: Thu, 15 Dec 2016 09:28:14 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 14, 2016 at 5:04 PM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 2016-12-13 04:16 AM, Andre McCurdy wrote:
>>
>> On Mon, Dec 12, 2016 at 9:14 PM, Huang, Jie (Jackie)
>> <Jackie.Huang@windriver.com> wrote:
>>>>
>>>> From: Andre McCurdy [mailto:armccurdy@gmail.com]
>>>> For reference, here's the patch I've been using. It's a slightly more
>>>> generic fix than the one in the KDE bug report.
>>>
>>> Thanks, It's a better patch and I will take it and send as v2 of this
>>> issue if you're
>>> not going to send it yourself, is it fine for you and could you provide
>>> extra info
>>> for the patch header like, upstream-status, written by or Signed-off-by?
>>
>> Sure. I forget why I didn't submit this at the time. The full patch is:
>>
>>> From d34e2a50ca5493f5a0ce9ccad83a36ac33689266 Mon Sep 17 00:00:00 2001
>>
>> From: Andre McCurdy <armccurdy@gmail.com>
>> Date: Fri, 12 Feb 2016 18:22:12 -0800
>> Subject: [PATCH] make ld-XXX.so strlen intercept optional
>>
>> Hack: Depending on how glibc was compiled (e.g. optimised for size or
>> built with _FORTIFY_SOURCE enabled) the strlen symbol might not be
>> found in ld-XXX.so. Therefore although we should still try to
>> intercept it, don't make it mandatory to do so.
>>
>> Upstream-Status: Inappropriate
>
> Can you explain why it's not appropriate for upstream?

Because it doesn't take into account the main reason why valgrind
tries to find a strlen symbol in ld-XXX.so, ie as a sanity check that
debug symbols for ld-XXX.so are available. In OE core, it's OK to
relax the sanity check because we ensure that symbols are available
via an RRECOMMENDS in the valgrind recipe:

  # valgrind needs debug information for ld.so at runtime in order to
  # redirect functions like strlen.
  RRECOMMENDS_${PN} += "${TCLIBC}-dbg"

However applying my patch (or the KDE patch referenced by Khem - which
is an even bigger hack) in a build environment which doesn't try to
make the same guarantees might be dangerous.

For reference, Buildroot handles the problem by never fully stripping ld-XXX.so

  https://github.com/buildroot/buildroot/commit/1edb4c51dee78d7d26700c037f29558e73d27ee0

> Does valgrind not support running with different optimizations
> of glibc?

Apparently not, but you should probably ask that question on the
valgrind lists rather than here.

A solution which may be more suitable for upstream would be for
valgrind to check for a number of different symbols (rather than just
strlen) and only generate a fatal error if none can be found. That's
not a trivial patch though.

>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  coregrind/m_redir.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/coregrind/m_redir.c b/coregrind/m_redir.c
>> index 7e4df8d..640a346 100644
>> --- a/coregrind/m_redir.c
>> +++ b/coregrind/m_redir.c
>> @@ -1220,7 +1220,18 @@ static void add_hardwired_spec (const  HChar*
>> sopatt, const HChar* fnpatt,
>>     spec->from_fnpatt = CONST_CAST(HChar *,fnpatt);
>>     spec->to_addr     = to_addr;
>>     spec->isWrap      = False;
>> -   spec->mandatory   = mandatory;
>> +
>> +   /* Hack: Depending on how glibc was compiled (e.g. optimised for size
>> or
>> +      built with _FORTIFY_SOURCE enabled) the strlen symbol might not be
>> found.
>> +      Therefore although we should still try to intercept it, don't make
>> it
>> +      mandatory to do so. We over-ride "mandatory" here to avoid the need
>> to
>> +      patch the many different architecture specific callers to
>> +      add_hardwired_spec(). */
>> +   if (0==VG_(strcmp)("strlen", fnpatt))
>> +      spec->mandatory = NULL;
>
>
> I know that Jackie has a v2 out but since the interested parties are
> CCed here, and since this is marked as a hack, would there
> be any value in issuing a warning:
>
> #warning "strlen() will not be tracked due to glibc optimization level"
>
> or something like that. Maybe it's overkill since strlen is (should be?)
> side-effect free but I thought I'd share the thought.
>
> What's the right thing to do upstream after we have this hack merged
> locally to fix our ptests?
>
> ../Randy
>
>> +   else
>> +      spec->mandatory = mandatory;
>> +
>>     /* VARIABLE PARTS */
>>     spec->mark        = False; /* not significant */
>>     spec->done        = False; /* not significant */
>>
>
>
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, Canada,
> K2K 2W5

