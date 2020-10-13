Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.980.1602610810310214250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 10:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rILVu4gE;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id u8so1013999ejg.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 10:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=V8tRXZJYzNTAqE2fXjQDJDTZF+s+I3ZBAK+vB0fhV0Y=;
        b=rILVu4gE8Ev2SIQhmS+bHF74NStsZ/Lj2rq5DgqIzsFxZ2LqPIN4aOPYarhHgBKFal
         vxDkk6nBt2gbKLYvVExZjH/aL0LVEVm4Uy3HsTxAgfPe/fN8gSXILeT7GIHnutefPC47
         vRUhYMgltPE7WbJNcyRKud2N/0RPSazwv4RF1pGaqCIFbq0XqSYrbKRfxUeFfxUO8r6a
         DGSLkFSY6oVf+RV9VikYcgu1H6I9udieYP/pRNT+D63aPI0CAdCco78PIzYvzKT642Kj
         /BJriYjd4LvMC8utrs3t68P/nIWVmwkJkysz2rgKizZD2Az7kXIoY92pBvVo7zGC5yyC
         GrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=V8tRXZJYzNTAqE2fXjQDJDTZF+s+I3ZBAK+vB0fhV0Y=;
        b=U8/icNcnzWdEm17JVKWBZRd3DqiOXX6BfAe+qN/Y+1cy7QK4ujk/ZMMqij0ECej5lk
         c/zUyQxIl1yqc1OeshFjnkZTu2QqysatSqUncjK/l7ETENZDN9klFSNx7UHNUGdW8NRx
         k2cqTtCwRNNwZmolS4oFfLiAtly1puWM1tj+zIxfmOlPY0zDe1jCT34d8MMVRE9eh5xA
         3SskfCwdKstp0CA3luweKSOQXGMA8vCBvJ5wd1JFOIYn3Y5+FTRwIuV0KA0flolsdX7i
         G3nmdaznDoCuCnpeZ/5DXGFaFOMQN8Rak8+U6Tdr+b+OPocoWuUp0UW1CzlBY6rgMtQ6
         fBWA==
X-Gm-Message-State: AOAM531G5su8rZRrjzGSfx12gzJdEbWjbsK1s0e5Z1iiIGREIAmFivwy
	mLAMY/rVGMoyICbQE0+zfgUiINwCy1mutToap7YJDUoivKN7Wmk8
X-Google-Smtp-Source: ABdhPJxi2IrHdKae9ILafACsCGjnbA6UoQx7DN+XFDZ5fPZH1Nr2WLH4r7p+QWsbM+Cwegazj2G0aMmHrYclqqx9mEo=
X-Received: by 2002:a17:906:d7ad:: with SMTP id pk13mr855083ejb.33.1602610808872;
 Tue, 13 Oct 2020 10:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
 <20201012123620.2095778-5-quaresma.jose@gmail.com> <CANNYZj-gsTcYJjpwxeT7TwAj8QQptQUBSd6N5QmaoNR82JQRUA@mail.gmail.com>
 <CANPvuRmb_GnG0R2+6zRHxWJG0Hu4cAYD_6kKEyZRp+05+9E8Mw@mail.gmail.com>
 <CANNYZj-w+S4Zk0Vjav6KABUNwX3a=jCjDznHDHBch6sLOXpJnA@mail.gmail.com>
 <CAHtQpK5hq5dZVwwwxUq3hvgQ3zUfAibx5Qboh6Ju7VvxWA+n2Q@mail.gmail.com>
 <CANNYZj9Mr1VLAY5=ubgdYO08KWWUTPfd50CMqT-jcvZ44rPtMw@mail.gmail.com>
 <CAHtQpK7T7rqfACB7MSnTh701yPbPy2B51Em924-FueriejFXOA@mail.gmail.com>
 <CANNYZj_AqswY3JJnVu=vtNQPdgfd=tbE89WgRD4Fxm1O=msFFQ@mail.gmail.com>
 <163D7EFF5EFA949A.25724@lists.openembedded.org> <CANPvuRmeDf9Mmcj95noPET0d=NGtcC33k8qRhBRb95pLOxMQHQ@mail.gmail.com>
 <CANNYZj9Zgc1BbufcL-ef8ArheofAd3S_raWVdkKYK7c+7PD4uQ@mail.gmail.com>
In-Reply-To: <CANNYZj9Zgc1BbufcL-ef8ArheofAd3S_raWVdkKYK7c+7PD4uQ@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 13 Oct 2020 18:39:58 +0100
Message-ID: <CANPvuR=f=yeES9DzgbMpQreyHxr9bh9YeCEYrY8Xs8knN_kxVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/13] gstreamer1.0-plugins-bad: disable vulkan
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the help.

I have submit a new series with the recipes for addressing the issue
in building the vulkan plugin

This adds the shaderc tool
https://patchwork.openembedded.org/series/26532

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia ter=C3=A7a,
13/10/2020 =C3=A0(s) 17:29:
>
> Either way is ok. If there are two patchsets, reference them in cover le=
tters.
>
> Alex
>
> On Tue, 13 Oct 2020 at 16:38, Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>>
>> I have new 3 recipes for fix the build of the vulkan gstreamer plugin
>>
>> spirv-tools:
>> move it from meta-oe, add native build and install some extra header fi=
les.
>>
>> glslang:
>> is the official reference compiler front end for the OpenGL ES and
>> OpenGL shading languages.
>>
>> shaderc:
>> A collection of tools, libraries and tests for shader compilation that
>> provide the binary glslc need to build the vulkan plugin.
>>
>> What is the better method to submit this?
>> A new patch series with these 3 recipes or a gstreamer patch series v2
>> with all the recipes needed.
>>
>> Jose Quaresma via lists.openembedded.org
>> <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
>> ter=C3=A7a, 13/10/2020 =C3=A0(s) 09:11:
>> >
>> > Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia segunda,
>> > 12/10/2020 =C3=A0(s) 20:45:
>> > >
>> > > On Mon, 12 Oct 2020 at 20:20, Andrey Zhizhikin <andrey.z@gmail.com>=
 wrote:
>> > >>
>> > >>
>> > >> What I meant to point out was - there is a dependency in Vulkan on
>> > >> glslang, irrespective whether it is compiled standalone or as a
>> > >> dependency of another package. I believe this Vulkan <- glslang
>> > >> dependency should be solved first before Vulkan can be included
>> > >> anywhere further.
>> > >>
>> > >> As I know, it is currently solved locally in meta-freescale-distro
>> > >> layer, hence it was my question on whether it should be moved to
>> > >> OE-Core to solve the Vulkan dependency altogether?
>> > >
>> > >
>> > > Can you please point to where glslang is used in the vulkan source =
tree? Is it something recently added, as vulkan bits and examples have been=
 building fine without it in oe-core?
>> >
>> > I am working on a recipe for 'shaderc' that is needed for build the
>> > gstreamer vulkan plugin
>> >
>> > This recipe needs glslang and spirv-tools.
>> > I don't have knowledge of the existence of glslang on
>> > meta-freescale-distro and I created one for myself.
>> >
>> > >
>> > > Alex
>> >
>> >
>> >
>> > --
>> > best regards,
>> > Jos=C3=A9 Quaresma
>> >
>> >=20
>> >
>>
>>
>> --
>> best regards,
>> Jos=C3=A9 Quaresma



--=20
best regards,
Jos=C3=A9 Quaresma
