Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <429629c2-95d3-7a9f-df3f-e8ddf2ba5b2f@gmail.com>
Date: Wed, 22 Jun 2022 11:54:19 +0530
MIME-Version: 1.0
Subject: Re: [OE-core] [AUH] rust-llvm: upgrading to 1.61.0 FAILED
References: <01010181200fec93-2abce4ac-3ed8-402a-8127-c076f733d788-000000@us-west-2.amazonses.com>
 <CANNYZj9cfUQkS+oDpW7hK5Zi4JWnsmYnEeU5+X-9onRcMSw0fA@mail.gmail.com>
 <260249af-2c6a-dbde-96a3-65a80c451ea8@windriver.com>
 <CANNYZj_WDmAaji4tiUQi9=w1bwMTQ810tO-HUXqroSMAZa21Mg@mail.gmail.com>
From: "Sundeep KOKKONDA" <sundeep.kokkonda@gmail.com>
In-Reply-To: <CANNYZj_WDmAaji4tiUQi9=w1bwMTQ810tO-HUXqroSMAZa21Mg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------ZxVbC40V8T40HOXq26dkO4ru"
Content-Language: en-US
List-id: <openembedded-core.lists.openembedded.org>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: "Gowda, Naveen" <naveen.gowda@windriver.com>, Randy MacLeod <randy.macleod@windriver.com>, Alexander Kanavin <alex.kanavin@gmail.com>

--------------ZxVbC40V8T40HOXq26dkO4ru
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hi,

In Yocto, the Rust upgrade from 1.60.0 -> 1.61.0 enables a dependency on 
the libstdc++-static library for rust-llvm. With this upgrade build is 
aborted for 'bitbake core-image-minimal -cpopulate_sdk' with below error.

