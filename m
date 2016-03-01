Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0475A731CD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 19:12:09 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l68so52349914wml.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 11:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=gbCbJBW9zZy2KbI4WjhAr1JZ4rLT4rEJUZAJhjEIzWo=;
	b=a77pZvOLeaDwrXG4b6gyc27/Oe/rmDkwm9pKfZY2GQHN1WoUi1h9S6adLO78rFbRqM
	UoNoadBO2S2FgziigcwwDGCJ05AqHZBMDrnGxVkNNDE7IZfjT8ndlSYZh2Ods/NzIQJx
	F17wmc22uiF7JSKrayp8cZuZHsARYsw+4dlsMAZ+WQH5XHPGgyTZu54+aT91F7jT+lUU
	+npYW5TLvlODiZjYH/vtL/s9MjCNBRjlbAQIhP7tWqceP12EqdOa3139zgJWAiobb4m3
	goDfhvafc09z/4J24QJcch3X7X4qwPRC/sp+oWLP9jdHw58FmuNAdz47TQ6aVM5XNw8b
	x+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=gbCbJBW9zZy2KbI4WjhAr1JZ4rLT4rEJUZAJhjEIzWo=;
	b=C8k/dEPQAhv+IprpfGsf4ZogCdryyJMwzv5nEEuuByhzV9JcneJG3buwTgni0px5QW
	SRwZ4Gu0uSF4b64xLU9fTT5CfSfHn9ZRP0LjjhEnud28Oq7oB4tsyoGV8jKqukJK9m4Z
	B0DqKIhRYcYSR1M/YBSqVaTfdnV9KZKq6bBJpPEcGZa82Cs8ED+eukDTQpr9ScgB+Pkf
	yxE8C/ES9HjRPLG4ocqZcTUjoComMkRXzyIKIinWbe891pFy+UKMPUYB6FQTQyGajNtT
	UFTxFlY5mUyGOymzPfGqsFez0wUwVC7pYhNWRDws89l40kCfQqUcqw0MtoSnF1l0gdMk
	8Sow==
X-Gm-Message-State: AD7BkJItEXx3alw23oqIsPwQCDY3/g1xJxKa/RsnQEMnb/1alVFQ7YN3T6PU9/2IaprCahQfFmZ/S2vSUSR85w==
MIME-Version: 1.0
X-Received: by 10.28.50.133 with SMTP id y127mr646996wmy.4.1456859529597; Tue,
	01 Mar 2016 11:12:09 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Tue, 1 Mar 2016 11:12:09 -0800 (PST)
In-Reply-To: <56D5C464.4050402@windriver.com>
References: <1456577083-19366-1-git-send-email-daniel.dragomir@windriver.com>
	<1456577083-19366-2-git-send-email-daniel.dragomir@windriver.com>
	<CAJ86T=UpqspDQ0R0Ts0krLxfAawdHUz+V2Sc418VZ5uxZMHL2g@mail.gmail.com>
	<56D5C464.4050402@windriver.com>
Date: Tue, 1 Mar 2016 11:12:09 -0800
Message-ID: <CAJ86T=V=rV9GvZZ7tXd=_05SVwwkyj4oM+AnrjkLdNxtVJZkew@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Dragomir Daniel <daniel.dragomir@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] Add tune for 32-bit ARMv8-a
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
X-List-Received-Date: Tue, 01 Mar 2016 19:12:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 1, 2016 at 8:33 AM, Dragomir Daniel
<daniel.dragomir@windriver.com> wrote:
>
> On 03/01/2016 02:02 AM, Andre McCurdy wrote:
>>
>> On Sat, Feb 27, 2016 at 4:44 AM, Daniel Dragomir
>> <daniel.dragomir@windriver.com> wrote:
>>>
>>> This patch adds tunes for 32-bit armv8 platforms. The user can select
>>> the vector floating-point instruction set: vfpv3, vfpv4 or fp-armv8
>>> and the Neon, crc and crypto extensions.
>>
>> Why vfpv3? Are there really any armv8a CPUs which have vfpv3 but not
>> vfpv4?
>
>
> Hello Andre,
>
> I didn't checked before, I simply follow armv7a example and add the new
> features.
> But it seams that you're right, all armv8a CPU support both vfp versions,
> so, I will remove armv8a-vfpv3 tune and keep just vfpv4 one.
>
>>> Also, fix some parsing failures for armv7a*-neon-vfpv4 tunes.
>>
>> If you find any issues in arch-armv7a.inc then please double check
>> arch-armv7ve.inc too. These two files are very closely related.
>>
>>> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
>>> Signed-off-by: Cristian Bercaru <cristian.bercaru at windriver.com>
>>> ---
>>>   meta/conf/machine/include/arm/arch-armv7a.inc |  4 +-
>>>   meta/conf/machine/include/arm/arch-armv8a.inc | 75
>>> +++++++++++++++++++++++++++
>>>   2 files changed, 77 insertions(+), 2 deletions(-)
>>>   create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
>>>
>>> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc
>>> b/meta/conf/machine/include/arm/arch-armv7a.inc
>>> index d3b6f64..ff6bc29 100644
>>> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
>>> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
>>> @@ -65,8 +65,8 @@ PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3 =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-v
>>>   PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3 =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16} armv7ahf-vfp-vfpv3d16-vfpv3
>>> armv7at2hf-vfp-vfpv3d16-vfpv3"
>>>   PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-neon"
>>>   PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon
>>> armv7at2hf-vfp-neon"
>>> -PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4 =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} armv7ahf-vfp-neon-vfpv4"
>>> -PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7ahf-vfp-neon-vfpv4
>>> armv7at2hf-vfp-neon-vfpv4"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4 =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} armv7ahf-vfp-vfpv4-neon"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7ahf-vfp-vfpv4-neon
>>> armv7at2hf-vfp-neon-vfpv4"
>>
>> Is this patch against jethro? Master seems to have a different fix:
>>
>>
>> http://git.openembedded.org/openembedded-core/commit/?id=6661718158f8fdcdf63b0d48e8fe72d3ac4778f2
>
>
> Yes, against jethro branch. That's why I didn't saw this fix and also didn't
> saw the arch-armv7ve.inc file.
> How do I proceed if I want to have armv8a support in jethro? Should I
> checkout the master branch and add my changes there and resend the patch
> with the note to be backported to jethro?
> But this patch (with the fix for armv7a) and the one that add
> arch-armv7ve.inc will be back-ported to jethro too, or how is the process?

