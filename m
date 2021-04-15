Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.7865.1618497027108529543
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 07:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UaSiVRf/;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id y12so18295582qtx.11
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 07:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Cr1Q1khwtCu4neRU5yjmWBHhtumurKkrrwL2D8P57l4=;
        b=UaSiVRf/Vj2dpteT1kpcShyB4LAbEHyTLD3mGAeCRqdlahYFlzhjo6x0PB2r1wTtmX
         RNHAQRb/x6UZSxCmGz6kHqCOW4OGrHqkK+Z1tTTXFWZ/7OpvC+BTxgThnvqdnVcSqZjd
         0h9DT4Cpma+9do2iz/BJgyBx0J8yyxMUgiKKJJE9RuKhcWr0psSNpaW1MteZFlY3iDrQ
         gRRqYPXQkUEL0RI8s9JOtz0Chxa81Pn5qwTUeYY6xlly1vO8NUN2wE2NFp5bQPG+d/my
         KWXOkSRHmpW+0kotugY2t0g2h4z3uUVjaykDBhcclgbj53XAq2ROW6bjWLSVBCC6VOAt
         p/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Cr1Q1khwtCu4neRU5yjmWBHhtumurKkrrwL2D8P57l4=;
        b=pVFue8N8+IB10MK6zbxR9g3A/NQSMNqIN+cMCWWXMiiPP4vL/5USuxwnX88Gf6Hxkc
         l8ft19OCGIViWMrJGbuxLiyQl8wY/q15lSRl7t1tAGyDJ2B1BGY4Ax17CQ6Al5XOgGqT
         zSgK0yj4e/UNw+2UI2IKLOUmThuV/CPdy0qESmI8VVfN3QkRMtrqG184qghsh61WItGQ
         RlkXInXAaODyHS5ZqJV+c96K2+msXNZzZDa77NZP30jaZwbJa177o3aFiV/k6a7QfDyQ
         +19VYC23x0K3LY1B25psB7PXvW45bsT+5HPrqFvreu9ArXtIZrD5fS9+CyMr2kdcSkaU
         ZJKw==
X-Gm-Message-State: AOAM530MBnganVMpZ3KVdhxCOZ4+1Nrc8ur9nlB/nuesngIh8KP8jnKD
	vzdlPegeg2SDoptixhGISQrVJd4SbfX0IigJju4=
X-Google-Smtp-Source: ABdhPJx0Vs4AqlSiDXYE8up1LXgKMELl9kKqizWiRSjzTsXlvmHlV+WxrBp14L7W5KkE/N0aithHZlwV9QLTWIEqaOU=
X-Received: by 2002:ac8:7b22:: with SMTP id l2mr3169615qtu.294.1618497025994;
 Thu, 15 Apr 2021 07:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210409115932.72453-1-vinay.m.engg@gmail.com> <CANNYZj85zmWjRe2KR53u_eF-DDf47eR9eOJnP1Ch0Df6COoAaA@mail.gmail.com>
In-Reply-To: <CANNYZj85zmWjRe2KR53u_eF-DDf47eR9eOJnP1Ch0Df6COoAaA@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Thu, 15 Apr 2021 20:00:13 +0530
Message-ID: <CANUMPcXvyCr_k7__2kyyAdH2N_x=Avw7HEENCZYs67b1-yJvhQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Rust cross testing integration with oe-selftest.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Sent patches as you requested. There are about 8 patches.
Mailing list link from
https://lists.openembedded.org/g/openembedded-core/message/150462  to
https://lists.openembedded.org/g/openembedded-core/message/150469

The patches are on top of "rmacleod/rust-wip-2021-02-02" branch.
$git clone  git://git.yoctoproject.org/poky-contrib -b
rmacleod/rust-wip-2021-02-02

Let me know in case of any more details needed.

Regards,
Vinay

On Sat, Apr 10, 2021 at 3:20 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> There are a few unrelated changes all bundled together - please split it=
 into several commits and properly describe each. Particularly rust-test.in=
c is huge, and does need a proper explanation of what is happening and why,=
 in both the commit message and inline comments. Do keep in mind: making th=
e code work is only half the job, the other half is explaining what happens=
 to other humans.
