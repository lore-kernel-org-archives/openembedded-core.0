Return-Path: <andrei@gherzan.ro>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 97B627705C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 15:50:37 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l68so91904855wml.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2016 07:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P/Hrqcfrq3aNk41jgMSOblBsNG56ZvEBKCMRgr8Q1r8=;
	b=B4ghN6uo8xnUamT9uh4HUJxWgzziaNgf80fpsDfXE7GUt8ZXv9qnOAkjyzzeOmzl9N
	m/UKrM2oCN12JUhb5P4+KYfKSHJ/LI6wTAFcp4umZSdX4Sc2Dj2CMfMGiIuYF6w6Ek9O
	EwAWz7mDy0ptOSmXTcaGWwTCQmDXVvqyL3ajFVJhZEytG7vE1PMtt3FyV+qBmjilpkQe
	vBQE+sdhDHWG4/zpo/nwoWkYAKW8yM/NQ7623cfezJermOz3ZnEK7tyA22dE3yAlfGzq
	C0u9NOqvpL0590LuXe27Dq58I6X4lN2rgH1lRN7yrtpKF3cDPm3jgTLSyBlo4bZI0KfD
	EuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P/Hrqcfrq3aNk41jgMSOblBsNG56ZvEBKCMRgr8Q1r8=;
	b=fPwjRRogkMjF/Osf7FduxvclefnnfE7ONHliYbF1jkN60I1jpZ3XKq7F8RXvGfJ7CO
	0/M8/m/j10QilF2lQs0/DxzKh6P7wzv9+UIxNjEoWBfOhD9XE98CDG2ixj5+vGEqWD7l
	6/3i8qbCH9i8RmiZfUpq9+opTBaK2z776RcfxNkyICQi8Ff47M3cNWdKpZ0jXTJcH+bk
	u4OCgXOIAkWltKXzR78rPxMamJPEd9DBAXjYd3+cB2T5/V2kn9tAystOX2Z25ScJLuk5
	aimNT+mGw9VWKAswlXtsigBuDE4ln43QrUvBRkBjLUd83l8KCaE3RV1KWeyvbZIPAXQJ
	/nig==
X-Gm-Message-State: AD7BkJIcxJSP4Ja0GMQa6FKyVHocyC6iiemoW5sPVX/sxbIgeVQIBuJmuTf/AZx8WF8OjjndsXOqk5NFL7cokg==
X-Received: by 10.28.228.85 with SMTP id b82mr682950wmh.36.1456933837810; Wed,
	02 Mar 2016 07:50:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.126.135 with HTTP; Wed, 2 Mar 2016 07:49:58 -0800 (PST)
X-Originating-IP: [84.56.32.62]
In-Reply-To: <56D6C202.5000008@windriver.com>
References: <1456577083-19366-1-git-send-email-daniel.dragomir@windriver.com>
	<1456577083-19366-2-git-send-email-daniel.dragomir@windriver.com>
	<CAK18fxG3L6W942-Q6qQD+9o7QtWTq7yW+wp9iDgBGvAKyDEaKQ@mail.gmail.com>
	<56D6C202.5000008@windriver.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 2 Mar 2016 16:49:58 +0100
Message-ID: <CAK18fxHDin0noXABTT4XUpBYXg-UgEO1jksSAB1mjqa6Ff04GA@mail.gmail.com>
To: Dragomir Daniel <daniel.dragomir@windriver.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 02 Mar 2016 15:50:39 -0000
Content-Type: multipart/alternative; boundary=001a114b0deadd87a2052d12d7ed

--001a114b0deadd87a2052d12d7ed
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 2, 2016 at 11:35 AM, Dragomir Daniel <
daniel.dragomir@windriver.com> wrote:

