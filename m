Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7705C4727C
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:42 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.31122.1649046402955478293
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 21:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Oo0CMOsb;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.54,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f54.google.com with SMTP id r13so17334815ejd.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 21:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K0vE6Kh6MIlOuRNAMiF6CLPoZT7FIgGwtWEQBHeP6js=;
        b=Oo0CMOsbNJDf2JjrpoksVH8dzaWqo3E+qRUFvA35bA2VlHSfSkdNo5PyLmzbdgdU+q
         0Jq2Z1IAd5nO6DiWymoyq4LyPcsttOjSPFEqOK79fUNUTxFAtfqd3E2w/BVIth7etJGK
         vF7iI1Kbmlu6P6yEpdNVDGFRtpnQaKvFLXbjRzdH/MCGpAl5WuTvb9MdSy/DW/4evl7+
         kn1xOGAWkQc/+uPTOJDlyDWVd21hvBS2vt/rULeeIdVli837RMNvUf4pjc8rTHgpZTN/
         vFSA1CQ8oeXhu9fls02bpquooNDCDI5Mx6hniUL3u7weGz471edDf4MkvZ7qtRaMQcnI
         /17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K0vE6Kh6MIlOuRNAMiF6CLPoZT7FIgGwtWEQBHeP6js=;
        b=mzcalujzCOTWGSF/zONZ5tcLWT5FC+BhOstF4+3bXsSBgopksd+8KW0RNpd/2CsNLx
         FPNdidPMiU5gSAcMryBykGzsikZ7Vv7TgJXzI83+9rnpJu183YR7R3Q9/wAVdCtaoUXs
         jvz7GtcfBidLTLVuhWjkzCVh59edHJNFNuftlMa2AUpDNQr9Qi3fPq3mXryh9lvQVmyH
         sKAMY4EUPcJrVeCuiL/tTVq2FhtqXZyaE0kNtp8+mmfuOtECbmrfc/shpdpdu8VmrLml
         IrKF3Y98Iuo/moV3cHhAgpiGGpbJI3AKYac3G1Q4SKel8vLpnNDGOwEkXBST+ftG5Vp3
         e+Dw==
X-Gm-Message-State: AOAM530KKKCqVqELkASijEUa+uLEMs8wRnzunR0iaaJuNumt6w01W2uo
	qfNwbt/zaPvBLDRNefqGh2Jt0pVGv3TUk4TIT+cK11o2hdjcAeud
X-Google-Smtp-Source: 
 ABdhPJx4xE66V+OQ4mHgj2UsLLSDvoPi4ggysqAVxkSc6CMawhYT9SZ3vP/fX+vvFePTtvIF+NgCjbhVRfZ6IA/hNEU=
X-Received: by 2002:a17:906:704f:b0:6e0:2ce5:131e with SMTP id
 r15-20020a170906704f00b006e02ce5131emr8827782ejj.246.1649046401217; Sun, 03
 Apr 2022 21:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1649026624.git.steve@sakoman.com>
 <a2428925bb68387bfeefa37d8500d23631211a64.1649026624.git.steve@sakoman.com>
 <CACpMEhNbRebsWNd-2QtDkZs_udEw1taK=9i7zh15MU=JP-Krgg@mail.gmail.com>
In-Reply-To: 
 <CACpMEhNbRebsWNd-2QtDkZs_udEw1taK=9i7zh15MU=JP-Krgg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 3 Apr 2022 18:26:29 -1000
Message-ID: 
 <CAOSpxdZ764d7VM6rb-qTUETfqOghheW9Akfoud4du_aMWB8RSg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 2/8] go: backport patch fix for CVE-2021-38297
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f692f305dbcc88ec"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163982

--000000000000f692f305dbcc88ec
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 3, 2022, 6:23 PM Ranjitsinh Rathod <
ranjitsinhrathod1991@gmail.com> wrote:

> Hi Steve,
>
> There is one commented out line present. Is that really needed?
>

Good catch!  I'll remove that prior to the pull request.

Steve


