Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC234C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 13:16:22 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.7030.1655903779460557624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 06:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mmy2ZhXG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id a10so9219473wmj.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 06:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=l1n5S3qzHMnQfLkSUXL93cnN+UJ/v0/ekGwJqp/BjTk=;
        b=Mmy2ZhXGf6eh2cpdxqxNU+it2alMv+TEzWUS9fCHtkHT15cwSdYrsWY9eZwNt37JdP
         nsDDns7ARZiopq+UlrdDtTwPuAxMtBEMqV9GVoWetfsUQO96fR8sW2DKgXfBPGEhuT7/
         WUveFmfJIVSSTA3F3uF0hi9tARthejEvP1Le4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=l1n5S3qzHMnQfLkSUXL93cnN+UJ/v0/ekGwJqp/BjTk=;
        b=hDTTVQQTHBmlaDiywxz1rdgAigKx23jkDD8GxQNAW7fnt08ennRc+JEE502qj1vbwp
         afnla/zGpZCJ5JYHRKwJtnUyPyR8dI8vYxaiHRQ5teUDwbJ2faNeBXo0+lC4g9KHkFKn
         FeG0LbTuSuql/B7jMU1qnrqtgmq0DcchmDht5U80x3nf3cgXRy3oXhaOzmTIT6ip3pXx
         CMd8VsJUa0SoZNlq4dM/O5M4k7tH9h7nstQSoBE9yBic8xvyjmnO7oW3Jsq2qREvGF1+
         mhB9P3BxFkOnAaBX3oAL+6qELM8zfA/ddvpq/uUMF3+jwAB74QaAKBAb7Dg7Yma8lbnW
         ySSA==
X-Gm-Message-State: AJIora+gpdvVN4Lm5BOJRv7szz4q6101sW5LpKxvw7dcLpKnsheatw6c
	cn3pYla8zxIqwgIK9I/F/LzE5w==
X-Google-Smtp-Source: 
 AGRyM1vVzHoLh1iSwicLKaDjvh1WNgyCYIozkGqJkwsaZYtohFkbRREMuZpR2TP1MPNRPcJ3JwAhGA==
X-Received: by 2002:a05:600c:4fd0:b0:39c:6565:31a0 with SMTP id
 o16-20020a05600c4fd000b0039c656531a0mr3870282wmq.142.1655903777608;
        Wed, 22 Jun 2022 06:16:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b8dc:82a2:aabd:2c47?
 ([2001:8b0:aba:5f3c:b8dc:82a2:aabd:2c47])
        by smtp.gmail.com with ESMTPSA id
 f27-20020a5d58fb000000b0021b9e8d4c22sm2181011wrd.61.2022.06.22.06.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 06:16:16 -0700 (PDT)
Message-ID: 
 <68c067eee6e053e192aa26887a574862ab3d065e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] rust-llvm: upgrading to 1.61.0 FAILED
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Cc: "Gowda, Naveen" <naveen.gowda@windriver.com>, Randy MacLeod
	 <randy.macleod@windriver.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Jun 2022 14:16:15 +0100
In-Reply-To: <429629c2-95d3-7a9f-df3f-e8ddf2ba5b2f@gmail.com>
References: 
	<01010181200fec93-2abce4ac-3ed8-402a-8127-c076f733d788-000000@us-west-2.amazonses.com>
	 <CANNYZj9cfUQkS+oDpW7hK5Zi4JWnsmYnEeU5+X-9onRcMSw0fA@mail.gmail.com>
	 <260249af-2c6a-dbde-96a3-65a80c451ea8@windriver.com>
	 <CANNYZj_WDmAaji4tiUQi9=w1bwMTQ810tO-HUXqroSMAZa21Mg@mail.gmail.com>
	 <429629c2-95d3-7a9f-df3f-e8ddf2ba5b2f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 13:16:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167235

