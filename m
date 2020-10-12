Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web11.4978.1602525946609198377
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 11:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bn9vzzEu;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: andrey.z@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id w25so9611510vsk.9
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 11:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DHXSt6iNvdLa365hBBK96hllwWeDzeYUF/q+CYOlrlA=;
        b=bn9vzzEu1z9WFtNiMp+5woKkNXilNPFRHjfSLez8G8t5wrDiwW4I4vpQV4381zO3oZ
         96bPYUaoPWLMGWv2Kf2Gf68yxDNlB+pZinZ/BcXmwOO0QzM8s9FJJSaaAyAEqkLkDCj9
         2te682e66rj8IbKvXVwUGIR0Z/FxmYqNbiQbY50C7oZ6gQCivny60joq4qg7N3Uj+rN3
         IVMctGNADH764Vdu1kRFwqV0MI5P01OK5FUxweY5VIko8cGIglr+o8wafUlnGTAVLRds
         zh7uj10djeM0M8IN/xPq5wr+s/wVCG+YmTdy5BGSb4wy2XLLFqnUvTr4KpFMgCKOIJGQ
         QU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DHXSt6iNvdLa365hBBK96hllwWeDzeYUF/q+CYOlrlA=;
        b=WwIytn8KQvqa2ilvZ6sf9S7fABy892VBshtVe35P3e0MRKipxCu1Mbkgs65xRxkZws
         rSMsNLSxw90oMBhINrYE3ifdYQIEsXQIniwKgweQAiDSU1zxZT+IkToxuLGU2K+up4a9
         Z97u/eVAr/t1FlnjEogruKrhNsaBKLKoCOw32TOlY2tRhG0FsZe4s5rYnSj9lfKx3mQD
         Es09POryaES7+tHZQ47Xoz4loAtI3hHa0Sfw+ghZXJoLSM8F2VesxIc6LEB6dGuK8TiR
         LmJkjvkIz+qHvek1Tvp0A0/NS/Gf+tvzZ8lVQbwyeQRfmPcyN9gJp6i5q+0hsQ/1u5oR
         Clcg==
X-Gm-Message-State: AOAM533eQiIsO8l4ZtOtMs8pgiQlcO6r5GM8NNXeyo0aD6+fokOatlxe
	40CRFHk1kSZipoEoPgS7kK6YyrmD7kAl3RaKZzc=
X-Google-Smtp-Source: ABdhPJw2nmXhUJyN3ZCmXVzjuFv6ZEdCjxI9TyGDFb5Pg7ps55Q1dL7WYotkygLC9Rg+V4V7e8RTem6LNGoRM3MYyyU=
X-Received: by 2002:a67:2bc4:: with SMTP id r187mr10762207vsr.56.1602525945735;
 Mon, 12 Oct 2020 11:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
 <20201012123620.2095778-5-quaresma.jose@gmail.com> <CANNYZj-gsTcYJjpwxeT7TwAj8QQptQUBSd6N5QmaoNR82JQRUA@mail.gmail.com>
 <CANPvuRmb_GnG0R2+6zRHxWJG0Hu4cAYD_6kKEyZRp+05+9E8Mw@mail.gmail.com> <CANNYZj-w+S4Zk0Vjav6KABUNwX3a=jCjDznHDHBch6sLOXpJnA@mail.gmail.com>
In-Reply-To: <CANNYZj-w+S4Zk0Vjav6KABUNwX3a=jCjDznHDHBch6sLOXpJnA@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Mon, 12 Oct 2020 20:05:32 +0200
Message-ID: <CAHtQpK5hq5dZVwwwxUq3hvgQ3zUfAibx5Qboh6Ju7VvxWA+n2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/13] gstreamer1.0-plugins-bad: disable vulkan
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 7:28 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Right, this is fine then. But please add the information and links to th=
e commit message, so that anyone who wants to address this knows where to s=
tart.
>
> Alex
>
> On Mon, 12 Oct 2020 at 18:13, Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>>
>> As I understand, the problem is not related with the vulkan package.
>>
>> To build the vulkan gstreamer plugin whe need a native binary that is
>> not provided in OE core.
>> This binary is [glslc]
>>
>> It is provided by the shaderc project
>> https://github.com/google/shaderc
>>
>> Gstreamer upstream also suggests this project.
>> As glslangValidator is the tool coming from Khronos it would probably
>> be good to support it.
>> https://github.com/KhronosGroup/glslang
>>
>> I can try to build a recipe to fix the missing glslc native binary.
>> But it's better if anyone can provide more information on this because
>> I am not expert in this area.

That has been addressed in meta-freescale-distro layer
(https://github.com/Freescale/meta-freescale-distro/commit/01c87325571e5ee=
91ecc575c863fb693fc1c9955).
There has been a similar native dependency required for GPU SDK build
with Vulkan support, hence the recipe for glslang has been introduced.

Should this be maybe ported to OE-Core?

>>
>> Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia segunda,
>> 12/10/2020 =C3=A0(s) 16:54:
>> >
>> > On Mon, 12 Oct 2020 at 14:36, Jose Quaresma <quaresma.jose@gmail.com>=
 wrote:
>> >>
>> >> -PACKAGECONFIG[vulkan]          =3D "-Dvulkan=3Denabled,-Dvulkan=3Dd=
isabled,vulkan-loader"
>> >> +# FIXME: vulkan build fail
>> >> +# to build vulkan, a new package is needed.
>> >> +# add shaderc package as a separate pacth
>> >> +# https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues=
/1349
>> >> +#| Program glslc found: NO
>> >> +#| gst-libs/gst/vulkan/meson.build:273:0: ERROR: Program(s) ['glslc=
'] not found or not executable
>> >> +#PACKAGECONFIG[vulkan]          =3D "-Dvulkan=3Denabled,-Dvulkan=3D=
disabled,vulkan-loader shaderc"
>> >
>> >
>> > I think this needs to be addressed, as it's a regression in what prev=
iously worked. If a newer version of vulkan is required, I have done some w=
ork towards that here:
>> > http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dak=
anavin/package-version-updates-later&id=3Dd6715a06317b1799f5380cc8169acfbd0=
696d498
>> >
>> > but had to put it on hold because gstreamer 1.16 is not compatible wi=
th it :) Can you cherry-pick that and see if it helps? (there's an even new=
er vulkan available since, so maybe you need to do additional upgrading)
>>
>> I understand the problem and is because of this that I put it in a
>> separate patch.
>> I will try your work on
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dakan=
avin/package-version-updates-later&id=3Dd6715a06317b1799f5380cc8169acfbd069=
6d498
>> But as I mentioned before I think the problem needs to be solved with
>> a new recipe.
>>
>> >
>> > Alex
>>
>>
>>
>> --
>> best regards,
>> Jos=C3=A9 Quaresma
>
>
>=20
>


--=20
Regards,
Andrey.