======= Error Text =======
| error: could not compile `rustc_llvm` due to previous error
|
| Caused by:
|   process didn't exit successfully: 
`/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/bootstrap/debug/rustc 
--crate-name rustc_llvm --edition=2021 compiler/rustc_llvm/src/lib.rs 
--error-format=json 
--json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type 
lib --emit=dep-info,metadata,link -C opt-level=3 -C embed-bitcode=no -C 
debuginfo=0 -C metadata=5acc17ffb3ce44a9 -C 
extra-filename=-5acc17ffb3ce44a9 --out-dir 
/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage0-rustc/x86_64-unknown-linux-gnu/release/deps 
--target x86_64-unknown-linux-gnu -C 
linker=/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/wrapper/build-rust-ccld 
-L 
dependency=/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage0-rustc/x86_64-unknown-linux-gnu/release/deps 
-L 
dependency=/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage0-rustc/release/deps 
--extern 
libc=/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage0-rustc/x86_64-unknown-linux-gnu/release/deps/liblibc-be8f25d7c5c0a059.rmeta 
--cfg=bootstrap -Csymbol-mangling-version=v0 -Zmacro-backtrace 
-Clink-args=-Wl,-z,origin '-Clink-args=-Wl,-rpath,$ORIGIN/../lib' 
-Ztls-model=initial-exec -Zunstable-options '-Wrustc::internal' 
-Cprefer-dynamic -Z binary-dep-depinfo -L 
native=/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage0-rustc/x86_64-unknown-linux-gnu/release/build/rustc_llvm-688051e8c720f5a9/out 
-L 
native=/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/recipe-sysroot-native/usr/lib/llvm-rust/lib 
-L 
native=/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-llvm-native/1.61.0-r0/recipe-sysroot-native/usr/lib 
-L 
native=/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-llvm-native/1.61.0-r0/recipe-sysroot-native/lib 
-L native= --cfg 'llvm_component="aarch64"' --cfg 'llvm_component="arm"' 
--cfg 'llvm_component="asmparser"' --cfg 'llvm_component="bitreader"' 
--cfg 'llvm_component="bitwriter"' --cfg 'llvm_component="coverage"' 
--cfg 'llvm_component="instrumentation"' --cfg 'llvm_component="ipo"' 
--cfg 'llvm_component="linker"' --cfg 'llvm_component="lto"' --cfg 
'llvm_component="mips"' --cfg 'llvm_component="powerpc"' --cfg 
'llvm_component="riscv"' --cfg 'llvm_component="x86"' -l 
static=llvm-wrapper -l static=LLVMX86TargetMCA -l static=LLVMMCA -l 
static=LLVMX86Disassembler -l static=LLVMX86AsmParser -l 
static=LLVMX86CodeGen -l static=LLVMX86Desc -l static=LLVMX86Info -l 
static=LLVMRISCVDisassembler -l static=LLVMRISCVAsmParser -l 
static=LLVMRISCVCodeGen -l static=LLVMRISCVDesc -l static=LLVMRISCVInfo 
-l static=LLVMPowerPCDisassembler -l static=LLVMPowerPCAsmParser -l 
static=LLVMPowerPCCodeGen -l static=LLVMPowerPCDesc -l 
static=LLVMPowerPCInfo -l static=LLVMMipsDisassembler -l 
static=LLVMMipsAsmParser -l static=LLVMMipsCodeGen -l 
static=LLVMMipsDesc -l static=LLVMMipsInfo -l static=LLVMLTO -l 
static=LLVMPasses -l static=LLVMCoroutines -l static=LLVMObjCARCOpts -l 
static=LLVMExtensions -l static=LLVMCoverage -l 
static=LLVMARMDisassembler -l static=LLVMARMAsmParser -l 
static=LLVMARMCodeGen -l static=LLVMipo -l static=LLVMInstrumentation -l 
static=LLVMVectorize -l static=LLVMLinker -l static=LLVMIRReader -l 
static=LLVMAsmParser -l static=LLVMFrontendOpenMP -l static=LLVMARMDesc 
-l static=LLVMARMUtils -l static=LLVMARMInfo -l 
static=LLVMAArch64Disassembler -l static=LLVMMCDisassembler -l 
static=LLVMAArch64AsmParser -l static=LLVMAArch64CodeGen -l 
static=LLVMCFGuard -l static=LLVMGlobalISel -l static=LLVMSelectionDAG 
-l static=LLVMAsmPrinter -l static=LLVMDebugInfoMSF -l 
static=LLVMCodeGen -l static=LLVMTarget -l static=LLVMScalarOpts -l 
static=LLVMInstCombine -l static=LLVMAggressiveInstCombine -l 
static=LLVMTransformUtils -l static=LLVMBitWriter -l static=LLVMAnalysis 
-l static=LLVMProfileData -l static=LLVMDebugInfoDWARF -l 
static=LLVMObject -l static=LLVMTextAPI -l static=LLVMMCParser -l 
static=LLVMBitReader -l static=LLVMCore -l static=LLVMRemarks -l 
static=LLVMBitstreamReader -l static=LLVMAArch64Desc -l 
static=LLVMAArch64Utils -l static=LLVMAArch64Info -l static=LLVMMC -l 
static=LLVMDebugInfoCodeView -l static=LLVMBinaryFormat -l 
static=LLVMSupport -l static=LLVMDemangle -l dylib=rt -l dylib=dl -l 
dylib=pthread -l dylib=m -l static=stdc++` (exit status: 1)
| warning: build failed, waiting for other jobs to finish...
|     Building [====================>    ] 186/218: rustc_ast_passes, 
rustc_e...
|     Building [====================>    ] 187/218: rustc_expand, 
rustc_parse...
|     Building [====================>    ] 188/218: rustc_expand, 
rustc_parse...
|     Building [====================>    ] 189/218: rustc_parse, 
rustc_builti...
|     Building [====================>    ] 190/218: rustc_parse, 
rustc_middle
|     Building [====================>    ] 191/218: rustc_middle
| error: build failed
| command did not execute successfully: 
"/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rust-snapshot/bin/cargo" 
"build" "--target" "x86_64-unknown-linux-gnu" "-Zbinary-dep-depinfo" 
"-j" "16" "-v" "--release" "--frozen" "--features" "llvm max_level_info" 
"--manifest-path" 
"/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/compiler/rustc/Cargo.toml" 
"--message-format" "json-render-diagnostics"
| expected success, got: exit status: 101
| Traceback (most recent call last):
|   File 
"/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstrap.py", 
line 1341, in <module>
|     main()
|   File 
"/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstrap.py", 
line 1324, in main
|     bootstrap(help_triggered)
|   File 
"/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstrap.py", 
line 1310, in bootstrap
|     run(args, env=env, verbose=build.verbose, is_bootstrap=True)
|   File 
"/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstrap.py", 
line 185, in run
|     raise RuntimeError(err)
| RuntimeError: failed to run: 
/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/bootstrap/debug/bootstrap 
-j 16 build --stage 2 --verbose
| WARNING: 
/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104:179 
exit 1 from 'python3 src/bootstrap/bootstrap.py -j 16 "$@" --verbose'
| WARNING: Backtrace (BB generated script):
|     #1: rust_runx, 
/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104, 
line 179
|     #2: do_compile, 
/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104, 
line 162
|     #3: main, 
/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104, 
line 202
NOTE: recipe rust-native-1.61.0-r0: task do_compile: Failed
==========================================