On Wed, 2022-06-22 at 11:54 +0530, Sundeep KOKKONDA wrote:
> Hi,
> =C2=A0
>=20
>=20
>=20
> =C2=A0In Yocto, the Rust upgrade from 1.60.0 -> 1.61.0 enables a dependen=
cy on the libstdc++-static library for rust-llvm. With this upgrade build i=
s aborted for 'bitbake core-image-minimal -cpopulate_sdk' with below error.
> =C2=A0
>=20
>=20
>=20
> =C2=A0=3D=3D=3D=3D=3D=3D=3D Error Text =3D=3D=3D=3D=3D=3D=3D
> =C2=A0| error: could not compile `rustc_llvm` due to previous error
> =C2=A0|=20
> =C2=A0| Caused by:
> =C2=A0|=C2=A0=C2=A0 process didn't exit successfully: `/home/pokybuild/yo=
cto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.=
0-r0/rustc-1.61.0-src/build/bootstrap/debug/rustc --crate-name rustc_llvm -=
-edition=3D2021 compiler/rustc_llvm/src/lib.rs --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts,future-incompat --crate-type lib --em=
it=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C debug=
info=3D0 -C metadata=3D5acc17ffb3ce44a9 -C extra-filename=3D-5acc17ffb3ce44=
a9 --out-dir /home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work=
/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-l=
inux-gnu/stage0-rustc/x86_64-unknown-linux-gnu/release/deps --target x86_64=
-unknown-linux-gnu -C linker=3D/home/pokybuild/yocto-worker/qemumips-alt/bu=
ild/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/wrapper/build-rust-cc=
ld -L dependency=3D/home/pokybuild/yocto-worker/qemumips-alt/build/build/tm=
p/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unk=
nown-linux-gnu/stage0-rustc/x86_64-unknown-linux-gnu/release/deps -L depend=
ency=3D/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_6=
4-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-g=
nu/stage0-rustc/release/deps --extern libc=3D/home/pokybuild/yocto-worker/q=
emumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1=
.61.0-src/build/x86_64-unknown-linux-gnu/stage0-rustc/x86_64-unknown-linux-=
gnu/release/deps/liblibc-be8f25d7c5c0a059.rmeta --cfg=3Dbootstrap -Csymbol-=
mangling-version=3Dv0 -Zmacro-backtrace -Clink-args=3D-Wl,-z,origin '-Clink=
-args=3D-Wl,-rpath,$ORIGIN/../lib' -Ztls-model=3Dinitial-exec -Zunstable-op=
tions '-Wrustc::internal' -Cprefer-dynamic -Z binary-dep-depinfo -L native=
=3D/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-li=
nux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/s=
tage0-rustc/x86_64-unknown-linux-gnu/release/build/rustc_llvm-688051e8c720f=
5a9/out -L native=3D/home/pokybuild/yocto-worker/qemumips-alt/build/build/t=
mp/work/x86_64-linux/rust-native/1.61.0-r0/recipe-sysroot-native/usr/lib/ll=
vm-rust/lib -L native=3D/home/pokybuild/yocto-worker/qemumips-alt/build/bui=
ld/tmp/work/x86_64-linux/rust-llvm-native/1.61.0-r0/recipe-sysroot-native/u=
sr/lib -L native=3D/home/pokybuild/yocto-worker/qemumips-alt/build/build/tm=
p/work/x86_64-linux/rust-llvm-native/1.61.0-r0/recipe-sysroot-native/lib -L=
 native=3D --cfg 'llvm_component=3D"aarch64"' --cfg 'llvm_component=3D"arm"=
' --cfg 'llvm_component=3D"asmparser"' --cfg 'llvm_component=3D"bitreader"'=
 --cfg 'llvm_component=3D"bitwriter"' --cfg 'llvm_component=3D"coverage"' -=
