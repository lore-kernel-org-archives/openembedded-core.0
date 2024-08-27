Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E973AC54734
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 13:23:02 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.77611.1724764980619736131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 06:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nw+m8sDa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42816ca797fso49278905e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 06:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724764979; x=1725369779; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CwiZ7o9LtPO9Bv/uD7gQnhV35MwHJ89hNQFwjsPhMCA=;
        b=Nw+m8sDa5GE6qj8jSiF4nPe+eHrIllTVk2iaXZhyLTI4eAtydWz2aPgBGNXHE4s0oz
         WUkXcmSR3kPXC8J4URksAgdBHF2KrW68sgZZroJ9L8cB5juxTch3KJbMZfV6vQObaRca
         uL6XO6KUHSt6jaCSL6NfFRplR2iOsQ93JurAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724764979; x=1725369779;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CwiZ7o9LtPO9Bv/uD7gQnhV35MwHJ89hNQFwjsPhMCA=;
        b=vzVyuI4Sfl0v1D7IVpDInPi8nMv590CAqsn18wKATAxht2E+sGToeb1ouNXxXalz2N
         9u6vUMeY8X1N5RimSbtoOFS+xe5qCRKO/18oYRp0NFGMU0j7PstIS72O27M67e8p/gyh
         Rg0f72RchNVBuZYkKCNqVhmRzaGhZx4r2eNDjaYHDg12/HhoSkiCMQO6F4TXINX6GOsY
         MJ1mZ2hjH5Kp0deOGNaxTmbOKRa20O42/QsZ1dqphoPlxgRSLxboXBN4B7vCa+C2Prji
         Ynk3YDzC6jFn4PohAxMLqIwHpyutF6F71bdCBdWAZhKas6oZcpp3tCd0U/rzKgtCCssx
         ekEA==
X-Gm-Message-State: AOJu0Yy7OBVAMKOm7iVNkGL6HaA0bIKyiqT9bISZhxg4r/P5CGYLmLgE
	cpekT1oqHo6DZ4KtF3IOt2nnpqJIsP2YYSEU4Rizj52VPRBVvMHTmud25EDJrYs=