> Hi Andrei,
>
>
> On 03/02/2016 02:17 AM, Andrei Gherzan wrote:
>
> Hi Daniel,
>
> On Sat, Feb 27, 2016 at 1:44 PM, Daniel Dragomir <
> <daniel.dragomir@windriver.com>daniel.dragomir@windriver.com> wrote:
>
>> This patch adds tunes for 32-bit armv8 platforms. The user can select
>> the vector floating-point instruction set: vfpv3, vfpv4 or fp-armv8
>> and the Neon, crc and crypto extensions.
>>
>> Also, fix some parsing failures for armv7a*-neon-vfpv4 tunes.
>>
>> Signed-off-by: Daniel Dragomir < <daniel.dragomir@windriver.com>
>> daniel.dragomir@windriver.com>
>> Signed-off-by: Cristian Bercaru <cristian.bercaru at windriver.com>
>> ---
>>  meta/conf/machine/include/arm/arch-armv7a.inc |  4 +-
>>  meta/conf/machine/include/arm/arch-armv8a.inc | 75
>> +++++++++++++++++++++++++++
>>  2 files changed, 77 insertions(+), 2 deletions(-)
>>  create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
>>
>> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc
>> b/meta/conf/machine/include/arm/arch-armv7a.inc
>> index d3b6f64..ff6bc29 100644
>> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
>> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
>> @@ -65,8 +65,8 @@ PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3 =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-v
>>  PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3 =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16} armv7ahf-vfp-vfpv3d16-vfpv3
>> armv7at2hf-vfp-vfpv3d16-vfpv3"
>>  PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-neon"
>>  PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon
>> armv7at2hf-vfp-neon"
>> -PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4 =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} armv7ahf-vfp-neon-vfpv4"
>> -PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7ahf-vfp-neon-vfpv4
>> armv7at2hf-vfp-neon-vfpv4"
>> +PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4 =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} armv7ahf-vfp-vfpv4-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7ahf-vfp-vfpv4-neon
>> armv7at2hf-vfp-neon-vfpv4"
>>
>>  # Big Endian
>>  AVAILTUNES += "armv7ab armv7atb armv7ab-vfpv3d16 armv7atb-vfpv3d16
>> armv7ab-vfpv3 armv7atb-vfpv3 armv7ab-neon armv7atb-neon"
>> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc
>> b/meta/conf/machine/include/arm/arch-armv8a.inc
>> new file mode 100644
>> index 0000000..2d8dd73
>> --- /dev/null
>> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
>> @@ -0,0 +1,75 @@
>> +DEFAULTTUNE ?= "armv8a"
>> +
>> +TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
>> +TUNECONFLICTS[armv8a] = "armv4 armv5 armv6 armv7 armv7a"
>> +
>> +TUNEVALID[crc] = "Enable CRC instrucitons for ARMv8-a"
>>
>
> Small typo here: instrucitons .
>
>
> Thanks! Didn't noticed :)
>
>
Welcome.


