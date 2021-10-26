Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7556AC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 12:12:29 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.11115.1635250348172948776
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 05:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lAf5nPfK;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id v193so7462412pfc.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 05:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LniiL+0qouVHxRlvQfqKePcKI5IAA37wFZa131C6ZWg=;
        b=lAf5nPfKok6xAaLTW5KqEw5IXIBQgIUeer7ZM2WEw9E/eontixzXQKcQW9ZJt7eLOs
         WewzKdkQwBa2v8TS/cn+NfD9rsR0jwRd6mnoYOrYmvYhPaUS3ztCTVPGgkIRcrayfvZ7
         sn5qM55Ctk76vUkVLFMO7ClfijxiYInR7S11RXe3RQcEpFNPaCcXiiASNw7xz26fY529
         qNVJhqxG3459SRBX5t8eRFyWA8hdXanzboJDbXHVauXseR7G0R63eRk+fETbC4qgIR/n
         88zBmQs1Wy8H3/njKv5SQ6w9Wa6UoKDS1L1brzRgL9CPdfHGeQYbGYhFRNdWi5c4Riba
         fNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LniiL+0qouVHxRlvQfqKePcKI5IAA37wFZa131C6ZWg=;
        b=lQRVUDqESxSxPp/eNkATlKXeADGsfmjPPOMoE2gspS1JU8JA9vWjb0OaJk0jCF/5wp
         YWg/XQcZ2EUTklp2KLehnm/826nLw+2S841bI1tmyudIh1iAhAV7s1bJ35yR7tLpygwg
         szhfrQMP81lMi0GSZjQl2qi5ZfFTTmrvSuF2qBazihef4OZfajPrP5CaWAsRkVEiCRV+
         eEnXfe527Wqt+nBCulfsiRz97ANK4F66y733sdz+10YAU+PWQm+itUy5r8D/pl+bPj7w
         mVgSNCsmo9jVl4yyTVeYhfahisRucDvUpI2zoXgPpZwAwiZMLn0dGsByMiDGYOJvlXzD
         K5sQ==
X-Gm-Message-State: AOAM531yn9KL23vOU06UMYv1Yox9YwGAJMCVqUCA2lNYaSt/Z1l88Qj9
	+w0VRDMEP6tKoQlQ/q0fE4tDtdSDBiiGtNEjk+w=
X-Google-Smtp-Source: 
 ABdhPJyl5EqY1lAfNukpXZlU3YTymNP4YAuWdc8gbrOLfkCyOE9ZCLPUZszayD4YMvoBQtsPnQPxHiGuifJFNFS0+RI=
X-Received: by 2002:a05:6a00:a8e:b0:47b:a658:7f4d with SMTP id
 b14-20020a056a000a8e00b0047ba6587f4dmr24675433pfl.82.1635250347444; Tue, 26
 Oct 2021 05:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211023065203.1624178-1-raj.khem@gmail.com>
 <16B193358866A17D.20978@lists.openembedded.org>
In-Reply-To: <16B193358866A17D.20978@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 26 Oct 2021 14:12:16 +0200
Message-ID: 
 <CA+chaQfFk1mNBbBERcbAqvdK4dGuXpyGzUtc3jyGxXRhShjpgQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Upgrade to 1.56.0
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 Randy MacLeod <randy.macleod@windriver.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000140eca05cf406466"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 12:12:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157391

--000000000000140eca05cf406466
Content-Type: text/plain; charset="UTF-8"

Looks like it was caused by rust-cross issues reported in:
https://lists.openembedded.org/g/openembedded-core/message/156516

Re-building libstd-rs in empty TMPDIR, just for qemuarm MACHINE without
using sstate worked.