The build error is solved by adding the libstdc++.a library on the Host 
(in my case Ubuntu) machine. Now, I am working on to add this library to 
the Yocto nativesdk sysroot to avoid the dependency on the Host machine. 
I made several attempts to add the libstdc++ lib to the nativesdk 
sysroot before the rust / rust-llvm recipe 'do_compile' task is 
executed. In the build directory I can see the libstdc++.a is available 
but it is not considered by the rust recipe and still the above mentoned 
error is appearing. When I added dependencies, I observed  errors like 
'nothing provides libstdc++ / libstdc++-static / libstdc++-staticdev / 
virtual/nativesdk-libstdc++-staticdev ... etc'.

_Below are the few locations in build/tmp/work/ directory where 
libstdc++.a lib is available._
/./x86_64-nativesdk-pokysdk-linux/meta-environment-qemux86-64/1.0-r8/recipe-sysroot/usr/lib/libstdc++.a//
//./x86_64-nativesdk-pokysdk-linux/rust-cross-canadian-x86-64/1.61.0-r0/recipe-sysroot/usr/lib/libstdc++.a//
//./x86_64-nativesdk-pokysdk-linux/rust-tools-cross-canadian-x86-64/1.61.0-r0/recipe-sysroot/usr/lib/libstdc++.a/


Could someone give some hints on which recipe should provide the 
libstdc++-static lib and how can I made it is considered by the rust recipe?

The link 
_https://github.com/rust-lang/rust/issues/94983#issue-1170386860_ 
describes the libstdc++ dependency with rust update.




Thanks,
Sundeep K.