>
>
>
>> +ARMPKGSFX_FPU .= "${@bb.utils.contains(" <$%7B@bb.utils.contains(>TUNE_FEATURES",
>> "crc", "-crc", "", d)}"
>> +
>> +TUNEVALID[crypto] = "Enable ARMv8 crypto extension."
>> +ARMPKGSFX_FPU .= "${@bb.utils.contains(" <$%7B@bb.utils.contains(>TUNE_FEATURES",
>> "crypto", "-crypto", "", d)}"
>> +
>> +TUNEVALID[fp-armv8] = "Enable ARMv8 Vector Floating Point unit."
>> +ARMPKGSFX_FPU .= "${@bb.utils.contains(" <$%7B@bb.utils.contains(>TUNE_FEATURES",
>> "fp-armv8", "-fp-armv8", "", d)}"
>> +
>> +TUNE_CCARGS .= "${@bb.utils.contains(" <$%7B@bb.utils.contains(>TUNE_FEATURES",
>> "armv8a", bb.utils.contains("TUNE_FEATURES", "crc", " -march=armv8-a+crc",
>> " -march=armv8-a", d), "", d)}"
>> +
>> +TUNE_CCARGS .= "${@bb.utils.contains(" <$%7B@bb.utils.contains(>TUNE_FEATURES",
>> "fp-armv8", bb.utils.contains("TUNE_FEATURES", "neon",
>> bb.utils.contains("TUNE_FEATURES", "crypto", " -mfpu=crypto-neon-fp-armv8",
>> " -mfpu=neon-fp-armv8", d), " -mfpu=fp-armv8", d), "", d)}"
>> +
>> +MACHINEOVERRIDES =. "${@bb.utils.contains(" <$%7B@bb.utils.contains(>TUNE_FEATURES",
>> "armv8a", "armv8a:", "" ,d)}"
>> +
>> +require conf/machine/include/arm/arch-armv7a.inc
>> +
>> +# Little Endian base configs
>> +AVAILTUNES += "armv8a armv8a-vfpv3 armv8a-neon armv8a-vfpv4
>> armv8a-vfpv4-neon armv8a-fp-armv8 armv8a-fp-armv8-neon
>> armv8a-crypto-fp-armv8-neon"
>> +ARMPKGARCH_tune-armv8a ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-vfpv3 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-neon ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-vfpv4 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-vfpv4-neon ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-fp-armv8 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-fp-armv8-neon ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crypto-fp-armv8-neon ?= "armv8a"
>> +TUNE_FEATURES_tune-armv8a ?= "arm armv8a vfp"
>> +TUNE_FEATURES_tune-armv8a-vfpv3 ?= "${TUNE_FEATURES_tune-armv8a} vfpv3"
>> +TUNE_FEATURES_tune-armv8a-neon ?= "${TUNE_FEATURES_tune-armv8a} neon"
>> +TUNE_FEATURES_tune-armv8a-vfpv4 ?= "${TUNE_FEATURES_tune-armv8a} vfpv4"
>> +TUNE_FEATURES_tune-armv8a-vfpv4-neon ?= "${TUNE_FEATURES_tune-armv8a}
>> neon vfpv4"
>> +TUNE_FEATURES_tune-armv8a-fp-armv8 ?= "${TUNE_FEATURES_tune-armv8a}
>> fp-armv8"
>> +TUNE_FEATURES_tune-armv8a-fp-armv8-neon ?= "${TUNE_FEATURES_tune-armv8a}
>> neon fp-armv8"
>> +TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon ?=
>> "${TUNE_FEATURES_tune-armv8a} crypto neon fp-armv8"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}
>> armv8a armv8a-vfp"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3 =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-vfp-vfpv3"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3} armv8a-vfp-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4 =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3} armv8a-vfp-vfpv4"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4-neon =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4} armv8a-vfp-neon
>> armv8a-vfp-vfpv4-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8 =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-fp-armv8-vfp"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8} armv8a-vfp-neon
>> armv8a-fp-armv8-vfp-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto-fp-armv8-neon =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon}
>> armv8a-crypto-fp-armv8-vfp-neon"
>> +
>> +# CRC configs
>> +AVAILTUNES += "armv8a-crc armv8a-crc-vfpv3 armv8a-crc-neon
>> armv8a-crc-vfpv4 armv8a-crc-vfpv4-neon armv8a-crc-fp-armv8
>> armv8a-crc-fp-armv8-neon armv8a-crc-crypto-fp-armv8-neon"
>> +ARMPKGARCH_tune-armv8a-crc ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-vfpv3 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-neon ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-vfpv4 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-vfpv4-neon ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-fp-armv8 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-fp-armv8-neon ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-crypto-fp-armv8-neon ?= "armv8a"
>> +TUNE_FEATURES_tune-armv8a-crc ?= "${TUNE_FEATURES_tune-armv8a} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-vfpv3 ?=
>> "${TUNE_FEATURES_tune-armv8a-vfpv3} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-neon ?= "${TUNE_FEATURES_tune-armv8a-neon}
>> crc"
>> +TUNE_FEATURES_tune-armv8a-crc-vfpv4 ?=
>> "${TUNE_FEATURES_tune-armv8a-vfpv4} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-vfpv4-neon ?=
>> "${TUNE_FEATURES_tune-armv8a-vfpv4-neon} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-fp-armv8 ?=
>> "${TUNE_FEATURES_tune-armv8a-fp-armv8} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-fp-armv8-neon ?=
>> "${TUNE_FEATURES_tune-armv8a-fp-armv8-neon} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-crypto-fp-armv8-neon ?=
>> "${TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon} crc"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-crc-vfp"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3 =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} armv8a-vfp-vfpv3
>> armv8a-crc-vfp-vfpv3"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3} armv8a-vfp-neon
>> armv8a-crc-vfp-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4 =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3} armv8a-vfp-vfpv4
>> armv8a-crc-vfp-vfpv4"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4-neon =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4} armv8a-vfp-neon
>> armv8a-crc-vfp-neon armv8a-vfp-vfpv4-neon armv8a-crc-vfp-vfpv4-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8 =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} armv8a-vfp-fp-armv8
>> armv8a-crc-fp-armv8-vfp"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8-neon =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8} armv8a-vfp-neon
>> armv8a-vfp-neon-fp-armv8 armv8a-crc-fp-armv8-vfp-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto-fp-armv8-neon =
>> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8-neon}
>> armv8a-vfp-crypto-neon-fp-armv8 armv8a-crc-crypto-fp-armv8-vfp-neon"
>>
>>
> Any plans for 64 bit version?
>
> Andrei
>
>
> Yes, we have plans to add specific tunes for armv8 64bit too, but after we
> finish for 32bit.
> For the moment, for 64bit, we simply include arch-armv8.inc witch only
> require arch-arm64.inc.
>
>
I am aware of those tunes but they don't include all the features. Thanks
for the heads up. I was about to look into these but I'll wait for you to
push it and will review.

