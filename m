Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2574CC43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 09:01:41 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web08.5013.1655888494589735135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 02:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z4XHDdbF;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id a2so26650418lfg.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 02:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9t9K+BQfpTVo6xMnopsgpCZuy6CjfoxnkS16rskSWwc=;
        b=Z4XHDdbFYG8wBI5YhOPbVj6K3+7/3RtvZjhfVveDFLgmidC4jicEEs1dR6CweItK4n
         PIPgcIPUHqGd1dR8MQ1J0SBp/iV0MBNs15qz5T1sJ43RRSx1vAQ4/oMHqApkldItLggw
         eb9u8qveN3ywRqi2mmk42xSckUfs3uKHeDi6aseZd0w5grxBGNwMcNE5KzmFFtbxgJs6
         Ejdml/3pQtZ4dJjy3fikDhh7BnVyEzKHxYT76HHGGuWR8qmKz8IPdLQa8woSwUUW9h99
         O08/qeWzAIAgDK7fRjymNX7TLN6JxHiyUELG3+LyZE2QZ5OjZfCxNgr1RQnOfjUlZEtk
         0kFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9t9K+BQfpTVo6xMnopsgpCZuy6CjfoxnkS16rskSWwc=;
        b=WV77cOAldXIdsxI/Kb2PIP4MwuOQB58Yocr+73tkeFCKKq5Keha3BG/DW4Mf3ks0mu
         OufPK1NRxnzWSubNrRAGkFxVFv1kfimeJO38Wwnzgjmy41HS3GbGfpdRgPGFWSvGL+o1
         wiCogqMW+/5FS/bZ2ztQl8RbZ+XNMY1u6SzpE3CTqtUeUS42Znam7MZSubj3rhzMEOMd
         gn5LD0nhyHrEfRpjgBxBnkGw0kkHRCcnC8rjsWqVNd60k6xb27So6Yi8Q7uxOslYsJDD
         2zAC+Wb9Y4CzHDPx8gn79EL+TxovbGko42Z7IIo7SWZvE9N0u+CcBBWPWjchM8A65H8V
         hv7w==
X-Gm-Message-State: AJIora/DKO/TehxuksFRyB9c+qZfNkngimaTOKEFNs7+xpCI22gawOBI
	y/nE9FdSlRCPMsoTogR3wsRe51A8G4sUXi9kJ3c=
X-Google-Smtp-Source: 
 AGRyM1s4t04o9ym1oxa83JdKd/F2clWRZX2PWNckepkPtPPleKuMXocXxuKXXk8m5xT0hWWU9f9zvabKoWn3HdAn3P0=
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr1568209lfa.380.1655888492692; Wed, 22
 Jun 2022 02:01:32 -0700 (PDT)
MIME-Version: 1.0
References: 
 <01010181200fec93-2abce4ac-3ed8-402a-8127-c076f733d788-000000@us-west-2.amazonses.com>
 <CANNYZj9cfUQkS+oDpW7hK5Zi4JWnsmYnEeU5+X-9onRcMSw0fA@mail.gmail.com>
 <260249af-2c6a-dbde-96a3-65a80c451ea8@windriver.com>
 <CANNYZj_WDmAaji4tiUQi9=w1bwMTQ810tO-HUXqroSMAZa21Mg@mail.gmail.com>
 <429629c2-95d3-7a9f-df3f-e8ddf2ba5b2f@gmail.com>
 <16FAE43C2CB492E0.16268@lists.openembedded.org>
In-Reply-To: <16FAE43C2CB492E0.16268@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Jun 2022 11:01:21 +0200
Message-ID: 
 <CANNYZj_qaFtP-kquGm-ZsAs5_9zd5key8uWkaRoy7dVcixeP9A@mail.gmail.com>
Subject: Re: [OE-core] [AUH] rust-llvm: upgrading to 1.61.0 FAILED
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
	"Gowda, Naveen" <naveen.gowda@windriver.com>,
 Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 09:01:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167224

I quickly checked: libstdc++.a is built by nativesdk-gcc-runtime
recipe and goes into nativesdk-libstdc++-staticdev package. Does this
answer the issue you have?

Alex

