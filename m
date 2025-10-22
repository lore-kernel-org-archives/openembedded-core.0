Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459A1CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 04:43:52 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.1490.1761108226251074499
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 21:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N8ExeMuw;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78488cdc20aso51371487b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 21:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761108225; x=1761713025; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P29UQ422DzDslzD5gW18MmwU68k3r8wr02g07+IbEpY=;
        b=N8ExeMuwyVnyfGgM/7fcyI82DGsJ0WuQ65kzNOG5jgobrVA79QD+IAzvYh8tHQ6612
         cMc2Iim1PkdWYCKxiyEFUPfHJiUoOICQy78c9dDslnx/mIFy3vKyh0M3FNzQzGWenuF4
         hBuWXdgP0TOFLBeRT89KyvvvBg6KScquAAXoF3MnfX2CQ+nkSRnlg65ury3PgEfaNNaU
         rBoiJ64GwAMgbhSWAet++ICkQonVc50tVBw87lpMwqYI/tiCRuVmdHN7xqxbpuSArc/I
         vrmMYlbToob5mTc6wSDAT9ndAoOgx8OjVG4Jq8obLsNBkjNX5+vKcRkLbyspFuFgV6XX
         sYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761108225; x=1761713025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P29UQ422DzDslzD5gW18MmwU68k3r8wr02g07+IbEpY=;
        b=e0RM0WQcIJqQIgV+i+a/V+btPPS54nV5gwsRIT5A9ALKzIPFLJk9rcT/oJMzmjp3Hb
         8Nwb1AMgfTRLAXXeIAOaUtESqM5UfChRP+E+sYOfM6zYKAmCJIouaUjGBWuPDO2a/TGQ
         K4DUqQMyCXrr1OzgYDTqc/WPxbXCgr6O3ahQ/jN5bG0una6/APiYhUs17ZHg5pECuArT
         vmqwwROPNSm5sCftZpkdGRVqiSHbTXnm8EmH9WdhfzijkFDjtcfHebKD50ZRYoJfGUTW
         1due02F1QpXgDx4O1uOc4HeuitiYeBS2KDXv+WZDgRLHjUgw7nJ+hm/LIqXN+NSuqSMi
         9xfw==
X-Gm-Message-State: AOJu0YxvfOiX6/8qhqClz1eJSTUYx8Br7KFynTej+aVc4C/cIKok+Xu7
	p35kVkxU9PrA8DECD3ZaX8F15CtvX83SGHStT+q1OoJQxsltNrh12drfzvl6zShfpmpTxPqv79k
	Qgb6KDXdqFI98dwbnc2fn0rIiYlWYKkA=
X-Gm-Gg: ASbGnct3FfE21WdsLj6c/xBzYNZCAgz1b3PfugrnZxo269VGohkRg2Vju6JqsPpNtmC
	f83yKjw/zPswawZs+H7PSkX5bcd47wadXTOLMHN5038c9f6pfpuQSDHYgEKfw1tM0P1o7RAdaGd
	ex7NPniWa/2vn8as9FtC2TVa43OMXkA9TTSZDtMuYkijLZW/4JC4cVLgdYr64RjhkyoUlolGc+9
	NogqLO+d3WjyQn5sPE9sX1Z5UTCq4Om2iiSiAKrCkOj7iK2Q7W243xKLPX9rUKwi3RT603Lzsdf
	eJ41zdC/33bTWbtGdzLow27ZOiHYxTrXo/7/w9JXWs1ro/A213Y5SCM1zBwi
X-Google-Smtp-Source: AGHT+IGphLyrGPl0yvFOiHESG0PPEu296cRlpu0lngACwCje6cCSJD44fpzByiNf8lJg2WT5eailPrgZgM1XPgC16w8=
X-Received: by 2002:a05:690e:130e:b0:63e:302e:6745 with SMTP id
 956f58d0204a3-63e302e699amr8084593d50.42.1761108225295; Tue, 21 Oct 2025
 21:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251022043126.989530-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251022043126.989530-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Oct 2025 21:43:17 -0700
X-Gm-Features: AS18NWB_-RvMI9Yr4hu7uQHJdxIAx51Ab1LpRPQhFvMkfHEpcqWErPm9_0x0oOc
Message-ID: <CAMKF1so5GsGtuE2UfvxPmiUBtVv7w_y4XHuc1t+q1_C6SH=Amw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm/clang: Upgrade to 21.1.4 release
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 04:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225169

LGTM, thanks for the patch