Cheers!

--001a114b0deadd87a2052d12d7ed
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Mar 2, 2016 at 11:35 AM, Dragomir Daniel <span dir=3D"ltr">&lt;<a href=
=3D"mailto:daniel.dragomir@windriver.com" target=3D"_blank">daniel.dragomir=
@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    Hi Andrei,<div><div class=3D"h5"><br>
    <br>
    <div>On 03/02/2016 02:17 AM, Andrei Gherzan
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">Hi Daniel,<br>
          <br>
          <div class=3D"gmail_quote">On Sat, Feb 27, 2016 at 1:44 PM,
            Daniel Dragomir <span dir=3D"ltr">&lt;<a href=3D"mailto:daniel.=
dragomir@windriver.com" target=3D"_blank"></a><a href=3D"mailto:daniel.drag=
omir@windriver.com" target=3D"_blank">daniel.dragomir@windriver.com</a>&gt;=
</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-s=
tyle:solid;padding-left:1ex">This
              patch adds tunes for 32-bit armv8 platforms. The user can
              select<br>
              the vector floating-point instruction set: vfpv3, vfpv4 or
              fp-armv8<br>
              and the Neon, crc and crypto extensions.<br>
              <br>
              Also, fix some parsing failures for armv7a*-neon-vfpv4
              tunes.<br>
              <br>
              Signed-off-by: Daniel Dragomir &lt;<a href=3D"mailto:daniel.d=
ragomir@windriver.com" target=3D"_blank"></a><a href=3D"mailto:daniel.drago=
mir@windriver.com" target=3D"_blank">daniel.dragomir@windriver.com</a>&gt;<=
br>
              Signed-off-by: Cristian Bercaru &lt;cristian.bercaru at <a hr=
ef=3D"http://windriver.com" rel=3D"noreferrer" target=3D"_blank">windriver.=
com</a>&gt;<br>
              ---<br>
              =C2=A0meta/conf/machine/include/arm/arch-armv7a.inc |=C2=A0 4=
 +-<br>
              =C2=A0meta/conf/machine/include/arm/arch-armv8a.inc | 75
              +++++++++++++++++++++++++++<br>
              =C2=A02 files changed, 77 insertions(+), 2 deletions(-)<br>
              =C2=A0create mode 100644
              meta/conf/machine/include/arm/arch-armv8a.inc<br>
              <br>
              diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc
              b/meta/conf/machine/include/arm/arch-armv7a.inc<br>
              index d3b6f64..ff6bc29 100644<br>
              --- a/meta/conf/machine/include/arm/arch-armv7a.inc<br>
              +++ b/meta/conf/machine/include/arm/arch-armv7a.inc<br>
              @@ -65,8 +65,8 @@ PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3
              =3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-v<br>
              =C2=A0PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3 =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16}
              armv7ahf-vfp-vfpv3d16-vfpv3 armv7at2hf-vfp-vfpv3d16-vfpv3&quo=
t;<br>
              =C2=A0PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-neon&=