On Wed, 22 Jun 2022 at 10:32, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Can you publish your work somewhere on git so I can reproduce the
> nativesdk issue locally?
>
> Khem, can you help us out please with it? :)
>
> Also I'm starting to wonder if we should patch rust with a workaround
> from the ticket instead?
>
>
> Alex
>
> On Wed, 22 Jun 2022 at 08:24, Sundeep KOKKONDA
> <sundeep.kokkonda@gmail.com> wrote:
> >
> > Hi,
> >
> > In Yocto, the Rust upgrade from 1.60.0 -> 1.61.0 enables a dependency o=
n the libstdc++-static library for rust-llvm. With this upgrade build is ab=
orted for 'bitbake core-image-minimal -cpopulate_sdk' with below error.
> >
> > =3D=3D=3D=3D=3D=3D=3D Error Text =3D=3D=3D=3D=3D=3D=3D
> > | error: could not compile `rustc_llvm` due to previous error
> > |
> > | Caused by:
> > |   process didn't exit successfully: `/home/pokybuild/yocto-worker/qem=
umips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.6=
1.0-src/build/bootstrap/debug/rustc --crate-name rustc_llvm --edition=3D202=
1 compiler/rustc_llvm/src/lib.rs --error-format=3Djson --json=3Ddiagnostic-=
rendered-ansi,artifacts,future-incompat --crate-type lib --emit=3Ddep-info,=
metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C debuginfo=3D0 -C me=
tadata=3D5acc17ffb3ce44a9 -C extra-filename=3D-5acc17ffb3ce44a9 --out-dir /=
home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/=
rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage=
0-rustc/x86_64-unknown-linux-gnu/release/deps --target x86_64-unknown-linux=
-gnu -C linker=3D/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/=
work/x86_64-linux/rust-native/1.61.0-r0/wrapper/build-rust-ccld -L dependen=
cy=3D/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-=
linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu=
/stage0-rustc/x86_64-unknown-linux-gnu/release/deps -L dependency=3D/home/p=
okybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-n=
ative/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage0-rust=
c/release/deps --extern libc=3D/home/pokybuild/yocto-worker/qemumips-alt/bu=
ild/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/buil=
d/x86_64-unknown-linux-gnu/stage0-rustc/x86_64-unknown-linux-gnu/release/de=
ps/liblibc-be8f25d7c5c0a059.rmeta --cfg=3Dbootstrap -Csymbol-mangling-versi=
on=3Dv0 -Zmacro-backtrace -Clink-args=3D-Wl,-z,origin '-Clink-args=3D-Wl,-r=
path,$ORIGIN/../lib' -Ztls-model=3Dinitial-exec -Zunstable-options '-Wrustc=
::internal' -Cprefer-dynamic -Z binary-dep-depinfo -L native=3D/home/pokybu=
ild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native=
/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage0-rustc/x86=
_64-unknown-linux-gnu/release/build/rustc_llvm-688051e8c720f5a9/out -L nati=
ve=3D/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-=
linux/rust-native/1.61.0-r0/recipe-sysroot-native/usr/lib/llvm-rust/lib -L =
native=3D/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86=
_64-linux/rust-llvm-native/1.61.0-r0/recipe-sysroot-native/usr/lib -L nativ=
e=3D/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-l=
inux/rust-llvm-native/1.61.0-r0/recipe-sysroot-native/lib -L native=3D --cf=
g 'llvm_component=3D"aarch64"' --cfg 'llvm_component=3D"arm"' --cfg 'llvm_c=
omponent=3D"asmparser"' --cfg 'llvm_component=3D"bitreader"' --cfg 'llvm_co=
mponent=3D"bitwriter"' --cfg 'llvm_component=3D"coverage"' --cfg 'llvm_comp=
onent=3D"instrumentation"' --cfg 'llvm_component=3D"ipo"' --cfg 'llvm_compo=
nent=3D"linker"' --cfg 'llvm_component=3D"lto"' --cfg 'llvm_component=3D"mi=
ps"' --cfg 'llvm_component=3D"powerpc"' --cfg 'llvm_component=3D"riscv"' --=
cfg 'llvm_component=3D"x86"' -l static=3Dllvm-wrapper -l static=3DLLVMX86Ta=
rgetMCA -l static=3DLLVMMCA -l static=3DLLVMX86Disassembler -l static=3DLLV=
MX86AsmParser -l static=3DLLVMX86CodeGen -l static=3DLLVMX86Desc -l static=
=3DLLVMX86Info -l static=3DLLVMRISCVDisassembler -l static=3DLLVMRISCVAsmPa=
rser -l static=3DLLVMRISCVCodeGen -l static=3DLLVMRISCVDesc -l static=3DLLV=
MRISCVInfo -l static=3DLLVMPowerPCDisassembler -l static=3DLLVMPowerPCAsmPa=
rser -l static=3DLLVMPowerPCCodeGen -l static=3DLLVMPowerPCDesc -l static=
=3DLLVMPowerPCInfo -l static=3DLLVMMipsDisassembler -l static=3DLLVMMipsAsm=
Parser -l static=3DLLVMMipsCodeGen -l static=3DLLVMMipsDesc -l static=3DLLV=
MMipsInfo -l static=3DLLVMLTO -l static=3DLLVMPasses -l static=3DLLVMCorout=
ines -l static=3DLLVMObjCARCOpts -l static=3DLLVMExtensions -l static=3DLLV=
MCoverage -l static=3DLLVMARMDisassembler -l static=3DLLVMARMAsmParser -l s=
tatic=3DLLVMARMCodeGen -l static=3DLLVMipo -l static=3DLLVMInstrumentation =
-l static=3DLLVMVectorize -l static=3DLLVMLinker -l static=3DLLVMIRReader -=
l static=3DLLVMAsmParser -l static=3DLLVMFrontendOpenMP -l static=3DLLVMARM=
Desc -l static=3DLLVMARMUtils -l static=3DLLVMARMInfo -l static=3DLLVMAArch=
64Disassembler -l static=3DLLVMMCDisassembler -l static=3DLLVMAArch64AsmPar=
ser -l static=3DLLVMAArch64CodeGen -l static=3DLLVMCFGuard -l static=3DLLVM=
GlobalISel -l static=3DLLVMSelectionDAG -l static=3DLLVMAsmPrinter -l stati=
c=3DLLVMDebugInfoMSF -l static=3DLLVMCodeGen -l static=3DLLVMTarget -l stat=
ic=3DLLVMScalarOpts -l static=3DLLVMInstCombine -l static=3DLLVMAggressiveI=
nstCombine -l static=3DLLVMTransformUtils -l static=3DLLVMBitWriter -l stat=
ic=3DLLVMAnalysis -l static=3DLLVMProfileData -l static=3DLLVMDebugInfoDWAR=
F -l static=3DLLVMObject -l static=3DLLVMTextAPI -l static=3DLLVMMCParser -=
l static=3DLLVMBitReader -l static=3DLLVMCore -l static=3DLLVMRemarks -l st=
atic=3DLLVMBitstreamReader -l static=3DLLVMAArch64Desc -l static=3DLLVMAArc=
h64Utils -l static=3DLLVMAArch64Info -l static=3DLLVMMC -l static=3DLLVMDeb=
ugInfoCodeView -l static=3DLLVMBinaryFormat -l static=3DLLVMSupport -l stat=
ic=3DLLVMDemangle -l dylib=3Drt -l dylib=3Ddl -l dylib=3Dpthread -l dylib=
=3Dm -l static=3Dstdc++` (exit status: 1)
> > | warning: build failed, waiting for other jobs to finish...
> > |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D>    ] 186/218: rustc_ast_passes, rustc_e...
> > |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D>    ] 187/218: rustc_expand, rustc_parse...
> > |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D>    ] 188/218: rustc_expand, rustc_parse...
> > |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D>    ] 189/218: rustc_parse, rustc_builti...
> > |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D>    ] 190/218: rustc_parse, rustc_middle
> > |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D>    ] 191/218: rustc_middle
> > | error: build failed
> > | command did not execute successfully: "/home/pokybuild/yocto-worker/q=
emumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rust-sn=
apshot/bin/cargo" "build" "--target" "x86_64-unknown-linux-gnu" "-Zbinary-d=
ep-depinfo" "-j" "16" "-v" "--release" "--frozen" "--features" "llvm max_le=
vel_info" "--manifest-path" "/home/pokybuild/yocto-worker/qemumips-alt/buil=
d/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/compil=
er/rustc/Cargo.toml" "--message-format" "json-render-diagnostics"
> > | expected success, got: exit status: 101
> > | Traceback (most recent call last):
> > |   File "/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/wor=
k/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstr=
ap.py", line 1341, in <module>
> > |     main()
> > |   File "/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/wor=
k/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstr=
ap.py", line 1324, in main
> > |     bootstrap(help_triggered)
> > |   File "/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/wor=
k/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstr=
ap.py", line 1310, in bootstrap
> > |     run(args, env=3Denv, verbose=3Dbuild.verbose, is_bootstrap=3DTrue=
)
> > |   File "/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/wor=
k/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstr=
ap.py", line 185, in run
> > |     raise RuntimeError(err)
> > | RuntimeError: failed to run: /home/pokybuild/yocto-worker/qemumips-al=
t/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/=
build/bootstrap/debug/bootstrap -j 16 build --stage 2 --verbose
> > | WARNING: /home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/wo=
rk/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104:179 exit 1=
 from 'python3 src/bootstrap/bootstrap.py -j 16 "$@" --verbose'
> > | WARNING: Backtrace (BB generated script):
> > |     #1: rust_runx, /home/pokybuild/yocto-worker/qemumips-alt/build/bu=
ild/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104,=
 line 179
> > |     #2: do_compile, /home/pokybuild/yocto-worker/qemumips-alt/build/b=
uild/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104=
, line 162
> > |     #3: main, /home/pokybuild/yocto-worker/qemumips-alt/build/build/t=
mp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104, line=
 202
> > NOTE: recipe rust-native-1.61.0-r0: task do_compile: Failed
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > The build error is solved by adding the libstdc++.a library on the Host=
 (in my case Ubuntu) machine. Now, I am working on to add this library to t=
he Yocto nativesdk sysroot to avoid the dependency on the Host machine. I m=
ade several attempts to add the libstdc++ lib to the nativesdk sysroot befo=
re the rust / rust-llvm recipe 'do_compile' task is executed. In the build =
directory I can see the libstdc++.a is available but it is not considered b=
y the rust recipe and still the above mentoned error is appearing. When I a=
dded dependencies, I observed  errors like 'nothing provides libstdc++ / li=
bstdc++-static / libstdc++-staticdev / virtual/nativesdk-libstdc++-staticde=
v ... etc'.
> >
> > Below are the few locations in build/tmp/work/ directory where libstdc+=
+.a lib is available.
> > ./x86_64-nativesdk-pokysdk-linux/meta-environment-qemux86-64/1.0-r8/rec=
ipe-sysroot/usr/lib/libstdc++.a
> > ./x86_64-nativesdk-pokysdk-linux/rust-cross-canadian-x86-64/1.61.0-r0/r=
ecipe-sysroot/usr/lib/libstdc++.a
> > ./x86_64-nativesdk-pokysdk-linux/rust-tools-cross-canadian-x86-64/1.61.=
0-r0/recipe-sysroot/usr/lib/libstdc++.a
> >
> >
> > Could someone give some hints on which recipe should provide the libstd=
c++-static lib and how can I made it is considered by the rust recipe?
> >
> > The link https://github.com/rust-lang/rust/issues/94983#issue-117038686=
0 describes the libstdc++ dependency with rust update.
> >
> >
> >
> >
> > Thanks,
> > Sundeep K.
> >
> >
> > On 13-06-2022 18:56, Alexander Kanavin wrote:
> >
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > To get started quicker, I have a recipe update commit on top of this
> > branch, which you are welcome to cherry-pick:
> > https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin/package-ver=
sion-updates-later
> >
> > Alex
> >
> > On Mon, 13 Jun 2022 at 15:01, Randy MacLeod <randy.macleod@windriver.co=
m> wrote:
> >
> > On 2022-06-13 04:15, Alexander Kanavin wrote:
> >
> > Rust 1.61 is held by rust-native regressing on red hat distros; fedora
> > 34/35, centos/alma 8 all show this:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/3151
> >
> > Alex
> >
> > Thanks Alex.
> >
> >
> > Naveen, Sundeep,
> >
> > It looks like there's been a change to how or if libstdc++-static is us=
ed:
> >
> > https://github.com/rust-lang/rust/issues/97138
> >
> >
> > This change is part of 1.61:
> >
> > https://github.com/rust-lang/rust/pull/94832
> >
> > so perhaps we need to change our recipe. Anyway, I only took a quick lo=
ok.
> > Please work on this issue ASAP.
> >
> > ../Randy
> >
> >
> > On Wed, 1 Jun 2022 at 18:19, Auto Upgrade Helper <auh@yoctoproject.org>=
 wrote:
> >
> > Hello,
> >
> > this email is a notification from the Auto Upgrade Helper
> > that the automatic attempt to upgrade the recipe *rust-llvm* to *1.61.0=
* has Failed (devtool error).
> >
> > Detailed error information:
> >
> > The following devtool command failed:  finish -f rust-llvm /home/pokybu=
ild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust
> > NOTE: Starting bitbake server...
> > WARNING: Host distribution "almalinux-8.6" has not been validated with =
this version of the build system; you may possibly experience unexpected fa=
ilures. It is recommended that you use a tested distribution.
> > Loading cache...done.
> > Loaded 1643 entries from dependency cache.
> > Parsing recipes...done.
> > Parsing of 884 .bb files complete (883 cached, 1 parsed). 1644 targets,=
 35 skipped, 0 masked, 0 errors.
> >
> > Summary: There was 1 WARNING message.
> >
> > ERROR: Traceback (most recent call last):
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/cookerdata.py", line 162, in wrapped
> >      return func(fn, *args)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/cookerdata.py", line 187, in parse_config_file
> >      return bb.parse.handle(fn, data, include)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/__init__.py", line 107, in handle
> >      return h['handle'](fn, data, include)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/parse_py/ConfHandler.py", line 118, in handle
> >      abs_fn =3D resolve_file(fn, data)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/__init__.py", line 133, in resolve_file
> >      raise IOError(errno.ENOENT, "file %s not found" % fn)
> > FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/buil=
d/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
> >
> > ERROR: Unable to parse /home/pokybuild/yocto-worker/auh/build/build/pok=
y/meta/recipes-devtools/rust/conf/layer.conf: [Errno 2] file /home/pokybuil=
d/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.c=
onf not found
> > Traceback (most recent call last):
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/cookerdata.py", line 162, in wrapped
> >      return func(fn, *args)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/cookerdata.py", line 187, in parse_config_file
> >      return bb.parse.handle(fn, data, include)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/__init__.py", line 107, in handle
> >      return h['handle'](fn, data, include)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/parse_py/ConfHandler.py", line 118, in handle
> >      abs_fn =3D resolve_file(fn, data)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/__init__.py", line 133, in resolve_file
> >      raise IOError(errno.ENOENT, "file %s not found" % fn)
> > FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/buil=
d/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
> >
> > During handling of the above exception, another exception occurred:
> >
> > Traceback (most recent call last):
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devt=
ool", line 334, in <module>
> >      ret =3D main()
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devt=
ool", line 321, in main
> >      ret =3D args.func(args, config, basepath, workspace)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/=
devtool/standard.py", line 2108, in finish
> >      updated, appendfile, removed =3D _update_recipe(args.recipename, w=
orkspace, rd, args.mode, appendlayerdir, wildcard_version=3DTrue, no_remove=
=3DFalse, no_report_remove=3Dremoving_original, initial_rev=3Dargs.initial_=
rev, dry_run_outdir=3Ddry_run_outdir, no_overrides=3Dargs.no_overrides, for=
ce_patch_refresh=3Dargs.force_patch_refresh)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/=
devtool/standard.py", line 1814, in _update_recipe
> >      updated, appendf, removed =3D _update_recipe_patch(recipename, wor=
kspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_repor=
t_remove, initial_rev, dry_run_outdir, force_patch_refresh)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/=
devtool/standard.py", line 1671, in _update_recipe_patch
> >      redirect_output=3Ddry_run_outdir)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/=
recipeutils.py", line 705, in bbappend_recipe
> >      appendpath, pathok =3D get_bbappend_path(rd, destlayerdir, wildcar=
dver)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/=
recipeutils.py", line 632, in get_bbappend_path
> >      confdata =3D bb.cookerdata.parse_config_file(destlayerconf, confda=
ta)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/cookerdata.py", line 167, in wrapped
> >      raise bb.BBHandledException()
> > bb.BBHandledException
> >
> >
> > Please review the attached files for further information and build/upda=
te failures.
> > Any problem please file a bug at https://bugzilla.yoctoproject.org/ente=
r_bug.cgi?product=3DAutomated%20Update%20Handler
> >
> > Regards,
> > The Upgrade Helper
> >
> >
> >
> > --
> > # Randy MacLeod
> > # Wind River Linux
> >
> > .
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167223): https://lists.openembedded.org/g/openembedde=
d-core/message/167223
> Mute This Topic: https://lists.openembedded.org/mt/91480159/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

