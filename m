Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CF4C4708D
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:42 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.31300.1649046236904435659
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 21:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qrgabhqG;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id k2so2306914edj.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 21:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EUgDdi8gvUQtQxvnqY2neTpfFbKtSXO86NDmoTPYo5o=;
        b=qrgabhqGsZZxl2Mo/+QCNg7bwjNkLlQ8x9MbyionL8EmplRRrf1NhfdXnkEwdWoWd0
         lvqqK2DVjkXy3RIHxnc3fS/dBgvI1h/SR+pp9mrYRNYPvDSBGF7KylCSghgMVWKQ/5EA
         /LGbj7ZB/Gh2ZBk3lEkStJMq9v382CAUvSxhuFVUubZWeBWPDNVQcYSZ2zkol4BgcrHa
         VgpkHgURP/wHJ1dzxkqwW8sp/hdWbkuVYRIPgCweKH7P7bPuzKvTVV4h6JT1T/9j/tHi
         kT5rgK6ls1NQl8zGsaskNh/3bjAfK3wj+g8OKenKKLKBnD0yFMsyJy7sVkNLglJo1cWJ
         kFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EUgDdi8gvUQtQxvnqY2neTpfFbKtSXO86NDmoTPYo5o=;
        b=yA3mzNwwMgZsTiemjXqNIz6nhhFZQvm+7bouVLT3abz0SoQwcZaFLhj4haJChL9DAL
         3gT3M1ukHPy0W2VRQmD9wfgTPlKM+E+qSgm1U3yoAQze2aclsXQEWBanJxRVsmUoIRrU
         grnttEfIxEHycFPD2BokIgAE9OFIfHGvLmhO87kl1Skg1WT3DlUQDQxiUOpVdakThzso
         E2BSWbHyOlJ95Tg8KUOmcrIbs00uS9fBx389xCJcZowOMaIc+etzWK3Bo0uoyNtUxZdL
         /nJo5rvLUwTI0g1QtHjXFfbuVLnHmxgvUSpCV6dOIrtbsH0g+6w7PIOEGLqd/M414PwR
         a9jg==
X-Gm-Message-State: AOAM532+EtBcO7lyIls8ZqgKJR83LfJLfBHfeM4iPWEI1lAFc08awiWQ
	6Eil5NQtSZVVbpxOzW+2LnqB2RCfXSX9cntuEWs=
X-Google-Smtp-Source: 
 ABdhPJyTD0TD1fHi7+yJ4cBzgo4AvK0u4NhLvKGOziv7TdgMKTSKyO0or5fVzSFwaObsctJ2Cwfbdgk/i4M69LkYEOg=
X-Received: by 2002:a05:6402:3044:b0:41c:d4d4:8664 with SMTP id
 bs4-20020a056402304400b0041cd4d48664mr2112990edb.239.1649046235127; Sun, 03
 Apr 2022 21:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1649026624.git.steve@sakoman.com>
 <a2428925bb68387bfeefa37d8500d23631211a64.1649026624.git.steve@sakoman.com>
In-Reply-To: 
 <a2428925bb68387bfeefa37d8500d23631211a64.1649026624.git.steve@sakoman.com>
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Date: Mon, 4 Apr 2022 09:53:42 +0530
Message-ID: 
 <CACpMEhNbRebsWNd-2QtDkZs_udEw1taK=9i7zh15MU=JP-Krgg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 2/8] go: backport patch fix for CVE-2021-38297
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001027f305dbcc7f2b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163981

--0000000000001027f305dbcc7f2b
Content-Type: text/plain; charset="UTF-8"

Hi Steve,

There is one commented out line present. Is that really needed?

Thanks,
Ranjitsinh Rathod

On Mon, 4 Apr, 2022, 8:01 am Steve Sakoman, <steve@sakoman.com> wrote:

