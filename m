Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6E5CCA472
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 12:54:55 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.15222.1759928093795233995
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 05:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Be3y8yCU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46b303f7469so48147955e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 05:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759928092; x=1760532892; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VltYiHlYucJdtPgOJc8WLuDx+rYZnjFNV2T5Y7FQQdM=;
        b=Be3y8yCUlxklYFgg1FztHRjbKfzVXF50tvh44BmT6EVk3tkg/afen/STpju5+GKB5B
         CtgS8fOCQIDK1vT7KF7yiv1IdaMZ+6gmj4p+7Ip4q/wX0zE6buD8/mZuxdKlCENyambJ
         /oRyTFUpi/sgtCvNtd1YSV9iXOHCD6qjwJ/Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759928092; x=1760532892;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VltYiHlYucJdtPgOJc8WLuDx+rYZnjFNV2T5Y7FQQdM=;
        b=eqJ4sCZmu87vrG52rCysax24arTijWUXwz8V+kM7Tdpp5qIKGwIzehxflqDdY/Tk/o
         R9W8ymKPcsT7/I0W1Pi1Cu3YCGYYQjnFz0H3PZRkq4Jmoi4y7arXnOAciQqRIvuqD0CH
         p+OnoMhG0GQ/etHBayfpVjU+FyuLNrPLdvyREpz57l7f0Nemo3U7x8bTdC28/bmE7/1M
         50QireUPtmiBIipzx3s7htATPsCVN1jC7t6mP3ZNLDFD7W81BchSMRW4tXn39zMrGhYT
         ax1DmyZj2MhpsMpWqIB5CAYEBWN4SvCsgzGwKd26ISZaDFbKz+BGaQXsQtJADwzLqx1E
         tQRA==
X-Gm-Message-State: AOJu0YyDquzkioCbj9m4qxdeSr8Q/zF98Vw2rPCkXGmg5xZUE1KsQ7VE
	u62mtBqogCXHDv8dZjkqLvoc3lLu81qRbSub03cgmHbHO0g0ceHs73pL5WW0Qln9XuI=
X-Gm-Gg: ASbGncsQKRgz6PmPVXN6LUcxNYkQbZOF7BNsUK876+l/vAKolvwHVg8tgaKkZzjF3rY
	4JZubKXS0qMRo4sOQqHyII7WNvhNgBZRwSp/k4Vt6BhbS7Ab8RsUsRVlJ24E61hzhQavJJGiF6r
	bty0qusz114Y/wJjzwb0+zwRheYex7RfIA4ptg/lHXdekARIjIy7Dxbsm3hWqLFkEvreERjYlbr
	xZaPgjrbiUYXYs2BCHky3iT0Fho13GTnuXa+LiNWpVdg+MYJKAkV+JkOBmDvHPl3xUvEBOrRKq/
	3pxFHM3wLFrM1g3wYcHcF4p4EF3UngzzY7I9Rrv3VF/83+jXDcPF0pp4koc5rlt1jHnoZCPA8b4
	VIhzOt2E90zOZ9Z9dnPBuzppbjwEHpcZbTUwTxhiWId1wXsJa4VVlqvx80VoI0CmFyV+Rr3CDPP
	3jN/6Tzy4jc8fgJHfsnkN4/yC4M8z389a5
