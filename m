Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id BE1E179CB2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2018 12:30:47 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id o15-v6so9654938wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Nov 2018 04:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q2zxZ0Z1wlhpmpJVTnqE8eU8sn8VAhkVTPGJufmOlgE=;
	b=NlSKQlv0/F6QrnJKMcN/tjWkWx2ZxUju4vRd+q2Yy5fkPi/BGVY6OMz7THeWIsjkrI
	CjNPPEQI48MoYW+FM/Nd2ypV5R3iGa12+CSdToLAwBNVjLhaNJlzLhETmwRK5fhv+t33
	Tap1eBG5UpcNKKbJ6NHRcTN3zBFnTicCgd80JxcHIs8x7oy1XnTpbIt6IdWa+HG8rFha
	IyHSzh+ONyi5CdbCAboA+djf5ubKg2m7wrPK2cihm0sbn/FhHreLlIdqyMUppOHiTvJ+
	MeqbOL6Osonr7k4xBIZ2EfNq6ZjCq7zSrxPM33g2XIEmvMuKM5f3UJRjBWgVPxTbpANH
	4AMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q2zxZ0Z1wlhpmpJVTnqE8eU8sn8VAhkVTPGJufmOlgE=;
	b=kHAv+NA+XNBHp7rZja4bBQ2abHcuuRjQGcFKy55qNuEOnOF/HjxkW+nQ/Z9siFTWYl
	xDJU1QzVam6QnAswLNXVyyd1kiGZ9WJ7yGdAiMdC/AazvUcZSRwxGX27Sqc+nZhNLpX9
	cPSlYc6tVeB+G//nemBQIzKVSbgYMuKmRDDiNC+VrR0vpoQP7NMCZTK95qgIPWJnJQTY
	9Xe8/iui9iJco2ZKaI3l8tjXJ4TR3J8EkOsjX9CqibcK5Z5b/VgOfMnEcGF3uizcXRtC
	asyfENqoDT4hD1dD7eMOeZDUv6NKtSJ2m5JZDsDk6KN5tagFsxeSQWf9DxWa6YH+V6FR
	9YNw==
X-Gm-Message-State: AGRZ1gKFRWK0Dhp3zRwd7xrgIDVtrYvrzsYjqyO1EunhkrX45SSsOE2y
	TZx5FuY10qcIVaa19oO/PhztibdWKh2mxTz90G7W5w==
X-Google-Smtp-Source: AJdET5fVa0Gizlq7LyeOMSt4UHBXTJoKUUtWotziiy+HnSuaCelh9gfsGsTXojcS4aOhjAIWYhGKe7kS9lQHdk367gI=
X-Received: by 2002:adf:e388:: with SMTP id
	e8-v6mr23591393wrm.321.1541507448381; 
	Tue, 06 Nov 2018 04:30:48 -0800 (PST)
MIME-Version: 1.0
References: <1540546971-36870-1-git-send-email-hongxu.jia@windriver.com>
	<CA+chaQes8DkRGNThxJVxJYdUBr0JG7_DteLvsCq1A4SRV-E3bQ@mail.gmail.com>
In-Reply-To: <CA+chaQes8DkRGNThxJVxJYdUBr0JG7_DteLvsCq1A4SRV-E3bQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 6 Nov 2018 13:30:37 +0100
Message-ID: <CA+chaQc1E3dkEyqPzjmUfUUg4YBrF-2Gj0dib9x_hw00DZaqAQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go 1.9/1.11: fix textrel qa warning for non mips arch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Nov 2018 12:30:48 -0000
Content-Type: multipart/alternative; boundary="000000000000e124b80579fe2b5d"

--000000000000e124b80579fe2b5d
Content-Type: text/plain; charset="UTF-8"

Sorry for noise, I've double checked and your fix wasn't included yet in
the build which triggered the QA warning for me.

I've re-triggered to test with the fix really included, will let you know
if it didn't fix the issue.

Thanks