quot;<br>
              =C2=A0PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon
              armv7at2hf-vfp-neon&quot;<br>
              -PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4 =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}
              armv7ahf-vfp-neon-vfpv4&quot;<br>
              -PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon}
              armv7ahf-vfp-neon-vfpv4 armv7at2hf-vfp-neon-vfpv4&quot;<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4 =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}
              armv7ahf-vfp-vfpv4-neon&quot;<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon}
              armv7ahf-vfp-vfpv4-neon armv7at2hf-vfp-neon-vfpv4&quot;<br>
              <br>
              =C2=A0# Big Endian<br>
              =C2=A0AVAILTUNES +=3D &quot;armv7ab armv7atb armv7ab-vfpv3d16
              armv7atb-vfpv3d16 armv7ab-vfpv3 armv7atb-vfpv3
              armv7ab-neon armv7atb-neon&quot;<br>
              diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc
              b/meta/conf/machine/include/arm/arch-armv8a.inc<br>
              new file mode 100644<br>
              index 0000000..2d8dd73<br>
              --- /dev/null<br>
              +++ b/meta/conf/machine/include/arm/arch-armv8a.inc<br>
              @@ -0,0 +1,75 @@<br>
              +DEFAULTTUNE ?=3D &quot;armv8a&quot;<br>
              +<br>
              +TUNEVALID[armv8a] =3D &quot;Enable instructions for ARMv8-a&=
quot;<br>
              +TUNECONFLICTS[armv8a] =3D &quot;armv4 armv5 armv6 armv7 armv=
7a&quot;<br>
              +<br>
              +TUNEVALID[crc] =3D &quot;Enable CRC instrucitons for ARMv8-a=
&quot;<br>
            </blockquote>
            <div><br>
            </div>
            <div>Small typo here: instrucitons .</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></div></div>
    Thanks! Didn&#39;t noticed :)<div><div class=3D"h5"><br></div></div></d=
iv></blockquote><div><br></div><div>Welcome.</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div text=3D"#000000" bgcolor=3D"#FFFFFF"><div><div =
class=3D"h5">
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-s=
tyle:solid;padding-left:1ex">+ARMPKGSFX_FPU
              .=3D <a href=3D"mailto:$%7B@bb.utils.contains(" target=3D"_bl=
ank">&quot;${@bb.utils.contains(&quot;</a>TUNE_FEATURES&quot;, &quot;crc&qu=
ot;, &quot;-crc&quot;,
              &quot;&quot;, d)}&quot;<br>
              +<br>
              +TUNEVALID[crypto] =3D &quot;Enable ARMv8 crypto extension.&q=
uot;<br>
              +ARMPKGSFX_FPU .=3D <a href=3D"mailto:$%7B@bb.utils.contains(=
" target=3D"_blank">&quot;${@bb.utils.contains(&quot;</a>TUNE_FEATURES&quot=
;,
              &quot;crypto&quot;, &quot;-crypto&quot;, &quot;&quot;, d)}&qu=
ot;<br>
              +<br>
              +TUNEVALID[fp-armv8] =3D &quot;Enable ARMv8 Vector Floating P=
oint
              unit.&quot;<br>
              +ARMPKGSFX_FPU .=3D <a href=3D"mailto:$%7B@bb.utils.contains(=
" target=3D"_blank">&quot;${@bb.utils.contains(&quot;</a>TUNE_FEATURES&quot=
;,
              &quot;fp-armv8&quot;, &quot;-fp-armv8&quot;, &quot;&quot;, d)=
}&quot;<br>
              +<br>
              +TUNE_CCARGS .=3D <a href=3D"mailto:$%7B@bb.utils.contains(" =
target=3D"_blank">&quot;${@bb.utils.contains(&quot;</a>TUNE_FEATURES&quot;,
              &quot;armv8a&quot;, bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;crc&quot;, &quot;
              -march=3Darmv8-a+crc&quot;, &quot; -march=3Darmv8-a&quot;, d)=
, &quot;&quot;, d)}&quot;<br>
              +<br>
              +TUNE_CCARGS .=3D <a href=3D"mailto:$%7B@bb.utils.contains(" =
target=3D"_blank">&quot;${@bb.utils.contains(&quot;</a>TUNE_FEATURES&quot;,
              &quot;fp-armv8&quot;, bb.utils.contains(&quot;TUNE_FEATURES&q=
uot;, &quot;neon&quot;,
              bb.utils.contains(&quot;TUNE_FEATURES&quot;, &quot;crypto&quo=
t;, &quot;
              -mfpu=3Dcrypto-neon-fp-armv8&quot;, &quot; -mfpu=3Dneon-fp-ar=
mv8&quot;, d), &quot;
              -mfpu=3Dfp-armv8&quot;, d), &quot;&quot;, d)}&quot;<br>
              +<br>
              +MACHINEOVERRIDES =3D.
              <a href=3D"mailto:$%7B@bb.utils.contains(" target=3D"_blank">=