X-Google-Smtp-Source: AGHT+IFgnp4pfynBAErwgIgmnC7/LVIgLozCQxKGfgkpE40YEWtOAcf4fqi479l0Vh+fMasPU+4y6w==
X-Received: by 2002:a05:600c:8286:b0:46d:3a07:73cd with SMTP id 5b1f17b1804b1-46fa9af0117mr23058995e9.23.1759928092058;
        Wed, 08 Oct 2025 05:54:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c525:4328:d09:a5d4? ([2001:8b0:aba:5f3c:c525:4328:d09:a5d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9bf7f80sm36511735e9.1.2025.10.08.05.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 05:54:51 -0700 (PDT)
Message-ID: <d9e3ca199410d01d4703bc5a07e16632e8a41272.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V3 1/2] rust: Use clang instead of rust-llvm
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, Khem Raj <raj.khem@gmail.com>, Ross
 Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Date: Wed, 08 Oct 2025 13:54:50 +0100
In-Reply-To: <a7b7c7a1-7110-427b-b883-c097e62c447f@windriver.com>
References: <20250926102411.3742996-1-Deepesh.Varatharajan@windriver.com>
	 <9433bf5a-8648-4142-a17f-69092253dd46@gmail.com>
	 <f07bc225-e3b6-4ac9-b6e4-de52d4053618@windriver.com>
	 <CAMKF1spO_MP=CtN8rdG3S=YE2qmUEVYfCDsRrxzo6pipvpJD6w@mail.gmail.com>
	 <55dd2edb-6faf-446d-b28a-4bace9859169@windriver.com>
	 <CAMKF1srTjQc4ib7vo4+OPdDxzKj6fWowniUQajcvRGy-nUDv2w@mail.gmail.com>
	 <a7b7c7a1-7110-427b-b883-c097e62c447f@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 12:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224580

On Wed, 2025-10-08 at 18:19 +0530, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
>=20
> On 08-10-2025 01:47, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >=20
> > On Tue, Oct 7, 2025 at 4:10=E2=80=AFAM Deepesh Varatharajan
> > <deepesh.varatharajan@windriver.com> wrote:
> > >=20
> > > On 02-10-2025 00:59, Khem Raj wrote:
> > > > CAUTION: This email comes from a non Wind River email account!
> > > > Do not click links or open attachments unless you recognize the sen=
der and know the content is safe.
> > > >=20
> > > > On Mon, Sep 29, 2025 at 1:29=E2=80=AFAM Deepesh Varatharajan
> > > > <deepesh.varatharajan@windriver.com> wrote:
> > > > > On 26-09-2025 23:00, Khem Raj wrote:
> > > > > > CAUTION: This email comes from a non Wind River email account!
> > > > > > Do not click links or open attachments unless you recognize the=
 sender
> > > > > > and know the content is safe.
> > > > > >=20
> > > > > > On 9/26/25 3:24 AM, Varatharajan, Deepesh via lists.openembedde=
d.org
> > > > > > wrote:
> > > > > > > From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
> > > > > > >=20
> > > > > > > Updated the Rust build to depend on Clang instead.
> > > > > > >=20
> > > > > > > *Summary of discussion with the rust upstream about using lat=
est LLVM
> > > > > > > instead of Rust maintained LLVM fork.
> > > > > > > https://internals.rust-lang.org/t/can-we-use-proper-clang-ins=
tead-of-llvm-fork-what-rust-uses/23489
> > > > > > >=20
> > > > > > >=20
> > > > > > > *Upstream LLVM is generally compatible:
> > > > > > > - Rust does support building with upstream (vanilla) LLVM, es=
pecially
> > > > > > > the latest
> > > > > > > major release and the one or two preceding ones.
> > > > > > > https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.h=
tml#updating-llvm
> > > > > > >=20
> > > > > > >=20
> > > > > > > *Impact on Yocto Rust upgrades:
> > > > > > > - Rust upgrades shall always check for updates on rust forked=
 llvm
> > > > > > > and backport
> > > > > > > the relevant patches to clang's llvm.
> > > > > > >=20
> > > > > > > *Regarding the rust forked llvm local patches:
> > > > > > > - There are no local patches on rust forked llvm other than t=
he
> > > > > > > backported fixes
> > > > > > > from llvm master.
> > > > > > >=20
> > > > > > > *We now add these flags "-Clink-arg=3D-lz -Clink-arg=3D-lzstd=
" because of
> > > > > > > this following
> > > > > > > diff otherwise we will get errors during link time.
> > > > > > >=20
> > > > > > > Setup in rust-llvm
> > > > > > > -DLLVM_ENABLE_ZLIB=3DOFF \
> > > > > > > -DLLVM_ENABLE_ZSTD=3DOFF \
> > > > > > > -DLLVM_ENABLE_FFI=3DOFF \
> > > > > > >=20
> > > > > > > Setup in clang
> > > > > > > -DLLVM_ENABLE_FFI=3DON \
> > > > > > > -DLLVM_ENABLE_ZSTD=3DON \
> > > > > > >=20
> > > > > > > *When multilibs enabled:
> > > > > > >=20
> > > > > > > llvm-config expects static libraries to be located in the lib
> > > > > > > directory rather than
> > > > > > > lib64. However, since LLVM is built as a non-multilib compone=
nt, the
> > > > > > > lib directory
> > > > > > > doesn't contain any library files. To accommodate this withou=
t
> > > > > > > breaking multilib
> > > > > > > behavior, we copy the required library files appropriately.
> > > > > > >=20
> > > > > > > Previously, when we depended on rust-llvm, this worked becaus=
e we
> > > > > > > specified:
> > > > > > > -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust
> > > > > > >=20
> > > > > > > With this setup, llvm-config was installed inside
> > > > > > > ${libdir}/llvm-rust, which included
> > > > > > > its own bin and lib directories. Thus, llvm-config located in=
 bin
> > > > > > > would correctly find
> > > > > > > the libraries in the adjacent lib directory.
> > > > > > >=20
> > > > > > > Even when multilib was enabled or not, llvm-config would stil=
l look
> > > > > > > for libraries under
> > > > > > > lib in this structure, so everything functioned as expected.
> > > > > > >=20
> > > > > > > *Changes needs to be done when llvm splits from clang:
> > > > > > > In rust recipe:
> > > > > > > Update the dependency from:
> > > > > > > DEPENDS +=3D "ninja-native clang" to DEPENDS +=3D "ninja-nati=
ve llvm"
> > > > > > >=20
> > > > > > > In llvm recipe:
> > > > > > > Apply the same changes that were made in the Clang recipe, as=
 those
> > > > > > > configurations have now been moved to the LLVM recipe after t=
he split.
> > > > > > >=20
> > > > > > > Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@win=
driver.com>
> > > > > > > ---
> > > > > > > =C2=A0=C2=A0=C2=A0 meta/recipes-devtools/clang/clang_git.bb=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> > > > > > > =C2=A0=C2=A0=C2=A0 meta/recipes-devtools/clang/common-clang.i=
nc |=C2=A0 6 +++---
> > > > > > > =C2=A0=C2=A0=C2=A0 meta/recipes-devtools/rust/rust_1.90.0.bb=
=C2=A0=C2=A0=C2=A0 | 18 ++++++++++++++----
> > > > > > > =C2=A0=C2=A0=C2=A0 3 files changed, 19 insertions(+), 9 delet=
ions(-)
> > > > > > >=20
> > > > > > > diff --git a/meta/recipes-devtools/clang/clang_git.bb
> > > > > > > b/meta/recipes-devtools/clang/clang_git.bb
> > > > > > > index 53bca1c24f..3e117b308b 100644
> > > > > > > --- a/meta/recipes-devtools/clang/clang_git.bb
> > > > > > > +++ b/meta/recipes-devtools/clang/clang_git.bb
> > > > > > > @@ -83,7 +83,6 @@ OECMAKE_SOURCEPATH =3D "${S}/llvm"
> > > > > > > =C2=A0=C2=A0=C2=A0 # https://github.com/llvm/llvm-project/blo=
b/main/llvm/CMakeLists.txt
> > > > > > > =C2=A0=C2=A0=C2=A0 LLVM_TARGETS_GPU ?=3D "${@bb.utils.contain=
s_any('DISTRO_FEATURES',
> > > > > > > 'opencl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
> > > > > > > =C2=A0=C2=A0=C2=A0 LLVM_TARGETS_TO_BUILD ?=3D
> > > > > > > "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARG=
ETS_GPU}"
> > > > > > > -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_a=
rch(bb,
> > > > > > > d)};BPF;${LLVM_TARGETS_GPU}"
> > > > > > compiler we build is building all architectures once because it=
 then
