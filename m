Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web09.42.1603642268892584473
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2020 09:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=THXeHFNW;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id dn5so6888926edb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2020 09:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xwI/domsXAMzQhEyYq3/nLq4MBkjvgrB56ff9ELiAXw=;
        b=THXeHFNWXW3r6ZLDSUybkoXjH8ihCgDIAIIuNmHxQ3ywOo8PRpYDtl1PxziD2K317T
         rm+BEK3gznz74/k1hNCTtK0/hTzPbRwxO/Dr4W0tHJbP91ds3MBXSZ8wsOrxc8vzu/da
         El5JFkYniPIDFNPjS2ErM9E1KR8WEixo8gPY+Jv6OWKasXOjI8GWhOALELmrLmFj3dza
         buGK3PKRXeR4HbguF8pVYnhEf5iTMwgn2WmKnBQACTo8Ratu/T2iE1rJ/G9+c5WWrQ+W
         5SCnHtxLWrKSrF4oFDIaUv7sFuQAKGvDReyNG0i7lB2gbGAOhdoI400tW0pXQdzj/M6Q
         ildA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xwI/domsXAMzQhEyYq3/nLq4MBkjvgrB56ff9ELiAXw=;
        b=I+PB3WeqdTBxMKx2A36qfgiqC+si0OU7H3cHwR2IYHkNlJHgBjQwSboyNgKVHGCiKU
         9MZ3RDP4CCICG5/g9ZX6dgUHY9W1HeL3J+cyRA12gPRV+LmEA/Bi/MXuKJ696g/SgzW+
         h/YbpubVnm053ZX/X8PSIklpPmVPvSwVGU2KawB05kSFnP1Bu1m6yj0ceghfO2ISLWHu
         B68bw1IJHAZlrqNu0N7FfSh1KJl5zQvQ+2E3JTITpocvo/Aaykm0ep4SwkuilYXEOg+U
         hKyf9BQTzz/xWYHiaFoYy3o2PkMi5ZcIhiFXo75417mCGiyDL6JXdSYTs1K0HbYa92I8
         i42Q==
X-Gm-Message-State: AOAM530nH7VfeccfCUSvmT3vmNIVMRGqr9TmOLrFbix22eX/X33xq0HX
	Ipqert5Li9snIK4S8VMjiLr1vk2iGTjUAAkVtSM=
X-Google-Smtp-Source: ABdhPJxKt8kvJFaCImoBLui9397Xnc0xiDwcPm2Nab067vUjwwCHna3HL1zbvWQ4+l2aax0nCX+1EilivxQPweJa7aA=
X-Received: by 2002:aa7:d597:: with SMTP id r23mr10487789edq.19.1603642267263;
 Sun, 25 Oct 2020 09:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201017142935.3605756-1-quaresma.jose@gmail.com> <436d7e8c6bb8f34052c59924eb8020145e413dfa.camel@linuxfoundation.org>
In-Reply-To: <436d7e8c6bb8f34052c59924eb8020145e413dfa.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Sun, 25 Oct 2020 16:11:02 +0000
Message-ID: <CANPvuRkv-Jk8L7AhN7hYhHNA8ArU21PbE8egm9N2ZytsQEBGKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/5] spirv-tools: import from meta-oe to OE core
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

The following recipes do not have a maintainer assigned to them.
Please add an entry to meta/conf/distro/include/maintainers.inc file.
glslang (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes=
-graphics/glslang/glslang_8.13.3559.bb)
shaderc (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes=
-graphics/shaderc/shaderc_2019.0.bb)
spirv-tools (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/rec=
ipes-graphics/spir/spirv-tools_git.bb)

spirv-tools comes from meta-oe, I can assign the same maintainer found
in meta-oe or it is not possible?

glslang and shaderc don't exist in other layers and it is created by me.
You are saying that I can be the mateiner or have to be someone else.

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
domingo, 25/10/2020 =C3=A0(s) 14:52:
>
> On Sat, 2020-10-17 at 15:29 +0100, Jose Quaresma wrote:
> > This receipe is needed to build the new shaderc
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  ...0001-Avoid-pessimizing-std-move-3124.patch | 50 +++++++++++++++++++
> >  ...STALL_LIBDIR-in-installed-CMake-file.patch | 35 +++++++++++++
> >  meta/recipes-graphics/spir/spirv-tools_git.bb | 35 +++++++++++++
> >  3 files changed, 120 insertions(+)
> >  create mode 100644 meta/recipes-graphics/spir/files/0001-Avoid-pessimi=
zing-std-move-3124.patch
> >  create mode 100644 meta/recipes-graphics/spir/files/0001-Respect-CMAKE=
_INSTALL_LIBDIR-in-installed-CMake-file.patch
> >  create mode 100644 meta/recipes-graphics/spir/spirv-tools_git.bb
>
> Hi,
>
> I did run some brief tests on these, I noticed there is no maintainer
> set for the new recipes. We need to set one for recipes in OE-Core,
> see:
>
> meta/conf/distro/include/maintainers.inc
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1490/st=
eps/8/logs/step2d
>
> Cheers,
>
> Richard
>


--=20
best regards,
Jos=C3=A9 Quaresma