On Tue, Oct 21, 2025 at 9:31=E2=80=AFPM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Brings following bugfixes on top of 21.1.3
>
> 222fc11f2b8f Bump version to 21.1.4
> 480a90482e5b release/21.x: [clang-format] Fix a crash on BAS_BlockIndent =
(#164047)
> 3333dd88a493 Update clang/lib/Format/TokenAnnotator.cpp
> 54cdd973782e [clang-format] Annotate ::operator and Foo::operator correct=
ly (#164048)
> ceeb93096c79 [libclang/python] Return None instead of null cursors from T=
oken.cursor (#163183)
> 7e153f5372ed [clang-format] Fix an assertion failure on comment-only conf=
ig files (#163111)
> faca424bc5f7 [clang-format] Correctly handle backward compatibility of C =
headers (#159908)
> c5a3aa8934b0 [libc++] Properly implement array cookies in the ARM ABI (#1=
60182)
> 0d819a9104b2 [libunwind] Fix aarch64 SEH unwinding with a debugger attach=
ed (#162867)
> 464d75ad5f26 [MachinePipeliner] Add test missed in #154940 (NFC) (#163350=
)
> ffa6b0c365ec [MachinePipeliner] Limit the number of stores in BB (#154940=
)
> 570c4c944338 [clang] Fix catching pointers by reference on mingw targets =
(#162546)
> c6af6be3cd1c [libc++][docs] Add missing entry for P3379R0 to `21.rst`
> a2e93dce5f2b [Hexagon][llvm-objdump] Start a fresh packet at symbol bound=
aries. (#163466)
> dfdee9a929aa [clang][modules] Derive mtime from PCM timestamps, not PCM f=
iles (#162965)
> bd9bc536b4ac [LLD] [COFF] Fix aarch64 delayimport of sret arguments (#163=
096)
> 7b785dcb70f6 [LLD][COFF] Fix tailMergeARM64 delayload thunk 128 MB range =
limitation (#161844)
> a847f1832857 [Hexagon] Support lowering of setuo & seto for vector types =
in Hexagon (#158740)
> e14b5e82244e [clang-format] Fix a bug in wrapping { after else (#161048)
> b54051ac74cb [clang-format] Correctly annotate RequiresExpressionLBrace (=
#155773)
> c9fbd571b52c dfsan: Fix test with gcc 15.
> 68f118f265c9 Switch dtls_test.c from XFAIL to UNSUPPORTED on aarch64.
> a86b1e397e90 compiler-rt: Make the tests pass on AArch64 and with page si=
ze !=3D 4096.
> c03b58bb091e [clangd] Fix code action kind for readability-identifier-nam=
ing fixes (#162808)
> caef7619d5fd [clang-format] Fix a bug in OneLineFormatOffRegex (#162961)
> 5386abc82ab8 [libc++][ranges] Fix `ranges::join_view` segmented iterator =
trait (#158347)
> 18593ab316f6 workflows/release-binaries: Run tests on the same runner as =
the build (#162421)
> 13bee3a798b1 [Mips] Fix clang crashes when assembling invalid MIPS beql i=
nstructions with --arch=3Dmips (#156413)
> 0d1b9249d189 [CI] Add dyung and c-rhodes to the Release Asset List (#1624=
78)
> c000f3226bdf [Mips] Fixed libunwind::Registers_mips_o32::jumpto to allow =
for load delay (#152942)
> 276050887539 [LLDB][ProcessWindows] Set exit status on instance rather th=
an going through all targets (#159308)
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/conf/distro/include/maintainers.inc     | 2 +-
>  meta/recipes-devtools/clang/common-clang.inc | 2 +-
>  meta/recipes-devtools/clang/common.inc       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 444c7f6521..c4142e2b72 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt =3D "Bruce Ashfie=
ld <bruce.ashfield@gmail.com>
>  RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
>  RECIPE_MAINTAINER:pn-lld =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-llvm-project-source-21.1.3 =3D "Khem Raj <raj.khem@=
gmail.com>"
> +RECIPE_MAINTAINER:pn-llvm-project-source-21.1.4 =3D "Khem Raj <raj.khem@=
gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
>  RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-=
devtools/clang/common-clang.inc
> index 7191d41efd..416258c5d3 100644
> --- a/meta/recipes-devtools/clang/common-clang.inc
> +++ b/meta/recipes-devtools/clang/common-clang.inc
> @@ -5,7 +5,7 @@ LLVM_HTTP ?=3D "https://github.com/llvm"
>
>  MAJOR_VER =3D "21"
>  MINOR_VER =3D "1"
> -PATCH_VER =3D "3"
> +PATCH_VER =3D "4"
>  # could be 'rcX' or 'git' or empty ( for release )
>  VER_SUFFIX =3D ""
>
> diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtoo=
ls/clang/common.inc
> index 8a7ac57554..20adbf2610 100644
> --- a/meta/recipes-devtools/clang/common.inc
> +++ b/meta/recipes-devtools/clang/common.inc
> @@ -17,7 +17,7 @@ BASEURI ?=3D "${LLVM_HTTP}/llvm-project/releases/downlo=
ad/llvmorg-${PV}${VER_SUFFI
>  UPSTREAM_CHECK_URI =3D "${LLVM_HTTP}/llvm-project/releases/"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
>  SOURCEDIR ?=3D "llvm-project-${PV}${VER_SUFFIX}.src"
> -SRC_URI[sha256sum] =3D "9c9db50d8046f668156d83f6b594631b4ca79a0d96e4f19b=
ed9dc019b022e58f"
> +SRC_URI[sha256sum] =3D "a01ad7e5167780c945871d75c0413081d12067607a6de5cf=
71dc3e8d1a82112c"
>
>  SRC_URI =3D "\
>      ${BASEURI} \
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225168): https://lists.openembedded.org/g/openembedde=
d-core/message/225168
> Mute This Topic: https://lists.openembedded.org/mt/115887533/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