&quot;${@bb.utils.contains(&quot;</a>TUNE_FEATURES&quot;, &quot;armv8a&quot=
;,
              &quot;armv8a:&quot;, &quot;&quot; ,d)}&quot;<br>
              +<br>
              +require conf/machine/include/arm/arch-armv7a.inc<br>
              +<br>
              +# Little Endian base configs<br>
              +AVAILTUNES +=3D &quot;armv8a armv8a-vfpv3 armv8a-neon
              armv8a-vfpv4 armv8a-vfpv4-neon armv8a-fp-armv8
              armv8a-fp-armv8-neon armv8a-crypto-fp-armv8-neon&quot;<br>
              +ARMPKGARCH_tune-armv8a ?=3D &quot;armv8a&quot;<br>
              +ARMPKGARCH_tune-armv8a-vfpv3 ?=3D &quot;armv8a&quot;<br>
              +ARMPKGARCH_tune-armv8a-neon ?=3D &quot;armv8a&quot;<br>
              +ARMPKGARCH_tune-armv8a-vfpv4 ?=3D &quot;armv8a&quot;<br>
              +ARMPKGARCH_tune-armv8a-vfpv4-neon ?=3D &quot;armv8a&quot;<br=
>
              +ARMPKGARCH_tune-armv8a-fp-armv8 ?=3D &quot;armv8a&quot;<br>
              +ARMPKGARCH_tune-armv8a-fp-armv8-neon ?=3D &quot;armv8a&quot;=
<br>
              +ARMPKGARCH_tune-armv8a-crypto-fp-armv8-neon ?=3D &quot;armv8=
a&quot;<br>
              +TUNE_FEATURES_tune-armv8a ?=3D &quot;arm armv8a vfp&quot;<br=
>
              +TUNE_FEATURES_tune-armv8a-vfpv3 ?=3D
              &quot;${TUNE_FEATURES_tune-armv8a} vfpv3&quot;<br>
              +TUNE_FEATURES_tune-armv8a-neon ?=3D
              &quot;${TUNE_FEATURES_tune-armv8a} neon&quot;<br>
              +TUNE_FEATURES_tune-armv8a-vfpv4 ?=3D
              &quot;${TUNE_FEATURES_tune-armv8a} vfpv4&quot;<br>
              +TUNE_FEATURES_tune-armv8a-vfpv4-neon ?=3D
              &quot;${TUNE_FEATURES_tune-armv8a} neon vfpv4&quot;<br>
              +TUNE_FEATURES_tune-armv8a-fp-armv8 ?=3D
              &quot;${TUNE_FEATURES_tune-armv8a} fp-armv8&quot;<br>
              +TUNE_FEATURES_tune-armv8a-fp-armv8-neon ?=3D
              &quot;${TUNE_FEATURES_tune-armv8a} neon fp-armv8&quot;<br>
              +TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon ?=3D
              &quot;${TUNE_FEATURES_tune-armv8a} crypto neon fp-armv8&quot;=
<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv8a armv8a-vfp&qu=
ot;<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3 =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-vfp-vfpv3&quo=
t;<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3} armv8a-vfp-neo=
n&quot;<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4 =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3}
              armv8a-vfp-vfpv4&quot;<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4-neon =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4} armv8a-vfp-neo=
n
              armv8a-vfp-vfpv4-neon&quot;<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8 =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-fp-armv8-vfp&=
quot;<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8}
              armv8a-vfp-neon armv8a-fp-armv8-vfp-neon&quot;<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto-fp-armv8-neon =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon}
              armv8a-crypto-fp-armv8-vfp-neon&quot;<br>
              +<br>
              +# CRC configs<br>
              +AVAILTUNES +=3D &quot;armv8a-crc armv8a-crc-vfpv3
              armv8a-crc-neon armv8a-crc-vfpv4 armv8a-crc-vfpv4-neon
              armv8a-crc-fp-armv8 armv8a-crc-fp-armv8-neon
              armv8a-crc-crypto-fp-armv8-neon&quot;<br>
              +ARMPKGARCH_tune-armv8a-crc ?=3D &quot;armv8a&quot;<br>
              +ARMPKGARCH_tune-armv8a-crc-vfpv3 ?=3D &quot;armv8a&quot;<br>
              +ARMPKGARCH_tune-armv8a-crc-neon ?=3D &quot;armv8a&quot;<br>
              +ARMPKGARCH_tune-armv8a-crc-vfpv4 ?=3D &quot;armv8a&quot;<br>
              +ARMPKGARCH_tune-armv8a-crc-vfpv4-neon ?=3D &quot;armv8a&quot=