On Tue, Nov 6, 2018 at 9:31 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> Hi, there are still textrel QA issues for aarch64 builds:
>
>
> ERROR: go-1.11.1-r0 do_package_qa: QA Issue: ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/bin/go' has relocations in .text
> ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/bin/go' has relocations in .text
> ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/trace' has relocations in .text
> ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/trace' has relocations in .text
> ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/pprof' has relocations in .text
> ELF binary '/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/pprof' has relocations in .text [textrel]
> ERROR: go-1.11.1-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
> ERROR: go-1.11.1-r0 do_package_qa: Function failed: do_package_qa
>
>
> On Fri, Oct 26, 2018 at 11:32 AM Hongxu Jia <hongxu.jia@windriver.com>
> wrote:
>
>> While building go itself, the go build system does not support
>> to set `-buildmode=pie' from environment.
>>
>> Add GOBUILDMODE to support it which make PIE executables the default
>> build mode, as PIE executables are required as of Yocto
>>
>> But mips doesn't support -buildmode=pie, so skip the QA checking for
>> mips and its variants
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>  meta/recipes-devtools/go/go-1.11.inc               |  1 +
>>  .../0008-use-GOBUILDMODE-to-set-buildmode.patch    | 40
>> ++++++++++++++++++++++
>>  meta/recipes-devtools/go/go-1.9.inc                |  1 +
>>  .../0011-use-GOBUILDMODE-to-set-buildmode.patch    | 40
>> ++++++++++++++++++++++
>>  meta/recipes-devtools/go/go_1.11.bb                | 12 +++++++
>>  meta/recipes-devtools/go/go_1.9.bb                 | 16 +++++----
>>  6 files changed, 104 insertions(+), 6 deletions(-)
>>  create mode 100644
>> meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
>>  create mode 100644
>> meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch
>>
>> diff --git a/meta/recipes-devtools/go/go-1.11.inc
>> b/meta/recipes-devtools/go/go-1.11.inc
>> index c02e468..d626514 100644
>> --- a/meta/recipes-devtools/go/go-1.11.inc
>> +++ b/meta/recipes-devtools/go/go-1.11.inc
>> @@ -15,6 +15,7 @@ SRC_URI += "\
>>
>>  file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
>>      file://0006-cmd-dist-separate-host-and-target-builds.patch \
>>      file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
>> +    file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
>>  "
>>
>>  SRC_URI_append_libc-musl = "
>> file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
>> diff --git
>> a/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
>> b/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
>> new file mode 100644
>> index 0000000..88986dc
>> --- /dev/null
>> +++
>> b/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
>> @@ -0,0 +1,40 @@
>> +From 0e0c247f0caec23528889ff09d98348cba9028f1 Mon Sep 17 00:00:00 2001
>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>> +Date: Fri, 26 Oct 2018 15:02:32 +0800
>> +Subject: [PATCH] use GOBUILDMODE to set buildmode
>> +
>> +While building go itself, the go build system does not support
>> +to set `-buildmode=pie' from environment.
>> +
>> +Add GOBUILDMODE to support it which make PIE executables the default
>> +build mode, as PIE executables are required as of Yocto
>> +
>> +Refers: https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI
>> +Upstream-Status
>> <https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI+Upstream-Status>:
>> Deny [upstream choose antoher solution: `17a256b
>> +cmd/go: -buildmode=pie for android/arm']
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + src/cmd/go/internal/work/build.go | 6 +++++-
>> + 1 file changed, 5 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/src/cmd/go/internal/work/build.go
>> b/src/cmd/go/internal/work/build.go
>> +index 145b875..595d703 100644
>> +--- a/src/cmd/go/internal/work/build.go
>> ++++ b/src/cmd/go/internal/work/build.go
>> +@@ -218,7 +218,11 @@ func AddBuildFlags(cmd *base.Command) {
>> +
>> +       cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
>> +       cmd.Flag.Var(buildCompiler{}, "compiler", "")
>> +-      cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default",
>> "")
>> ++      if bm := os.Getenv("GOBUILDMODE"); bm != "" {
>> ++              cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", bm,
>> "")
>> ++      } else {
>> ++              cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode",
>> "default", "")
>> ++      }
>> +       cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
>> +       cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
>> +       cmd.Flag.StringVar(&cfg.BuildMod, "mod", "", "")
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-devtools/go/go-1.9.inc
>> b/meta/recipes-devtools/go/go-1.9.inc
>> index 329cee0..ba1eaa0 100644
>> --- a/meta/recipes-devtools/go/go-1.9.inc
>> +++ b/meta/recipes-devtools/go/go-1.9.inc
>> @@ -19,6 +19,7 @@ SRC_URI += "\
>>
>>  file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
>>
>>  file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
>>
>>  file://0010-make.bash-override-CC-when-building-dist-and-go_boot.patch \
>> +        file://0011-use-GOBUILDMODE-to-set-buildmode.patch \
>>  "
>>  SRC_URI_append_libc-musl = " file://set-external-linker.patch"
>>
>> diff --git
>> a/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch
>> b/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch
>> new file mode 100644
>> index 0000000..e69ce06
>> --- /dev/null
>> +++
>> b/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode.patch
>> @@ -0,0 +1,40 @@
>> +From b928fafab1d9425aae9341806bd2f6178ba1da1f Mon Sep 17 00:00:00 2001
>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>> +Date: Fri, 26 Oct 2018 16:32:50 +0800
>> +Subject: [PATCH] use GOBUILDMODE to set buildmode
>> +
>> +While building go itself, the go build system does not support
>> +to set `-buildmode=pie' from environment.
>> +
>> +Add GOBUILDMODE to support it which make PIE executables the default
>> +build mode, as PIE executables are required as of Yocto
>> +
>> +Refers: https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI
>> +Upstream-Status
>> <https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI+Upstream-Status>:
>> Deny [upstream choose antoher solution: `17a256b
>> +cmd/go: -buildmode=pie for android/arm']
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + src/cmd/go/internal/work/build.go | 6 +++++-
>> + 1 file changed, 5 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/src/cmd/go/internal/work/build.go
>> b/src/cmd/go/internal/work/build.go
>> +index b276de5..1683e7e 100644
>> +--- a/src/cmd/go/internal/work/build.go
>> ++++ b/src/cmd/go/internal/work/build.go
>> +@@ -211,7 +211,11 @@ func AddBuildFlags(cmd *base.Command) {
>> +
>> +       cmd.Flag.Var((*base.StringsFlag)(&buildAsmflags), "asmflags", "")
>> +       cmd.Flag.Var(buildCompiler{}, "compiler", "")
>> +-      cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default",
>> "")
>> ++      if bm := os.Getenv("GOBUILDMODE"); bm != "" {
>> ++              cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", bm,
>> "")
>> ++      } else {
>> ++              cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode",
>> "default", "")
>> ++      }
>> +       cmd.Flag.Var((*base.StringsFlag)(&buildGcflags), "gcflags", "")
>> +       cmd.Flag.Var((*base.StringsFlag)(&buildGccgoflags), "gccgoflags",
>> "")
>> +       cmd.Flag.StringVar(&cfg.BuildContext.InstallSuffix,
>> "installsuffix", "", "")
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-devtools/go/go_1.11.bb
>> b/meta/recipes-devtools/go/go_1.11.bb
>> index c67e2cb..ce3b905 100644
>> --- a/meta/recipes-devtools/go/go_1.11.bb
>> +++ b/meta/recipes-devtools/go/go_1.11.bb
>> @@ -1,2 +1,14 @@
>>  require go-${PV}.inc
>>  require go-target.inc
>> +
>> +export GOBUILDMODE=""
>> +
>> +# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips
>> +# doesn't support -buildmode=pie, so skip the QA checking for mips and
>> its
>> +# variants.
>> +python() {
>> +    if 'mips' in d.getVar('TARGET_ARCH'):
>> +        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
>> +    else:
>> +        d.appendVar('GOBUILDMODE', 'pie')
>> +}
>> diff --git a/meta/recipes-devtools/go/go_1.9.bb
>> b/meta/recipes-devtools/go/go_1.9.bb
>> index 7da7897..c5cdfb6 100644
>> --- a/meta/recipes-devtools/go/go_1.9.bb
>> +++ b/meta/recipes-devtools/go/go_1.9.bb
>> @@ -5,6 +5,7 @@ export GO_TARGET_INSTALL = "cmd"
>>  export GO_FLAGS = "-a"
>>  export CC_FOR_TARGET = "${CC}"
>>  export CXX_FOR_TARGET = "${CXX}"
>> +export GOBUILDMODE=""
>>
>>  do_compile() {
>>         export GOBIN="${B}/bin"
>> @@ -16,9 +17,12 @@ do_compile() {
>>         cd ${B}
>>  }
>>
>> -# for aarch64 ends with textrel in ${PN}
>> -# http://errors.yoctoproject.org/Errors/Details/185634/
>> -# ERROR: QA Issue: ELF binary
>> '/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/bin/go'
>> has relocations in .text
>> -# ELF binary
>> '/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/trace'
>> has relocations in .text
>> -# ELF binary
>> '/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/pprof'
>> has relocations in .text [textrel]
>> -INSANE_SKIP_${PN} += "textrel"
>> +# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips
>> +# doesn't support -buildmode=pie, so skip the QA checking for mips and
>> its
>> +# variants.
>> +python() {
>> +    if 'mips' in d.getVar('TARGET_ARCH'):
>> +        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
>> +    else:
>> +        d.appendVar('GOBUILDMODE', 'pie')
>> +}
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--000000000000e124b80579fe2b5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry for noise, I&#39;ve double checked and your fix wasn=
&#39;t included yet in the build which triggered the QA warning for me.<div=
><br></div><div>I&#39;ve re-triggered to test with the fix really included,=
 will let you know if it didn&#39;t fix the issue.</div><div><br></div><div=
>Thanks</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, =
Nov 6, 2018 at 9:31 AM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmai=
l.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div dir=3D"ltr"><pre class=3D"m_2259858583088756193gmail-console=
-output" style=3D"box-sizing:border-box;white-space:pre-wrap;margin-top:0px=
;margin-bottom:0px;color:rgb(51,51,51);font-size:15px">Hi, there are still =
textrel QA issues for aarch64 builds:</pre><pre class=3D"m_2259858583088756=
193gmail-console-output" style=3D"box-sizing:border-box;white-space:pre-wra=
p;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:15px"><br>=
</pre><pre class=3D"m_2259858583088756193gmail-console-output" style=3D"box=
-sizing:border-box;white-space:pre-wrap;margin-top:0px;margin-bottom:0px;co=
lor:rgb(51,51,51);font-size:15px">ERROR: go-1.11.1-r0 do_package_qa: QA Iss=
ue: ELF binary &#39;/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go=
/bin/go&#39; has relocations in .text<br>ELF binary &#39;/work/aarch64/go/1=
.11.1-r0/packages-split/go/usr/lib/go/bin/go&#39; has relocations in .text
ELF binary &#39;/work/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/pkg=
/tool/linux_arm64/trace&#39; has relocations in .text<br>ELF binary &#39;/w=
ork/aarch64/go/1.11.1-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/=
trace&#39; has relocations in .text<br>ELF binary &#39;/work/aarch64/go/1.1=
1.1-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/pprof&#39; has rel=
ocations in .text<br>ELF binary &#39;/work/aarch64/go/1.11.1-r0/packages-sp=
lit/go/usr/lib/go/pkg/tool/linux_arm64/pprof&#39; has relocations in .text =
[textrel]<br>ERROR: go-1.11.1-r0 do_package_qa: QA run found fatal errors. =
Please consider fixing them.
ERROR: go-1.11.1-r0 do_package_qa: Function failed: do_package_qa</pre></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Oct 26, 2018 at 1=
1:32 AM Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=
=3D"_blank">hongxu.jia@windriver.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">While building go itself, the go build system does not sup=
port<br>
to set `-buildmode=3Dpie&#39; from environment.<br>
<br>
Add GOBUILDMODE to support it which make PIE executables the default<br>
build mode, as PIE executables are required as of Yocto<br>
<br>
But mips doesn&#39;t support -buildmode=3Dpie, so skip the QA checking for<=
br>
mips and its variants<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-1.11.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0.../0008-use-GOBUILDMODE-to-set-buildmode.patch=C2=A0 =C2=A0 | 40 +++=
+++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/go/go-1.9.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0.../0011-use-GOBUILDMODE-to-set-buildmode.patch=C2=A0 =C2=A0 | 40 +++=
+++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go_1.11.bb" rel=3D"norefer=
rer" target=3D"_blank">go_1.11.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 12 +++++++<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go_1.9.bb" rel=3D"noreferr=
er" target=3D"_blank">go_1.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 16 +++++----<br>
=C2=A06 files changed, 104 insertions(+), 6 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDM=
ODE-to-set-buildmode.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMO=
DE-to-set-buildmode.patch<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.11.inc b/meta/recipes-devtools/g=
o/go-1.11.inc<br>
index c02e468..d626514 100644<br>
--- a/meta/recipes-devtools/go/go-1.11.inc<br>
+++ b/meta/recipes-devtools/go/go-1.11.inc<br>
@@ -15,6 +15,7 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0005-make.bash-override-CC-when-building-dist-an=
d-go_boot.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0006-cmd-dist-separate-host-and-target-builds.pa=
tch \<br>
=C2=A0 =C2=A0 =C2=A0file://0007-cmd-go-make-GOROOT-precious-by-default.patc=
h \<br>
+=C2=A0 =C2=A0 file://0008-use-GOBUILDMODE-to-set-buildmode.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI_append_libc-musl =3D &quot; file://0009-ld-replace-glibc-dyna=
mic-linker-with-musl.patch&quot;<br>
diff --git a/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-b=
uildmode.patch b/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-s=
et-buildmode.patch<br>
new file mode 100644<br>
index 0000000..88986dc<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmod=
e.patch<br>
@@ -0,0 +1,40 @@<br>
+From 0e0c247f0caec23528889ff09d98348cba9028f1 Mon Sep 17 00:00:00 2001<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D=
"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+Date: Fri, 26 Oct 2018 15:02:32 +0800<br>
+Subject: [PATCH] use GOBUILDMODE to set buildmode<br>
+<br>
+While building go itself, the go build system does not support<br>
+to set `-buildmode=3Dpie&#39; from environment.<br>
+<br>
+Add GOBUILDMODE to support it which make PIE executables the default<br>
+build mode, as PIE executables are required as of Yocto<br>
+<br>
+Refers: <a href=3D"https://groups.google.com/forum/#!topic/golang-dev/gRCe=
5URKewI+Upstream-Status" rel=3D"noreferrer" target=3D"_blank">https://group=
s.google.com/forum/#!topic/golang-dev/gRCe5URKewI<br>
+Upstream-Status</a>: Deny [upstream choose antoher solution: `17a256b<br>
+cmd/go: -buildmode=3Dpie for android/arm&#39;]<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ src/cmd/go/internal/work/build.go | 6 +++++-<br>
+ 1 file changed, 5 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/=
build.go<br>
+index 145b875..595d703 100644<br>
+--- a/src/cmd/go/internal/work/build.go<br>
++++ b/src/cmd/go/internal/work/build.go<br>
+@@ -218,7 +218,11 @@ func AddBuildFlags(cmd *base.Command) {<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.Var(&amp;load.BuildAsmflags, &quot;asm=
flags&quot;, &quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.Var(buildCompiler{}, &quot;compiler&qu=
ot;, &quot;&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 cmd.Flag.StringVar(&amp;cfg.BuildBuildmode, &quot;bu=
ildmode&quot;, &quot;default&quot;, &quot;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 if bm :=3D os.Getenv(&quot;GOBUILDMODE&quot;); bm !=
=3D &quot;&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.Flag.StringVar(&amp;=
cfg.BuildBuildmode, &quot;buildmode&quot;, bm, &quot;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.Flag.StringVar(&amp;=
cfg.BuildBuildmode, &quot;buildmode&quot;, &quot;default&quot;, &quot;&quot=
;)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.Var(&amp;load.BuildGcflags, &quot;gcfl=
ags&quot;, &quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.Var(&amp;load.BuildGccgoflags, &quot;g=
ccgoflags&quot;, &quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.StringVar(&amp;cfg.BuildMod, &quot;mod=
&quot;, &quot;&quot;, &quot;&quot;)<br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go=
/go-1.9.inc<br>
index 329cee0..ba1eaa0 100644<br>
--- a/meta/recipes-devtools/go/go-1.9.inc<br>
+++ b/meta/recipes-devtools/go/go-1.9.inc<br>
@@ -19,6 +19,7 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-make.bash-add-GOHOSTxx-indire=
ction-for-cross-canadia.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-cmd-go-buildmode-pie-forces-e=
xternal-linking-mode-on.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-make.bash-override-CC-when-bu=
ilding-dist-and-go_boot.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0011-use-GOBUILDMODE-to-set-buildmode.p=
atch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI_append_libc-musl =3D &quot; file://set-external-linker.patch&=
quot;<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-bu=
ildmode.patch b/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set=
-buildmode.patch<br>
new file mode 100644<br>
index 0000000..e69ce06<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.9/0011-use-GOBUILDMODE-to-set-buildmode=
.patch<br>
@@ -0,0 +1,40 @@<br>
+From b928fafab1d9425aae9341806bd2f6178ba1da1f Mon Sep 17 00:00:00 2001<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D=
"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+Date: Fri, 26 Oct 2018 16:32:50 +0800<br>
+Subject: [PATCH] use GOBUILDMODE to set buildmode<br>
+<br>
+While building go itself, the go build system does not support<br>
+to set `-buildmode=3Dpie&#39; from environment.<br>
+<br>
+Add GOBUILDMODE to support it which make PIE executables the default<br>
+build mode, as PIE executables are required as of Yocto<br>
+<br>
+Refers: <a href=3D"https://groups.google.com/forum/#!topic/golang-dev/gRCe=
5URKewI+Upstream-Status" rel=3D"noreferrer" target=3D"_blank">https://group=
s.google.com/forum/#!topic/golang-dev/gRCe5URKewI<br>
+Upstream-Status</a>: Deny [upstream choose antoher solution: `17a256b<br>
+cmd/go: -buildmode=3Dpie for android/arm&#39;]<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ src/cmd/go/internal/work/build.go | 6 +++++-<br>
+ 1 file changed, 5 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/=
build.go<br>
+index b276de5..1683e7e 100644<br>
+--- a/src/cmd/go/internal/work/build.go<br>
++++ b/src/cmd/go/internal/work/build.go<br>
+@@ -211,7 +211,11 @@ func AddBuildFlags(cmd *base.Command) {<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.Var((*base.StringsFlag)(&amp;buildAsmf=
lags), &quot;asmflags&quot;, &quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.Var(buildCompiler{}, &quot;compiler&qu=
ot;, &quot;&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 cmd.Flag.StringVar(&amp;cfg.BuildBuildmode, &quot;bu=
ildmode&quot;, &quot;default&quot;, &quot;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 if bm :=3D os.Getenv(&quot;GOBUILDMODE&quot;); bm !=
=3D &quot;&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.Flag.StringVar(&amp;=
cfg.BuildBuildmode, &quot;buildmode&quot;, bm, &quot;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.Flag.StringVar(&amp;=
cfg.BuildBuildmode, &quot;buildmode&quot;, &quot;default&quot;, &quot;&quot=
;)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.Var((*base.StringsFlag)(&amp;buildGcfl=
ags), &quot;gcflags&quot;, &quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.Var((*base.StringsFlag)(&amp;buildGccg=
oflags), &quot;gccgoflags&quot;, &quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.Flag.StringVar(&amp;cfg.BuildContext.Instal=
lSuffix, &quot;installsuffix&quot;, &quot;&quot;, &quot;&quot;)<br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.11.bb" rel=3D"=
noreferrer" target=3D"_blank">go_1.11.bb</a> b/meta/recipes-devtools/go/<a =
href=3D"http://go_1.11.bb" rel=3D"noreferrer" target=3D"_blank">go_1.11.bb<=
/a><br>
index c67e2cb..ce3b905 100644<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go_1.11.bb" rel=3D"norefer=
rer" target=3D"_blank">go_1.11.bb</a><br>
+++ b/meta/recipes-devtools/go/<a href=3D"http://go_1.11.bb" rel=3D"norefer=
rer" target=3D"_blank">go_1.11.bb</a><br>
@@ -1,2 +1,14 @@<br>
=C2=A0require go-${PV}.inc<br>
=C2=A0require go-target.inc<br>
+<br>
+export GOBUILDMODE=3D&quot;&quot;<br>
+<br>
+# Add pie to GOBUILDMODE to satisfy &quot;textrel&quot; QA checking, but m=
ips<br>
+# doesn&#39;t support -buildmode=3Dpie, so skip the QA checking for mips a=
nd its<br>
+# variants.<br>
+python() {<br>
+=C2=A0 =C2=A0 if &#39;mips&#39; in d.getVar(&#39;TARGET_ARCH&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;INSANE_SKIP_%s&#39; % d.getVa=
r(&#39;PN&#39;), &quot; textrel&quot;)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;GOBUILDMODE&#39;, &#39;pie&#3=
9;)<br>
+}<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.9.bb" rel=3D"n=
oreferrer" target=3D"_blank">go_1.9.bb</a> b/meta/recipes-devtools/go/<a hr=
ef=3D"http://go_1.9.bb" rel=3D"noreferrer" target=3D"_blank">go_1.9.bb</a><=
br>
index 7da7897..c5cdfb6 100644<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go_1.9.bb" rel=3D"noreferr=
er" target=3D"_blank">go_1.9.bb</a><br>
+++ b/meta/recipes-devtools/go/<a href=3D"http://go_1.9.bb" rel=3D"noreferr=
er" target=3D"_blank">go_1.9.bb</a><br>
@@ -5,6 +5,7 @@ export GO_TARGET_INSTALL =3D &quot;cmd&quot;<br>
=C2=A0export GO_FLAGS =3D &quot;-a&quot;<br>
=C2=A0export CC_FOR_TARGET =3D &quot;${CC}&quot;<br>
=C2=A0export CXX_FOR_TARGET =3D &quot;${CXX}&quot;<br>
+export GOBUILDMODE=3D&quot;&quot;<br>
<br>
=C2=A0do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOBIN=3D&quot;${B}/bin&quot;<br>
@@ -16,9 +17,12 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}<br>
=C2=A0}<br>
<br>
-# for aarch64 ends with textrel in ${PN}<br>
-# <a href=3D"http://errors.yoctoproject.org/Errors/Details/185634/" rel=3D=
"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Detail=
s/185634/</a><br>
-# ERROR: QA Issue: ELF binary &#39;/work/aarch64-oe-linux/go/1.9.7-r0/pack=
ages-split/go/usr/lib/go/bin/go&#39; has relocations in .text<br>
-# ELF binary &#39;/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr=
/lib/go/pkg/tool/linux_arm64/trace&#39; has relocations in .text<br>
-# ELF binary &#39;/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr=
/lib/go/pkg/tool/linux_arm64/pprof&#39; has relocations in .text [textrel]<=
br>
-INSANE_SKIP_${PN} +=3D &quot;textrel&quot;<br>
+# Add pie to GOBUILDMODE to satisfy &quot;textrel&quot; QA checking, but m=
ips<br>
+# doesn&#39;t support -buildmode=3Dpie, so skip the QA checking for mips a=
nd its<br>
+# variants.<br>
+python() {<br>
+=C2=A0 =C2=A0 if &#39;mips&#39; in d.getVar(&#39;TARGET_ARCH&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;INSANE_SKIP_%s&#39; % d.getVa=
r(&#39;PN&#39;), &quot; textrel&quot;)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;GOBUILDMODE&#39;, &#39;pie&#3=
9;)<br>
+}<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>
</blockquote></div>

--000000000000e124b80579fe2b5d--