> > > > > > reuses same compiler for all cross compilers just by creating c=
anonical
> > > > > > symlinks, this change is not going to work.
> > > > > We removed this line because, for the clang class-target build, L=
LVM was
> > > > > only compiling
> > > > > libraries for the target architecture and GPU targets and kept in=
side
> > > > > the target
> > > > > sysroot. Since we use the llvm-config built for the class-target =
during
> > > > > the Rust target build,
> > > > > it was failing due to the absence of static libraries for other
> > > > > architectures in the target sysroot.
> > > > > Here the target is x86 arch. So, it compiled libraries for x86 ar=
ch only
> > > > > and we can see the error
> > > > > for missing libraries for other archs as below:
> > > > >=20
> > > > > > =C2=A0 --- stderr
> > > > > > =C2=A0 llvm-config: error: missing:
> > > > > poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysro=
ot/usr/lib/libLLVMAArch64Info.a
> > > > > > =C2=A0 llvm-config: error: missing:
> > > > > poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysro=
ot/usr/lib/libLLVMLoongArchInfo.a
> > > > > > =C2=A0 llvm-config: error: missing:
> > > > > poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysro=
ot/usr/lib/libLLVMLoongArchDisassembler.a
> > > > > > =C2=A0 llvm-config: error: missing:
> > > > > poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysro=
ot/usr/lib/libLLVMMipsInfo.a
> > > > > > =C2=A0 llvm-config: error: missing:
> > > > > poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysro=
ot/usr/lib/libLLVMPowerPCInfo.a
> > > > > > =C2=A0 llvm-config: error: missing:
> > > > > poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysro=
ot/usr/lib/libLLVMRISCVTargetMCA.a
> > > > > .
> > > > > .
> > > > > .
> > > > > > =C2=A0 thread 'main' panicked at compiler/rustc_llvm/build.rs:2=
77:16:
> > > > > > =C2=A0 command did not execute successfully:
> > > > > "poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysr=
oot/usr/lib/llvm-config"
> > > > >=20
> > > > > "--link-static" "--libs" "aarch64" "amdgpu" "arm" "asmparser"
> > > > > "bitreader" "bitwriter" "bpf" "coverage" "instrumentation" "ipo" =
"linker"
> > > > > "loongarch" "lto" "mips" "nvptx" "powerpc" "riscv" "x86"
> > > > > > =C2=A0 expected success, got: exit status: 1
> > > > >=20
> > > > > Maybe instead of removing. Can we change
> > > > > -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(=
bb,
> > > > > d)};BPF;${LLVM_TARGETS_GPU}"
> > > > > to
> > > > > -LLVM_TARGETS_TO_BUILD:class-target ?=3D
> > > > > "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;;BPF;${LLVM_TAR=
GETS_GPU}"
> > > > > ?
> > > > I think we don't want to build all the general arches for target, o=
nly
> > > > the target arch and gpu arches
> > > > is what is needed.=C2=A0 If we build all the backends, that will sl=
ow down
> > > > things. But if target rust needs
> > > > to support all the architectures to generate code for, then we don'=
t
> > > > have much choice. Can you see
> > > > if we are ok to just target one architecture ?
> > > The issue doesn't originate from Rust directly, it stems from the
> > > following logic
> > > in the Rust recipe, where the natively built llvm-config is copied in=
to
> > > the target sysroot:
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Copy the natively built llvm-config =
into the target so we can run
> > > it. Horrible,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # but works!
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE}=
 !=3D
> > > ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p `dirn=
ame ${RUST_ALTERNATE_EXE_PATH}`
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp ${RUST_ALTE=
RNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -e ${STAG=
ING_LIBDIR_NATIVE}/libc++.so.1 ]; then
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 patchelf --set-rpath \$ORIGIN/../../../../../`basename
> > > ${STAGING_DIR_NATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> > >=20
> > > Since llvm-config is being copied from ${STAGING_BINDIR_NATIVE} to
> > > ${STAGING_BINDIR},
> > > and the native Clang was built with the following configuration:
> > > LLVM_TARGETS_TO_BUILD ?=3D
> > > "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS_GPU}=
"
> > >=20
> > > The copied llvm-config will expect the corresponding target libraries=
 to
> > > be present in the ${STAGING_LIBDIR}.
> > >=20
> > > To address this issue, as far as I can see we have three options.
> > >=20
> > > 1) Build clang-target also for all mentioned archs for clang-native.
> > > 2) Copy all the required libraries from ${STAGING_LIBDIR_NATIVE} to
> > > ${STAGING_LIBDIR}.
> > > 3) Instead of copying llvm-config from ${STAGING_BINDIR_NATIVE} to
> > > ${STAGING_BINDIR},
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 directly make rust-target build =
dependent
> > > on=C2=A0 ${STAGING_BINDIR_NATIVE}/llvm-config.
> > >=20
> > > Are there any better or cleaner alternatives to handle this situation=
?
> > > Any suggestions would be greatly appreciated.
> > I would prefer option 3 since these libs are inherently cross built,
> > it perhaps does not matter if
> > they come from native or cross built clang. But that would have been
> > default before this copy dance
> > was done. I might have forgotten now, if this was done specifically to =
address a
> > case which we can testout now.
> Making Rust depend directly on the native llvm-config is not feasible
> because librustc_llvm*.rlib
> is built for the host architecture(x86-64) . While this works if the=20
> target is x86-64 or x86, for
> other architectures we get the following error:
> we encounter the following error:
> ld: .../librustc_llvm-f50ec2a9934e24d2.rlib: error adding symbols: file=
=20
> format not recognized
> collect2: error: ld returned 1 exit status
>=20
> Therefore, copying the natively built llvm-config into the target=20
> sysroot and unsetting the RPATH
> is currently the best approach, and that=E2=80=99s what we are doing. How=
ever,=20
> even after unsetting the
> RPATH, the native llvm-config still references to static libraries for=
=20
> other architectures during
> compile time. To fix this, those libraries must be present in the target=
=20
> sysroot.
>=20
> =C2=A0From what I see, the only feasible solution is to build LLVM target=
=20
> libraries for all supported
> architectures. Copying these libraries from the native sysroot is not
> feasible because the native
> sysroot contains libs for all OE-core targets, while the target sysroot=
=20
> contains libs only for its
> specific target=E2=80=94copying would cause conflicts.

Could it make sense to add in symlinks to the missing pieces between
the two sysroots? We could make that part sysroot specific, i.e. not
affect the target packages, just sysroot population?

Thanks for the timings btw. Given that, I could be tempted to merge
things, then look to improve things again in a follow up patch set.

Curious on others thoughts?

Cheers,

Richard