On Tue, Oct 26, 2021 at 2:06 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> On Sat, Oct 23, 2021 at 8:52 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>> This is latest major release, changes are here [1]
>>
>> Forward port libstd-rs patches and refresh musl/rv64 port
>>
>> [1] https://github.com/rust-lang/rust/releases/tag/1.56.0
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Randy MacLeod <Randy.MacLeod@windriver.com>
>>
>
> Anyone seeing libstd-rs failing to build?
>
> e.g. for raspberrypi4 it fails with:
>
> | error: could not compile `core`
> |
> | Caused by:
> |   process didn't exit successfully: `rustc --crate-name core
> --edition=2018 library/core/src/lib.rs --error-format=json
> --json=diagnostic-rendered-ansi,artifacts --crate-type lib
> --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C
> metadata=1c41b1708b174d1e -C extra-filename=-1c41b1708b174d1e --out-dir
> /OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/arm-oe-linux-gnueabi/release/deps
> --target arm-oe-linux-gnueabi -C
> linker=/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/wrapper/target-rust-ccld
> -L
> dependency=/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/arm-oe-linux-gnueabi/release/deps
> -L
> dependency=/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/release/deps
> -L
> /OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0=/usr/src/debug/libstd-rs/1.56.0-r0
> -Cembed-bitcode=yes -L
> /OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/recipe-sysroot/usr/lib
> -C link-arg=-Wl,-soname,libstd.so` (signal: 11, SIGSEGV: invalid memory
> reference)
> | warning: build failed, waiting for other jobs to finish...
>
> with qemuarm it fails as well:
> | error: could not compile `core`
> |
> | Caused by:
> |   process didn't exit successfully: `rustc --crate-name core
> --edition=2018 library/core/src/lib.rs --error-format=json
> --json=diagnostic-rendered-ansi,artifacts --crate-type lib
> --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C
> metadata=1c41b1708b174d1e -C extra-filename=-1c41b1708b174d1e --out-dir
> /OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/arm-oe-linux-gnueabi/release/deps
> --target arm-oe-linux-gnueabi -C
> linker=/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/wrapper/target-rust-ccld
> -L
> dependency=/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/arm-oe-linux-gnueabi/release/deps
> -L
> dependency=/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/release/deps
> -L
> /OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0=/usr/src/debug/libstd-rs/1.56.0-r0
> -Cembed-bitcode=yes -L
> /OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/recipe-sysroot/usr/lib
> -C link-arg=-Wl,-soname,libstd.so` (signal: 11, SIGSEGV: invalid memory
> reference)
> | warning: build failed, waiting for other jobs to finish...
>
> Will try to downgrade to 1.55.0.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157390):
> https://lists.openembedded.org/g/openembedded-core/message/157390
> Mute This Topic: https://lists.openembedded.org/mt/86531835/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000140eca05cf406466
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Looks like it was caused by rust-cross issues reporte=
d in:</div><a href=3D"https://lists.openembedded.org/g/openembedded-core/me=
ssage/156516">https://lists.openembedded.org/g/openembedded-core/message/15=
6516</a><br><div><br></div><div>Re-building libstd-rs in empty TMPDIR, just=
 for qemuarm MACHINE without using sstate worked.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 26, 2021=
 at 2:06 PM Martin Jansa via <a href=3D"http://lists.openembedded.org">list=
s.openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists=
.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div di=
r=3D"ltr">On Sat, Oct 23, 2021 at 8:52 AM Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></=
div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">This is latest major release, changes are here [1]<br>
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
src/<a href=3D"http://lib.rs" target=3D"_blank">lib.rs</a> --error-format=
=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=
=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadat=
a=3D1c41b1708b174d1e -C extra-filename=3D-1c41b1708b174d1e --out-dir /OE/bu=
ild/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-=
rs/1.56.0-r0/build/arm-oe-linux-gnueabi/release/deps --target arm-oe-linux-=
gnueabi -C linker=3D/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv=
4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/wrapper/target-rust-ccld -L dependen=
cy=3D/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnue=
abi/libstd-rs/1.56.0-r0/build/arm-oe-linux-gnueabi/release/deps -L dependen=
cy=3D/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnue=
abi/libstd-rs/1.56.0-r0/build/release/deps -L /OE/build/oe-core/tmp-glibc/w=
ork/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/recipe-sys=
root/usr/lib/rust --remap-path-prefix=3D/OE/build/oe-core/tmp-glibc/work/co=
rtexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0=3D/usr/src/debug=
/libstd-rs/1.56.0-r0 -Cembed-bitcode=3Dyes -L /OE/build/oe-core/tmp-glibc/w=
ork/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/recipe-sys=
root/usr/lib -C link-arg=3D-Wl,-soname,libstd.so` (signal: 11, SIGSEGV: inv=
alid memory reference)<br>| warning: build failed, waiting for other jobs t=
o finish...<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gma=
il_quote">with qemuarm it fails as well:</div><div class=3D"gmail_quote">| =
error: could not compile `core`<br>|<br>| Caused by:<br>| =C2=A0 process di=
dn&#39;t exit successfully: `rustc --crate-name core --edition=3D2018 libra=
ry/core/src/<a href=3D"http://lib.rs" target=3D"_blank">lib.rs</a> --error-=
format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib =
--emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C m=
etadata=3D1c41b1708b174d1e -C extra-filename=3D-1c41b1708b174d1e --out-dir =
/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd=
-rs/1.56.0-r0/build/arm-oe-linux-gnueabi/release/deps --target arm-oe-linux=
-gnueabi -C linker=3D/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe=
-linux-gnueabi/libstd-rs/1.56.0-r0/wrapper/target-rust-ccld -L dependency=
=3D/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/lib=
std-rs/1.56.0-r0/build/arm-oe-linux-gnueabi/release/deps -L dependency=3D/O=
E/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libstd-r=
s/1.56.0-r0/build/release/deps -L /OE/build/oe-core/tmp-glibc/work/cortexa1=
5t2hf-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0/recipe-sysroot/usr/lib/rust=
 --remap-path-prefix=3D/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-=
oe-linux-gnueabi/libstd-rs/1.56.0-r0=3D/usr/src/debug/libstd-rs/1.56.0-r0 -=
Cembed-bitcode=3Dyes -L /OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon=
-oe-linux-gnueabi/libstd-rs/1.56.0-r0/recipe-sysroot/usr/lib -C link-arg=3D=
-Wl,-soname,libstd.so` (signal: 11, SIGSEGV: invalid memory reference)<br>|=
 warning: build failed, waiting for other jobs to finish...<br></div><div c=
lass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Will try to downg=
rade to 1.55.0.</div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157390): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157390" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157390</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86531835/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86531835/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000140eca05cf406466--

