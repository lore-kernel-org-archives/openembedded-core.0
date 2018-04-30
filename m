Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8A3086FFD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 15:25:40 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id z9so6989250pfe.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gd3yxUSOxEc5d49d5/+lArfBKiJhxoC559Ll48I09zQ=;
	b=Znwh10vWqGqUtiDVx6HMFQBCa5JnU7jpNQFjr0uDbzvxs9MFT567baFRV74z8E0QZT
	l1kvHGZKRI1o1x0sQP6NfPKO/fATYXBJ9PtEji1IiM1AuXBx8jzxmsYn0qvCNVkbOB4/
	G9vG/fjdK/fR297exWKfUilGSXuL+UqqnIJ2QjoEwfdy8z9hFJwdAzMv6rppbjmDQEwz
	3H34Qzx4cR5AFvdq4D5ekOTDPIDDJLldhqlSpaJPUiw/sIfS+7WmrX/QpIAjRXuRw3aC
	nlB6EfLTGZ7sIGZ2BINs/eAx6xsei9UgnWJnELREMSCTxgARiv1RVUxVDpFLrClUAIww
	DWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gd3yxUSOxEc5d49d5/+lArfBKiJhxoC559Ll48I09zQ=;
	b=jBsdg/akdl1w6fRWlxdun+haiwaGk7m63D+a4OK7PDvewn9gPBMbswJz6GuaWx7xag
	4kcdT42/JCm6V5k7+V5Eog+4oMgocow1MA3Ev9dA5+6xDpNCjyorKQb70lDoG6CKqXbV
	PbdAtP0DJtzhgcK0U6mFpuSvrXzsPpuhXHfTnFyvHKPsW9asT3q9m5Vf+GIUjYXsDOSO
	K5a+U05/cUfi3U0QKG6K3ONL5YrYtB58VS/f6IjGyx9DFVdstKWCD6dt8OTzB/8JbkIx
	Hg3lh99e1gFgEmbZHN2IJe6nnHDbN1Vpw9sXQ8vUNp8hoXdzAGoT/yDjY7+OHjqtwt05
	BX0w==
X-Gm-Message-State: ALQs6tAJmsG3XXaGf64MIX/Lk4pgGkKuuzJTwslbIqEoLt+TxtQ1Yd2O
	IERiTIFdp6Pr4zLNCgvGxcWqopS68AAiSxxOCOI=
X-Google-Smtp-Source: AB8JxZo+GcYm++4tn6RVIRGEcv2LVa2MRZ2zYtV21ubKYeIm379x5iQjBTAwZC7+TDJM8ErZwuQNPJvMX1AZyPGED80=
X-Received: by 2002:a17:902:2cc3:: with SMTP id
	n61-v6mr3235451plb.260.1525101940888; 
	Mon, 30 Apr 2018 08:25:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.182.141 with HTTP; Mon, 30 Apr 2018 08:25:10 -0700 (PDT)
In-Reply-To: <CAJTo0Lb7fNonPU+cLDy=28yHfkH-FuzTCrX8BtsipjZ3_fAJ7w@mail.gmail.com>
References: <20180420163354.12065-1-raj.khem@gmail.com>
	<CAJTo0Lbqnrsa05cxUbpW0wDgRPMUqN60=X0rWKMPK9uqdpVogQ@mail.gmail.com>
	<CAMKF1soffEYq1=8QnSDYAwCXPpMU5_eya1AcKpPAoazzNLX+0A@mail.gmail.com>
	<CAJTo0LYsyXj9otTBNhPBLLF0PiQm-d3BZapMaN-3AwdRM9obfg@mail.gmail.com>
	<CAJTo0Lb7fNonPU+cLDy=28yHfkH-FuzTCrX8BtsipjZ3_fAJ7w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Apr 2018 08:25:10 -0700
Message-ID: <CAMKF1spLkcXkBHqV7SppPRGRJM3kiAonFdvibrqgZQruLGTd=g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/6] libssp-nonshared: Add recipe
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
X-List-Received-Date: Mon, 30 Apr 2018 15:25:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 30, 2018 at 8:21 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Now I've actually read what you wrote, I see I didn't miss it ;)
>
> Now it fails like this:
>
> ERROR: Nothing RPROVIDES 'rpcsvc-proto' (but
> /home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> RDEPENDS on or otherwise requires it)
>

yeah, please drop the prior patches from me and pick kraj/pu branch
from oe-core contrib repo. That has all latest changes.