On 13-06-2022 18:56, Alexander Kanavin wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> To get started quicker, I have a recipe update commit on top of this
> branch, which you are welcome to cherry-pick:
> https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/package-version-updates-later
>
> Alex
>
> On Mon, 13 Jun 2022 at 15:01, Randy MacLeod<randy.macleod@windriver.com>  wrote:
>> On 2022-06-13 04:15, Alexander Kanavin wrote:
>>> Rust 1.61 is held by rust-native regressing on red hat distros; fedora
>>> 34/35, centos/alma 8 all show this:
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/3151
>>>
>>> Alex
>> Thanks Alex.
>>
>>
>> Naveen, Sundeep,
>>
>> It looks like there's been a change to how or if libstdc++-static is used:
>>
>> https://github.com/rust-lang/rust/issues/97138
>>
>>
>> This change is part of 1.61:
>>
>> https://github.com/rust-lang/rust/pull/94832
>>
>> so perhaps we need to change our recipe. Anyway, I only took a quick look.
>> Please work on this issue ASAP.
>>
>> ../Randy
>>
>>
>>> On Wed, 1 Jun 2022 at 18:19, Auto Upgrade Helper<auh@yoctoproject.org>  wrote:
>>>> Hello,
>>>>
>>>> this email is a notification from the Auto Upgrade Helper
>>>> that the automatic attempt to upgrade the recipe *rust-llvm* to *1.61.0* has Failed (devtool error).
>>>>
>>>> Detailed error information:
>>>>
>>>> The following devtool command failed:  finish -f rust-llvm /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust
>>>> NOTE: Starting bitbake server...
>>>> WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
>>>> Loading cache...done.
>>>> Loaded 1643 entries from dependency cache.
>>>> Parsing recipes...done.
>>>> Parsing of 884 .bb files complete (883 cached, 1 parsed). 1644 targets, 35 skipped, 0 masked, 0 errors.
>>>>
>>>> Summary: There was 1 WARNING message.
>>>>
>>>> ERROR: Traceback (most recent call last):
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 162, in wrapped
>>>>       return func(fn, *args)
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 187, in parse_config_file
>>>>       return bb.parse.handle(fn, data, include)
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 107, in handle
>>>>       return h['handle'](fn, data, include)
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 118, in handle
>>>>       abs_fn = resolve_file(fn, data)
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 133, in resolve_file
>>>>       raise IOError(errno.ENOENT, "file %s not found" % fn)
>>>> FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
>>>>
>>>> ERROR: Unable to parse /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
>>>> Traceback (most recent call last):
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 162, in wrapped
>>>>       return func(fn, *args)
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 187, in parse_config_file
>>>>       return bb.parse.handle(fn, data, include)
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 107, in handle
>>>>       return h['handle'](fn, data, include)
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 118, in handle
>>>>       abs_fn = resolve_file(fn, data)
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 133, in resolve_file
>>>>       raise IOError(errno.ENOENT, "file %s not found" % fn)
>>>> FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
>>>>
>>>> During handling of the above exception, another exception occurred:
>>>>
>>>> Traceback (most recent call last):
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 334, in <module>
>>>>       ret = main()
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 321, in main
>>>>       ret = args.func(args, config, basepath, workspace)
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 2108, in finish
>>>>       updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1814, in _update_recipe
>>>>       updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1671, in _update_recipe_patch
>>>>       redirect_output=dry_run_outdir)
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/recipeutils.py", line 705, in bbappend_recipe
>>>>       appendpath, pathok = get_bbappend_path(rd, destlayerdir, wildcardver)
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/recipeutils.py", line 632, in get_bbappend_path
>>>>       confdata = bb.cookerdata.parse_config_file(destlayerconf, confdata)
>>>>     File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 167, in wrapped
>>>>       raise bb.BBHandledException()
>>>> bb.BBHandledException
>>>>
>>>>
>>>> Please review the attached files for further information and build/update failures.
>>>> Any problem please file a bug athttps://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>>>>
>>>> Regards,
>>>> The Upgrade Helper
>>>>
>>>> 
>>>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>
> .


--------------ZxVbC40V8T40HOXq26dkO4ru
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <div class="moz-cite-prefix">Hi,<br>
        <br>
        In Yocto, the Rust upgrade from 1.60.0 -&gt; 1.61.0 enables a
        dependency on the libstdc++-static library for rust-llvm. With
        this upgrade build is aborted for 'bitbake core-image-minimal
        -cpopulate_sdk' with below error.<br>
        <br>
        ======= Error Text =======<br>
        <font size="1" face="Courier New">| error: could not compile
          `rustc_llvm` due to previous error<br>
          | <br>
          | Caused by:<br>
          |   process didn't exit successfully:
`/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/bootstrap/debug/rustc
          --crate-name rustc_llvm --edition=2021
          compiler/rustc_llvm/src/lib.rs --error-format=json
          --json=diagnostic-rendered-ansi,artifacts,future-incompat
          --crate-type lib --emit=dep-info,metadata,link -C opt-level=3
          -C embed-bitcode=no -C debuginfo=0 -C
          metadata=5acc17ffb3ce44a9 -C extra-filename=-5acc17ffb3ce44a9
          --out-dir
/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage0-rustc/x86_64-unknown-linux-gnu/release/deps
          --target x86_64-unknown-linux-gnu -C
linker=/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/wrapper/build-rust-ccld
          -L
dependency=/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage0-rustc/x86_64-unknown-linux-gnu/release/deps
          -L
dependency=/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage0-rustc/release/deps
          --extern
libc=/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage0-rustc/x86_64-unknown-linux-gnu/release/deps/liblibc-be8f25d7c5c0a059.rmeta
          --cfg=bootstrap -Csymbol-mangling-version=v0 -Zmacro-backtrace
          -Clink-args=-Wl,-z,origin
          '-Clink-args=-Wl,-rpath,$ORIGIN/../lib'
          -Ztls-model=initial-exec -Zunstable-options
          '-Wrustc::internal' -Cprefer-dynamic -Z binary-dep-depinfo -L
native=/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage0-rustc/x86_64-unknown-linux-gnu/release/build/rustc_llvm-688051e8c720f5a9/out
          -L
native=/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/recipe-sysroot-native/usr/lib/llvm-rust/lib
          -L
native=/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-llvm-native/1.61.0-r0/recipe-sysroot-native/usr/lib
          -L
native=/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-llvm-native/1.61.0-r0/recipe-sysroot-native/lib
          -L native= --cfg 'llvm_component="aarch64"' --cfg
          'llvm_component="arm"' --cfg 'llvm_component="asmparser"'
          --cfg 'llvm_component="bitreader"' --cfg
          'llvm_component="bitwriter"' --cfg 'llvm_component="coverage"'
          --cfg 'llvm_component="instrumentation"' --cfg
          'llvm_component="ipo"' --cfg 'llvm_component="linker"' --cfg
          'llvm_component="lto"' --cfg 'llvm_component="mips"' --cfg
          'llvm_component="powerpc"' --cfg 'llvm_component="riscv"'
          --cfg 'llvm_component="x86"' -l static=llvm-wrapper -l
          static=LLVMX86TargetMCA -l static=LLVMMCA -l
          static=LLVMX86Disassembler -l static=LLVMX86AsmParser -l
          static=LLVMX86CodeGen -l static=LLVMX86Desc -l
          static=LLVMX86Info -l static=LLVMRISCVDisassembler -l
          static=LLVMRISCVAsmParser -l static=LLVMRISCVCodeGen -l
          static=LLVMRISCVDesc -l static=LLVMRISCVInfo -l
          static=LLVMPowerPCDisassembler -l static=LLVMPowerPCAsmParser
          -l static=LLVMPowerPCCodeGen -l static=LLVMPowerPCDesc -l
          static=LLVMPowerPCInfo -l static=LLVMMipsDisassembler -l
          static=LLVMMipsAsmParser -l static=LLVMMipsCodeGen -l
          static=LLVMMipsDesc -l static=LLVMMipsInfo -l static=LLVMLTO
          -l static=LLVMPasses -l static=LLVMCoroutines -l
          static=LLVMObjCARCOpts -l static=LLVMExtensions -l
          static=LLVMCoverage -l static=LLVMARMDisassembler -l
          static=LLVMARMAsmParser -l static=LLVMARMCodeGen -l
          static=LLVMipo -l static=LLVMInstrumentation -l
          static=LLVMVectorize -l static=LLVMLinker -l
          static=LLVMIRReader -l static=LLVMAsmParser -l
          static=LLVMFrontendOpenMP -l static=LLVMARMDesc -l
          static=LLVMARMUtils -l static=LLVMARMInfo -l
          static=LLVMAArch64Disassembler -l static=LLVMMCDisassembler -l
          static=LLVMAArch64AsmParser -l static=LLVMAArch64CodeGen -l
          static=LLVMCFGuard -l static=LLVMGlobalISel -l
          static=LLVMSelectionDAG -l static=LLVMAsmPrinter -l
          static=LLVMDebugInfoMSF -l static=LLVMCodeGen -l
          static=LLVMTarget -l static=LLVMScalarOpts -l
          static=LLVMInstCombine -l static=LLVMAggressiveInstCombine -l
          static=LLVMTransformUtils -l static=LLVMBitWriter -l
          static=LLVMAnalysis -l static=LLVMProfileData -l
          static=LLVMDebugInfoDWARF -l static=LLVMObject -l
          static=LLVMTextAPI -l static=LLVMMCParser -l
          static=LLVMBitReader -l static=LLVMCore -l static=LLVMRemarks
          -l static=LLVMBitstreamReader -l static=LLVMAArch64Desc -l
          static=LLVMAArch64Utils -l static=LLVMAArch64Info -l
          static=LLVMMC -l static=LLVMDebugInfoCodeView -l
          static=LLVMBinaryFormat -l static=LLVMSupport -l
          static=LLVMDemangle -l dylib=rt -l dylib=dl -l dylib=pthread
          -l dylib=m -l static=stdc++` (exit status: 1)<br>
          | warning: build failed, waiting for other jobs to finish...<br>
          |     Building [====================&gt;    ] 186/218:
          rustc_ast_passes, rustc_e...<br>
          |     Building [====================&gt;    ] 187/218:
          rustc_expand, rustc_parse...<br>
          |     Building [====================&gt;    ] 188/218:
          rustc_expand, rustc_parse...<br>
          |     Building [====================&gt;    ] 189/218:
          rustc_parse, rustc_builti...<br>
          |     Building [====================&gt;    ] 190/218:
          rustc_parse, rustc_middle<br>
          |     Building [====================&gt;    ] 191/218:
          rustc_middle<br>
          | error: build failed<br>
          | command did not execute successfully:
"/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rust-snapshot/bin/cargo"
          "build" "--target" "x86_64-unknown-linux-gnu"
          "-Zbinary-dep-depinfo" "-j" "16" "-v" "--release" "--frozen"
          "--features" "llvm max_level_info" "--manifest-path"
"/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/compiler/rustc/Cargo.toml"
          "--message-format" "json-render-diagnostics"<br>
          | expected success, got: exit status: 101<br>
          | Traceback (most recent call last):<br>
          |   File
"/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstrap.py",
          line 1341, in &lt;module&gt;<br>
          |     main()<br>
          |   File
"/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstrap.py",
          line 1324, in main<br>
          |     bootstrap(help_triggered)<br>
          |   File
"/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstrap.py",
          line 1310, in bootstrap<br>
          |     run(args, env=env, verbose=build.verbose,
          is_bootstrap=True)<br>
          |   File
"/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstrap.py",
          line 185, in run<br>
          |     raise RuntimeError(err)<br>
          | RuntimeError: failed to run:
/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/bootstrap/debug/bootstrap
          -j 16 build --stage 2 --verbose<br>
          | WARNING:
/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104:179
          exit 1 from 'python3 src/bootstrap/bootstrap.py -j 16 "$@"
          --verbose'<br>
          | WARNING: Backtrace (BB generated script):<br>
          |     #1: rust_runx,
/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104,
          line 179<br>
          |     #2: do_compile,
/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104,
          line 162<br>
          |     #3: main,
