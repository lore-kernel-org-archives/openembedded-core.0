Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2495DC04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 08:21:38 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.21705.1661415689731531900
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 01:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c9/TYBxa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id d16so18311822wrr.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 01:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=TEjWBM99uKRQf/kLxOWbGo5gCUDaCAqtC4yTCqVhgAA=;
        b=c9/TYBxa/tyRoYnvAyM1FSmOHWRpRcl2W+Yln6CgD8DZRQF7NYFy35/livbPeNN/PA
         m6gmW9i0Sln6p3tC+odXc7cL8DZyxy1AD0Uj+XXFP0H9DQP8XJoadvTI38Wstz6I5dC3
         y+Dj1CBokoTAPvIYXSlUbBVQe1stWHLl05P1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=TEjWBM99uKRQf/kLxOWbGo5gCUDaCAqtC4yTCqVhgAA=;
        b=HfbnZqr0o+ISDM0ZuwKOLpQb+tZ5fQTzd3oy7dL5KGB1baN2agOB0dQkrTHbf67mha
         J/3DgCOubJkowNqMOTwMQ4/392An5jKyepAg2Eu4A0dOFAb209q26H+d4SqwqRph901n
         bg4GyGFQG9D1uJgXCpKhPAhw8dqiF+Kx3bYFJF5H/JPiVT5/qKmZTHvCrBejhq9Y5uyZ
         uiCFGrT6g7b0sCV/YL/dTWBR3bKGCBzf+VdZmZ3tEY77Xod6xXwmsLsFx28mOHdLbhyY
         Lvk95g4auC54FOoncs9sQV36WP2AC8xA3MJ5auaR6l2xD2XHlTAqFrS4i/nc1tC0AeSy
         SNng==
X-Gm-Message-State: ACgBeo38e8iXkYVOx+BeVUk+LyqcGMtQQWBrnHSIG2UqdkcKpTDHJReg
	xDimieZ2+Lq2L1qq6oIsuKafaA==
X-Google-Smtp-Source: 
 AA6agR6tyM19nV9HKN1K4AbFCnseDO0DX544lnb+oQbSvYibWChU1gwijCYT0TwupliUF8xj9Okysg==
X-Received: by 2002:a5d:4a84:0:b0:225:20ed:872b with SMTP id
 o4-20020a5d4a84000000b0022520ed872bmr1471897wrq.267.1661415687542;
        Thu, 25 Aug 2022 01:21:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8059:8737:891c:87d?
 ([2001:8b0:aba:5f3c:8059:8737:891c:87d])
        by smtp.gmail.com with ESMTPSA id
 c10-20020adfa70a000000b0022529d3e911sm19447982wrd.109.2022.08.25.01.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 01:21:26 -0700 (PDT)
Message-ID: 
 <af63da104ec9d91ab441d3cabfaadfe4700760fa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/sdk: extend rust test to also use a
 build script
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Bergin <peter@berginkonsult.se>,
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Aug 2022 09:21:26 +0100
In-Reply-To: <f7469b7e-7df2-e418-6da0-7427bbdc8cfd@berginkonsult.se>
References: <20220823085636.30868-1-peter@berginkonsult.se>
	 <20220823085636.30868-2-peter@berginkonsult.se>
	 <6ca1d415a0faeba53e6a3945bd1fafd89866e2e9.camel@linuxfoundation.org>
	 <f7469b7e-7df2-e418-6da0-7427bbdc8cfd@berginkonsult.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 08:21:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169838

Hi Peter,

On Thu, 2022-08-25 at 09:17 +0200, Peter Bergin wrote:
> On 2022-08-24 10:52, Richard Purdie wrote:
> > On Tue, 2022-08-23 at 10:56 +0200, Peter Bergin wrote:
> > > The test for rust in the SDK is extended with the simplest
> > > possible build script. This will make use of the host toolchain
> > > for building build.rs before building the rust package for target.
> > >=20
> > > Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> > > ---
> > >   meta/lib/oeqa/sdk/files/rust/hello/build.rs | 3 +++
> > >   1 file changed, 3 insertions(+)
> > >   create mode 100644 meta/lib/oeqa/sdk/files/rust/hello/build.rs
> > >=20
> > > diff --git a/meta/lib/oeqa/sdk/files/rust/hello/build.rs b/meta/lib/o=
eqa/sdk/files/rust/hello/build.rs
> > > new file mode 100644
> > > index 00000000000..b1a533d5dfa
> > > --- /dev/null
> > > +++ b/meta/lib/oeqa/sdk/files/rust/hello/build.rs
> > > @@ -0,0 +1,3 @@
> > > +/* This is the simplest build script just to invoke host compiler
> > > +   in the build process. */
> > > +fn main() {}
> > This seemed to break everywhere :(
> Not good. :-|
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/5773/=
steps/13/logs/stdio
> >=20
> > and many others.
>=20
> I've tried locally to reproduce something. I've built and tested=20
> genericx86 and qemuarm64 now on core-image-sato sdk that I saw was the=
=20
> target for the autobuilder. Both tests passes. The failure I see in the=
=20
> autobuilder logs is that the build script can not be executed. On my=20
> machine I have that file and it can clearly be executed:
>=20
> $ find=20
> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello=
/target/=20
> -name build-script-build
> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello=
/target/debug/build/hello-4dbf26d86b93a892/build-script-build=20
>=20
> $=20
> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello=
/target/debug/build/hello-4dbf26d86b93a892/build-script-build=20
>=20
> $ file=20
> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello=
/target/debug/build/hello-4dbf26d86b93a892/build-script-build=20
>=20
> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello=
/target/debug/build/hello-4dbf26d86b93a892/build-script-build:=20
> ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically=20
> linked, interpreter=20
> /storage/yocto/esp5-platform/build/genericx86/tmp/work/genericx86-poky-li=
nux/core-image-sato/1.0-r0/testimage-sdk/sysroots/x86_64-pokysdk-linux/lib/=
ld-linux-x86-64.so.2,=20
> BuildID[sha1]=3Dc5d5e70657f8342addf5343d0206c77d9d767fd8, for GNU/Linux=
=20
> 3.2.0, with debug_info, not stripped
>=20
> Found one interesting link here=20
> https://github.com/rust-lang/cargo/issues/3553. Unfortunately without=20
> answer. But also checked the interpreter in my build which looks correct?
>=20
> $ readelf -a=20
> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello=
/target/debug/build/hello-4dbf26d86b93a892/build-script-build=20
> > grep interpreter
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [Requesting program interpreter:=20
> /storage/yocto/esp5-platform/build/genericx86/tmp/work/genericx86-poky-li=
nux/core-image-sato/1.0-r0/testimage-sdk/sysroots/x86_64-pokysdk-linux/lib/=
ld-linux-x86-64.so.2]=20
>=20
>=20
> So there are some differences between my machine and the autobuilder=20
> setup that I can't get. I would need help here as I'm not that familiar=
=20
> with the autobuilder setup. Can it still be some host dependency? I'm=20
> running on Ubuntu 22.04. Is it possible to check in a autobuilder setup=
=20
> if the file 'build-script-build' is present and possible to execute?

After staring at this for an hour, I think the pattern is that is it
failing on builds with:

SDKMACHINE =3D "i686"

which probably means the linker isn't linking against the libc and
loader in the SDK properly.

(i686 SDK binaries should run on x86_64 hosts since we provide our own
loader and libc)

Cheers,

Richard