> Also:
>
> NOTE: Multiple providers are available for virtual/crypt (glibc, musl)
> Consider defining a PREFERRED_PROVIDER entry to match virtual/crypt
>
> Ross
>
> On 30 April 2018 at 16:05, Burton, Ross <ross.burton@intel.com> wrote:
>> Oh yes, sorry missed that when I was trying to pick up just the SSP changes.
>>
>> Ross
>>
>> On 30 April 2018 at 15:17, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Mon, Apr 30, 2018 at 6:08 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>>> build-appliance is failing at SDK creation time:
>>>>
>>>>  Problem: package packagegroup-self-hosted-1.0-r13.0.noarch requires
>>>> packagegroup-self-hosted-sdk, but none of the providers can be
>>>> installed
>>>>   - conflicting requests
>>>>   - nothing provides libssp-dev needed by
>>>> packagegroup-self-hosted-sdk-1.0-r13.0.noarch
>>>>
>>>
>>> we do not need libssp there, I have sent a patch to remove it from packagegroup
>>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/pu&id=03e113aedd069ea97f2f3ce96fc8337e3601732b
>>>
>>>> Ross
>>>>
>>>> On 20 April 2018 at 17:33, Khem Raj <raj.khem@gmail.com> wrote:
>>>>> libssp-nonshared is a minimal gcc runtime piece which is needed
>>>>> on non-glibc systems which do implement libssp APIs in libc
>>>>>
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>> ---
>>>>> Changes since v1:
>>>>> - Package into staticdev package
>>>>>
>>>>>  meta/recipes-core/musl/libssp-nonshared.bb    | 39 ++++++++++++++++
>>>>>  .../musl/libssp-nonshared/ssp-local.c         | 45 +++++++++++++++++++
>>>>>  2 files changed, 84 insertions(+)
>>>>>  create mode 100644 meta/recipes-core/musl/libssp-nonshared.bb
>>>>>  create mode 100644 meta/recipes-core/musl/libssp-nonshared/ssp-local.c
>>>>>
>>>>> diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipes-core/musl/libssp-nonshared.bb
>>>>> new file mode 100644
>>>>> index 0000000000..00a0a3d411
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-core/musl/libssp-nonshared.bb
>>>>> @@ -0,0 +1,39 @@
>>>>> +# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
>>>>> +# Released under the MIT license (see COPYING.MIT for the terms)
>>>>> +
>>>>> +SUMMARY = "Minimal libssp_nonshared.a must needed for ssp to work with gcc on musl"
>>>>> +LICENSE = "GPL-3.0-with-GCC-exception"
>>>>> +LIC_FILES_CHKSUM = "file://ssp-local.c;beginline=1;endline=32;md5=c06d391208c0cfcbc541a6728ed65cc4"
>>>>> +SECTION = "libs"
>>>>> +
>>>>> +SRC_URI = "file://ssp-local.c"
>>>>> +
>>>>> +PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
>>>>> +
>>>>> +INHIBIT_DEFAULT_DEPS = "1"
>>>>> +
>>>>> +STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
>>>>> +STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
>>>>> +
>>>>> +DEPENDS = "virtual/${TARGET_PREFIX}binutils \
>>>>> +           virtual/${TARGET_PREFIX}gcc-initial \
>>>>> +"
>>>>> +
>>>>> +do_configure[noexec] = "1"
>>>>> +
>>>>> +S = "${WORKDIR}"
>>>>> +
>>>>> +do_compile() {
>>>>> +       ${CC} ${CPPFLAGS} ${CFLAGS} -c ssp-local.c -o ssp-local.o
>>>>> +       ${AR} r libssp_nonshared.a ssp-local.o
>>>>> +}
>>>>> +do_install() {
>>>>> +       install -Dm 0644 ${B}/libssp_nonshared.a ${D}${base_libdir}/libssp_nonshared.a
>>>>> +}
>>>>> +#
>>>>> +# We will skip parsing for non-musl systems
>>>>> +#
>>>>> +COMPATIBLE_HOST = ".*-musl.*"
>>>>> +RDEPENDS_${PN}-staticdev = ""
>>>>> +RDEPENDS_${PN}-dev = ""
>>>>> +RRECOMMENDS_${PN}-dbg = "${PN}-staticdev (= ${EXTENDPKGV})"
>>>>> diff --git a/meta/recipes-core/musl/libssp-nonshared/ssp-local.c b/meta/recipes-core/musl/libssp-nonshared/ssp-local.c
>>>>> new file mode 100644
>>>>> index 0000000000..8f51afa2c1
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-core/musl/libssp-nonshared/ssp-local.c
>>>>> @@ -0,0 +1,45 @@
>>>>> +/* Stack protector support.
>>>>> +   Copyright (C) 2005-2018 Free Software Foundation, Inc.
>>>>> +
>>>>> +This file is part of GCC.
>>>>> +
>>>>> +GCC is free software; you can redistribute it and/or modify it under
>>>>> +the terms of the GNU General Public License as published by the Free
>>>>> +Software Foundation; either version 3, or (at your option) any later
>>>>> +version.
>>>>> +
>>>>> +In addition to the permissions in the GNU General Public License, the
>>>>> +Free Software Foundation gives you unlimited permission to link the
>>>>> +compiled version of this file into combinations with other programs,
>>>>> +and to distribute those combinations without any restriction coming
>>>>> +from the use of this file.  (The General Public License restrictions
>>>>> +do apply in other respects; for example, they cover modification of
>>>>> +the file, and distribution when not linked into a combine
>>>>> +executable.)
>>>>> +
>>>>> +GCC is distributed in the hope that it will be useful, but WITHOUT ANY
>>>>> +WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>>>> +FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
>>>>> +for more details.
>>>>> +
>>>>> +Under Section 7 of GPL version 3, you are granted additional
>>>>> +permissions described in the GCC Runtime Library Exception, version
>>>>> +3.1, as published by the Free Software Foundation.
>>>>> +
>>>>> +You should have received a copy of the GNU General Public License and
>>>>> +a copy of the GCC Runtime Library Exception along with this program;
>>>>> +see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
>>>>> +<http://www.gnu.org/licenses/>.  */
>>>>> +
>>>>> +extern void __stack_chk_fail (void);
>>>>> +
>>>>> +/* Some targets can avoid loading a GP for calls to hidden functions.
>>>>> +   Using this entry point may avoid the load of a GP entirely for the
>>>>> +   function, making the overall code smaller.  */
>>>>> +
>>>>> +void
>>>>> +__attribute__((visibility ("hidden")))
>>>>> +__stack_chk_fail_local (void)
>>>>> +{
>>>>> +  __stack_chk_fail ();
>>>>> +}
>>>>> --
>>>>> 2.17.0
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

