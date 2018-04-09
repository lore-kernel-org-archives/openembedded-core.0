Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id 152D374754
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 22:05:03 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id d9-v6so8237952oth.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 15:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1YAZ5D/VC2QyAYnuMeIB0SzvVpmqdAgEJdRW0AsD09s=;
	b=PEdO+M3aRcvY98hOjTJeMNij2+BedyAm8+1USjnsJE46tBIYPfn0aGe9zoefNAESlZ
	7D8YIJIF1e8Ql/ieOHQDIPwiq35yjmXcpg8yEHeXT7WQlWlbnF6k1INJIyMTmrLnO4Sl
	2Fsh9b/x1XI0kFG6ACvopB+fMXM4rMWDpuZabqLXlEl3JfrMJoLpPbsXpa6EDvkHHDEl
	4AdNnmVAN2YWFRMLBRDwgbFFIGdY1BHNWzUb2gLzbBrRErT6wB09TagJAUzmZG0A6ir/
	yjUiFQTjNZCR3LedzHqsEgQyj0CLK/uE6NdxF/eIL91TBCY8zRZlfYWi2RQd+9O0Ik3v
	Azig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1YAZ5D/VC2QyAYnuMeIB0SzvVpmqdAgEJdRW0AsD09s=;
	b=hfBeVXxij7htb8Ul7EAFdNpI3k5uC+4EqK+csOpmc1QpVAbakn98KXkdQjNtPahE4S
	wr4kbIZoUXM5Jy65aOCW9TRi4edS57Ur0OBdgCAh4myRZXuBrGwzfskmfFgLYhNqjDGv
	BoZjcIxMLyDgGOeDo2+rDsbIJhyDlTRzq7mj7zMAKYpz1B3dLDuvDqZ2gBVSt9G1ZiT4
	yLStxUWj3oPLqxmpKI1UOKDEo4lEsRJfRLKAmLji8lK4gSoh5JZcVwJJh2puW+u/ifEh
	+xYEFQkSc/R6kREtVgB9M2JH4I4XdKpztxeRuwJF5dUU5HNU3sHrPGJhLBjdnjxxMWa8
	SA6w==
X-Gm-Message-State: ALQs6tCFgAyQ/mhQKtTfoi1M9+TByavHEpuZabNxWvdxK93bQsFoKNm7
	pXc3lsa8JbM+ezDdkAbVYWOJM0lMI7LdSI+LsmujAg==
X-Google-Smtp-Source: AIpwx4861H37VpGcDzgWSVxfqWle+sx4IEdqzAfGnHyMnI0JvFGgUgHrwnhyo69W4vxtfDc5mcwLcj982WOSkoEcns0=
X-Received: by 2002:a9d:e4d:: with SMTP id
	n13-v6mr22637477otd.168.1523311504856; 
	Mon, 09 Apr 2018 15:05:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Mon, 9 Apr 2018 15:04:44 -0700 (PDT)
In-Reply-To: <CAMKF1sqzycqqo4+vJ4g=fzy4+k8xwfLDjb8VdssBc_5+KNPzRQ@mail.gmail.com>
References: <20180409151919.9133-1-ross.burton@intel.com>
	<CAJ86T=V7o5nE-pX9QZGqXFL93O2Nt=GE7cist-zo2WGg0zO_sg@mail.gmail.com>
	<CAJTo0Lbh=YR9KFHHDLk6WTj+rj0OxCrv7VyqjRbX-wFgHi=o1w@mail.gmail.com>
	<CAMKF1sqzycqqo4+vJ4g=fzy4+k8xwfLDjb8VdssBc_5+KNPzRQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Apr 2018 23:04:44 +0100
Message-ID: <CAJTo0LY=ybUH-TRcz-E6=z9K8gGs15FDHTz9q3LANfUbk7a7VA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_base: use xz -T instead of pixz
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
X-List-Received-Date: Mon, 09 Apr 2018 22:05:04 -0000
Content-Type: text/plain; charset="UTF-8"

On 9 April 2018 at 22:20, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Apr 9, 2018 at 1:44 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 9 April 2018 at 21:13, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Mon, Apr 9, 2018 at 8:19 AM, Ross Burton <ross.burton@intel.com> wrote:
>>>> xz has native support for threaded compression now and SDK creation was the only
>>>> part of oe-core which is using pixz instead of xz.
>>>>
>>>> Not only does this remove pixz-native from the SDK dependencies, but in my
>>>> limited testing xz -T0 is slightly faster and produces smaller archives than
>>>> pixz for the same input.
>>>>
>>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>>> ---
>>>>
>>>>  # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
>>>> @@ -225,7 +225,7 @@ fakeroot tar_sdk() {
>>>>         # Package it up
>>>>         mkdir -p ${SDKDEPLOYDIR}
>>>>         cd ${SDK_OUTPUT}/${SDKPATH}
>>>> -       tar ${SDKTAROPTS} -cf - . | pixz > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
>>>> +       tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
>>>
>>> Since -T 0 will use all available CPUs (ie any attempts the user may
>>> have made to limit parallelism via BB_NUMBER_THREADS or PARALLEL_MAKE
>>> will be ignored), perhaps it's worth adding something like
>>> "--memlimit=70%" to try to give some protection for environments with
>>> lots of CPUs but not so much DRAM?
>>
>> There's a few places where -T0 is passed already: tar.xz image
>> creation and opkg creation, so I guess we need to centralise this
>> somewhere too.
>>
>
> May be use XZ_OPT env bariable and param to -T could use the bitbake
> calculated number of CPUs

-T0 is use as many threads as there are cores, which is the same as
the bitbake function.  Re-using BB_NUMBER_THREADS might work.

Ross

