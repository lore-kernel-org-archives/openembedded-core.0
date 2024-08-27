Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D15C54735
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 12:41:02 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.77458.1724762458941255203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 05:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AkHzr7cT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37186c2278bso3447035f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724762457; x=1725367257; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gSjHHleROvY2pPvmHdOTGGg6rcH8L3Xu7qaZJjvCUJo=;
        b=AkHzr7cTfeMNIQujhntdKEgsA6x6oNx/SA1IQQVIqsMQsDyNg4eQDB/Phs/54zHIfH
         wH+ztu4ZPuFcm0haSwHOTCVDFfWAnsGbJLKW1pNh5BUGbkjtKhWqWSP6IipFvKWIaqhM
         psSvFgzRaKkDaUqyuitOg9bPLc7rcPEUknZPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724762457; x=1725367257;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gSjHHleROvY2pPvmHdOTGGg6rcH8L3Xu7qaZJjvCUJo=;
        b=li340tDXrk355580tp74yAv8Oab01PEh1o88rsni8dHAgTPoUvLQ/vzxrL3gpP7Xri
         SOGGYzWsi+EqwKvvFmVJ0+QPsWyC8PxWDdShUzQwaQ2UEDPtIm42lS+++f4KtdtoxmEe
         aVKMZXU/HympIp/GDq2kAbhFM+7fu/gFpX8urxBJQBFUGzdsB/bxgRhfc6rpL2w8hvMr
         K9vsDpFMkEJJcaf2Z+O1eIRT8K8SvNa3ENF3nA7lAoPg/4j22L4yMTHubptbYDOjnwdF
         83NJoPn6NHzvG2dDc0J8ZETXCIL+kz00ajo1tq3g9FFKykrKyOolv0Uilrp5kgo/AnzO
         M/rg==
X-Gm-Message-State: AOJu0YzsoPBw7ST9V6zBqEnGKp+rjIi97YcPJ8nEZfNE06Zyyw2ZR0tu
	ryHP5jgnrhf9qlibszDOFVHQ8B9MUFWzlAsF+1cGgBTi4YEJUj/R32f3DhgkNYw=
X-Google-Smtp-Source: AGHT+IFTuAtN7NBZzTv6BZ7h/z0ejo6LQXdWRcmozZtphTX+siSaAOrtVcTcLh6M8mjaQzHtKUrbDw==
X-Received: by 2002:adf:f90c:0:b0:362:ad01:5435 with SMTP id ffacd0b85a97d-3748c84429cmr1513146f8f.29.1724762456939;
        Tue, 27 Aug 2024 05:40:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f5f7:3b8b:ca90:386f? ([2001:8b0:aba:5f3c:f5f7:3b8b:ca90:386f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ffb66sm13041360f8f.84.2024.08.27.05.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 05:40:56 -0700 (PDT)
Message-ID: <1356a3e7519ffca6f65810ea2953429fbe08fa1e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] rust: Upgrade 1.78.0->1.79.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Tue, 27 Aug 2024 13:40:55 +0100
In-Reply-To: <CANNYZj-2yiGpKNc1Jcc6NO8+8MhNYiYV-3xh3BbJqTw4nyJT0A@mail.gmail.com>
References: <20240825170553.566798-1-Yash.Shinde@windriver.com>
	 <20240825170553.566798-2-Yash.Shinde@windriver.com>
	 <bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org>
	 <15bf0cae-b114-4ac7-89d9-3f7df77b41bd@windriver.com>
	 <CANNYZj-2yiGpKNc1Jcc6NO8+8MhNYiYV-3xh3BbJqTw4nyJT0A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 12:41:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203838

On Tue, 2024-08-27 at 14:24 +0200, Alexander Kanavin wrote:
> > The error log says:
> >=20
> > stdio: ERROR: cargo-native-1.79.0-r0 do_compile: Execution of '/home/po=
kybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-nati=
ve/1.79.0/temp/run.do_compile.1874995' failed with exit code 101
> > stdio: ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worke=
r/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-native/1.79.0/temp/log.=
do_compile.1874995
> > stdio: ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/qemuarm=
64/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_compile) failed with=
 exit code '1'