The process is always to get changes merged to master first.

Support for new CPU tuning options is unlikely to get backported to
the official jethro release, so you'll need to keep these changes in
your own branch or distro until you update to the OE release which
includes them.

(If you don't maintain your own distro then a simpler approach may be
just to set the required TUNE_CCARGS etc directly from your machine
config file).


>>>   # Big Endian
>>>   AVAILTUNES += "armv7ab armv7atb armv7ab-vfpv3d16 armv7atb-vfpv3d16
>>> armv7ab-vfpv3 armv7atb-vfpv3 armv7ab-neon armv7atb-neon"
>>> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc
>>> b/meta/conf/machine/include/arm/arch-armv8a.inc
>>> new file mode 100644
>>> index 0000000..2d8dd73
>>> --- /dev/null
>>> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
>>> @@ -0,0 +1,75 @@
>>> +DEFAULTTUNE ?= "armv8a"
>>> +
>>> +TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
>>> +TUNECONFLICTS[armv8a] = "armv4 armv5 armv6 armv7 armv7a"
>>> +
>>> +TUNEVALID[crc] = "Enable CRC instrucitons for ARMv8-a"
>>> +ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "crc", "-crc",
>>> "", d)}"
>>> +
>>> +TUNEVALID[crypto] = "Enable ARMv8 crypto extension."
>>> +ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "crypto",
>>> "-crypto", "", d)}"
>>> +
>>> +TUNEVALID[fp-armv8] = "Enable ARMv8 Vector Floating Point unit."
>>> +ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fp-armv8",
>>> "-fp-armv8", "", d)}"
>>> +
>>> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv8a",
>>> bb.utils.contains("TUNE_FEATURES", "crc", " -march=armv8-a+crc", "
>>> -march=armv8-a", d), "", d)}"
>>> +
>>> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "fp-armv8",
>>> bb.utils.contains("TUNE_FEATURES", "neon",
>>> bb.utils.contains("TUNE_FEATURES", "crypto", " -mfpu=crypto-neon-fp-armv8",
>>> " -mfpu=neon-fp-armv8", d), " -mfpu=fp-armv8", d), "", d)}"
>>> +
>>> +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv8a",
>>> "armv8a:", "" ,d)}"
>>> +
>>> +require conf/machine/include/arm/arch-armv7a.inc
>>
>> You should include arch-armv7ve.inc here, not arch-armv7a.inc.
>
>
> Ok, but armv7ve include file is not in jethro. Only in master.
>
> Thanks,
> Daniel
>
>
>>
>>> +# Little Endian base configs
>>> +AVAILTUNES += "armv8a armv8a-vfpv3 armv8a-neon armv8a-vfpv4
>>> armv8a-vfpv4-neon armv8a-fp-armv8 armv8a-fp-armv8-neon
>>> armv8a-crypto-fp-armv8-neon"
>>> +ARMPKGARCH_tune-armv8a ?= "armv8a"
>>> +ARMPKGARCH_tune-armv8a-vfpv3 ?= "armv8a"
>>> +ARMPKGARCH_tune-armv8a-neon ?= "armv8a"
>>> +ARMPKGARCH_tune-armv8a-vfpv4 ?= "armv8a"
>>> +ARMPKGARCH_tune-armv8a-vfpv4-neon ?= "armv8a"
>>> +ARMPKGARCH_tune-armv8a-fp-armv8 ?= "armv8a"
>>> +ARMPKGARCH_tune-armv8a-fp-armv8-neon ?= "armv8a"
>>> +ARMPKGARCH_tune-armv8a-crypto-fp-armv8-neon ?= "armv8a"
>>> +TUNE_FEATURES_tune-armv8a ?= "arm armv8a vfp"
>>> +TUNE_FEATURES_tune-armv8a-vfpv3 ?= "${TUNE_FEATURES_tune-armv8a} vfpv3"
>>> +TUNE_FEATURES_tune-armv8a-neon ?= "${TUNE_FEATURES_tune-armv8a} neon"
>>> +TUNE_FEATURES_tune-armv8a-vfpv4 ?= "${TUNE_FEATURES_tune-armv8a} vfpv4"
>>> +TUNE_FEATURES_tune-armv8a-vfpv4-neon ?= "${TUNE_FEATURES_tune-armv8a}
>>> neon vfpv4"
>>> +TUNE_FEATURES_tune-armv8a-fp-armv8 ?= "${TUNE_FEATURES_tune-armv8a}
>>> fp-armv8"
>>> +TUNE_FEATURES_tune-armv8a-fp-armv8-neon ?= "${TUNE_FEATURES_tune-armv8a}
>>> neon fp-armv8"
>>> +TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon ?=
>>> "${TUNE_FEATURES_tune-armv8a} crypto neon fp-armv8"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv8a = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}
>>> armv8a armv8a-vfp"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3 =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-vfp-vfpv3"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3} armv8a-vfp-neon"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4 =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3} armv8a-vfp-vfpv4"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4-neon =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4} armv8a-vfp-neon
>>> armv8a-vfp-vfpv4-neon"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8 =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-fp-armv8-vfp"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8} armv8a-vfp-neon
>>> armv8a-fp-armv8-vfp-neon"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto-fp-armv8-neon =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon}
>>> armv8a-crypto-fp-armv8-vfp-neon"
>>> +
>>> +# CRC configs
>>> +AVAILTUNES += "armv8a-crc armv8a-crc-vfpv3 armv8a-crc-neon
>>> armv8a-crc-vfpv4 armv8a-crc-vfpv4-neon armv8a-crc-fp-armv8
>>> armv8a-crc-fp-armv8-neon armv8a-crc-crypto-fp-armv8-neon"
>>> +ARMPKGARCH_tune-armv8a-crc ?= "armv8a"
>>> +ARMPKGARCH_tune-armv8a-crc-vfpv3 ?= "armv8a"
>>> +ARMPKGARCH_tune-armv8a-crc-neon ?= "armv8a"
>>> +ARMPKGARCH_tune-armv8a-crc-vfpv4 ?= "armv8a"
>>> +ARMPKGARCH_tune-armv8a-crc-vfpv4-neon ?= "armv8a"
>>> +ARMPKGARCH_tune-armv8a-crc-fp-armv8 ?= "armv8a"
>>> +ARMPKGARCH_tune-armv8a-crc-fp-armv8-neon ?= "armv8a"
>>> +ARMPKGARCH_tune-armv8a-crc-crypto-fp-armv8-neon ?= "armv8a"
>>> +TUNE_FEATURES_tune-armv8a-crc ?= "${TUNE_FEATURES_tune-armv8a} crc"
>>> +TUNE_FEATURES_tune-armv8a-crc-vfpv3 ?=
>>> "${TUNE_FEATURES_tune-armv8a-vfpv3} crc"
>>> +TUNE_FEATURES_tune-armv8a-crc-neon ?= "${TUNE_FEATURES_tune-armv8a-neon}
>>> crc"
>>> +TUNE_FEATURES_tune-armv8a-crc-vfpv4 ?=
>>> "${TUNE_FEATURES_tune-armv8a-vfpv4} crc"
>>> +TUNE_FEATURES_tune-armv8a-crc-vfpv4-neon ?=
>>> "${TUNE_FEATURES_tune-armv8a-vfpv4-neon} crc"
>>> +TUNE_FEATURES_tune-armv8a-crc-fp-armv8 ?=
>>> "${TUNE_FEATURES_tune-armv8a-fp-armv8} crc"
>>> +TUNE_FEATURES_tune-armv8a-crc-fp-armv8-neon ?=
>>> "${TUNE_FEATURES_tune-armv8a-fp-armv8-neon} crc"
>>> +TUNE_FEATURES_tune-armv8a-crc-crypto-fp-armv8-neon ?=
>>> "${TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon} crc"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-crc-vfp"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3 =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} armv8a-vfp-vfpv3
>>> armv8a-crc-vfp-vfpv3"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3} armv8a-vfp-neon
>>> armv8a-crc-vfp-neon"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4 =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3} armv8a-vfp-vfpv4
>>> armv8a-crc-vfp-vfpv4"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4-neon =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4} armv8a-vfp-neon
>>> armv8a-crc-vfp-neon armv8a-vfp-vfpv4-neon armv8a-crc-vfp-vfpv4-neon"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8 =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} armv8a-vfp-fp-armv8
>>> armv8a-crc-fp-armv8-vfp"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8-neon =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8} armv8a-vfp-neon
>>> armv8a-vfp-neon-fp-armv8 armv8a-crc-fp-armv8-vfp-neon"
>>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto-fp-armv8-neon =
>>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8-neon}
>>> armv8a-vfp-crypto-neon-fp-armv8 armv8a-crc-crypto-fp-armv8-vfp-neon"
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