> From: Davide Gardenal <davidegarde2000@gmail.com>
>
> Patch taken from
>
> https://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90040a85922564
> from the following issue
> https://github.com/golang/go/issues/48797
>
> Original repo
> https://go.googlesource.com/go/+/77f2750f4398990eed972186706f160631d7dae4
>
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-devtools/go/go-1.14.inc          |  4 +
>  .../go/go-1.14/CVE-2021-38297.patch           | 97 +++++++++++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.14.inc
> b/meta/recipes-devtools/go/go-1.14.inc
> index 9b3c3b30a8..f98757d10d 100644
> --- a/meta/recipes-devtools/go/go-1.14.inc
> +++ b/meta/recipes-devtools/go/go-1.14.inc
> @@ -19,9 +19,13 @@ SRC_URI += "\
>      file://CVE-2021-34558.patch \
>      file://CVE-2021-33196.patch \
>      file://CVE-2021-33197.patch \
> +    file://CVE-2021-38297.patch \
>      file://CVE-2022-23806.patch \
>      file://CVE-2022-23772.patch \
>  "
> +
> +# file://CVE-2021-38297.patch
> +
>  SRC_URI_append_libc-musl = "
> file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
>  SRC_URI[main.sha256sum] =
> "7ed13b2209e54a451835997f78035530b331c5b6943cdcd68a3d815fdc009149"
>
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
> new file mode 100644
> index 0000000000..24ceabf808
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
> @@ -0,0 +1,97 @@
> +From 4548fcc8dfd933c237f29bba6f90040a85922564 Mon Sep 17 00:00:00 2001
> +From: Michael Knyszek <mknyszek@google.com>
> +Date: Thu, 2 Sep 2021 16:51:59 -0400
> +Subject: [PATCH] [release-branch.go1.16] misc/wasm, cmd/link: do not let
> + command line args overwrite global data
> +
> +On Wasm, wasm_exec.js puts command line arguments at the beginning
> +of the linear memory (following the "zero page"). Currently there
> +is no limit for this, and a very long command line can overwrite
> +the program's data section. Prevent this by limiting the command
> +line to 4096 bytes, and in the linker ensuring the data section
> +starts at a high enough address (8192).
> +
> +(Arguably our address assignment on Wasm is a bit confusing. This
> +is the minimum fix I can come up with.)
> +
> +Thanks to Ben Lubar for reporting this issue.
> +
> +Change by Cherry Mui <cherryyz@google.com>.
> +
> +For #48797
> +Fixes #48799
> +Fixes CVE-2021-38297
> +
> +Change-Id: I0f50fbb2a5b6d0d047e3c134a88988d9133e4ab3
> +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/1205933
> +Reviewed-by
> <https://team-review.git.corp.google.com/c/golang/go-private/+/1205933+Reviewed-by>:
> Roland Shoemaker <bracewell@google.com>
> +Reviewed-by: Than McIntosh <thanm@google.com>
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/354591
> +Trust: Michael Knyszek <mknyszek@google.com>
> +Reviewed-by: Heschi Kreinick <heschi@google.com>
> +
> +CVE: CVE-2021-38297
> +
> +Upstream-Status: Backport:
> +
> https://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90040a85922564
> +
> +Inline of ctxt.isWAsm followin this implemetation:
> +
> https://github.com/golang/go/blob/4548fcc8dfd933c237f29bba6f90040a85922564/src/cmd/link/internal/ld/target.go#L127
> +
> +Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> +---
> + misc/wasm/wasm_exec.js           |  7 +++++++
> + src/cmd/link/internal/ld/data.go | 11 ++++++++++-
> + 2 files changed, 17 insertions(+), 1 deletion(-)
> +
> +diff --git a/misc/wasm/wasm_exec.js b/misc/wasm/wasm_exec.js
> +index 82041e6bb901..a0a264278b1b 100644
> +--- a/misc/wasm/wasm_exec.js
> ++++ b/misc/wasm/wasm_exec.js
> +@@ -564,6 +564,13 @@
> +                               offset += 8;
> +                       });
> +
> ++                      // The linker guarantees global data starts from
> at least wasmMinDataAddr.
> ++                      // Keep in sync with
> cmd/link/internal/ld/data.go:wasmMinDataAddr.
> ++                      const wasmMinDataAddr = 4096 + 4096;
> ++                      if (offset >= wasmMinDataAddr) {
> ++                              throw new Error("command line too long");
> ++                      }
> ++
> +                       this._inst.exports.run(argc, argv);
> +                       if (this.exited) {
> +                               this._resolveExitPromise();
> +diff --git a/src/cmd/link/internal/ld/data.go
> b/src/cmd/link/internal/ld/data.go
> +index 52035e96301c..54a1d188cdb9 100644
> +--- a/src/cmd/link/internal/ld/data.go
> ++++ b/src/cmd/link/internal/ld/data.go
> +@@ -2330,6 +2330,11 @@ func assignAddress(ctxt *Link, sect *sym.Section,
> n int, s loader.Sym, va uint64
> +       return sect, n, va
> + }
> +
> ++// On Wasm, we reserve 4096 bytes for zero page, then 4096 bytes for
> wasm_exec.js
> ++// to store command line args. Data sections starts from at least
> address 8192.
> ++// Keep in sync with wasm_exec.js.
> ++const wasmMinDataAddr = 4096 + 4096
> ++
> + // address assigns virtual addresses to all segments and sections and
> + // returns all segments in file order.
> + func (ctxt *Link) address() []*sym.Segment {
> +@@ -2339,10 +2344,14 @@ func (ctxt *Link) address() []*sym.Segment {
> +       order = append(order, &Segtext)
> +       Segtext.Rwx = 05
> +       Segtext.Vaddr = va
> +-      for _, s := range Segtext.Sections {
> ++      for i, s := range Segtext.Sections {
> +               va = uint64(Rnd(int64(va), int64(s.Align)))
> +               s.Vaddr = va
> +               va += s.Length
> ++
> ++              if ctxt.Arch.Family == sys.Wasm && i == 0 && va <
> wasmMinDataAddr {
> ++                      va = wasmMinDataAddr
> ++              }
> +       }
> +
> +       Segtext.Length = va - uint64(*FlagTextAddr)
> +
> \ No newline at end of file
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163974):
> https://lists.openembedded.org/g/openembedded-core/message/163974
> Mute This Topic: https://lists.openembedded.org/mt/90233348/6360406
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ranjitsinhrathod1991@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000001027f305dbcc7f2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Steve,<div dir=3D"auto"><br></div><div dir=3D"auto">Th=
ere is one commented out line present. Is that really needed?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Ranjit=
sinh Rathod</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, 4 Apr, 2022, 8:01 am Steve Sakoman, &lt;<a href=3D=
"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">From: Davide Gardenal &lt;<a href=3D"mailto:davide=
garde2000@gmail.com" target=3D"_blank" rel=3D"noreferrer">davidegarde2000@g=
mail.com</a>&gt;<br>
<br>
Patch taken from<br>
<a href=3D"https://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90=
040a85922564" rel=3D"noreferrer noreferrer" target=3D"_blank">https://githu=
b.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90040a85922564</a><br>
from the following issue<br>
<a href=3D"https://github.com/golang/go/issues/48797" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://github.com/golang/go/issues/48797</a><br=
>
<br>
Original repo<br>
<a href=3D"https://go.googlesource.com/go/+/77f2750f4398990eed972186706f160=
631d7dae4" rel=3D"noreferrer noreferrer" target=3D"_blank">https://go.googl=
esource.com/go/+/77f2750f4398990eed972186706f160631d7dae4</a><br>
<br>
Signed-off-by: Davide Gardenal &lt;<a href=3D"mailto:davide.gardenal@huawei=
.com" target=3D"_blank" rel=3D"noreferrer">davide.gardenal@huawei.com</a>&g=
t;<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank" rel=3D"noreferrer">steve@sakoman.com</a>&gt;<br>
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
+From: Michael Knyszek &lt;<a href=3D"mailto:mknyszek@google.com" target=3D=
"_blank" rel=3D"noreferrer">mknyszek@google.com</a>&gt;<br>
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
+Change by Cherry Mui &lt;<a href=3D"mailto:cherryyz@google.com" target=3D"=
_blank" rel=3D"noreferrer">cherryyz@google.com</a>&gt;.<br>
+<br>
+For #48797<br>
+Fixes #48799<br>
+Fixes CVE-2021-38297<br>
+<br>
+Change-Id: I0f50fbb2a5b6d0d047e3c134a88988d9133e4ab3<br>
+Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/golang/g=
o-private/+/1205933+Reviewed-by" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://team-review.git.corp.google.com/c/golang/go-private/+/1205933=
<br>
+Reviewed-by</a>: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.c=
om" target=3D"_blank" rel=3D"noreferrer">bracewell@google.com</a>&gt;<br>
+Reviewed-by: Than McIntosh &lt;<a href=3D"mailto:thanm@google.com" target=
=3D"_blank" rel=3D"noreferrer">thanm@google.com</a>&gt;<br>
+Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/354591" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://go-review.googlesou=
rce.com/c/go/+/354591</a><br>
+Trust: Michael Knyszek &lt;<a href=3D"mailto:mknyszek@google.com" target=
=3D"_blank" rel=3D"noreferrer">mknyszek@google.com</a>&gt;<br>
+Reviewed-by: Heschi Kreinick &lt;<a href=3D"mailto:heschi@google.com" targ=
et=3D"_blank" rel=3D"noreferrer">heschi@google.com</a>&gt;<br>
+<br>
+CVE: CVE-2021-38297<br>
+<br>
+Upstream-Status: Backport:<br>
+<a href=3D"https://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f9=
0040a85922564" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90040a85922564</a><br>
+<br>
+Inline of ctxt.isWAsm followin this implemetation:<br>
+<a href=3D"https://github.com/golang/go/blob/4548fcc8dfd933c237f29bba6f900=
40a85922564/src/cmd/link/internal/ld/target.go#L127" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://github.com/golang/go/blob/4548fcc8dfd933c=
237f29bba6f90040a85922564/src/cmd/link/internal/ld/target.go#L127</a><br>
+<br>
+Signed-off-by: Davide Gardenal &lt;<a href=3D"mailto:davide.gardenal@huawe=
i.com" target=3D"_blank" rel=3D"noreferrer">davide.gardenal@huawei.com</a>&=
gt;<br>
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
enembedded-core/message/163974" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/163974</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90233348/6360=
406" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/90233348/6360406</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ranjitsinhratho=
d1991@gmail.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinhrathod1991@=
gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000001027f305dbcc7f2b--

