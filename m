Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274A6C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 12:06:38 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.11209.1635249997573906151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 05:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HQ3S6e2f;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id 187so14082250pfc.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 05:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7jCEKMKVtwJIgiMnPNaJZM9a9zonu+l4Gfh7JASKj7M=;
        b=HQ3S6e2fZSBUHB8rgjRIz3vPfGRgKNFomxqYOuzDjt+0WMGUpOncVEqDwjqgHZmkAo
         18wH25+Pb2Pc/vYOerWK05tRilVjQp8u6Si546G0Jpo9BqLbwx83DLGBiIDHfQGV5k4R
         K+1arkCVscPmXBR8D2ROjfzxmOfoPPKA5dBnQYD7LDp01445PjMD/j4Wb+X9cNrypOir
         TrPPqPXaXKNv4V2xHxROyY1lge+N5kFNI6KD0IomBzFZgOPVAPYzPA7yhhlQnvSBtDC/
         a5j1Iz97ho3Ku/yiO159+24bc7XUifgAeQPiE4Mx+anebxH0EM9wZUNQj05rUE4agQ/K
         yokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7jCEKMKVtwJIgiMnPNaJZM9a9zonu+l4Gfh7JASKj7M=;
        b=fE8AAyUSKyGUQ82xo/eOUxt63KnXZvlOJlbBgKtatlDNV4vEzuAUwPPH5NVEW6FYFn
         gOvepHcgyixqXtN27hB+JeWvMmBk38OT4hcEcnECl43H4WXEQH/8nc33Tf13ycVM4ORO
         nTxCDTFIEK2pSY5P77CluQJgmLUQVBekWeg8Krfg2wL54IxQRGtBR9ZaRjtCwJK0zFRK
         6gHdSW/QtBi8gA6amr/Tfl+3/RplJ3GRL6aBt+yWmuQnG+MNBaWPUzlIO6wjFSPYLcs6
         Vd7Bsw8e9lZCtcCP3ZsqRDJvyLrr159oLFYQnGvu1UJkalEDM0WkLXMmQNnJO0uTcjyD
         oIhg==
X-Gm-Message-State: AOAM532pwMlolaePWO9SVi/tjeou15qU046LbYztGPluSDd1GdjXX+jg
	yzB86WttXyTVQ3xZjm8GJPmf5TXlE+1RhWx6bs0=
X-Google-Smtp-Source: 
 ABdhPJw7262uzifUiu3aeC8Xt4zdoK5QeAhBn+t4GeiDuIxuuc29DCNjQMGHqhHtssrkrc8hKCwBbEtGb5piIuyTDOk=
X-Received: by 2002:a05:6a00:a8e:b0:47b:a658:7f4d with SMTP id
 b14-20020a056a000a8e00b0047ba6587f4dmr24641693pfl.82.1635249997017; Tue, 26
 Oct 2021 05:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211023065203.1624178-1-raj.khem@gmail.com>
In-Reply-To: <20211023065203.1624178-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 26 Oct 2021 14:06:26 +0200
Message-ID: 
 <CA+chaQeRiBT0=4Zen24PP-E2kPc-NOgNyWR5Kq5Aphznc_=-Eg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Upgrade to 1.56.0
To: Khem Raj <raj.khem@gmail.com>, Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000030f74e05cf404fe9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 12:06:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157390

--00000000000030f74e05cf404fe9
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 23, 2021 at 8:52 AM Khem Raj <raj.khem@gmail.com> wrote:

> This is latest major release, changes are here [1]
>
> Forward port libstd-rs patches and refresh musl/rv64 port
>
> [1] https://github.com/rust-lang/rust/releases/tag/1.56.0
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Randy MacLeod <Randy.MacLeod@windriver.com>
>

Anyone seeing libstd-rs failing to build?

e.g. for raspberrypi4 it fails with:

| error: could not compile `core`
|
| Caused by:
|   process didn't exit successfully: `rustc --crate-name core
--edition=2018 library/core/src/lib.rs --error-format=json
--json=diagnostic-rendered-ansi,artifacts --crate-type lib
--emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C
metadata=1c41b1708b174d1e -C extra-filename=-1c41b1708b174d1e --out-dir
/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/arm-oe-linux-gnueabi/release/deps
--target arm-oe-linux-gnueabi -C
linker=/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/wrapper/target-rust-ccld
-L
dependency=/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/arm-oe-linux-gnueabi/release/deps
-L
dependency=/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/release/deps
-L
/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/recipe-sysroot/usr/lib/rust
--remap-path-prefix=/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0=/usr/src/debug/libstd-rs/1.56.0-r0
-Cembed-bitcode=yes -L
/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/recipe-sysroot/usr/lib
-C link-arg=-Wl,-soname,libstd.so` (signal: 11, SIGSEGV: invalid memory
reference)
| warning: build failed, waiting for other jobs to finish...

with qemuarm it fails as well:
| error: could not compile `core`
|
| Caused by:
|   process didn't exit successfully: `rustc --crate-name core
--edition=2018 library/core/src/lib.rs --error-format=json
--json=diagnostic-rendered-ansi,artifacts --crate-type lib
--emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C
metadata=1c41b1708b174d1e -C extra-filename=-1c41b1708b174d1e --out-dir
/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/arm-oe-linux-gnueabi/release/deps
--target arm-oe-linux-gnueabi -C
linker=/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/wrapper/target-rust-ccld
-L
dependency=/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/arm-oe-linux-gnueabi/release/deps
-L
dependency=/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/release/deps
-L
/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/recipe-sysroot/usr/lib/rust
--remap-path-prefix=/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0=/usr/src/debug/libstd-rs/1.56.0-r0
-Cembed-bitcode=yes -L
/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/recipe-sysroot/usr/lib
-C link-arg=-Wl,-soname,libstd.so` (signal: 11, SIGSEGV: invalid memory
reference)
| warning: build failed, waiting for other jobs to finish...

Will try to downgrade to 1.55.0.

--00000000000030f74e05cf404fe9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Oct 23, 2021 at 8:52 AM Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">This is latest major release, changes are here [1]<br>
<br>
Forward port libstd-rs patches and refresh musl/rv64 port<br>
<br>
[1] <a href=3D"https://github.com/rust-lang/rust/releases/tag/1.56.0" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/rust/release=
s/tag/1.56.0</a><br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.com" target=
=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;<br></blockquote><div><br></=
div><div>Anyone seeing libstd-rs failing to build?</div><div><br></div><div=
>e.g. for raspberrypi4 it fails with:</div><div><br></div><div>| error: cou=
ld not compile `core`</div>|<br>| Caused by:<br>| =C2=A0 process didn&#39;t=
 exit successfully: `rustc --crate-name core --edition=3D2018 library/core/=
src/<a href=3D"http://lib.rs">lib.rs</a> --error-format=3Djson --json=3Ddia=
gnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,metadata=
,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D1c41b1708b174d1e=
 -C extra-filename=3D-1c41b1708b174d1e --out-dir /OE/build/oe-core/tmp-glib=
c/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/a=
rm-oe-linux-gnueabi/release/deps --target arm-oe-linux-gnueabi -C linker=3D=
/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/l=
ibstd-rs/1.56.0-r0/wrapper/target-rust-ccld -L dependency=3D/OE/build/oe-co=
re/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0=
-r0/build/arm-oe-linux-gnueabi/release/deps -L dependency=3D/OE/build/oe-co=
re/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0=
-r0/build/release/deps -L /OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neo=
n-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/recipe-sysroot/usr/lib/rust --=
remap-path-prefix=3D/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv=
4-oe-linux-gnueabi/libstd-rs/1.56.0-r0=3D/usr/src/debug/libstd-rs/1.56.0-r0=
 -Cembed-bitcode=3Dyes -L /OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neo=
n-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/recipe-sysroot/usr/lib -C link=
-arg=3D-Wl,-soname,libstd.so` (signal: 11, SIGSEGV: invalid memory referenc=
e)<br>| warning: build failed, waiting for other jobs to finish...<br></div=
><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">with qemua=
rm it fails as well:</div><div class=3D"gmail_quote">| error: could not com=
pile `core`<br>|<br>| Caused by:<br>| =C2=A0 process didn&#39;t exit succes=
sfully: `rustc --crate-name core --edition=3D2018 library/core/src/<a href=
=3D"http://lib.rs">lib.rs</a> --error-format=3Djson --json=3Ddiagnostic-ren=
dered-ansi,artifacts --crate-type lib --emit=3Ddep-info,metadata,link -C op=
t-level=3D3 -C embed-bitcode=3Dno -C metadata=3D1c41b1708b174d1e -C extra-f=
ilename=3D-1c41b1708b174d1e --out-dir /OE/build/oe-core/tmp-glibc/work/cort=
exa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/arm-oe-linux-gnue=
abi/release/deps --target arm-oe-linux-gnueabi -C linker=3D/OE/build/oe-cor=
e/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/wr=
apper/target-rust-ccld -L dependency=3D/OE/build/oe-core/tmp-glibc/work/cor=
texa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/arm-oe-linux-gnu=
eabi/release/deps -L dependency=3D/OE/build/oe-core/tmp-glibc/work/cortexa1=
5t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/release/deps -L /OE/b=
uild/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1=
.56.0-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/OE/build/oe-cor=
e/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0=3D=
/usr/src/debug/libstd-rs/1.56.0-r0 -Cembed-bitcode=3Dyes -L /OE/build/oe-co=
re/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/r=
ecipe-sysroot/usr/lib -C link-arg=3D-Wl,-soname,libstd.so` (signal: 11, SIG=
SEGV: invalid memory reference)<br>| warning: build failed, waiting for oth=
er jobs to finish...<br></div><div class=3D"gmail_quote"><br></div><div cla=
ss=3D"gmail_quote">Will try to downgrade to 1.55.0.</div></div>

--00000000000030f74e05cf404fe9--