X-Google-Smtp-Source: AGHT+IFk7L7Vnv39yYBcEWH9xzIpLzbglgzEXlCud7ZvYVp0wzTmFjJfVJ9gWm6n68/LvEmVMnM4Ng==
X-Received: by 2002:a05:600c:474f:b0:426:6a5e:73c5 with SMTP id 5b1f17b1804b1-42b9ae3f4a7mr15479635e9.37.1724764978748;
        Tue, 27 Aug 2024 06:22:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f5f7:3b8b:ca90:386f? ([2001:8b0:aba:5f3c:f5f7:3b8b:ca90:386f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abf0179f7sm226382355e9.47.2024.08.27.06.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 06:22:58 -0700 (PDT)
Message-ID: <5216855652e912043a3b7a06e1d76956d2babdd7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] rust: Upgrade 1.78.0->1.79.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash.Shinde@windriver.com, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Tue, 27 Aug 2024 14:22:57 +0100
In-Reply-To: <152b3da8-8d5d-4dc2-ad60-ab03bc4b361b@windriver.com>
References: <20240825170553.566798-1-Yash.Shinde@windriver.com>
	 <20240825170553.566798-2-Yash.Shinde@windriver.com>
	 <bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org>
	 <15bf0cae-b114-4ac7-89d9-3f7df77b41bd@windriver.com>
	 <CANNYZj-2yiGpKNc1Jcc6NO8+8MhNYiYV-3xh3BbJqTw4nyJT0A@mail.gmail.com>
	 <1356a3e7519ffca6f65810ea2953429fbe08fa1e.camel@linuxfoundation.org>
	 <152b3da8-8d5d-4dc2-ad60-ab03bc4b361b@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 13:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203842

On Tue, 2024-08-27 at 18:17 +0530, Yash Shinde via
lists.openembedded.org wrote:
>=20
> On 27-08-2024 18:10, Richard Purdie wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the
> > sender and know the content is safe.
> >=20
> > On Tue, 2024-08-27 at 14:24 +0200, Alexander Kanavin wrote:
> > > > The error log says:
> > > >=20
> > > > stdio: ERROR: cargo-native-1.79.0-r0 do_compile: Execution of
> > > > '/home/pokybuild/yocto-
> > > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > > native/1.79.0/temp/run.do_compile.1874995' failed with exit
> > > > code 101
> > > > stdio: ERROR: Logfile of failure stored in:
> > > > /home/pokybuild/yocto-
> > > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > > native/1.79.0/temp/log.do_compile.1874995
> > > > stdio: ERROR: Task (virtual:native:/home/pokybuild/yocto-
> > > > worker/qemuarm64/build/meta/recipes-
> > > > devtools/rust/cargo_1.79.0.bb:do_compile) failed with exit code
> > > > '1'
> > > >=20
> > > > stdio: ERROR: Command . ./oe-init-build-env; bitbake core-
> > > > image-sato core-image-sato-sdk core-image-minimal core-image-
> > > > minimal-dev core-image-full-cmdline core-image-
> > > > sato:do_populate_sdk core-image-minimal:do_populate_sdk_ext
> > > > core-image-sato:do_populate_sdk_ext -k failed with exit code 1,
> > > > see errors above. (1724719291.3: 11079.3)
> > > >=20
> > > > I checked "bitbake cargo -c do_compile", "core-image-
> > > > minimal:do_populate_sdk" and core-image-sato:do_populate_sdk
> > > > and all passed successfully.
> > > >=20
> > > > The build cmd has many core-image minimal and sato build cmds.
> > > > Could you please help me to point out which of these exactly
> > > > cause the issue?
> > > The key error is at line 22936:
> > >=20
> > > error: linking with
> > > `/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/wrapper/target-rust-ccld`
> > > failed: exit status: 1
> > > > =3D note: LC_ALL=3D"C"
> > > PATH=3D"/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/recipe-sysroot-native/usr/lib/rustlib/x86_64-
> > > unknown-linux-gnu/bin:/home/pokybuild/yocto-
> > > worker/qemuarm64/build/scripts/native-
> > > intercept:/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/sysroots-uninative/x86_64-
> > > linux/usr/bin:/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/recipe-sysroot-native/usr/bin/python3-
> > > native:/home/pokybuild/yocto-
> > > worker/qemuarm64/build/scripts:/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/recipe-sysroot-native/usr/bin/x86_64-
> > > linux:/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/recipe-sysroot-
> > > native/usr/bin:/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/recipe-sysroot-
> > > native/usr/sbin:/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/recipe-sysroot-
> > > native/usr/bin:/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/recipe-sysroot-native/sbin:/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/recipe-sysroot-native/bin:/home/pokybuild/yocto-
> > > worker/qemuarm64/build/bitbake/bin:/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/hosttools"
> > > VSLANG=3D"1033" "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/wrapper/target-rust-ccld"
> > > "-m64" "/tmp/rustcgeGK7l/symbols.o"
> > > "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/build/cargo-
> > > 559f5ce7ae478850/build_script_build-
> > > 559f5ce7ae478850.build_script_build.a4202d660cdaa2b7-
> > > cgu.0.rcgu.o"
> > > "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/build/cargo-
> > > 559f5ce7ae478850/build_script_build-
> > > 559f5ce7ae478850.build_script_build.a4202d660cdaa2b7-
> > > cgu.1.rcgu.o"
> > > "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/build/cargo-
> > > 559f5ce7ae478850/build_script_build-
> > > 559f5ce7ae478850.build_script_build.a4202d660cdaa2b7-
> > > cgu.2.rcgu.o"
> > > "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/build/cargo-
> > > 559f5ce7ae478850/build_script_build-
> > > 559f5ce7ae478850.build_script_build.a4202d660cdaa2b7-
> > > cgu.3.rcgu.o"
> > > "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/build/cargo-
> > > 559f5ce7ae478850/build_script_build-
> > > 559f5ce7ae478850.23ia22jv7py8po1d.rcgu.o"
> > > "-Wl,--as-needed" "-L"
> > > "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/deps"
> > > "-L" "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/recipe-sysroot-
> > > native/usr/lib/pkgconfig/../../../usr/lib"
> > > "-L" "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/build/libz-sys-
> > > 4aaad36e8fa0c1c8/out/lib"
> > > "-L" "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/build/libz-sys-
> > > 4aaad36e8fa0c1c8/out/lib"
> > > "-L" "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/recipe-sysroot-native/usr/lib/rustlib/x86_64-
> > > unknown-linux-gnu/lib"
> > > "-Wl,-Bstatic" "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/deps/libtar-
> > > 50d87f8544312d1c.rlib"
> > > "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/deps/libfiletime-
> > > 3998b29f82907e6b.rlib"
> > > "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/deps/liblibc-
> > > 8df5257514cf4a7e.rlib"
> > > "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/deps/libfla
> > > work/x86_64-linux/cargo-native/1.79.0/recipe-sysroot-
> > > native/usr/lib/rustlib/x86_64-unknown-linux-
> > > gnu/lib/libcompiler_builtins-8272a355176f4c87.rlib"
> > > "-Wl,-Bdynamic" "-lgcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-
> > > ldl"
> > > "-lc" "-Wl,--eh-frame-hdr" "-Wl,-z,noexecstack" "-L"
> > > "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/recipe-sysroot-native/usr/lib/rustlib/x86_64-
> > > unknown-linux-gnu/lib"
> > > "-o" "/home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/build/cargo-
> > > 559f5ce7ae478850/build_script_build-559f5ce7ae478850"
> > > "-Wl,--gc-sections" "-pie" "-Wl,-z,relro,-z,now" "-nodefaultlibs"
> > > > =3D note: /home/pokybuild/yocto-
> > > > worker/qemuarm64/build/build/tmp/hosttools/ld:
> > > /home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/deps/liblibz_sys-
> > > 28dfff8940ad7a90.rlib(deflate.o):
> > > relocation R_X86_64_32S against hidden symbol `_length_code' can
> > > not
> > > be used when making a PIE object
> > > > /home/pokybuild/yocto-
> > > > worker/qemuarm64/build/build/tmp/hosttools/ld:
> > > /home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/deps/liblibz_sys-
> > > 28dfff8940ad7a90.rlib(trees.o):
> > > relocation R_X86_64_32S against hidden symbol `_length_code' can
> > > not
> > > be used when making a PIE object
> > > > /home/pokybuild/yocto-
> > > > worker/qemuarm64/build/build/tmp/hosttools/ld:
> > > /home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/deps/liblibz_sys-
> > > 28dfff8940ad7a90.rlib(zutil.o):
> > > relocation R_X86_64_32 against `.rodata.str1.1' can not be used
> > > when
> > > making a PIE object; recompile with -fPIE
> > > > /home/pokybuild/yocto-
> > > > worker/qemuarm64/build/build/tmp/hosttools/ld:
> > > /home/pokybuild/yocto-
> > > worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-
> > > native/1.79.0/build/target/release/deps/liblibz_sys-
> > > 28dfff8940ad7a90.rlib(crc32.o):
> > > relocation R_X86_64_32 against `.rodata' can not be used when
> > > making a
> > > PIE object; recompile with -fPIE
> > > > collect2: error: ld returned 1 exit status
> > > I'm not sure what any of that means, but it could be specific to
> > > the
> > > host distro (alma9 as seen in
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/938=
5
> > > ).
> > It is cargo-native so touches the host distro and only seen on some
> > builds intermittently so it does look host specific. My own test
> > builds
> > passed.
> Can we re-run the builds just to be sure this is host distro specific
> issue, since other hosts passed?

Chances are this will have been built on another host and will now come
from sstate. We'd have to invalidate the cache and rebuild on a
specific host. I'm pretty sure this will be a host specific issue given
the pattern.

> Are we going to merge rust v1.79 for this release?

If the patches are working and ready I'd consider it. If they're not
ready, we won't.

Cheers,

Richard