> >=20
> > stdio: ERROR: Command . ./oe-init-build-env; bitbake core-image-sato co=
re-image-sato-sdk core-image-minimal core-image-minimal-dev core-image-full=
-cmdline core-image-sato:do_populate_sdk core-image-minimal:do_populate_sdk=
_ext
> > core-image-sato:do_populate_sdk_ext -k failed with exit code 1, see err=
ors above. (1724719291.3: 11079.3)
> >=20
> > I checked "bitbake cargo -c do_compile", "core-image-minimal:do_populat=
e_sdk" and core-image-sato:do_populate_sdk and all passed successfully.
> >=20
> > The build cmd has many core-image minimal and sato build cmds.
> > Could you please help me to point out which of these exactly cause the =
issue?
>=20
> The key error is at line 22936:
>=20
> error: linking with
> `/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux=
/cargo-native/1.79.0/wrapper/target-rust-ccld`
> failed: exit status: 1
> > >=20
> > =3D note: LC_ALL=3D"C"
> PATH=3D"/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_6=
4-linux/cargo-native/1.79.0/recipe-sysroot-native/usr/lib/rustlib/x86_64-un=
known-linux-gnu/bin:/home/pokybuild/yocto-worker/qemuarm64/build/scripts/na=
tive-intercept:/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/sysro=
ots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/qemuarm64/b=
uild/build/tmp/work/x86_64-linux/cargo-native/1.79.0/recipe-sysroot-native/=
usr/bin/python3-native:/home/pokybuild/yocto-worker/qemuarm64/build/scripts=
:/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/c=
argo-native/1.79.0/recipe-sysroot-native/usr/bin/x86_64-linux:/home/pokybui=
ld/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-native/1.=
79.0/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/qemuarm64/b=
uild/build/tmp/work/x86_64-linux/cargo-native/1.79.0/recipe-sysroot-native/=
usr/sbin:/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64=
-linux/cargo-native/1.79.0/recipe-sysroot-native/usr/bin:/home/pokybuild/yo=
cto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-native/1.79.0/=
recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/qemuarm64/build/bui=
ld/tmp/work/x86_64-linux/cargo-native/1.79.0/recipe-sysroot-native/bin:/hom=
e/pokybuild/yocto-worker/qemuarm64/build/bitbake/bin:/home/pokybuild/yocto-=
worker/qemuarm64/build/build/tmp/hosttools"
> VSLANG=3D"1033" "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/w=
ork/x86_64-linux/cargo-native/1.79.0/wrapper/target-rust-ccld"
> "-m64" "/tmp/rustcgeGK7l/symbols.o"
> "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux=
/cargo-native/1.79.0/build/target/release/build/cargo-559f5ce7ae478850/buil=
d_script_build-559f5ce7ae478850.build_script_build.a4202d660cdaa2b7-cgu.0.r=
cgu.o"
> "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux=
/cargo-native/1.79.0/build/target/release/build/cargo-559f5ce7ae478850/buil=
d_script_build-559f5ce7ae478850.build_script_build.a4202d660cdaa2b7-cgu.1.r=
cgu.o"
> "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux=
/cargo-native/1.79.0/build/target/release/build/cargo-559f5ce7ae478850/buil=
d_script_build-559f5ce7ae478850.build_script_build.a4202d660cdaa2b7-cgu.2.r=
cgu.o"
> "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux=
/cargo-native/1.79.0/build/target/release/build/cargo-559f5ce7ae478850/buil=
d_script_build-559f5ce7ae478850.build_script_build.a4202d660cdaa2b7-cgu.3.r=
cgu.o"
> "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux=
/cargo-native/1.79.0/build/target/release/build/cargo-559f5ce7ae478850/buil=
d_script_build-559f5ce7ae478850.23ia22jv7py8po1d.rcgu.o"
> "-Wl,--as-needed" "-L"
> "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux=
/cargo-native/1.79.0/build/target/release/deps"
> "-L" "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-=
linux/cargo-native/1.79.0/recipe-sysroot-native/usr/lib/pkgconfig/../../../=
usr/lib"
> "-L" "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-=
linux/cargo-native/1.79.0/build/target/release/build/libz-sys-4aaad36e8fa0c=
1c8/out/lib"
> "-L" "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-=
linux/cargo-native/1.79.0/build/target/release/build/libz-sys-4aaad36e8fa0c=
1c8/out/lib"
> "-L" "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-=
linux/cargo-native/1.79.0/recipe-sysroot-native/usr/lib/rustlib/x86_64-unkn=
own-linux-gnu/lib"
> "-Wl,-Bstatic" "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/wo=
rk/x86_64-linux/cargo-native/1.79.0/build/target/release/deps/libtar-50d87f=
8544312d1c.rlib"
> "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux=
/cargo-native/1.79.0/build/target/release/deps/libfiletime-3998b29f82907e6b=
.rlib"
> "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux=
/cargo-native/1.79.0/build/target/release/deps/liblibc-8df5257514cf4a7e.rli=
b"
> "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux=
/cargo-native/1.79.0/build/target/release/deps/libfla
> work/x86_64-linux/cargo-native/1.79.0/recipe-sysroot-native/usr/lib/rustl=
ib/x86_64-unknown-linux-gnu/lib/libcompiler_builtins-8272a355176f4c87.rlib"
> "-Wl,-Bdynamic" "-lgcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-ldl"
> "-lc" "-Wl,--eh-frame-hdr" "-Wl,-z,noexecstack" "-L"
> "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux=
/cargo-native/1.79.0/recipe-sysroot-native/usr/lib/rustlib/x86_64-unknown-l=
inux-gnu/lib"
> "-o" "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-=
linux/cargo-native/1.79.0/build/target/release/build/cargo-559f5ce7ae478850=
/build_script_build-559f5ce7ae478850"
> "-Wl,--gc-sections" "-pie" "-Wl,-z,relro,-z,now" "-nodefaultlibs"
> > =3D note: /home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/hostto=
ols/ld:
> /home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/=
cargo-native/1.79.0/build/target/release/deps/liblibz_sys-28dfff8940ad7a90.=
rlib(deflate.o):
> relocation R_X86_64_32S against hidden symbol `_length_code' can not
> be used when making a PIE object
> > /home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/hosttools/ld:
> /home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/=
cargo-native/1.79.0/build/target/release/deps/liblibz_sys-28dfff8940ad7a90.=
rlib(trees.o):
> relocation R_X86_64_32S against hidden symbol `_length_code' can not
> be used when making a PIE object
> > /home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/hosttools/ld:
> /home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/=
cargo-native/1.79.0/build/target/release/deps/liblibz_sys-28dfff8940ad7a90.=
rlib(zutil.o):
> relocation R_X86_64_32 against `.rodata.str1.1' can not be used when
> making a PIE object; recompile with -fPIE
> > /home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/hosttools/ld:
> /home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/=
cargo-native/1.79.0/build/target/release/deps/liblibz_sys-28dfff8940ad7a90.=
rlib(crc32.o):
> relocation R_X86_64_32 against `.rodata' can not be used when making a
> PIE object; recompile with -fPIE
> > collect2: error: ld returned 1 exit status
>=20
> I'm not sure what any of that means, but it could be specific to the
> host distro (alma9 as seen in
> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/9385).

It is cargo-native so touches the host distro and only seen on some
builds intermittently so it does look host specific. My own test builds
passed.

Cheers,

Richard