>
> Alex
>
> On Fri, 9 Apr 2021 at 13:59, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>>
>> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
>> ---
>>  meta/classes/rust-common.bbclass              |   5 +-
>>  meta/conf/bitbake.conf                        |   2 +-
>>  meta/lib/oeqa/selftest/cases/rust.py          |  41 ++
>>  meta/lib/oeqa/utils/qemurunner.py             |   8 +-
>>  meta/recipes-devtools/rust/rust-test.inc      | 504 ++++++++++++++++++
>>  .../recipes-devtools/rust/rust-test_1.46.0.bb |  12 +
>>  scripts/runqemu                               |  15 +-
>>  7 files changed, 583 insertions(+), 4 deletions(-)
>>  create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
>>  create mode 100644 meta/recipes-devtools/rust/rust-test.inc
>>  create mode 100644 meta/recipes-devtools/rust/rust-test_1.46.0.bb
>>
>> diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-commo=
n.bbclass
>> index ff7b9da8f3..fb75b07ba3 100644
>> --- a/meta/classes/rust-common.bbclass
>> +++ b/meta/classes/rust-common.bbclass
>> @@ -84,7 +84,10 @@ def rust_base_triple(d, thing):
>>      # This catches ARM targets and appends the necessary hard float bi=
ts
>>      if os =3D=3D "linux-gnueabi" or os =3D=3D "linux-musleabi":
>>          libc =3D bb.utils.contains('TUNE_FEATURES', 'callconvention-ha=
rd', 'hf', '', d)
>> -    return arch + vendor + '-' + os + libc
>> +    if d.getVar('TARGET_ARCH') =3D=3D 'mips64':
>> +       return arch + vendor + '-' + os + libc + 'abi64'
>> +    else:
>> +       return arch + vendor + '-' + os + libc
>>
>>  # Naming explanation
>>  # Yocto
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 3438be92b7..83e1b68071 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -483,7 +483,7 @@ HOSTTOOLS_DIR =3D "${TMPDIR}/hosttools"
>>  HOSTTOOLS +=3D " \
>>      [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp =
comm cp cpio \
>>      cpp cut date dd diff diffstat dirname du echo egrep env expand exp=
r false \
>> -    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip =
gzip \
>> +    fgrep file find flock g++ gawk gcc cc getconf getopt git grep gunz=
ip gzip \
>>      head hostname iconv id install ld ldd ln ls make md5sum mkdir mkfi=
fo mknod \
>>      mktemp mv nm objcopy objdump od patch perl pr printf pwd \
>>      python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq s=
h \
>> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selft=
est/cases/rust.py
>> new file mode 100644
>> index 0000000000..69a1a285a9
>> --- /dev/null
>> +++ b/meta/lib/oeqa/selftest/cases/rust.py
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: MIT
>> +import os
>> +from oeqa.core.decorator import OETestTag
>> +from oeqa.core.case import OEPTestResultTestCase
>> +from oeqa.selftest.case import OESelftestTestCase
>> +from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runq=
emu, Command
>> +
>> +class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
>> +
>> +       def run_check(self, *suites, ssh =3D None):
>> +               # configure ssh target
>> +               features =3D []
>> +               if ssh is not None:
>> +                       features.append('TOOLCHAIN_TEST_TARGET =3D "ssh=
"')
>> +                       features.append('TOOLCHAIN_TEST_HOST =3D "{0}"'=
.format(ssh))
>> +                       features.append('TOOLCHAIN_TEST_HOST_USER =3D "=
root"')
>> +                       features.append('TOOLCHAIN_TEST_HOST_PORT =3D "=
22"')
>> +               self.write_config("\n".join(features))
>> +
>> +               recipe =3D "rust-test"
>> +               bitbake("{} -c check".format(recipe))
>> +
>> +       def run_check_emulated(self, *args, **kwargs):
>> +               # build remote-test-server before image build
>> +               recipe =3D "rust-test"
>> +               bitbake("{} -c compile".format(recipe))
>> +               # build core-image-minimal with required packages
>> +               default_installed_packages =3D ["libgcc", "libstdc++", =
"libatomic", "libgomp"]
>> +               features =3D []
>> +               features.append('IMAGE_FEATURES +=3D "ssh-server-openss=
h"')
>> +               features.append('CORE_IMAGE_EXTRA_INSTALL +=3D "{0}"'.f=
ormat(" ".join(default_installed_packages)))
>> +               self.write_config("\n".join(features))
>> +               bitbake("core-image-minimal")
>> +               # wrap the execution with a qemu instance
>> +               with runqemu("core-image-minimal", runqemuparams =3D "n=
ographic slirp") as qemu:
>> +                       return self.run_check(*args, ssh=3Dqemu.ip, **k=
wargs)
>> +
>> +@OETestTag("toolchain-system")
>> +class RustSelfTestSystemEmulated(RustSelfTestBase):
>> +       def test_rust(self):
>> +               self.run_check_emulated("rust")
>> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qe=
murunner.py
>> index 77ec939ad7..aea7c624ec 100644
>> --- a/meta/lib/oeqa/utils/qemurunner.py
>> +++ b/meta/lib/oeqa/utils/qemurunner.py
>> @@ -184,7 +184,13 @@ class QemuRunner:
>>          # and analyze descendents in order to determine it.
>>          if os.path.exists(self.qemu_pidfile):
>>              os.remove(self.qemu_pidfile)
>> -        self.qemuparams =3D 'bootparams=3D"{0}" qemuparams=3D"-pidfile=
 {1}"'.format(bootparams, self.qemu_pidfile)
>> +
>> +        if "slirp" in launch_cmd:
>> +            self.use_slirp =3D True
>> +            self.qemuparams =3D 'bootparams=3D"{0}" qemuparams=3D"-pid=
file {1} -monitor telnet:127.0.0.1:1234,server,nowait -serial mon:stdio -se=
rial null"'.format(bootparams, self.qemu_pidfile)
>> +        else:
>> +            self.qemuparams =3D 'bootparams=3D"{0}" qemuparams=3D"-pid=
file {1}"'.format(bootparams, self.qemu_pidfile)
>> +
>>          if qemuparams:
>>              self.qemuparams =3D self.qemuparams[:-1] + " " + qemuparam=
s + " " + '\"'
>>
>> diff --git a/meta/recipes-devtools/rust/rust-test.inc b/meta/recipes-de=
vtools/rust/rust-test.inc
>> new file mode 100644
>> index 0000000000..0a13b3e0d8
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rust/rust-test.inc
>> @@ -0,0 +1,504 @@
>> +HOMEPAGE =3D "http://www.rust-lang.org"
>> +SECTION =3D "devel"
>> +LICENSE =3D "MIT | Apache-2.0"
>> +
>> +inherit rust
>> +inherit cargo_common
>> +
>> +DEPENDS +=3D "file-native python3-native"
>> +DEPENDS_append_class-native =3D " rust-llvm-native"
>> +
>> +# In case of x86_64 target we setting this path to location of "x86_64=
-poky-linux.json".
>> +# This is to differentiate cross target and build in config.toml file.
>> +export RUST_TARGET_PATH =3D "${STAGING_LIBDIR_NATIVE}/rustlib"
>> +
>> +export FORCE_CRATE_HASH=3D"${BB_TASKHASH}"
>> +
>> +#export YOCTO_ALTERNATE_EXE_PATH =3D "${STAGING_LIBDIR}/llvm-rust/bin/=
llvm-config"
>> +export YOCTO_ALTERNATE_MULTILIB_NAME =3D "/${BASELIB}"
>> +
>> +# We don't want to use bitbakes vendoring because the rust sources do =
their
>> +# own vendoring.
>> +CARGO_DISABLE_BITBAKE_VENDORING =3D "1"
>> +
>> +# We can't use RUST_BUILD_SYS here because that may be "musl" if
>> +# TCLIBC=3D"musl". Snapshots are always -unknown-linux-gnu
>> +SNAPSHOT_BUILD_SYS =3D "${BUILD_ARCH}-unknown-linux-gnu"
>> +setup_cargo_environment () {
>> +    # The first step is to build bootstrap and some early stage tools,
>> +    # these are build for the same target as the snapshot, e.g.
>> +    # x86_64-unknown-linux-gnu.
>> +    # Later stages are build for the native target (i.e. target.x86_64=
-linux)
>> +    cargo_common_do_configure
>> +
>> +    printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/co=
nfig
>> +    printf "linker =3D '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/c=
onfig
>> +}
>> +
>> +# Right now this is focused on arm-specific tune features.
>> +# We get away with this for now as one can only use x86-64 as the buil=
d host
>> +# (not arm).
>> +# Note that TUNE_FEATURES is _always_ refering to the target, so we re=
ally
>> +# don't want to use this for the host/build.
>> +def llvm_features_from_tune(d):
>> +    f =3D []
>> +    feat =3D d.getVar('TUNE_FEATURES')
>> +    if not feat:
>> +        return []
>> +    feat =3D frozenset(feat.split())
>> +
>> +    mach_overrides =3D d.getVar('MACHINEOVERRIDES')
>> +    mach_overrides =3D frozenset(mach_overrides.split(':'))
>> +
>> +    if 'vfpv4' in feat:
>> +        f.append("+vfp4")
>> +    if 'vfpv3' in feat:
>> +        f.append("+vfp3")
>> +    if 'vfpv3d16' in feat:
>> +        f.append("+d16")
>> +
>> +    if 'vfpv2' in feat or 'vfp' in feat:
>> +        f.append("+vfp2")
>> +
>> +    if 'neon' in feat:
>> +        f.append("+neon")
>> +
>> +    if 'aarch64' in feat:
>> +        f.append("+v8")
>> +
>> +    if 'mips32' in feat:
>> +        f.append("+mips32")
>> +
>> +    if 'mips32r2' in feat:
>> +        f.append("+mips32r2")
>> +
>> +    v7=3Dfrozenset(['armv7a', 'armv7r', 'armv7m', 'armv7ve'])
>> +    if (not mach_overrides.isdisjoint(v7)) or (not feat.isdisjoint(v7)=
):
>> +        f.append("+v7")
>> +    if ('armv6' in mach_overrides) or ('armv6' in feat):
>> +        f.append("+v6")
>> +
>> +    if 'dsp' in feat:
>> +        f.append("+dsp")
>> +
>> +    if 'thumb' in feat:
>> +        if d.getVar('ARM_THUMB_OPT') is "thumb":
>> +            if (not mach_overrides.isdisjoint(v7)) or (not feat.isdisj=
oint(v7)):
>> +                f.append("+thumb2")
>> +            f.append("+thumb-mode")
>> +
>> +    if 'cortexa5' in feat:
>> +        f.append("+a5")
>> +    if 'cortexa7' in feat:
>> +        f.append("+a7")
>> +    if 'cortexa9' in feat:
>> +        f.append("+a9")
>> +    if 'cortexa15' in feat:
>> +        f.append("+a15")
>> +    if 'cortexa17' in feat:
>> +        f.append("+a17")
>> +
>> +    return f
>> +
>> +# TARGET_CC_ARCH changes from build/cross/target so it'll do the right=
 thing
>> +# this should go away when https://github.com/rust-lang/rust/pull/3170=
9 is
>> +# stable (1.9.0?)
>> +def llvm_features_from_cc_arch(d):
>> +    f =3D []
>> +    feat =3D d.getVar('TARGET_CC_ARCH')
>> +    if not feat:
>> +        return []
>> +    feat =3D frozenset(feat.split())
>> +
>> +    if '-mmmx' in feat:
>> +        f.append("+mmx")
>> +    if '-msse' in feat:
>> +        f.append("+sse")
>> +    if '-msse2' in feat:
>> +        f.append("+sse2")
>> +    if '-msse3' in feat:
>> +        f.append("+sse3")
>> +    if '-mssse3' in feat:
>> +        f.append("+ssse3")
>> +    if '-msse4.1' in feat:
>> +        f.append("+sse4.1")
>> +    if '-msse4.2' in feat:
>> +        f.append("+sse4.2")
>> +    if '-msse4a' in feat:
>> +        f.append("+sse4a")
>> +    if '-mavx' in feat:
>> +        f.append("+avx")
>> +    if '-mavx2' in feat:
>> +        f.append("+avx2")
>> +
>> +    return f
>> +
>> +def llvm_features_from_target_fpu(d):
>> +    # TARGET_FPU can be hard or soft. +soft-float tell llvm to use sof=
t float
>> +    # ABI. There is no option for hard.
>> +
>> +    fpu =3D d.getVar('TARGET_FPU', True)
>> +    return ["+soft-float"] if fpu =3D=3D "soft" else []
>> +
>> +def llvm_features(d):
>> +    return ','.join(llvm_features_from_tune(d) +
>> +                    llvm_features_from_cc_arch(d) +
>> +                    llvm_features_from_target_fpu(d))
>> +
>> +## arm-unknown-linux-gnueabihf
>> +DATA_LAYOUT[arm] =3D "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
>> +LLVM_TARGET[arm] =3D "${RUST_TARGET_SYS}"
>> +TARGET_ENDIAN[arm] =3D "little"
>> +TARGET_POINTER_WIDTH[arm] =3D "32"
>> +TARGET_C_INT_WIDTH[arm] =3D "32"
>> +MAX_ATOMIC_WIDTH[arm] =3D "64"
>> +FEATURES[arm] =3D "+v6,+vfp2"
>> +
>> +## aarch64-unknown-linux-{gnu, musl}
>> +DATA_LAYOUT[aarch64] =3D "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:=
64-S128"
>> +LLVM_TARGET[aarch64] =3D "${RUST_TARGET_SYS}"
>> +TARGET_ENDIAN[aarch64] =3D "little"
>> +TARGET_POINTER_WIDTH[aarch64] =3D "64"
>> +TARGET_C_INT_WIDTH[aarch64] =3D "32"
>> +MAX_ATOMIC_WIDTH[aarch64] =3D "128"
>> +
>> +## x86_64-unknown-linux-{gnu, musl}
>> +DATA_LAYOUT[x86_64] =3D "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
>> +LLVM_TARGET[x86_64] =3D "${RUST_TARGET_SYS}"
>> +TARGET_ENDIAN[x86_64] =3D "little"
>> +TARGET_POINTER_WIDTH[x86_64] =3D "64"
>> +TARGET_C_INT_WIDTH[x86_64] =3D "32"
>> +MAX_ATOMIC_WIDTH[x86_64] =3D "64"
>> +
>> +## i686-unknown-linux-{gnu, musl}
>> +DATA_LAYOUT[i686] =3D "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
>> +LLVM_TARGET[i686] =3D "${RUST_TARGET_SYS}"
>> +TARGET_ENDIAN[i686] =3D "little"
>> +TARGET_POINTER_WIDTH[i686] =3D "32"
>> +TARGET_C_INT_WIDTH[i686] =3D "32"
>> +MAX_ATOMIC_WIDTH[i686] =3D "64"
>> +
>> +## XXX: a bit of a hack so qemux86 builds, clone of i686-unknown-linux=
-{gnu, musl} above
>> +DATA_LAYOUT[i586] =3D "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
>> +LLVM_TARGET[i586] =3D "${RUST_TARGET_SYS}"
>> +TARGET_ENDIAN[i586] =3D "little"
>> +TARGET_POINTER_WIDTH[i586] =3D "32"
>> +TARGET_C_INT_WIDTH[i586] =3D "32"
>> +MAX_ATOMIC_WIDTH[i586] =3D "64"
>> +
>> +## mips-unknown-linux-{gnu, musl}
>> +DATA_LAYOUT[mips] =3D "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
>> +LLVM_TARGET[mips] =3D "${RUST_TARGET_SYS}"
>> +TARGET_ENDIAN[mips] =3D "big"
>> +TARGET_POINTER_WIDTH[mips] =3D "32"
>> +TARGET_C_INT_WIDTH[mips] =3D "32"
>> +MAX_ATOMIC_WIDTH[mips] =3D "32"
>> +
>> +## mipsel-unknown-linux-{gnu, musl}
>> +DATA_LAYOUT[mipsel] =3D "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S6=
4"
>> +LLVM_TARGET[mipsel] =3D "${RUST_TARGET_SYS}"
>> +TARGET_ENDIAN[mipsel] =3D "little"
>> +TARGET_POINTER_WIDTH[mipsel] =3D "32"
>> +TARGET_C_INT_WIDTH[mipsel] =3D "32"
>> +MAX_ATOMIC_WIDTH[mipsel] =3D "32"
>> +
>> +## mips64-unknown-linux-{gnu, musl}
>> +DATA_LAYOUT[mips64] =3D "E-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
>> +LLVM_TARGET[mips64] =3D "${RUST_TARGET_SYS}"
>> +TARGET_ENDIAN[mips64] =3D "big"
>> +TARGET_POINTER_WIDTH[mips64] =3D "64"
>> +TARGET_C_INT_WIDTH[mips64] =3D "64"
>> +MAX_ATOMIC_WIDTH[mips64] =3D "64"
>> +
>> +## mips64el-unknown-linux-{gnu, musl}
>> +DATA_LAYOUT[mips64el] =3D "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
>> +LLVM_TARGET[mips64el] =3D "${RUST_TARGET_SYS}"
>> +TARGET_ENDIAN[mips64el] =3D "little"
>> +TARGET_POINTER_WIDTH[mips64el] =3D "64"
>> +TARGET_C_INT_WIDTH[mips64el] =3D "64"
>> +MAX_ATOMIC_WIDTH[mips64el] =3D "64"
>> +
>> +## powerpc-unknown-linux-{gnu, musl}
>> +DATA_LAYOUT[powerpc] =3D "E-m:e-p:32:32-i64:64-n32"
>> +LLVM_TARGET[powerpc] =3D "${RUST_TARGET_SYS}"
>> +TARGET_ENDIAN[powerpc] =3D "big"
>> +TARGET_POINTER_WIDTH[powerpc] =3D "32"
>> +TARGET_C_INT_WIDTH[powerpc] =3D "32"
>> +MAX_ATOMIC_WIDTH[powerpc] =3D "32"
>> +
>> +## riscv32-unknown-linux-{gnu, musl}
>> +DATA_LAYOUT[riscv32] =3D "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
>> +LLVM_TARGET[riscv32] =3D "${RUST_TARGET_SYS}"
>> +TARGET_ENDIAN[riscv32] =3D "little"
>> +TARGET_POINTER_WIDTH[riscv32] =3D "32"
>> +TARGET_C_INT_WIDTH[riscv32] =3D "32"
>> +MAX_ATOMIC_WIDTH[riscv32] =3D "32"
>> +
>> +## riscv64-unknown-linux-{gnu, musl}
>> +DATA_LAYOUT[riscv64] =3D "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
>> +LLVM_TARGET[riscv64] =3D "${RUST_TARGET_SYS}"
>> +TARGET_ENDIAN[riscv64] =3D "little"
>> +TARGET_POINTER_WIDTH[riscv64] =3D "64"
>> +TARGET_C_INT_WIDTH[riscv64] =3D "64"
>> +MAX_ATOMIC_WIDTH[riscv64] =3D "64"
>> +
>> +def arch_for(d, thing):
>> +    return d.getVar('{}_ARCH'.format(thing))
>> +
>> +def sys_for(d, thing):
>> +    return d.getVar('{}_SYS'.format(thing))
>> +
>> +def prefix_for(d, thing):
>> +    return d.getVar('{}_PREFIX'.format(thing))
>> +
>> +# Convert a normal arch (HOST_ARCH, TARGET_ARCH, BUILD_ARCH, etc) to s=
omething
>> +# rust's internals won't choke on.
>> +def arch_to_rust_target_arch(arch):
>> +    if arch =3D=3D "i586" or arch =3D=3D "i686":
>> +        return "x86"
>> +    elif arch =3D=3D "mipsel":
>> +        return "mips"
>> +    elif arch =3D=3D "mip64sel":
>> +        return "mips64"
>> +    else:
>> +        return arch
>> +
>> +# generates our target CPU value
>> +def llvm_cpu(d):
>> +    cpu =3D d.getVar('PACKAGE_ARCH')
>> +    target =3D d.getVar('TRANSLATED_TARGET_ARCH')
>> +
>> +    trans =3D {}
>> +    trans['corei7-64'] =3D "corei7"
>> +    trans['core2-32'] =3D "core2"
>> +    trans['x86-64'] =3D "x86-64"
>> +    trans['i686'] =3D "i686"
>> +    trans['i586'] =3D "i586"
>> +    trans['powerpc'] =3D "powerpc"
>> +    trans['mips64'] =3D "mips64"
>> +    trans['mips64el'] =3D "mips64"
>> +
>> +    if target in ["mips", "mipsel"]:
>> +        feat =3D frozenset(d.getVar('TUNE_FEATURES').split())
>> +        if "mips32r2" in feat:
>> +            trans['mipsel'] =3D "mips32r2"
>> +            trans['mips'] =3D "mips32r2"
>> +        elif "mips32" in feat:
>> +            trans['mipsel'] =3D "mips32"
>> +            trans['mips'] =3D "mips32"
>> +
>> +    try:
>> +        return trans[cpu]
>> +    except:
>> +        return trans.get(target, "generic")
>> +
>> +TARGET_LLVM_CPU=3D"${@llvm_cpu(d)}"
>> +TARGET_LLVM_FEATURES =3D "${@llvm_features(d)}"
>> +
>> +# class-native implies TARGET=3DHOST, and TUNE_FEATURES only describes=
 the real
>> +# (original) target.
>> +TARGET_LLVM_FEATURES_class-native =3D "${@','.join(llvm_features_from_=
cc_arch(d))}"
>> +
>> +def rust_gen_target(d, thing, wd, features, cpu):
>> +    import json
>> +    from distutils.version import LooseVersion
>> +    arch =3D arch_for(d, thing)
>> +    sys =3D sys_for(d, thing)
>> +    prefix =3D prefix_for(d, thing)
>> +
>> +    features =3D features or d.getVarFlag('FEATURES', arch) or ""
>> +    features =3D features.strip()
>> +
>> +    # build tspec
>> +    tspec =3D {}
>> +    tspec['llvm-target'] =3D d.getVarFlag('LLVM_TARGET', arch)
>> +    tspec['data-layout'] =3D d.getVarFlag('DATA_LAYOUT', arch)
>> +    tspec['max-atomic-width'] =3D int(d.getVarFlag('MAX_ATOMIC_WIDTH',=
 arch))
>> +    tspec['target-pointer-width'] =3D d.getVarFlag('TARGET_POINTER_WID=
TH', arch)
>> +    tspec['target-c-int-width'] =3D d.getVarFlag('TARGET_C_INT_WIDTH',=
 arch)
>> +    tspec['target-endian'] =3D d.getVarFlag('TARGET_ENDIAN', arch)
>> +    tspec['arch'] =3D arch_to_rust_target_arch(arch)
>> +    tspec['os'] =3D "linux"
>> +    if "musl" in tspec['llvm-target']:
>> +        tspec['env'] =3D "musl"
>> +    else:
>> +        tspec['env'] =3D "gnu"
>> +    tspec['vendor'] =3D "unknown"
>> +    tspec['target-family'] =3D "unix"
>> +    tspec['linker'] =3D "{}{}gcc".format(d.getVar('CCACHE'), prefix)
>> +    tspec['ar'] =3D "{}ar".format(prefix)
>> +    tspec['cpu'] =3D cpu
>> +    if features is not "":
>> +        tspec['features'] =3D features
>> +    tspec['dynamic-linking'] =3D True
>> +    tspec['executables'] =3D True
>> +    tspec['linker-is-gnu'] =3D True
>> +    tspec['linker-flavor'] =3D "gcc"
>> +    tspec['has-rpath'] =3D True
>> +    tspec['has-elf-tls'] =3D True
>> +    tspec['position-independent-executables'] =3D True
>> +    tspec['panic-strategy'] =3D d.getVar("RUST_PANIC_STRATEGY")
>> +
>> +    # Don't use jemalloc as it doesn't work for many targets.
>> +    # https://github.com/rust-lang/rust/pull/37392
>> +    # From 1.20.0 and forward, system allocator is the default.
>> +    if LooseVersion(d.getVar("PV")) < LooseVersion("1.20.0"):
>> +        tspec['exe-allocation-crate'] =3D "alloc_system"
>> +        tspec['lib-allocation-crate'] =3D "alloc_system"
>> +
>> +    # write out the target spec json file
>> +    with open(wd + sys + '.json', 'w') as f:
>> +        json.dump(tspec, f, indent=3D4)
>> +
>> +python do_rust_gen_targets () {
>> +    wd =3D d.getVar('WORKDIR') + '/targets/'
>> +    rust_gen_target(d, 'BUILD', wd, "", "generic")
>> +}
>> +
>> +addtask rust_gen_targets after do_patch before do_compile
>> +do_rust_gen_targets[dirs] +=3D "${WORKDIR}/targets"
>> +
>> +do_rust_setup_snapshot () {
>> +    for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.=
sh"; do
>> +        "${installer}" --prefix=3D"${WORKDIR}/rust-snapshot" --disable=
-ldconfig
>> +    done
>> +
>> +    # Some versions of rust (e.g. 1.18.0) tries to find cargo in stage=
0/bin/cargo
>> +    # and fail without it there.
>> +    mkdir -p ${RUSTSRC}/build/${BUILD_SYS}
>> +    ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${BUILD_SYS}/sta=
ge0
>> +}
>> +addtask rust_setup_snapshot after do_unpack before do_configure
>> +do_rust_setup_snapshot[dirs] +=3D "${WORKDIR}/rust-snapshot"
>> +
>> +
>> +python do_configure() {
>> +    import json
>> +    from distutils.version import LooseVersion
>> +    try:
>> +        import configparser
>> +    except ImportError:
>> +        import ConfigParser as configparser
>> +
>> +    # toml is rather similar to standard ini like format except it lik=
es values
>> +    # that look more JSON like. So for our purposes simply escaping al=
l values
>> +    # as JSON seem to work fine.
>> +
>> +    e =3D lambda s: json.dumps(s)
>> +
>> +    config =3D configparser.RawConfigParser()
>> +
>> +    # [target.ARCH-unknown-linux-gnu]
>> +    if( d.getVar('RUST_TARGET_SYS', True) !=3D d.getVar('SNAPSHOT_BUIL=
D_SYS', True)):
>> +       target_section =3D "target.{}".format(d.getVar('RUST_TARGET_SYS=
', True))
>> +    else :
>> +       target_section =3D "target.{}".format(d.getVar('TARGET_SYS', Tr=
ue))
>> +
>> +    config.add_section(target_section)
>> +
>> +    config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")=
))
>> +    config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
>> +    config.set(target_section, "linker", e(d.expand("${RUST_TARGET_CCL=
D}")))
>> +
>> +    # If we don't do this rust-native will compile it's own llvm for B=
UILD.
>> +    # [target.${BUILD_ARCH}-unknown-linux-gnu]
>> +    target_section =3D "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS=
', True))
>> +    config.add_section(target_section)
>> +
>> +    config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}"))=
)
>> +    config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
>> +
>> +    # [rust]
>> +    config.add_section("rust")
>> +    config.set("rust", "rpath", e(True))
>> +    config.set("rust", "channel", e("stable"))
>> +
>> +    if LooseVersion(d.getVar("PV")) < LooseVersion("1.32.0"):
>> +        config.set("rust", "use-jemalloc", e(False))
>> +
>> +    # Whether or not to optimize the compiler and standard library
>> +    config.set("rust", "optimize", e(True))
>> +
>> +    # Emits extraneous output from tests to ensure that failures of th=
e test
>> +    # harness are debuggable just from logfiles
>> +    config.set("rust", "verbose-tests", e(True))
>> +
>> +    # [build]
>> +    config.add_section("build")
>> +    config.set("build", "submodules", e(False))
>> +    config.set("build", "docs", e(False))
>> +
>> +    rustc =3D d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
>> +    config.set("build", "rustc", e(rustc))
>> +
>> +    cargo =3D d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
>> +    config.set("build", "cargo", e(cargo))
>> +
>> +    config.set("build", "vendor", e(True))
>> +
>> +    if( d.getVar('RUST_TARGET_SYS', True) !=3D d.getVar('SNAPSHOT_BUIL=
D_SYS', True)):
>> +        targets =3D [d.getVar("RUST_TARGET_SYS", True)]
>> +    else:
>> +        targets =3D [d.getVar("TARGET_SYS", True)]
>> +
>> +    config.set("build", "target", e(targets))
>> +
>> +    hosts =3D [d.getVar("SNAPSHOT_BUILD_SYS", True)]
>> +    config.set("build", "host", e(hosts))
>> +
>> +    # We can't use BUILD_SYS since that is something the rust snapshot=
 knows
>> +    # nothing about when trying to build some stage0 tools (like fabri=
cate)
>> +    config.set("build", "build", e(d.getVar("SNAPSHOT_BUILD_SYS", True=
)))
>> +
>> +    with open("config.toml", "w") as f:
>> +        config.write(f)
>> +
>> +    # set up ${WORKDIR}/cargo_home
>> +    bb.build.exec_func("setup_cargo_environment", d)
>> +}
>> +
>> +
>> +rust_runx () {
>> +    echo "COMPILE ${PN}" "$@"
>> +
>> +    # CFLAGS, LDFLAGS, CXXFLAGS, CPPFLAGS are used by rust's build for=
 a
>> +    # wide range of targets (not just TARGET). Yocto's settings for th=
em will
>> +    # be inappropriate, avoid using.
>> +    unset CFLAGS
>> +    unset LDFLAGS
>> +    unset CXXFLAGS
>> +    unset CPPFLAGS
>> +
>> +    oe_cargo_fix_env
>> +
>> +    nativepython3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make=
_argument(d, '-j %d')} "$@"
>> +}
>> +rust_runx[vardepsexclude] +=3D "PARALLEL_MAKE"
>> +
>> +do_compile () {
>> +    if [  "${SNAPSHOT_BUILD_SYS}" =3D "${RUST_TARGET_SYS}" ]
>> +    then
>> +       rust_runx build src/tools/remote-test-server --target "${TARGET=
_SYS}"
>> +    else
>> +       rust_runx build src/tools/remote-test-server --target "${RUST_T=
ARGET_SYS}"
>> +    fi
>> +}
>> +
>> +do_check[dirs] +=3D "${B}"
>> +do_check[nostamp] =3D "1"
>> +do_check () {
>> +    scp -P 2222 -o StrictHostKeyChecking=3Dno build/${SNAPSHOT_BUILD_S=
YS}/stage2-tools-bin/remote-test-server root@127.0.0.1:~/
>> +    ssh -p 2222 -o StrictHostKeyChecking=3Dno -f root@127.0.0.1 "~/rem=
ote-test-server -v remote"
>> +
>> +
>> +    export TEST_DEVICE_ADDR=3D"127.0.0.1:12345"
>> +    if [  "${SNAPSHOT_BUILD_SYS}" =3D "${RUST_TARGET_SYS}" ]
>> +    then
>> +       rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" =
> summary.txt 2> /dev/null
>> +    else
>> +       rust_runx test --no-fail-fast --target "${RUST_TARGET_SYS}" > s=
ummary.txt 2> /dev/null
>> +    fi
>> +
>> +}
>> +addtask do_check after do_compile
>> +
>> diff --git a/meta/recipes-devtools/rust/rust-test_1.46.0.bb b/meta/reci=
pes-devtools/rust/rust-test_1.46.0.bb
>> new file mode 100644
>> index 0000000000..b724ea5eb0
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rust/rust-test_1.46.0.bb
>> @@ -0,0 +1,12 @@
>> +require rust-test.inc
>> +require rust-source-${PV}.inc
>> +require rust-snapshot-${PV}.inc
>> +
>> +DEPENDS +=3D "rust-llvm (=3D${PV})"
>> +
>> +# Otherwise we'll depend on what we provide
>> +INHIBIT_DEFAULT_RUST_DEPS_class-native =3D "1"
>> +# We don't need to depend on gcc-native because yocto assumes it exist=
s
>> +PROVIDES_class-native =3D "virtual/${TARGET_PREFIX}rust"
>> +
>> +BBCLASSEXTEND =3D "native"
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index dd92a64553..1a21a90add 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -1055,7 +1055,7 @@ class BaseConfig(object):
>>          logger.info("Network configuration:%s", netconf)
>>          self.kernel_cmdline_script +=3D netconf
>>          # Port mapping
>> -        hostfwd =3D ",hostfwd=3Dtcp::2222-:22,hostfwd=3Dtcp::2323-:23"
>> +        hostfwd =3D ",hostfwd=3Dtcp::12345-:12345,hostfwd=3Dtcp::2323-=
:23,hostfwd=3Dtcp::2222-:22"
>>          qb_slirp_opt_default =3D "-netdev user,id=3Dnet0%s,tftp=3D%s" =
% (hostfwd, self.get('DEPLOY_DIR_IMAGE'))
>>          qb_slirp_opt =3D self.get('QB_SLIRP_OPT') or qb_slirp_opt_defa=
ult
>>          # Figure out the port
>> @@ -1084,6 +1084,19 @@ class BaseConfig(object):
>>                          mac +=3D 1
>>              if p !=3D p_new:
>>                  ports.append(p_new)
>> +                temp=3D__file__.split(os.path.basename(__file__))[0]
>> +                with open(temp+"../meta/recipes-devtools/rust/rust-tes=
t.inc", 'r+') as f:
>> +                    text =3D f.readlines()
>> +                    temp1=3D[]
>> +                    for i in text:
>> +                        temp =3D re.sub(r'(\S+\s)(-.)(\s\d+)( -o Stric=
tHostKeyChecking=3Dno .*)', r'\1\2 '+str(p_new)+'\\4', i)
>> +                        temp1.append(temp)
>> +                    temp2=3D''
>> +                    for i in temp1:
>> +                        temp2=3Dtemp2+i
>> +                    f.seek(0)
>> +                    f.write(temp2)
>> +                    f.truncate()
>>                  qb_slirp_opt =3D re.sub(':%s-' % p, ':%s-' % p_new, qb=
_slirp_opt)
>>                  logger.info("Port forward changed: %s -> %s" % (p, p_n=
ew))
>>          mac =3D "%s%02x" % (self.mac_slirp, mac)
>> --
>> 2.17.1
>>
>>
>>=20
>>