;<br>
              +ARMPKGARCH_tune-armv8a-crc-fp-armv8 ?=3D &quot;armv8a&quot;<=
br>
              +ARMPKGARCH_tune-armv8a-crc-fp-armv8-neon ?=3D &quot;armv8a&q=
uot;<br>
              +ARMPKGARCH_tune-armv8a-crc-crypto-fp-armv8-neon ?=3D
              &quot;armv8a&quot;<br>
              +TUNE_FEATURES_tune-armv8a-crc ?=3D
              &quot;${TUNE_FEATURES_tune-armv8a} crc&quot;<br>
              +TUNE_FEATURES_tune-armv8a-crc-vfpv3 ?=3D
              &quot;${TUNE_FEATURES_tune-armv8a-vfpv3} crc&quot;<br>
              +TUNE_FEATURES_tune-armv8a-crc-neon ?=3D
              &quot;${TUNE_FEATURES_tune-armv8a-neon} crc&quot;<br>
              +TUNE_FEATURES_tune-armv8a-crc-vfpv4 ?=3D
              &quot;${TUNE_FEATURES_tune-armv8a-vfpv4} crc&quot;<br>
              +TUNE_FEATURES_tune-armv8a-crc-vfpv4-neon ?=3D
              &quot;${TUNE_FEATURES_tune-armv8a-vfpv4-neon} crc&quot;<br>
              +TUNE_FEATURES_tune-armv8a-crc-fp-armv8 ?=3D
              &quot;${TUNE_FEATURES_tune-armv8a-fp-armv8} crc&quot;<br>
              +TUNE_FEATURES_tune-armv8a-crc-fp-armv8-neon ?=3D
              &quot;${TUNE_FEATURES_tune-armv8a-fp-armv8-neon} crc&quot;<br=
>
              +TUNE_FEATURES_tune-armv8a-crc-crypto-fp-armv8-neon ?=3D
              &quot;${TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon} crc&q=
uot;<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-crc-vfp&quot;=
<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3 =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} armv8a-vfp-vfpv3
              armv8a-crc-vfp-vfpv3&quot;<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3}
              armv8a-vfp-neon armv8a-crc-vfp-neon&quot;<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4 =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3}
              armv8a-vfp-vfpv4 armv8a-crc-vfp-vfpv4&quot;<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4-neon =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4}
              armv8a-vfp-neon armv8a-crc-vfp-neon armv8a-vfp-vfpv4-neon
              armv8a-crc-vfp-vfpv4-neon&quot;<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8 =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}
              armv8a-vfp-fp-armv8 armv8a-crc-fp-armv8-vfp&quot;<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8-neon =3D
              &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8}
              armv8a-vfp-neon armv8a-vfp-neon-fp-armv8
              armv8a-crc-fp-armv8-vfp-neon&quot;<br>
              +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto-fp-armv8-neon
              =3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8-neon=
}
              armv8a-vfp-crypto-neon-fp-armv8
              armv8a-crc-crypto-fp-armv8-vfp-neon&quot;<br>
              <span><font color=3D"#888888"><br>
                </font></span></blockquote>
            <div><br>
            </div>
            <div>Any plans for 64 bit version?</div>
            <div><br>
            </div>
            <div>Andrei=C2=A0</div>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br></div></div>
    Yes, we have plans to add specific tunes for armv8 64bit too, but
    after we finish for 32bit.<br>
    For the moment, for 64bit, we simply include arch-armv8.inc witch
    only require arch-arm64.inc.<br><br></div></blockquote><div><br></div><=
div>I am aware of those tunes but they don&#39;t include all the features. =
Thanks for the heads up. I was about to look into these but I&#39;ll wait f=
or you to push it and will review.=C2=A0</div><div><br></div><div>Cheers!</=
div></div><br></div></div>

--001a114b0deadd87a2052d12d7ed--
