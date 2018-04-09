Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7BF5A74A2D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 19:53:01 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id v64-v6so10048247otb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 12:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=it8XPdma4sCp+L55p7pdSFvSuT5mB4ditZZ91VqTYQE=;
	b=gZk4mNcP9q6K3ccV/vCMXvw+CVdi3iRnz0XGAxTOv2gI0L3QRuhxj2wITLRpazAbAC
	2Wmdo6Ap5suAD4Q/xw/6HfZpTjUoQ3ZombXZdA04vefbZsNiEHbND1bRIcC0TH7tJzFH
	FJf44k/ZRQUsfYDuF7TXOK+xG9Q7BauYka2asm3InwVMkEfyoqF3G+UfPiw63jHrD43e
	m73QKNKhKWhAJPjD+aJS6f76bEe+6eVvmcxK5Lvhtec6CAoVb42PQla6WFVONTdtNbj4
	Jj4IBKo1o3UnRkU/09+fA5qZJiNdzotagagSglDt8FQwUB8kIoRnGyDn5FLqvIqeVGQB
	vymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=it8XPdma4sCp+L55p7pdSFvSuT5mB4ditZZ91VqTYQE=;
	b=Zsjq9cTZJR5SxXKv9z4dYf80y4alVDuVFUUiFMBVIopjLH1Fz6EQuSfO4vEbnNJRMq
	0U55A7ppqE2GRTSVE6kvk/2TCFaHAsMxJp6IU2ko6mjq2GjaxZdjmhiotYAXfDFJUSJM
	jKkV+YihfzEYIKv1Wj+2AFolPAaPKgvosrdwqVKOJVze13JrcGtttkkTyNFTjnFkrW8x
	1FWySZ5YYd4GkEhY623oYN80vPmRFaQFYD//xT22UFk1iOYFy2Di2vLRH8vxjbx5eqwk
	JwIh9s2rR6aGHXXU8qQ+kruHHHGTh7mRfjYK/4fC1Guq/7VBNHnQ8R0H84kZOU3eXMxw
	2+fw==
X-Gm-Message-State: ALQs6tC7S/8w5gsupGEr6C97l/1CJz0GOCpjD6j+Xb+C6NTVoV+a1fQO
	WLBQjGbKNZpj+vDZ0zfX1pZbrjLHpUd+YeCT2wJfdA==
X-Google-Smtp-Source: AIpwx4/VRyeMpHrTv46BOJCIEy/4iyEXNJVOsC2tETNnWg+N80OHOrfsrCdwT4WQBYBMDKyMPHBsWpZB9Zj395J4M2E=
X-Received: by 2002:a9d:2ce2:: with SMTP id
	e31-v6mr22426345otd.135.1523303582071; 
	Mon, 09 Apr 2018 12:53:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Mon, 9 Apr 2018 12:52:41 -0700 (PDT)
In-Reply-To: <CAMKF1spx-4Bg9t+1_U-BTkJsWMauwGi+ijqYodgtRJSuqSLn+Q@mail.gmail.com>
References: <20180409151919.9133-1-ross.burton@intel.com>
	<CAMKF1sp3TFC-hR4+mWefFwEfm5fJmJ8Xj8r5MPKf0LeRJ14Hrg@mail.gmail.com>
	<CAJTo0LYb66UF9kHNhGnpb9T-ROyVD9N-iV90huMF+m-dn+HbJQ@mail.gmail.com>
	<CAMKF1spx-4Bg9t+1_U-BTkJsWMauwGi+ijqYodgtRJSuqSLn+Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Apr 2018 20:52:41 +0100
Message-ID: <CAJTo0LaeExNoF3ZYJST-PUMtV=r5m+CHUELnBtOPpM0tUeCOBQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 09 Apr 2018 19:53:01 -0000
Content-Type: text/plain; charset="UTF-8"

xz-native isn't in ASSUME_PROVIDED, we built it.

Ross

On 9 April 2018 at 19:44, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Apr 9, 2018 at 11:29 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> No, it's SDK generation, so xz-native (see SDK_DEPENDS in the first hunk).
>>
>
> OK then we need to make sure that all  supported distros will have the
> threaded xz version
>
>> Ross
>>
>> On 9 April 2018 at 18:46, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Mon, Apr 9, 2018 at 8:19 AM, Ross Burton <ross.burton@intel.com> wrote:
>>>> xz has native support for threaded compression now and SDK creation was the only
>>>> part of oe-core which is using pixz instead of xz.
>>>>
>>>> Not only does this remove pixz-native from the SDK dependencies, but in my
>>>> limited testing xz -T0 is slightly faster and produces smaller archives than
>>>> pixz for the same input.
>>>>
>>>
>>> this is using nativesdk-xz ?
>>>
>>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>>> ---
>>>>  meta/classes/populate_sdk_base.bbclass | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
>>>> index 77ec8aaec27..79984d7914f 100644
>>>> --- a/meta/classes/populate_sdk_base.bbclass
>>>> +++ b/meta/classes/populate_sdk_base.bbclass
>>>> @@ -46,7 +46,7 @@ TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
>>>>  TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
>>>>
>>>>  SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
>>>> -SDK_DEPENDS = "virtual/fakeroot-native pixz-native cross-localedef-native ${MLPREFIX}qemuwrapper-cross"
>>>> +SDK_DEPENDS = "virtual/fakeroot-native xz-native cross-localedef-native ${MLPREFIX}qemuwrapper-cross"
>>>>  SDK_DEPENDS_append_libc-glibc = " nativesdk-glibc-locale"
>>>>
>>>>  # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
>>>> @@ -225,7 +225,7 @@ fakeroot tar_sdk() {
>>>>         # Package it up
>>>>         mkdir -p ${SDKDEPLOYDIR}
>>>>         cd ${SDK_OUTPUT}/${SDKPATH}
>>>> -       tar ${SDKTAROPTS} -cf - . | pixz > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
>>>> +       tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
>>>>  }
>>>>
>>>>  fakeroot create_shar() {
>>>> --
>>>> 2.11.0
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

