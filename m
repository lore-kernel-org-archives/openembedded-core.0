Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF6A6011F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 09:56:12 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id v8-v6so12806873oie.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 02:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ibRB8aFxmoNADxrBoI1DQETain8GJLlsqNlqleynx6k=;
	b=WMP1ltfk70F6ydeqYe3vy5ptnMAPTMcwrd7hx9IM6gLN4Gaye8btey/KtDxuYqbChc
	+lY8/r7meohvRHdYRsfI5KuH/a8JerdsLTTqxyLLcC9HzCN4NoDihct+sykMKmAlU0FB
	FSvh3Pu/qsQAAA/a2LXaHOY9gu3zeDkXaAOiXLjVprza8YeE3g5o4d7p3P42vRB5dOwX
	gF0slHAJORqm1Ex2ovh1rxJtYyV+ZJYnE2hv0kNTE6fsyW22jyufGXhEUrQb1a1A69x0
	Z3AGjvYbSR+extRmcbmMcotDc0TrOudf2xEJdWDNXOKRJX6xFRzOLXaFs654mzrwp1uy
	/NJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ibRB8aFxmoNADxrBoI1DQETain8GJLlsqNlqleynx6k=;
	b=i7IVLw8XgAboJF+40xiaFTtu+NQi48AoDjoZFuzyLvx8eLPZYqcleAtus4klDSXVQh
	zyb/My9+TcuTV1WIybjHPsdDfB8B9/ax2tHVdsIE4b4ygDMGHP0khyLxti0UTiEKTD4+
	7ZeIYiU0S+rQo00oqTZXPve0OWT5AZ8YWDPLwIhQfPnr++2m4BG3f0iQ0srcKAhIekCL
	ZyxxWk3R2mQf5OwuSRpuo3nUW4eiVxxZ3R5tfKM7jGcec7W+HD/QT6BF6t103O6WTRqv
	rgqqwgubrUQ1mYZ66BvXUZz/IK+gn0xRo6i66+nVHW0BFBqVQ1hVQCd7c0T/DMlnYZaE
	AyWA==
X-Gm-Message-State: AOUpUlGgAUvYyMElrkiDeauby1czn75B7jKvBVm/okw09Sa8rAFLI3q+
	2e6GIY5SlAlaqH8dx0rLCMYXW+8j7Ya1qvL8S2Qtaw==
X-Google-Smtp-Source: AAOMgpfRx+8Gx/lx9OMefzJLUatX1vk0E8yn5F30Q/VCiSqJAatIBYYMzIhLQxUXeNxxtnhakY6Raa7p6RNHMsaDhGI=
X-Received: by 2002:aca:b256:: with SMTP id
	b83-v6mr2741145oif.235.1532512573989; 
	Wed, 25 Jul 2018 02:56:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 02:55:53
	-0700 (PDT)
In-Reply-To: <CAMKF1sr-j2=S1r37V8MaMX4E8KEvMwSrDoMJ0DfLAgvodSZa+w@mail.gmail.com>
References: <1532488573-19987-1-git-send-email-christopher.w.clark@gmail.com>
	<CAMKF1sr-j2=S1r37V8MaMX4E8KEvMwSrDoMJ0DfLAgvodSZa+w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jul 2018 10:55:53 +0100
Message-ID: <CAJTo0LbTDYO=qvLUCd4rA0D_Dy0kkcNbUHuhxt07EQ0W5BetBQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils : enable production of EFI binaries on x86-64
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
X-List-Received-Date: Wed, 25 Jul 2018 09:56:13 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, please just enable it as widely as possible.

Ross

On 25 July 2018 at 06:56, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jul 24, 2018 at 8:16 PM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
>>
>> From: Christopher Clark <christopher.clark6@baesystems.com>
>>
>> When MACHINE_FEATURES includes "efi" and target is x86-64,
>> enable the linker to produce Portable Executables: EFI binaries.
>>
>> Supplies "--enable-targets=x86_64-pep" in EXTRA_OECONF.
>>
>> Enables building the EFI variant of the Xen hypervisor.
>>
>> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
>> ---
>>  meta/recipes-devtools/binutils/binutils.inc | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
>> index 37813dd..eedcc7e 100644
>> --- a/meta/recipes-devtools/binutils/binutils.inc
>> +++ b/meta/recipes-devtools/binutils/binutils.inc
>> @@ -69,12 +69,15 @@ python do_package_prepend() {
>>
>>  B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
>>
>> +ENABLE_EFI_BINARIES_x86-64 = "--enable-targets=x86_64-pep"
>> +
>
>
>
>>  EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
>>                  --disable-werror \
>>                  --enable-deterministic-archives \
>>                  --enable-plugins \
>>                  ${LDGOLD} \
>> -                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
>> +                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
>> +                ${@bb.utils.contains('MACHINE_FEATURES', 'efi', '${ENABLE_EFI_BINARIES}', '', d)}"
>
> I think we should avoid using machine features rather enable this
> emulation unconditionally for efi enabled
> targets, which for now are arm/x86/x86_64/aarch64
>
>>
>>  LDGOLD_class-native = ""
>>  LDGOLD_class-crosssdk = ""
>> --
>> 2.7.4
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