> Thanks,
> Ranjitsinh Rathod
>
> On Mon, 4 Apr, 2022, 8:01 am Steve Sakoman, <steve@sakoman.com> wrote:
>
>> From: Davide Gardenal <davidegarde2000@gmail.com>
>>
>> Patch taken from
>>
>> https://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90040a85922564
>> from the following issue
>> https://github.com/golang/go/issues/48797
>>
>> Original repo
>> https://go.googlesource.com/go/+/77f2750f4398990eed972186706f160631d7dae4
>>
>> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>  meta/recipes-devtools/go/go-1.14.inc          |  4 +
>>  .../go/go-1.14/CVE-2021-38297.patch           | 97 +++++++++++++++++++
>>  2 files changed, 101 insertions(+)
>>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
>>
>> diff --git a/meta/recipes-devtools/go/go-1.14.inc
>> b/meta/recipes-devtools/go/go-1.14.inc
>> index 9b3c3b30a8..f98757d10d 100644
>> --- a/meta/recipes-devtools/go/go-1.14.inc
>> +++ b/meta/recipes-devtools/go/go-1.14.inc
>> @@ -19,9 +19,13 @@ SRC_URI += "\
>>      file://CVE-2021-34558.patch \
>>      file://CVE-2021-33196.patch \
>>      file://CVE-2021-33197.patch \
>> +    file://CVE-2021-38297.patch \
>>      file://CVE-2022-23806.patch \
>>      file://CVE-2022-23772.patch \
>>  "
>> +
>> +# file://CVE-2021-38297.patch
>> +
>>  SRC_URI_append_libc-musl = "
>> file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
>>  SRC_URI[main.sha256sum] =
>> "7ed13b2209e54a451835997f78035530b331c5b6943cdcd68a3d815fdc009149"
>>
>> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
>> b/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
>> new file mode 100644
>> index 0000000000..24ceabf808
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
>> @@ -0,0 +1,97 @@
>> +From 4548fcc8dfd933c237f29bba6f90040a85922564 Mon Sep 17 00:00:00 2001
>> +From: Michael Knyszek <mknyszek@google.com>
>> +Date: Thu, 2 Sep 2021 16:51:59 -0400
>> +Subject: [PATCH] [release-branch.go1.16] misc/wasm, cmd/link: do not let
>> + command line args overwrite global data
>> +
>> +On Wasm, wasm_exec.js puts command line arguments at the beginning
>> +of the linear memory (following the "zero page"). Currently there
>> +is no limit for this, and a very long command line can overwrite
>> +the program's data section. Prevent this by limiting the command
>> +line to 4096 bytes, and in the linker ensuring the data section
>> +starts at a high enough address (8192).
>> +
>> +(Arguably our address assignment on Wasm is a bit confusing. This
>> +is the minimum fix I can come up with.)
>> +
>> +Thanks to Ben Lubar for reporting this issue.
>> +
>> +Change by Cherry Mui <cherryyz@google.com>.
>> +
>> +For #48797
>> +Fixes #48799
>> +Fixes CVE-2021-38297
>> +
>> +Change-Id: I0f50fbb2a5b6d0d047e3c134a88988d9133e4ab3
>> +Reviewed-on:
>> https://team-review.git.corp.google.com/c/golang/go-private/+/1205933
>> +Reviewed-by
>> <https://team-review.git.corp.google.com/c/golang/go-private/+/1205933+Reviewed-by>:
>> Roland Shoemaker <bracewell@google.com>
>> +Reviewed-by: Than McIntosh <thanm@google.com>
>> +Reviewed-on: https://go-review.googlesource.com/c/go/+/354591
>> +Trust: Michael Knyszek <mknyszek@google.com>
>> +Reviewed-by: Heschi Kreinick <heschi@google.com>
>> +
>> +CVE: CVE-2021-38297
>> +
>> +Upstream-Status: Backport:
>> +
>> https://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90040a85922564
>> +
>> +Inline of ctxt.isWAsm followin this implemetation:
>> +
>> https://github.com/golang/go/blob/4548fcc8dfd933c237f29bba6f90040a85922564/src/cmd/link/internal/ld/target.go#L127
>> +
>> +Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
>> +---
>> + misc/wasm/wasm_exec.js           |  7 +++++++
>> + src/cmd/link/internal/ld/data.go | 11 ++++++++++-
>> + 2 files changed, 17 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/misc/wasm/wasm_exec.js b/misc/wasm/wasm_exec.js
>> +index 82041e6bb901..a0a264278b1b 100644
>> +--- a/misc/wasm/wasm_exec.js
>> ++++ b/misc/wasm/wasm_exec.js
>> +@@ -564,6 +564,13 @@
>> +                               offset += 8;
>> +                       });
>> +
>> ++                      // The linker guarantees global data starts from
>> at least wasmMinDataAddr.
>> ++                      // Keep in sync with
>> cmd/link/internal/ld/data.go:wasmMinDataAddr.
>> ++                      const wasmMinDataAddr = 4096 + 4096;
>> ++                      if (offset >= wasmMinDataAddr) {
>> ++                              throw new Error("command line too long");
>> ++                      }
>> ++
>> +                       this._inst.exports.run(argc, argv);
>> +                       if (this.exited) {
>> +                               this._resolveExitPromise();
>> +diff --git a/src/cmd/link/internal/ld/data.go
>> b/src/cmd/link/internal/ld/data.go
>> +index 52035e96301c..54a1d188cdb9 100644
>> +--- a/src/cmd/link/internal/ld/data.go
>> ++++ b/src/cmd/link/internal/ld/data.go
>> +@@ -2330,6 +2330,11 @@ func assignAddress(ctxt *Link, sect *sym.Section,
>> n int, s loader.Sym, va uint64
>> +       return sect, n, va
>> + }
>> +
>> ++// On Wasm, we reserve 4096 bytes for zero page, then 4096 bytes for
>> wasm_exec.js
>> ++// to store command line args. Data sections starts from at least
>> address 8192.
>> ++// Keep in sync with wasm_exec.js.
>> ++const wasmMinDataAddr = 4096 + 4096
>> ++
>> + // address assigns virtual addresses to all segments and sections and
>> + // returns all segments in file order.
>> + func (ctxt *Link) address() []*sym.Segment {
>> +@@ -2339,10 +2344,14 @@ func (ctxt *Link) address() []*sym.Segment {
>> +       order = append(order, &Segtext)
>> +       Segtext.Rwx = 05
>> +       Segtext.Vaddr = va
>> +-      for _, s := range Segtext.Sections {
>> ++      for i, s := range Segtext.Sections {
>> +               va = uint64(Rnd(int64(va), int64(s.Align)))
>> +               s.Vaddr = va
>> +               va += s.Length
>> ++
>> ++              if ctxt.Arch.Family == sys.Wasm && i == 0 && va <
>> wasmMinDataAddr {
>> ++                      va = wasmMinDataAddr
>> ++              }
>> +       }
>> +
>> +       Segtext.Length = va - uint64(*FlagTextAddr)
>> +
>> \ No newline at end of file
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#163974):
>> https://lists.openembedded.org/g/openembedded-core/message/163974
>> Mute This Topic: https://lists.openembedded.org/mt/90233348/6360406
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> ranjitsinhrathod1991@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>

--000000000000f692f305dbcc88ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Apr 3, 2022, 6:23 PM Ranjitsinh Rathod &lt;<a =
href=3D"mailto:ranjitsinhrathod1991@gmail.com">ranjitsinhrathod1991@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"=
>Hi Steve,<div dir=3D"auto"><br></div><div dir=3D"auto">There is one commen=
ted out line present. Is that really needed?</div></div></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Good catch!=C2=A0 I&#39=
;ll remove that prior to the pull request.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Steve</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto=
"><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"au=
to">Ranjitsinh Rathod</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, 4 Apr, 2022, 8:01 am Steve Sakoman, &lt;=
<a href=3D"mailto:steve@sakoman.com" target=3D"_blank" rel=3D"noreferrer">s=
teve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Fro=
m: Davide Gardenal &lt;<a href=3D"mailto:davidegarde2000@gmail.com" rel=3D"=
noreferrer noreferrer" target=3D"_blank">davidegarde2000@gmail.com</a>&gt;<=
br>
<br>
Patch taken from<br>
<a href=3D"https://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90=
040a85922564" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ht=
tps://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90040a85922564<=
/a><br>
from the following issue<br>
<a href=3D"https://github.com/golang/go/issues/48797" rel=3D"noreferrer nor=
eferrer noreferrer" target=3D"_blank">https://github.com/golang/go/issues/4=
8797</a><br>
<br>
Original repo<br>
<a href=3D"https://go.googlesource.com/go/+/77f2750f4398990eed972186706f160=
631d7dae4" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https=
://go.googlesource.com/go/+/77f2750f4398990eed972186706f160631d7dae4</a><br=
>
<br>
Signed-off-by: Davide Gardenal &lt;<a href=3D"mailto:davide.gardenal@huawei=
.com" rel=3D"noreferrer noreferrer" target=3D"_blank">davide.gardenal@huawe=
i.com</a>&gt;<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">steve@sakoman.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-1.14.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 4 +<br>
=C2=A0.../go/go-1.14/CVE-2021-38297.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 97 +++++++++++++++++++<br>
=C2=A02 files changed, 101 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-38297.pa=
tch<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/g=
o/go-1.14.inc<br>
index 9b3c3b30a8..f98757d10d 100644<br>
--- a/meta/recipes-devtools/go/go-1.14.inc<br>
+++ b/meta/recipes-devtools/go/go-1.14.inc<br>
@@ -19,9 +19,13 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2021-34558.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2021-33196.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2021-33197.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2021-38297.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2022-23806.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2022-23772.patch \<br>
=C2=A0&quot;<br>
+<br>
+# file://CVE-2021-38297.patch<br>
+<br>
=C2=A0SRC_URI_append_libc-musl =3D &quot; file://0009-ld-replace-glibc-dyna=
mic-linker-with-musl.patch&quot;<br>
=C2=A0SRC_URI[main.sha256sum] =3D &quot;7ed13b2209e54a451835997f78035530b33=
1c5b6943cdcd68a3d815fdc009149&quot;<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch b/meta/r=
ecipes-devtools/go/go-1.14/CVE-2021-38297.patch<br>
new file mode 100644<br>
index 0000000000..24ceabf808<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch<br>
@@ -0,0 +1,97 @@<br>
+From 4548fcc8dfd933c237f29bba6f90040a85922564 Mon Sep 17 00:00:00 2001<br>
+From: Michael Knyszek &lt;<a href=3D"mailto:mknyszek@google.com" rel=3D"no=
referrer noreferrer" target=3D"_blank">mknyszek@google.com</a>&gt;<br>
+Date: Thu, 2 Sep 2021 16:51:59 -0400<br>
+Subject: [PATCH] [release-branch.go1.16] misc/wasm, cmd/link: do not let<b=
r>
+ command line args overwrite global data<br>
+<br>
+On Wasm, wasm_exec.js puts command line arguments at the beginning<br>
+of the linear memory (following the &quot;zero page&quot;). Currently ther=
e<br>
+is no limit for this, and a very long command line can overwrite<br>
+the program&#39;s data section. Prevent this by limiting the command<br>
+line to 4096 bytes, and in the linker ensuring the data section<br>
+starts at a high enough address (8192).<br>
+<br>
+(Arguably our address assignment on Wasm is a bit confusing. This<br>
+is the minimum fix I can come up with.)<br>
+<br>
+Thanks to Ben Lubar for reporting this issue.<br>
+<br>
+Change by Cherry Mui &lt;<a href=3D"mailto:cherryyz@google.com" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">cherryyz@google.com</a>&gt;.<br>
+<br>
+For #48797<br>
+Fixes #48799<br>
+Fixes CVE-2021-38297<br>
+<br>
+Change-Id: I0f50fbb2a5b6d0d047e3c134a88988d9133e4ab3<br>
+Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/golang/g=
o-private/+/1205933+Reviewed-by" rel=3D"noreferrer noreferrer noreferrer" t=
arget=3D"_blank">https://team-review.git.corp.google.com/c/golang/go-privat=
e/+/1205933<br>
+Reviewed-by</a>: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.c=
om" rel=3D"noreferrer noreferrer" target=3D"_blank">bracewell@google.com</a=
>&gt;<br>
+Reviewed-by: Than McIntosh &lt;<a href=3D"mailto:thanm@google.com" rel=3D"=
noreferrer noreferrer" target=3D"_blank">thanm@google.com</a>&gt;<br>
+Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/354591" =
rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://go-revie=
w.googlesource.com/c/go/+/354591</a><br>
+Trust: Michael Knyszek &lt;<a href=3D"mailto:mknyszek@google.com" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">mknyszek@google.com</a>&gt;<br>
+Reviewed-by: Heschi Kreinick &lt;<a href=3D"mailto:heschi@google.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">heschi@google.com</a>&gt;<br>
+<br>
+CVE: CVE-2021-38297<br>
+<br>
+Upstream-Status: Backport:<br>
+<a href=3D"https://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f9=
0040a85922564" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90040a85922564=
</a><br>
+<br>
+Inline of ctxt.isWAsm followin this implemetation:<br>
+<a href=3D"https://github.com/golang/go/blob/4548fcc8dfd933c237f29bba6f900=
40a85922564/src/cmd/link/internal/ld/target.go#L127" rel=3D"noreferrer nore=
ferrer noreferrer" target=3D"_blank">https://github.com/golang/go/blob/4548=
fcc8dfd933c237f29bba6f90040a85922564/src/cmd/link/internal/ld/target.go#L12=
7</a><br>
+<br>
+Signed-off-by: Davide Gardenal &lt;<a href=3D"mailto:davide.gardenal@huawe=
i.com" rel=3D"noreferrer noreferrer" target=3D"_blank">davide.gardenal@huaw=
ei.com</a>&gt;<br>
+---<br>
+ misc/wasm/wasm_exec.js=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 =
+++++++<br>
+ src/cmd/link/internal/ld/data.go | 11 ++++++++++-<br>
+ 2 files changed, 17 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/misc/wasm/wasm_exec.js b/misc/wasm/wasm_exec.js<br>
+index 82041e6bb901..a0a264278b1b 100644<br>
+--- a/misc/wasm/wasm_exec.js<br>
++++ b/misc/wasm/wasm_exec.js<br>
+@@ -564,6 +564,13 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset +=3D 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0});<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // The linker guarantees global data starts from at least wasmMinDataAd=
dr.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Keep in sync with cmd/link/internal/ld/data.go:wasmMinDataAddr.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const wasmMinDataAddr =3D 4096 + 4096;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (offset &gt;=3D wasmMinDataAddr) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 throw new Error(&quot;command line too long=
&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0this._inst.exports.run(argc, argv);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (this.exited) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this._resolveExitPromise();<br>
+diff --git a/src/cmd/link/internal/ld/data.go b/src/cmd/link/internal/ld/d=
ata.go<br>
+index 52035e96301c..54a1d188cdb9 100644<br>
+--- a/src/cmd/link/internal/ld/data.go<br>
++++ b/src/cmd/link/internal/ld/data.go<br>
+@@ -2330,6 +2330,11 @@ func assignAddress(ctxt *Link, sect *sym.Section, n=
 int, s loader.Sym, va uint64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return sect, n, va<br>
+ }<br>
+ <br>
++// On Wasm, we reserve 4096 bytes for zero page, then 4096 bytes for wasm=
_exec.js<br>
++// to store command line args. Data sections starts from at least address=
 8192.<br>
++// Keep in sync with wasm_exec.js.<br>
++const wasmMinDataAddr =3D 4096 + 4096<br>
++<br>
+ // address assigns virtual addresses to all segments and sections and<br>
+ // returns all segments in file order.<br>
+ func (ctxt *Link) address() []*sym.Segment {<br>
+@@ -2339,10 +2344,14 @@ func (ctxt *Link) address() []*sym.Segment {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0order =3D append(order, &amp;Segtext)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Segtext.Rwx =3D 05<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Segtext.Vaddr =3D va<br>
+-=C2=A0 =C2=A0 =C2=A0 for _, s :=3D range Segtext.Sections {<br>
++=C2=A0 =C2=A0 =C2=A0 for i, s :=3D range Segtext.Sections {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0va =3D uint64(Rnd(i=
nt64(va), int64(s.Align)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s.Vaddr =3D va<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0va +=3D s.Length<br=
>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ctxt.Arch.Family =3D=
=3D sys.Wasm &amp;&amp; i =3D=3D 0 &amp;&amp; va &lt; wasmMinDataAddr {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 va =3D wasmMinDataAddr<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Segtext.Length =3D va - uint64(*FlagTextAddr)<b=
r>
+ <br>
\ No newline at end of file<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163974): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163974" rel=3D"noreferrer noreferrer noreferrer" ta=
rget=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/=
163974</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90233348/6360=
406" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/mt/90233348/6360406</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-core+own=
er@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://l=
ists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ranj=
itsinhrathod1991@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>ranjitsinhrathod1991@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div></div>

--000000000000f692f305dbcc88ec--