/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104,
          line 202<br>
          NOTE: recipe rust-native-1.61.0-r0: task do_compile: Failed</font><br>
        ==========================================<br>
        <br>
        The build error is solved by adding the libstdc++.a library on
        the Host (in my case Ubuntu) machine. Now, I am working on to
        add this library to the Yocto nativesdk sysroot to avoid the
        dependency on the Host machine. I made several attempts to add
        the libstdc++ lib to the nativesdk sysroot before the rust /
        rust-llvm recipe 'do_compile' task is executed. In the build
        directory I can see the libstdc++.a is available but it is not
        considered by the rust recipe and still the above mentoned error
        is appearing. When I added dependencies, I observed  errors like
        'nothing provides libstdc++ / libstdc++-static /
        libstdc++-staticdev / virtual/nativesdk-libstdc++-staticdev ...
        etc'.<br>
        <br>
        <u>Below are the few locations in build/tmp/work/ directory
          where libstdc++.a lib is available.</u><br>
        <i>./x86_64-nativesdk-pokysdk-linux/meta-environment-qemux86-64/1.0-r8/recipe-sysroot/usr/lib/libstdc++.a</i><i><br>
        </i><i>./x86_64-nativesdk-pokysdk-linux/rust-cross-canadian-x86-64/1.61.0-r0/recipe-sysroot/usr/lib/libstdc++.a</i><i><br>
        </i><i>./x86_64-nativesdk-pokysdk-linux/rust-tools-cross-canadian-x86-64/1.61.0-r0/recipe-sysroot/usr/lib/libstdc++.a</i><br>
        <br>
        <br>
        Could someone give some hints on which recipe should provide the
        libstdc++-static lib and how can I made it is considered by the
        rust recipe?<br>
        <br>
        The link <u><a class="moz-txt-link-freetext"
            href="https://github.com/rust-lang/rust/issues/94983#issue-1170386860">https://github.com/rust-lang/rust/issues/94983#issue-1170386860</a></u>
        describes the libstdc++ dependency with rust update.<br>
      </div>
      <div class="moz-cite-prefix"><br>
      </div>
      <div class="moz-cite-prefix"><br>
      </div>
      <div class="moz-cite-prefix"><br>
      </div>
      <div class="moz-cite-prefix"><br>
      </div>
      <div class="moz-cite-prefix">Thanks,</div>
      Sundeep K.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 13-06-2022 18:56, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj_WDmAaji4tiUQi9=w1bwMTQ810tO-HUXqroSMAZa21Mg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

To get started quicker, I have a recipe update commit on top of this
branch, which you are welcome to cherry-pick:
<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/package-version-updates-later">https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/package-version-updates-later</a>

Alex

On Mon, 13 Jun 2022 at 15:01, Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:randy.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 2022-06-13 04:15, Alexander Kanavin wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Rust 1.61 is held by rust-native regressing on red hat distros; fedora
34/35, centos/alma 8 all show this:
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/3151">https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/3151</a>

Alex
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Thanks Alex.


Naveen, Sundeep,

It looks like there's been a change to how or if libstdc++-static is used:

<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/issues/97138">https://github.com/rust-lang/rust/issues/97138</a>


This change is part of 1.61:

<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/pull/94832">https://github.com/rust-lang/rust/pull/94832</a>

so perhaps we need to change our recipe. Anyway, I only took a quick look.
Please work on this issue ASAP.

../Randy


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
On Wed, 1 Jun 2022 at 18:19, Auto Upgrade Helper <a class="moz-txt-link-rfc2396E" href="mailto:auh@yoctoproject.org">&lt;auh@yoctoproject.org&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rust-llvm* to *1.61.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f rust-llvm /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1643 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1644 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.

ERROR: Traceback (most recent call last):
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 162, in wrapped
     return func(fn, *args)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 187, in parse_config_file
     return bb.parse.handle(fn, data, include)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 107, in handle
     return h['handle'](fn, data, include)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 118, in handle
     abs_fn = resolve_file(fn, data)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 133, in resolve_file
     raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found

ERROR: Unable to parse /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
Traceback (most recent call last):
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 162, in wrapped
     return func(fn, *args)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 187, in parse_config_file
     return bb.parse.handle(fn, data, include)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 107, in handle
     return h['handle'](fn, data, include)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 118, in handle
     abs_fn = resolve_file(fn, data)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 133, in resolve_file
     raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 334, in &lt;module&gt;
     ret = main()
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 321, in main
     ret = args.func(args, config, basepath, workspace)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 2108, in finish
     updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1814, in _update_recipe
     updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1671, in _update_recipe_patch
     redirect_output=dry_run_outdir)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/recipeutils.py", line 705, in bbappend_recipe
     appendpath, pathok = get_bbappend_path(rd, destlayerdir, wildcardver)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/recipeutils.py", line 632, in get_bbappend_path
     confdata = bb.cookerdata.parse_config_file(destlayerconf, confdata)
   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 167, in wrapped
     raise bb.BBHandledException()
bb.BBHandledException


Please review the attached files for further information and build/update failures.
Any problem please file a bug at <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler</a>

Regards,
The Upgrade Helper



</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
--
# Randy MacLeod
# Wind River Linux

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">.
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------ZxVbC40V8T40HOXq26dkO4ru--
