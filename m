Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C8B374685
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 20:45:18 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id l190-v6so9001959oig.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 13:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8GZXhTPxNfyRn1CElNZNggUAHyX1noKb/wUeH4M1+Kk=;
	b=I/rxJFr38eD9gosTdloTv0ipp6u0ovb531rj7y11HXQb9SbrzHPRSlqr16uWWFuzk4
	tgIw5oGGD77ByVKgs18GXZ3o7iar/Kj5/dW9Ej5oqJrB7lxYYFlkERtN22wEsJpZ9jxs
	wDxr1cEoMNQA9UuKrqkZc0520Osq64Yc2nS9k++TNMQf6LJ5xpNK2m+dzRjj18RfOfes
	QNLD1F2YGqfPKZXE2HfpL1b+nle7CpyHPlwpDeVc0wNBR0olsEN/F2hGhPFPRNsPigq7
	C8D/Shqziv9L/ggIcFfpS2q1IfirBqE676U7+fjU1VsEci5QmCP0U0Ey03GsiqpwGHvr
	5Vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8GZXhTPxNfyRn1CElNZNggUAHyX1noKb/wUeH4M1+Kk=;
	b=g0BSFmEAmpeHu8i8sCSXXx7fGVSVf2FxCYM3EBdYlgXyHysrdBU4DmemChQO1JXYPw
	RhfzavJhV3PqcTCu0zQnRFNVZ9rmDawgiaTg5AR4C8LbewoPPYUUOdNRki7dGrjBAlGg
	BA9wYYlOYHBjLKOJnKVl4acXd0uXcmovwOgrmbZEZRUQSjMlsPuTpelIjaRS49pcxMVG
	0+Q/vWB8jfB/qljY2o35ZM4yhbbkzFxFFHU2StSGvfWXxO7ZHHQVLE2Y2cGpLCGQWM6d
	QipX+Urpuw1t5GGsM6qBV13qClLNgV2sgiOl+X/pfXxGYePXC5NJv3SJjeXEHony022Z
	X87g==
X-Gm-Message-State: ALQs6tDyTL+sv0mHD45QNKF37XvWJO7Jcw05iEIzxmzrD+ebos5ayWBj
	3qwr2CU0RmyPqi/IZyBnPL80dPOXGDGYp3Fz/chUag==
X-Google-Smtp-Source: AIpwx48d45DuMO5Dhxeu/NxpLneXoYwlFjzqipANgz3wO+8WOgcM9m5JQxkVaHcPi5L0QMGYKeXNB+UvI7tC1+0Jfik=
X-Received: by 2002:aca:ea06:: with SMTP id i6-v6mr340898oih.235.1523306719188;
	Mon, 09 Apr 2018 13:45:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Mon, 9 Apr 2018 13:44:58 -0700 (PDT)
In-Reply-To: <CAJ86T=V7o5nE-pX9QZGqXFL93O2Nt=GE7cist-zo2WGg0zO_sg@mail.gmail.com>
References: <20180409151919.9133-1-ross.burton@intel.com>
	<CAJ86T=V7o5nE-pX9QZGqXFL93O2Nt=GE7cist-zo2WGg0zO_sg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Apr 2018 21:44:58 +0100
Message-ID: <CAJTo0Lbh=YR9KFHHDLk6WTj+rj0OxCrv7VyqjRbX-wFgHi=o1w@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Mon, 09 Apr 2018 20:45:18 -0000
Content-Type: text/plain; charset="UTF-8"

On 9 April 2018 at 21:13, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Apr 9, 2018 at 8:19 AM, Ross Burton <ross.burton@intel.com> wrote:
>> xz has native support for threaded compression now and SDK creation was the only
>> part of oe-core which is using pixz instead of xz.
>>
>> Not only does this remove pixz-native from the SDK dependencies, but in my
>> limited testing xz -T0 is slightly faster and produces smaller archives than
>> pixz for the same input.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>
>>  # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
>> @@ -225,7 +225,7 @@ fakeroot tar_sdk() {
>>         # Package it up
>>         mkdir -p ${SDKDEPLOYDIR}
>>         cd ${SDK_OUTPUT}/${SDKPATH}
>> -       tar ${SDKTAROPTS} -cf - . | pixz > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
>> +       tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
>
> Since -T 0 will use all available CPUs (ie any attempts the user may
> have made to limit parallelism via BB_NUMBER_THREADS or PARALLEL_MAKE
> will be ignored), perhaps it's worth adding something like
> "--memlimit=70%" to try to give some protection for environments with
> lots of CPUs but not so much DRAM?

There's a few places where -T0 is passed already: tar.xz image
creation and opkg creation, so I guess we need to centralise this
somewhere too.

Ross

