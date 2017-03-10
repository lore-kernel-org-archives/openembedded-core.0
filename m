Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8ABD76AC3C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 05:21:17 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id u30so12616691uau.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 21:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SC7MgZDWGbp3YQkKDSpzVmybV5kxjJPGhgfiBOAENuk=;
	b=HHZ6nVkCuJ3jd8tL3w8034G1YnUwStUprlAaov+bUskpb2uaWXrBtbUgA8+o8VgPFI
	kUHh+q6a03k36Ueq7P8ZGR9myR3A9o57qZGIpSxylFeezX0IE14mKlz297eR0nt5/w4M
	WolXMXxHSTid1MLg/THOBqP6H/gE9qUz76JwbplsDquD45q3eHLE87l8j3LZCqMaEVf9
	Za0sfXEQomwWxOhZPD66bSTX6Twa8rDVYdnrO26VlulqJ9ZS+pWBOhwFadZhiz/r6E0q
	SBnpxnTKr+imhgm5E/cW2u1P2spqrHoRbCNTVtOYGh5ibWZPRyiyxdZtfPJJbTpITvwo
	TwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SC7MgZDWGbp3YQkKDSpzVmybV5kxjJPGhgfiBOAENuk=;
	b=PNCoMolfzWZ2T37vts+x/MuZ8AVziCcS5bqDhEbkcNfFHPHu6ZucJpRJIV+PkCuk5e
	hEYZngm7Ffa4XG1RYNPUOiFBhbsCQApsKpl+O2kTNjFhHM2oYe1yrdb5WAyapYwNvm/x
	mr1IruskIG024e4cwsDz90q/HadUHA6FrzvML/6w7yImXbsn8tsRMlwhoidwPxSjDw8o
	6uu7yB3H8QcBnMUmxvwiAEunC76g97QNgSxoSuVHNy8iIpK/3+zhuzTaT1p8rm0lz//w
	DHX5jYdqRJMqQuDu2Pno6FAHPibI4CFuVDx4IuZIfwsj4zsFfrzHYIT0FnQXGkxfbFr2
	3yTw==
X-Gm-Message-State: AMke39kRq1WaHJuzaDp5jl6rlYVRBCt7TE1EdOzIjIwGiXbYUYEMasetZLYjyILDlSf+1TjTvE93r1XqoX8gVA==
X-Received: by 10.176.75.196 with SMTP id b4mr7773937uag.69.1489123279227;
	Thu, 09 Mar 2017 21:21:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Thu, 9 Mar 2017 21:20:48 -0800 (PST)
In-Reply-To: <93a813bd-0faa-0585-9f6e-7a49d1282616@xevo.com>
References: <7f8eeb62-a767-0882-dcc0-9a6882192d82@xevo.com>
	<CAMKF1sqAw-rwkKYuEsY4QN1rA-YyQcx5hjpzux3cLk+4qxAemA@mail.gmail.com>
	<CAMKF1spRq0quE-B+T5Wio_z5FmfGNkeGrE=dcd3H-KT1KNP4HQ@mail.gmail.com>
	<93a813bd-0faa-0585-9f6e-7a49d1282616@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Mar 2017 21:20:48 -0800
Message-ID: <CAMKF1spkQgzbNMmhgHJs1wPfuo86eZU+mBceHCyP58gwULXchw@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-clang] LLVM shared library support
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
X-List-Received-Date: Fri, 10 Mar 2017 05:21:18 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 9, 2017 at 1:32 PM, Martin Kelly <mkelly@xevo.com> wrote:
> On 03/09/2017 01:06 PM, Khem Raj wrote:
>>
>> On Fri, Mar 3, 2017 at 12:09 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>
>>> meta-clang has only provided static compiler thus far, so using shared
>>> or static did not matter as much in fact it could be helping with
>>> faster compile
>>> times that we see with clang. However, there is no binding to keep it
>>> static
>>> link. Feel free to send a pull request to change it.
>>
>>
>> I did try this and I see a considerable slowdown in compiler speed. I
>> changed
>> two things at a time so may be its the other
>>
>> diff --git a/recipes-devtools/clang/clang_git.bb
>> b/recipes-devtools/clang/clang_git.bb
>> index 6c6e66a..7de2be1 100644
>> --- a/recipes-devtools/clang/clang_git.bb
>> +++ b/recipes-devtools/clang/clang_git.bb
>> @@ -73,7 +73,8 @@ EXTRA_OECMAKE_append_class-nativesdk = "\
>>                 -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
>>  "
>>  EXTRA_OECMAKE_append_class-target = "\
>> -               -DLLVM_ENABLE_PIC=False \
>> +               -DBUILD_SHARED_LIBS=ON \
>> +               -DLLVM_ENABLE_PIC=ON \
>>                 -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
>>                 -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
>>                 -DLLVM_TARGETS_TO_BUILD=${@get_clang_target_arch(bb, d)} \
>>
>>>
>
> Those are the exact changes I have been testing with; -DLLVM_ENABLE_PIC=ON
> is certainly necessary to prevent QA errors regarding text relocation, so
> you can't really make the changes in isolation. That said, the change is
> still very useful, as there are some programs that use only shared
> libLLVM.so, and without them you can't really use them with bitbake.
>

slow down is 6x when using clang to compile on target, I dont know if such
a patch would be a good thing from compiler pov.

> I hope to have a pull request for you soon once I iron out the rest of the
> issues.

