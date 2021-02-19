Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.168.1613776598228334193
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 15:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MJ1Ry/RT;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id h8so7249497qkk.6
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 15:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7fgsyICoVOJbO37BF1vz8ARiloR7yoTL40PbTS8nNYo=;
        b=MJ1Ry/RTqCblS9l2UCHB90rS9oLdunSOnnv7Vfkd0JCLuwMkVGk05QwnuOKdeqa/IT
         kpzVgLqYJp09hOSPL1jKlca5LIEbQnO/XB5v2Edqm0fdy5aUql06C2OB7ULGM/AMpOV/
         y4Oy6Mxub3AkSrpf++yaQI8OIbzf75mR6hRqPMzb6Z0yGxgCodztqoqMzcYqOP5hJfoe
         JaLTdzPGiCieH5xpud1mR8tMDdO0IsOlpiaB0/JbOvzS/5riP+DqRsTfkHsZXI85u4GE
         k7cIeVWnIeWP2+vKoBs8TdM8c5ZWd771ZDBxKCw3N/fSYv0p8DgKkr9Ddt1h2gRuWtNz
         ODRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7fgsyICoVOJbO37BF1vz8ARiloR7yoTL40PbTS8nNYo=;
        b=PfLDt2Ft4IwS92VRxhMp49plXxHEtRUw/hkd5F4mkSvwijfB7TZFWs1Gzwff1YhlfK
         GlIFSmQAd31tiZyHXF0hgLycXjgeJ/KsK88oLOTXsYhiExpxNWrH2AQVZeEV6zX98vR+
         omfSZmvO05OK2/CBzW3L2GsVtdJLLn3BjP/t1tjW1srJfT6pITik/zVmHmL2TIV6gQAt
         +JVa31Axiv4JnRzygp/Ho38stXcvUQavP6ZBMGEHiuYJEpYFxJ88dSkMuuOUp92gDtQU
         AoDy8GfMavBliLqhyXc/r/wIz8rR9O1vTN6/s9q3LpK7N6V9asGvVPWbeYWAEzNyjtBQ
         lCrA==
X-Gm-Message-State: AOAM532joA4kt/bcO5naxx3K1VHUoD7mlqy9dcuFk6BXNYl3zXBCgU9C
	oPzZ+6upkmfZcvQywDWChZs6aOB+bukdCv5jp0I=
X-Google-Smtp-Source: ABdhPJw9umB3lYbTxaGDS59AM8yG7F5GfyNm8GSharkLzcbo9Vk9ZFzPD42iFdoTVxFyFxV1Osza4ojCv9lqEMBxNIY=
X-Received: by 2002:a05:620a:b95:: with SMTP id k21mr11621073qkh.125.1613776597278;
 Fri, 19 Feb 2021 15:16:37 -0800 (PST)
MIME-Version: 1.0
References: <20210216230130.1516657-1-Martin.Jansa@gmail.com>
 <CAMKF1sqh0WEed86n+JGM3WHVxAM31xUZ6mR744CQpUE4Sa1ziQ@mail.gmail.com>
 <CA+chaQdoYMbPazDp8onpqJMNj9SBL7pT_5XLYE1Dv1XmJ5ZMZw@mail.gmail.com>
 <CAMKF1spBtFXUzDaDSnQiOYw9xYPrn_-MiOrEOnmpven940MbNQ@mail.gmail.com> <CA+chaQcKgbUi8jXH24xMT4j2SqRctYu8PiXr3WL5tpAgeWDg+Q@mail.gmail.com>
In-Reply-To: <CA+chaQcKgbUi8jXH24xMT4j2SqRctYu8PiXr3WL5tpAgeWDg+Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 19 Feb 2021 15:16:11 -0800
Message-ID: <CAMKF1spJ2iXuGXhZwMA-JX+d_XGPGA-6AXd4gPiVk3G0nbW1nA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] icu: backport fix for rare random genrb segmentation fault
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After discussing with Martin offline and also his test reports
indicate that we are not getting worse with this patch. So I am
comfortable backporting it to dunfell.

On Tue, Feb 16, 2021 at 6:08 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> > Generally it was done so it applied on latest data which may be regener=
ated during build
>
> Maybe I'm missing something, but
> https://git.openembedded.org/openembedded-core/commit/?id=3D5e5be67744d7d=
df5a9ac433ecba02f697a84a325
> adds make_icudata task after do_patch and it was creating a copy from ${W=
ORKDIR}/data and then patching it, if it's already patched by do_patch task=
, then the patched data directory is being used even if the make_icudata ge=
ts re-executed during build.
>
> So this IMHO shouldn't have any impact on behavior, except applying the p=
atch in do_patch instead of delaying (and possibly re-applying it when re-e=
xecuted) inside make_icudata task.
>
> On Tue, Feb 16, 2021 at 4:11 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Tue, Feb 16, 2021 at 3:53 PM Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>>>
>>>
>>>
>>> On Tue, Feb 16, 2021 at 3:33 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> > index 08254648e4..6ba88595df 100644
>>>> > --- a/meta/recipes-support/icu/icu_66.1.bb
>>>> > +++ b/meta/recipes-support/icu/icu_66.1.bb
>>>> > @@ -21,10 +21,11 @@ BASE_SRC_URI =3D "https://github.com/unicode-org=
/icu/releases/download/release-${I
>>>> >  DATA_SRC_URI =3D "https://github.com/unicode-org/icu/releases/downl=
oad/release-${ICU_FOLDER}/icu4c-${ICU_PV}-data.zip"
>>>> >  SRC_URI =3D "${BASE_SRC_URI};name=3Dcode \
>>>> >             ${DATA_SRC_URI};name=3Ddata \
>>>> > +           file://0001-Fix-big-endian-build.patch;patchdir=3D${WORK=
DIR} \
>>>
>>>  > +           file://0002-ICU-21175-Add-cnvalias-as-a-dependency-of-mi=
sc_res.patch;patchdir=3D${WORKDIR} \
>>>>
>>>>
>>>> why this change ?
>>>
>>>
>>> Because both these patches need to be applied on ${WORKDIR}/data direct=
ory and doing it here provides slightly better error message when the patch=
 doesn't apply (e.g. in this case ${WORKDIR}/data is using dos line endings=
, but I was preparing the patch in git repo where it's using unix line endi=
ngs as expected) and the patch call failing in do_make_icudata_class-target=
 is more confusing than usual do_patch failure.
>>>
>>> Was there any reason to apply this fix only for target builds? I haven'=
t found any.
>>
>>
>> Generally it was done so it applied on latest data which may be regenera=
ted during build
>>>
>>>
>>> Cheers,