-cfg 'llvm_component=3D"instrumentation"' --cfg 'llvm_component=3D"ipo"' --=
cfg 'llvm_component=3D"linker"' --cfg 'llvm_component=3D"lto"' --cfg 'llvm_=
component=3D"mips"' --cfg 'llvm_component=3D"powerpc"' --cfg 'llvm_componen=
t=3D"riscv"' --cfg 'llvm_component=3D"x86"' -l static=3Dllvm-wrapper -l sta=
tic=3DLLVMX86TargetMCA -l static=3DLLVMMCA -l static=3DLLVMX86Disassembler =
-l static=3DLLVMX86AsmParser -l static=3DLLVMX86CodeGen -l static=3DLLVMX86=
Desc -l static=3DLLVMX86Info -l static=3DLLVMRISCVDisassembler -l static=3D=
LLVMRISCVAsmParser -l static=3DLLVMRISCVCodeGen -l static=3DLLVMRISCVDesc -=
l static=3DLLVMRISCVInfo -l static=3DLLVMPowerPCDisassembler -l static=3DLL=
VMPowerPCAsmParser -l static=3DLLVMPowerPCCodeGen -l static=3DLLVMPowerPCDe=
sc -l static=3DLLVMPowerPCInfo -l static=3DLLVMMipsDisassembler -l static=
=3DLLVMMipsAsmParser -l static=3DLLVMMipsCodeGen -l static=3DLLVMMipsDesc -=
l static=3DLLVMMipsInfo -l static=3DLLVMLTO -l static=3DLLVMPasses -l stati=
c=3DLLVMCoroutines -l static=3DLLVMObjCARCOpts -l static=3DLLVMExtensions -=
l static=3DLLVMCoverage -l static=3DLLVMARMDisassembler -l static=3DLLVMARM=
AsmParser -l static=3DLLVMARMCodeGen -l static=3DLLVMipo -l static=3DLLVMIn=
strumentation -l static=3DLLVMVectorize -l static=3DLLVMLinker -l static=3D=
LLVMIRReader -l static=3DLLVMAsmParser -l static=3DLLVMFrontendOpenMP -l st=
atic=3DLLVMARMDesc -l static=3DLLVMARMUtils -l static=3DLLVMARMInfo -l stat=
ic=3DLLVMAArch64Disassembler -l static=3DLLVMMCDisassembler -l static=3DLLV=
MAArch64AsmParser -l static=3DLLVMAArch64CodeGen -l static=3DLLVMCFGuard -l=
 static=3DLLVMGlobalISel -l static=3DLLVMSelectionDAG -l static=3DLLVMAsmPr=
