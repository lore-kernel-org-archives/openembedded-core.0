Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id E970D74711
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 18:44:37 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id c7-v6so2468673plr.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 11:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qO4ycBa3pLcnqMe9X+bX4AlVPgpcH0sZBRBE53LU4LU=;
	b=T23i1GwN2vsSLPtZI8oPgu2GQJ+7PSM5eMEWOKPx3QQPLhfDANYWr4071Ca0OuUW79
	dgfD2ZQj4nIN/Dx1ubV4kkFqdmUFy9Qm1wG72fu+tEXueepaluVyMOetvwU7HXfuN527
	SguK5dVf+iWpyi02wOT2WdJKgqZJCqk0kuotH0xARAoSeqYlgIeX9F0sGsGisLW3lCZ6
	z8JsepsDnC8FHFNIBrpln/3sAv2s7xvSrgAiC+cULz84jWJrPV0KnuOucLLgMVJ4u1k6
	+SSsmg21uqD9WjjTvftz0e+GsfS3v5OFckD3tZ/X4LnE3Cd7Dyfa8YTIPS5wJhwwiArA
	9zMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qO4ycBa3pLcnqMe9X+bX4AlVPgpcH0sZBRBE53LU4LU=;
	b=mpCci4ITVK+kzrpq0SToXE8bylUskM3nikLPZIKnrhD+9ikJ9dZcOBJ2oJ2fkrpOKy
	Ac1AlwzIgnzhN09RW5f2dV0jJV0hn8r+osjxQKCWiWLvG1/y68CBA61Rc2IvSqF8avak
	Dvlxi9FPDF5QXuztKJtUw+Mm6j7G9IHVQ0bjaRMSHya4WXdl7L1rweQomGTxseyXFL2d
	KwB+QzC1ow/vmLc1YNyHQ+XXL3rXGJL+YTPfdhSGfcNb4686PW3rFCZNlGBHbp29EDTG
	3DKKLtc+W/tl2aReYnWuosUHFcRMyBqZQZYETUsK77fylQYYvYnPAVk/5V1UyfjGpUMP
	Z24w==
X-Gm-Message-State: AElRT7E6AX7aKLqAyFctlZrdd3WGu5A6FGo8I7OCDkV9PWdrfDeAgw1n
	6x81rg5knEg7H21ruk+Gdi0MGG3lD2ioccdk+mU=
X-Google-Smtp-Source: AIpwx4/6z3GoOzf8pE+AI5uGdTWsjViAHJBAcZEiut1YlY41NiKVyixcJETaLHWnORL2tLere/vcbA8nL/ddRbQe9o0=
X-Received: by 2002:a17:902:244:: with SMTP id
	62-v6mr31472865plc.125.1523299478521; 
	Mon, 09 Apr 2018 11:44:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.166.196 with HTTP; Mon, 9 Apr 2018 11:44:07 -0700 (PDT)
In-Reply-To: <CAJTo0LYb66UF9kHNhGnpb9T-ROyVD9N-iV90huMF+m-dn+HbJQ@mail.gmail.com>
References: <20180409151919.9133-1-ross.burton@intel.com>
	<CAMKF1sp3TFC-hR4+mWefFwEfm5fJmJ8Xj8r5MPKf0LeRJ14Hrg@mail.gmail.com>
	<CAJTo0LYb66UF9kHNhGnpb9T-ROyVD9N-iV90huMF+m-dn+HbJQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Apr 2018 11:44:07 -0700
Message-ID: <CAMKF1spx-4Bg9t+1_U-BTkJsWMauwGi+ijqYodgtRJSuqSLn+Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Mon, 09 Apr 2018 18:44:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 9, 2018 at 11:29 AM, Burton, Ross <ross.burton@intel.com> wrote:
> No, it's SDK generation, so xz-native (see SDK_DEPENDS in the first hunk).
>

OK then we need to make sure that all  supported distros will have the
threaded xz version

> Ross
>
> On 9 April 2018 at 18:46, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Apr 9, 2018 at 8:19 AM, Ross Burton <ross.burton@intel.com> wrote:
>>> xz has native support for threaded compression now and SDK creation was the only
>>> part of oe-core which is using pixz instead of xz.
>>>
>>> Not only does this remove pixz-native from the SDK dependencies, but in my
>>> limited testing xz -T0 is slightly faster and produces smaller archives than
>>> pixz for the same input.
>>>
>>
>> this is using nativesdk-xz ?
>>
>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>> ---
>>>  meta/classes/populate_sdk_base.bbclass | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
>>> index 77ec8aaec27..79984d7914f 100644
>>> --- a/meta/classes/populate_sdk_base.bbclass
>>> +++ b/meta/classes/populate_sdk_base.bbclass
>>> @@ -46,7 +46,7 @@ TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
>>>  TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
>>>
>>>  SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
>>> -SDK_DEPENDS = "virtual/fakeroot-native pixz-native cross-localedef-native ${MLPREFIX}qemuwrapper-cross"
>>> +SDK_DEPENDS = "virtual/fakeroot-native xz-native cross-localedef-native ${MLPREFIX}qemuwrapper-cross"
>>>  SDK_DEPENDS_append_libc-glibc = " nativesdk-glibc-locale"
>>>
>>>  # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
>>> @@ -225,7 +225,7 @@ fakeroot tar_sdk() {
>>>         # Package it up
>>>         mkdir -p ${SDKDEPLOYDIR}
>>>         cd ${SDK_OUTPUT}/${SDKPATH}
>>> -       tar ${SDKTAROPTS} -cf - . | pixz > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
>>> +       tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
>>>  }
>>>
>>>  fakeroot create_shar() {
>>> --
>>> 2.11.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

