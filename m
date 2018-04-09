Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id DF9AF74712
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 21:20:51 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id g14so6465761pfh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 14:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rqepkL1fGectuYdqQBzeeEkoWIvWswyMHSCiJNqrKxg=;
	b=EC5e4/fOKSUygRdrvfFzi4bMYWjyHOEBkHg7eMQFWQnT8So86eoYnfqDKc8Yizitv+
	zMViIp2VtPk8cMSHQTZWMBjpa/ooCJYoBdTILCTLELriS4Yh7waqgB63u4xU8uPX8qn4
	30A3W9z3a9mIeHcS/JKSOoFvVSCqKgsa+/G3CI/zmiwvb3BD9J+yLmY3hTMrnZQ18MCk
	BIwDnESCZzHsiN5OhpFT1UVIKzYAlS0QlgWIMnvj6ACd2eY9Isb3KXu1b54+I1A9o6uK
	R8CMQMaFAh1Gcz5YA0QWHBJoGKBPdqTCo9K0hNeHFSO74qNPT7q/MqjludzsBkrbXRa8
	QROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rqepkL1fGectuYdqQBzeeEkoWIvWswyMHSCiJNqrKxg=;
	b=kWoS3Oly4c/XkmEndChj+8mOIM4s+BmeQ3vA3tTYs4quP/xudWGsWRcdAkGxVrHCpq
	FeQLXV+TsgwmD6ty+mpTMCgMxo3fGEIyk3xcMbDyq4CowVSiUx16rhD/U8HfTbBuJBUp
	tj9qIu8nHnq0LYQPnAX3somsGDLLpvLytuTkBBQlg6RDo02gPgvsLV9HSJBJ/e3NwSAf
	AFarJ4XUVwU4yLuB7qmtpNAMm+ZZknJGM0AE8Bogbg4gUXHzM1pU9Xb+4wmF/CxSPGJY
	zlbw1yIB93vMTrXK+eQCch4PuHZXFU8EAknywsWHFywlZ3ptoMfkox77yWffmROi2yMh
	eLXw==
X-Gm-Message-State: AElRT7Fwpqwm1uHkxG2a/fTf32et2lGXROFbkL+qFvZDh7SsPzyTv3bK
	Mvk0ZFE3YY7YCES0V3u0nRpn7foJpt5RGaAqdVo=
X-Google-Smtp-Source: AIpwx49y9AlI2Z+wkvsAU/TTx26hvpCNFIo5TA2OI57nRVwaXTUE4Mwyek8bENVhNmXvBfGUXN3+t39eYDSX5B7JG8Q=
X-Received: by 10.101.73.207 with SMTP id t15mr26740109pgs.204.1523308852681; 
	Mon, 09 Apr 2018 14:20:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.166.196 with HTTP; Mon, 9 Apr 2018 14:20:22 -0700 (PDT)
In-Reply-To: <CAJTo0Lbh=YR9KFHHDLk6WTj+rj0OxCrv7VyqjRbX-wFgHi=o1w@mail.gmail.com>
References: <20180409151919.9133-1-ross.burton@intel.com>
	<CAJ86T=V7o5nE-pX9QZGqXFL93O2Nt=GE7cist-zo2WGg0zO_sg@mail.gmail.com>
	<CAJTo0Lbh=YR9KFHHDLk6WTj+rj0OxCrv7VyqjRbX-wFgHi=o1w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Apr 2018 14:20:22 -0700
Message-ID: <CAMKF1sqzycqqo4+vJ4g=fzy4+k8xwfLDjb8VdssBc_5+KNPzRQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Mon, 09 Apr 2018 21:20:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 9, 2018 at 1:44 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 9 April 2018 at 21:13, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Mon, Apr 9, 2018 at 8:19 AM, Ross Burton <ross.burton@intel.com> wrote:
>>> xz has native support for threaded compression now and SDK creation was the only
>>> part of oe-core which is using pixz instead of xz.
>>>
>>> Not only does this remove pixz-native from the SDK dependencies, but in my
>>> limited testing xz -T0 is slightly faster and produces smaller archives than
>>> pixz for the same input.
>>>
>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>> ---
>>>
>>>  # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
>>> @@ -225,7 +225,7 @@ fakeroot tar_sdk() {
>>>         # Package it up
>>>         mkdir -p ${SDKDEPLOYDIR}
>>>         cd ${SDK_OUTPUT}/${SDKPATH}
>>> -       tar ${SDKTAROPTS} -cf - . | pixz > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
>>> +       tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
>>
>> Since -T 0 will use all available CPUs (ie any attempts the user may
>> have made to limit parallelism via BB_NUMBER_THREADS or PARALLEL_MAKE
>> will be ignored), perhaps it's worth adding something like
>> "--memlimit=70%" to try to give some protection for environments with
>> lots of CPUs but not so much DRAM?
>
> There's a few places where -T0 is passed already: tar.xz image
> creation and opkg creation, so I guess we need to centralise this
> somewhere too.
>

May be use XZ_OPT env bariable and param to -T could use the bitbake
calculated number of CPUs

> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