inter -l static=3DLLVMDebugInfoMSF -l static=3DLLVMCodeGen -l static=3DLLVM=
Target -l static=3DLLVMScalarOpts -l static=3DLLVMInstCombine -l static=3DL=
LVMAggressiveInstCombine -l static=3DLLVMTransformUtils -l static=3DLLVMBit=
Writer -l static=3DLLVMAnalysis -l static=3DLLVMProfileData -l static=3DLLV=
MDebugInfoDWARF -l static=3DLLVMObject -l static=3DLLVMTextAPI -l static=3D=
LLVMMCParser -l static=3DLLVMBitReader -l static=3DLLVMCore -l static=3DLLV=
MRemarks -l static=3DLLVMBitstreamReader -l static=3DLLVMAArch64Desc -l sta=
tic=3DLLVMAArch64Utils -l static=3DLLVMAArch64Info -l static=3DLLVMMC -l st=
atic=3DLLVMDebugInfoCodeView -l static=3DLLVMBinaryFormat -l static=3DLLVMS=
upport -l static=3DLLVMDemangle -l dylib=3Drt -l dylib=3Ddl -l dylib=3Dpthr=
ead -l dylib=3Dm -l static=3Dstdc++` (exit status: 1)
> =C2=A0| warning: build failed, waiting for other jobs to finish...
> =C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0 Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>=C2=A0=C2=A0=C2=A0 ] 186/218: rustc_ast_pass=
es, rustc_e...
> =C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0 Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>=C2=A0=C2=A0=C2=A0 ] 187/218: rustc_expand, =
rustc_parse...
> =C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0 Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>=C2=A0=C2=A0=C2=A0 ] 188/218: rustc_expand, =
rustc_parse...
> =C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0 Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>=C2=A0=C2=A0=C2=A0 ] 189/218: rustc_parse, r=
ustc_builti...
> =C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0 Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>=C2=A0=C2=A0=C2=A0 ] 190/218: rustc_parse, r=
ustc_middle
> =C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0 Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>=C2=A0=C2=A0=C2=A0 ] 191/218: rustc_middle
> =C2=A0| error: build failed
> =C2=A0| command did not execute successfully: "/home/pokybuild/yocto-work=
er/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rus=
t-snapshot/bin/cargo" "build" "--target" "x86_64-unknown-linux-gnu" "-Zbina=
ry-dep-depinfo" "-j" "16" "-v" "--release" "--frozen" "--features" "llvm ma=
x_level_info" "--manifest-path" "/home/pokybuild/yocto-worker/qemumips-alt/=
build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/co=
mpiler/rustc/Cargo.toml" "--message-format" "json-render-diagnostics"
> =C2=A0| expected success, got: exit status: 101
> =C2=A0| Traceback (most recent call last):
> =C2=A0|=C2=A0=C2=A0 File "/home/pokybuild/yocto-worker/qemumips-alt/build=
/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/boo=
tstrap/bootstrap.py", line 1341, in <module>
> =C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0 main()
> =C2=A0|=C2=A0=C2=A0 File "/home/pokybuild/yocto-worker/qemumips-alt/build=
/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/boo=
tstrap/bootstrap.py", line 1324, in main
> =C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0 bootstrap(help_triggered)
> =C2=A0|=C2=A0=C2=A0 File "/home/pokybuild/yocto-worker/qemumips-alt/build=
/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/boo=
tstrap/bootstrap.py", line 1310, in bootstrap
> =C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0 run(args, env=3Denv, verbose=3Dbuild.verb=
ose, is_bootstrap=3DTrue)
> =C2=A0|=C2=A0=C2=A0 File "/home/pokybuild/yocto-worker/qemumips-alt/build=
/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/boo=
tstrap/bootstrap.py", line 185, in run
> =C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0 raise RuntimeError(err)
> =C2=A0| RuntimeError: failed to run: /home/pokybuild/yocto-worker/qemumip=
s-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-=
src/build/bootstrap/debug/bootstrap -j 16 build --stage 2 --verbose
> =C2=A0| WARNING: /home/pokybuild/yocto-worker/qemumips-alt/build/build/tm=
p/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104:179 ex=
it 1 from 'python3 src/bootstrap/bootstrap.py -j 16 "$@" --verbose'
> =C2=A0| WARNING: Backtrace (BB generated script):
> =C2=A0| =C2=A0=C2=A0=C2=A0 #1: rust_runx, /home/pokybuild/yocto-worker/qe=
mumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run=
.do_compile.175104, line 179
> =C2=A0| =C2=A0=C2=A0=C2=A0 #2: do_compile, /home/pokybuild/yocto-worker/q=
emumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/ru=
n.do_compile.175104, line 162
> =C2=A0| =C2=A0=C2=A0=C2=A0 #3: main, /home/pokybuild/yocto-worker/qemumip=
s-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_c=
ompile.175104, line 202
> =C2=A0NOTE: recipe rust-native-1.61.0-r0: task do_compile: Failed
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =C2=A0
>=20
>=20
>=20
> =C2=A0The build error is solved by adding the libstdc++.a library on the
> Host (in my case Ubuntu) machine. Now, I am working on to add this
> library to the Yocto nativesdk sysroot to avoid the dependency on the
> Host machine. I made several attempts to add the libstdc++ lib to the
> nativesdk sysroot before the rust / rust-llvm recipe 'do_compile'
> task is executed. In the build directory I can see the libstdc++.a is
> available but it is not considered by the rust recipe and still the
> above mentoned error is appearing. When I added dependencies, I
> observed=C2=A0 errors like 'nothing provides libstdc++ / libstdc++-static
> / libstdc++-staticdev / virtual/nativesdk-libstdc++-staticdev ...
> etc'.
> =C2=A0


Reading the discussion I think things got a little off track. Note that
this error is in rust-native so it will be using libstdc++ from the
host system.

This fills me with a lot of worry since if it does that, it will likely
struggle with uninative as once uninative swaps out the libc for the
uninative one, that will not match the=C2=A0static one. Depending on what
rust is doing, it may be fine but we need to check that.

I suspect we don't require a static libstdc++ on the host either in
that we don't check for it's presence in sanity.bbclass or list it in
our quick start docs in the lists of packages to install. That may or
may not therefore also be an issue.

Not sure what the solution is but it is concerning.

Cheers,

Richard





