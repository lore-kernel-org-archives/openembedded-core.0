Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8DBA3606BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 18:29:28 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id u84-v6so8610678oie.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YxsVtpFKDPY+SqjMj2mhqjysRXidNro13JS7rou9iWU=;
	b=GFS34A6wG+3eMy7bvbgWhDWEx/AogIZLbHol3IJt6f62Y656NEcZHcCmOBy7z6NoFo
	yRLJK2IEYw7iIzo04+MwQSUvoEVhHEjvLXTlg7OMxIKCyWQDbk4ZaHZeSGDvWZ4ynd/m
	thy8vFNkJ3qS5RaYMdXXI/yraMYOML8owdDAWChdQhVQoP92+H1v62PZl8z0Nje3OoTY
	/AzmN2l/AOf3V9MFToduVhHWgjqpWAZJqb6SInjKZBgWQPQHxznlUa7fWwH1wrFTrKcZ
	JS3Dy+4m+cchug/2t1kfcyU2lyybbVD7PuDu8I2s9vgfcREhrzbzSQXvGnGfVuOK2lmW
	ZCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YxsVtpFKDPY+SqjMj2mhqjysRXidNro13JS7rou9iWU=;
	b=HwHd0cHzvIJBURjsf2yajzejOrBMJHyAiDgQr6GR1fjFKP5LEhiIyUOABvdST8cz6j
	oUkOJBzOrtDiu+U86b5kG955y5M0ThFWFs7BRO4JysmHoKOAJyf/8ZHZ545EgvmWIToL
	Df//CYrsczZ/DolOc4DAV8kvLGWaSfLm+JCv6Hq27Hp58sebLF0oY2Fsz+0bMdJgvyWI
	o2Licc6b1YOZiqUFuELFVtT/rYy1mulNHdFb4nW7fzpo1sMN7aiflxQq3BW1XmLF4IR6
	LmHSagMxSxb6Cyd2IYHa7IBP0ELVssR202RZ2If3UG+UMT+5CEBXDztG9fx3N8FsyVFZ
	vIiA==
X-Gm-Message-State: ALQs6tAQ3v3CRniCu67AsSLVyk+lYUIkRChsoHPmDqpKsXayXikOE6em
	Ya51ALOTRboaUEYsko5WuSRZJD0vhq36TTpbGSxUHg==
X-Google-Smtp-Source: AIpwx48/2ubg785qGs8V4DtUfSnv4MZkEV7n4SRZPq4QDwoxsD0lerQ/vSSqw4nToFzD0ImjLc/pbpi+6USFMII6ia4=
X-Received: by 2002:aca:acd1:: with SMTP id
	v200-v6mr67969oie.320.1523298569968; 
	Mon, 09 Apr 2018 11:29:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Mon, 9 Apr 2018 11:29:09 -0700 (PDT)
In-Reply-To: <CAMKF1sp3TFC-hR4+mWefFwEfm5fJmJ8Xj8r5MPKf0LeRJ14Hrg@mail.gmail.com>
References: <20180409151919.9133-1-ross.burton@intel.com>
	<CAMKF1sp3TFC-hR4+mWefFwEfm5fJmJ8Xj8r5MPKf0LeRJ14Hrg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Apr 2018 19:29:09 +0100
Message-ID: <CAJTo0LYb66UF9kHNhGnpb9T-ROyVD9N-iV90huMF+m-dn+HbJQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 09 Apr 2018 18:29:29 -0000
Content-Type: text/plain; charset="UTF-8"

No, it's SDK generation, so xz-native (see SDK_DEPENDS in the first hunk).

Ross

On 9 April 2018 at 18:46, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Apr 9, 2018 at 8:19 AM, Ross Burton <ross.burton@intel.com> wrote:
>> xz has native support for threaded compression now and SDK creation was the only
>> part of oe-core which is using pixz instead of xz.
>>
>> Not only does this remove pixz-native from the SDK dependencies, but in my
>> limited testing xz -T0 is slightly faster and produces smaller archives than
>> pixz for the same input.
>>
>
> this is using nativesdk-xz ?
>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/classes/populate_sdk_base.bbclass | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
>> index 77ec8aaec27..79984d7914f 100644
>> --- a/meta/classes/populate_sdk_base.bbclass
>> +++ b/meta/classes/populate_sdk_base.bbclass
>> @@ -46,7 +46,7 @@ TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
>>  TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
>>
>>  SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
>> -SDK_DEPENDS = "virtual/fakeroot-native pixz-native cross-localedef-native ${MLPREFIX}qemuwrapper-cross"
>> +SDK_DEPENDS = "virtual/fakeroot-native xz-native cross-localedef-native ${MLPREFIX}qemuwrapper-cross"
>>  SDK_DEPENDS_append_libc-glibc = " nativesdk-glibc-locale"
>>
>>  # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
>> @@ -225,7 +225,7 @@ fakeroot tar_sdk() {
>>         # Package it up
>>         mkdir -p ${SDKDEPLOYDIR}
>>         cd ${SDK_OUTPUT}/${SDKPATH}
>> -       tar ${SDKTAROPTS} -cf - . | pixz > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
>> +       tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
>>  }
>>
>>  fakeroot create_shar() {
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

