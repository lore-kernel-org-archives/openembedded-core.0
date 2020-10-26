Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web08.11032.1603710575406056083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 04:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BJFr2E9t;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id w27so12788615ejb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 04:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ztq6aoR6vRZuYtdT36t+MyC534QKIUoAi1XV+55P+Ic=;
        b=BJFr2E9t32/FOwfcIgQBykuMGhbzb1qswlH2JbYt6/TbJxTCT8HuaGKlDdGXlHAkHw
         I+dk64Pe0ZXysTCywTGYcTO15xcEMjoWfyU0hp0UyZ4OTCS9zoLVBmjrJNkLNNI3IIHq
         n/sIBQs5Mhl+w6l5MtfiQl4ny5bj5Vv1f+2kqzNJ+Uc/bubRUT7lLFOOm08UCUy6d1qU
         Qdd6zFHx18aO6MFWgprPVD894M6QsIHQbrZj3aefim/Me42nUvsdKx4lMrHVzXwynuYp
         M8AvlkkJLxrTPpnsv50OZTZbJCakF1jGRJkZ34aV+e/hQ698LcHumc8gzlDxfbh2stgA
         i2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ztq6aoR6vRZuYtdT36t+MyC534QKIUoAi1XV+55P+Ic=;
        b=h1sXPpz2CRmw6bO/K1P9z5RAni9xsaJp/4rAbGJWHfh+7WPUeb2Eh9B076psxZMFk1
         ID5ofI9HoMP6XVHEObQe2IOojghT4Ln+Koriar2PVphXcZ0QIR/iPzeV6mTc/552DAoC
         6YvRuu6tL2aLsBcEIYEETxLD2WvMcTb4A+N2ZwYxPSZNLwpuyz30h9AmTpYwGyDERX2c
         jG5I0yv/A1vWlWESrwNpBmS2S3DpV4aOFv8MLN+QEzGrt+pshMfBReZBL6GnbnaGCXHD
         FztvMTGZ8zUt42+JFdbTzWLuhB1oxj+dD5onN5AtAsDhQxmkxnlwYFI+vJbpy2t5hXp8
         0Spw==
X-Gm-Message-State: AOAM532AZbNXjRx5+Ia6BE/TisI4oO9QzTLIePVeZSPyCAt70quioLXQ
	C+MCOPy/2fhltFanZ/CXerNFUVpYauSHeyNycdo=
X-Google-Smtp-Source: ABdhPJzDV6C3plgxsE83XudBm/z+3rLdhMO1xIHQtxfc9wT5LEyOvJnxl1T8ab+9mk/tWsWcrRPwxP507MQLiGbXIkU=
X-Received: by 2002:a17:906:249a:: with SMTP id e26mr15036865ejb.484.1603710572073;
 Mon, 26 Oct 2020 04:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201017142935.3605756-1-quaresma.jose@gmail.com>
 <436d7e8c6bb8f34052c59924eb8020145e413dfa.camel@linuxfoundation.org>
 <CANPvuRkv-Jk8L7AhN7hYhHNA8ArU21PbE8egm9N2ZytsQEBGKw@mail.gmail.com> <CANNYZj_o8zbiCP+2VPUkg5y_gMTLd4Ww6j6x=ywaCeCSZWNgWQ@mail.gmail.com>
In-Reply-To: <CANNYZj_o8zbiCP+2VPUkg5y_gMTLd4Ww6j6x=ywaCeCSZWNgWQ@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 26 Oct 2020 11:09:27 +0000
Message-ID: <CANPvuR=9FEG5QuE=2uBbYNb21KatdCaFU05UNBRVyEhb0Wu2Jg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/5] spirv-tools: import from meta-oe to OE core
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For now I will add myself as the maintainer of these three recipes if
it is possible
and send a new version of the series with this fixes for
meta/conf/distro/include/maintainers.inc

The author of the spirv-tools recipe on meta-oe was Ankit Navik
<ankit.tarot@gmail.com>.
I can try to contact him to know if he wants to be the maintainer of
the spirv-tools on OE-core.
if he accepts a will send a new patch for this.

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia domingo,
25/10/2020 =C3=A0(s) 18:00:
>
> Almost always the person adding the recipes to core should be the mainta=
iner for them as well - unless you can nominate someone else and they confi=
rm.
>
> Alex
>
> On Sun, 25 Oct 2020 at 17:11, Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>>
>> Hi Richard,
>>
>> The following recipes do not have a maintainer assigned to them.
>> Please add an entry to meta/conf/distro/include/maintainers.inc file.
>> glslang (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/rec=
ipes-graphics/glslang/glslang_8.13.3559.bb)
>> shaderc (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/rec=
ipes-graphics/shaderc/shaderc_2019.0.bb)
>> spirv-tools (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta=
/recipes-graphics/spir/spirv-tools_git.bb)
>>
>> spirv-tools comes from meta-oe, I can assign the same maintainer found
>> in meta-oe or it is not possible?
>>
>> glslang and shaderc don't exist in other layers and it is created by me=
.
>> You are saying that I can be the mateiner or have to be someone else.
>>
>> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
>> domingo, 25/10/2020 =C3=A0(s) 14:52:
>> >
>> > On Sat, 2020-10-17 at 15:29 +0100, Jose Quaresma wrote:
>> > > This receipe is needed to build the new shaderc
>> > >
>> > > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>> > > ---
>> > >  ...0001-Avoid-pessimizing-std-move-3124.patch | 50 +++++++++++++++=
++++
>> > >  ...STALL_LIBDIR-in-installed-CMake-file.patch | 35 +++++++++++++
>> > >  meta/recipes-graphics/spir/spirv-tools_git.bb | 35 +++++++++++++
>> > >  3 files changed, 120 insertions(+)
>> > >  create mode 100644 meta/recipes-graphics/spir/files/0001-Avoid-pes=
simizing-std-move-3124.patch
>> > >  create mode 100644 meta/recipes-graphics/spir/files/0001-Respect-C=
MAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch
>> > >  create mode 100644 meta/recipes-graphics/spir/spirv-tools_git.bb
>> >
>> > Hi,
>> >
>> > I did run some brief tests on these, I noticed there is no maintainer
>> > set for the new recipes. We need to set one for recipes in OE-Core,
>> > see:
>> >
>> > meta/conf/distro/include/maintainers.inc
>> >
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/149=
0/steps/8/logs/step2d
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>>
>>
>> --
>> best regards,
>> Jos=C3=A9 Quaresma
>>
>>=20
>>


--=20
best regards,
Jos=C3=A9 Quaresma
