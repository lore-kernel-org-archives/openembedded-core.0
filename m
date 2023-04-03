Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59552C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:19:44 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.66475.1680517180522120141
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TfS/hUqI;
 spf=pass (domain: mvista.com, ip: 209.85.208.180, mailfrom: skulkarni@mvista.com)
Received: by mail-lj1-f180.google.com with SMTP id a11so29769494lji.6
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 03:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1680517179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T2cy8tZSyr9qWDV7fYNzDnPfDJ53gZt0KCh4Ygful9Y=;
        b=TfS/hUqIOHXzH4FgZq/7eKjkJZYHVy1laVVw7HCUuRWeYNpfYYtaIjYtsl87/gtMZh
         QwkRVlxytsz9tER9AXR9tbDHq28w0qhgcCifBu+5vbD35ay+BaHEN/ozJtggAvZyrd+a
         wPTZRriaJRPYuGoyKXI1yEiBMj3wCEBSBllEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680517179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2cy8tZSyr9qWDV7fYNzDnPfDJ53gZt0KCh4Ygful9Y=;
        b=wC+zwz8+e/Dt4Vj74o3EjJ8qgjWXHTyukPtB74i7MkTJdOjZ/IXMnM0pv0kGTSIW5E
         ogrxrKNyFBXZLC1kQoKFlck1hBa3f8LdC8QQrVpJHz3pTG7OHDPWDfz+11DwOCnVc7fh
         EYFnYwX7tbUJOnQ/nWmfcX6Z1ckOAC/NJlcQJP9+pXm+D/HRAU2Z2ZguLdaBs4jJvd/C
         Mzmob+5Q/eUs3LUfpgbXe0ld1j5LA5cZE0VNvDpYbZbBJRo0HScOLiMJJd8R98vgeaNQ
         TfrGkjqg17R1WL3BozZtaswrSK7iC1ltRpl4DhokWSIRcQrnDfacStdYGr8KjJLCimRI
         24ww==
X-Gm-Message-State: AAQBX9e8LGZhbtFruDvKtFmNEuJFvGpiU0nbOnK0P8oIxIjw3+aNxFcf
	8jeicry37MUn4oBVtZ+2GzjjgA7lsGRlJIKYkKFMQw==
X-Google-Smtp-Source: AKy350ZU3iFFBDnYtecioXKlUnH77nh84do1iuokPUGDFx+b9iA9ukCeWAYH7NQXb9xJklFXpOgc6jXE35RGF57530A=
X-Received: by 2002:a2e:7004:0:b0:299:c8c4:c9f1 with SMTP id
 l4-20020a2e7004000000b00299c8c4c9f1mr10508920ljc.8.1680517178471; Mon, 03 Apr
 2023 03:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <175095E37B8161A1.14179@lists.openembedded.org>
In-Reply-To: <175095E37B8161A1.14179@lists.openembedded.org>
From: Shubham Kulkarni <skulkarni@mvista.com>
Date: Mon, 3 Apr 2023 15:49:27 +0530
Message-ID: <CAKzga+zqPYSa-yOupL3S5OeM_+GRFCRECZRw7soprgWHaSNTjg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] go-runtime: Security fix for CVE-2022-41723
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000764caa05f86be557"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 10:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179605

--000000000000764caa05f86be557
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

I think you missed the patch for the Kirkstone branch. It's showing an
*Unpatched* in the latest CVE metrics for kirkstone.

I had sent patches for CVE-2022-41723 in separate emails for both dunfell &
kirkstone with different subjects (mentioned branch). Dunfell patch is
already merged into dunfell-nut. I am not sure how kirkstone patch mail is
showing as a *reply* on dunfell patch mail. In the mail details as well as
on the list, it's showing the correct subject:
https://lists.openembedded.org/g/openembedded-core/message/179232

Apologies for the inconvenience caused. Please consider this patch for
kirkstone to fix CVE-2022-41723 golang.org/x/net/http2: avoid quadratic
complexity in HPACK decoding.

Regards,
Shubham Kulkarni

On Tue, Mar 28, 2023 at 6:14=E2=80=AFPM Shubham Kulkarni via lists.openembe=
dded.org
<skulkarni=3Dmvista.com@lists.openembedded.org> wrote:

> From: Shubham Kulkarni <skulkarni@mvista.com>
>
> Disable cmd/internal/moddeps test, since this update includes PRIVATE
> track fixes.
>
> Backport from
> https://github.com/golang/go/commit/5c3e11bd0b5c0a86e5beffcd4339b86a902b2=
1c3
>
> Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
>  .../go/go-1.18/CVE-2022-41723.patch           | 156 ++++++++++++++++++
>  2 files changed, 157 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41723.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc
> b/meta/recipes-devtools/go/go-1.17.13.inc
> index 99662bd298..971e38a744 100644
> --- a/meta/recipes-devtools/go/go-1.17.13.inc
> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
> @@ -20,6 +20,7 @@ SRC_URI +=3D "\
>      file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch =
\
>      file://CVE-2022-41715.patch \
>      file://CVE-2022-41717.patch \
> +    file://CVE-2022-41723.patch \
>  "
>  SRC_URI[main.sha256sum] =3D
> "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
>
> diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-41723.patch
> b/meta/recipes-devtools/go/go-1.18/CVE-2022-41723.patch
> new file mode 100644
> index 0000000000..a93fa31dcd
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-41723.patch
> @@ -0,0 +1,156 @@
> +From 451766789f646617157c725e20c955d4a9a70d4e Mon Sep 17 00:00:00 2001
> +From: Roland Shoemaker <bracewell@google.com>
> +Date: Mon, 6 Feb 2023 10:03:44 -0800
> +Subject: [PATCH] net/http: update bundled golang.org/x/net/http2
> +
> +Disable cmd/internal/moddeps test, since this update includes PRIVATE
> +track fixes.
> +
> +Fixes CVE-2022-41723
> +Fixes #58355
> +Updates #57855
> +
> +Change-Id: Ie870562a6f6e44e4e8f57db6a0dde1a41a2b090c
> +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/1728939
> +Reviewed-by
> <https://team-review.git.corp.google.com/c/golang/go-private/+/1728939+Re=
viewed-by>:
> Damien Neil <dneil@google.com>
> +Reviewed-by: Julie Qiu <julieqiu@google.com>
> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/468118
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +Run-TryBot: Michael Pratt <mpratt@google.com>
> +Auto-Submit: Michael Pratt <mpratt@google.com>
> +Reviewed-by: Than McIntosh <thanm@google.com>
> +
> +Upstream-Status: Backport [
> https://github.com/golang/go/commit/5c3e11bd0b5c0a86e5beffcd4339b86a902b2=
1c3
> ]
> +CVE: CVE-2022-41723
> +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> +---
> + src/vendor/golang.org/x/net/http2/hpack/hpack.go | 79
> +++++++++++++++---------
> + 1 file changed, 49 insertions(+), 30 deletions(-)
> +
> +diff --git a/src/vendor/golang.org/x/net/http2/hpack/hpack.go
> b/src/vendor/golang.org/x/net/http2/hpack/hpack.go
> +index 85f18a2..02e80e3 100644
> +--- a/src/vendor/golang.org/x/net/http2/hpack/hpack.go
> ++++ b/src/vendor/golang.org/x/net/http2/hpack/hpack.go
> +@@ -359,6 +359,7 @@ func (d *Decoder) parseFieldLiteral(n uint8, it
> indexType) error {
> +
> +       var hf HeaderField
> +       wantStr :=3D d.emitEnabled || it.indexed()
> ++      var undecodedName undecodedString
> +       if nameIdx > 0 {
> +               ihf, ok :=3D d.at(nameIdx)
> +               if !ok {
> +@@ -366,15 +367,27 @@ func (d *Decoder) parseFieldLiteral(n uint8, it
> indexType) error {
> +               }
> +               hf.Name =3D ihf.Name
> +       } else {
> +-              hf.Name, buf, err =3D d.readString(buf, wantStr)
> ++              undecodedName, buf, err =3D d.readString(buf)
> +               if err !=3D nil {
> +                       return err
> +               }
> +       }
> +-      hf.Value, buf, err =3D d.readString(buf, wantStr)
> ++      undecodedValue, buf, err :=3D d.readString(buf)
> +       if err !=3D nil {
> +               return err
> +       }
> ++      if wantStr {
> ++              if nameIdx <=3D 0 {
> ++                      hf.Name, err =3D d.decodeString(undecodedName)
> ++                      if err !=3D nil {
> ++                              return err
> ++                      }
> ++              }
> ++              hf.Value, err =3D d.decodeString(undecodedValue)
> ++              if err !=3D nil {
> ++                      return err
> ++              }
> ++      }
> +       d.buf =3D buf
> +       if it.indexed() {
> +               d.dynTab.add(hf)
> +@@ -459,46 +472,52 @@ func readVarInt(n byte, p []byte) (i uint64, remai=
n
> []byte, err error) {
> +       return 0, origP, errNeedMore
> + }
> +
> +-// readString decodes an hpack string from p.
> ++// readString reads an hpack string from p.
> + //
> +-// wantStr is whether s will be used. If false, decompression and
> +-// []byte->string garbage are skipped if s will be ignored
> +-// anyway. This does mean that huffman decoding errors for non-indexed
> +-// strings past the MAX_HEADER_LIST_SIZE are ignored, but the server
> +-// is returning an error anyway, and because they're not indexed, the
> error
> +-// won't affect the decoding state.
> +-func (d *Decoder) readString(p []byte, wantStr bool) (s string, remain
> []byte, err error) {
> ++// It returns a reference to the encoded string data to permit deferrin=
g
> decode costs
> ++// until after the caller verifies all data is present.
> ++func (d *Decoder) readString(p []byte) (u undecodedString, remain
> []byte, err error) {
> +       if len(p) =3D=3D 0 {
> +-              return "", p, errNeedMore
> ++              return u, p, errNeedMore
> +       }
> +       isHuff :=3D p[0]&128 !=3D 0
> +       strLen, p, err :=3D readVarInt(7, p)
> +       if err !=3D nil {
> +-              return "", p, err
> ++              return u, p, err
> +       }
> +       if d.maxStrLen !=3D 0 && strLen > uint64(d.maxStrLen) {
> +-              return "", nil, ErrStringLength
> ++              // Returning an error here means Huffman decoding errors
> ++              // for non-indexed strings past the maximum string length
> ++              // are ignored, but the server is returning an error anyw=
ay
> ++              // and because the string is not indexed the error will n=
ot
> ++              // affect the decoding state.
> ++              return u, nil, ErrStringLength
> +       }
> +       if uint64(len(p)) < strLen {
> +-              return "", p, errNeedMore
> +-      }
> +-      if !isHuff {
> +-              if wantStr {
> +-                      s =3D string(p[:strLen])
> +-              }
> +-              return s, p[strLen:], nil
> ++              return u, p, errNeedMore
> +       }
> ++      u.isHuff =3D isHuff
> ++      u.b =3D p[:strLen]
> ++      return u, p[strLen:], nil
> ++}
> +
> +-      if wantStr {
> +-              buf :=3D bufPool.Get().(*bytes.Buffer)
> +-              buf.Reset() // don't trust others
> +-              defer bufPool.Put(buf)
> +-              if err :=3D huffmanDecode(buf, d.maxStrLen, p[:strLen]); =
err
> !=3D nil {
> +-                      buf.Reset()
> +-                      return "", nil, err
> +-              }
> ++type undecodedString struct {
> ++      isHuff bool
> ++      b      []byte
> ++}
> ++
> ++func (d *Decoder) decodeString(u undecodedString) (string, error) {
> ++      if !u.isHuff {
> ++              return string(u.b), nil
> ++      }
> ++      buf :=3D bufPool.Get().(*bytes.Buffer)
> ++      buf.Reset() // don't trust others
> ++      var s string
> ++      err :=3D huffmanDecode(buf, d.maxStrLen, u.b)
> ++      if err =3D=3D nil {
> +               s =3D buf.String()
> +-              buf.Reset() // be nice to GC
> +       }
> +-      return s, p[strLen:], nil
> ++      buf.Reset() // be nice to GC
> ++      bufPool.Put(buf)
> ++      return s, err
> + }
> +--
> +2.7.4
> --
> 2.33.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179232):
> https://lists.openembedded.org/g/openembedded-core/message/179232
> Mute This Topic: https://lists.openembedded.org/mt/97904222/7032091
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> skulkarni@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000764caa05f86be557
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Steve,<div><br></div><div>I think you missed the patch =
for the Kirkstone branch. It&#39;s showing an <b>Unpatched</b>=C2=A0in the =
latest=C2=A0CVE metrics for kirkstone.</div><div><br></div><div>I had sent =
patches for CVE-2022-41723 in separate emails for both dunfell &amp; kirkst=
one with different subjects (mentioned branch). Dunfell patch is already me=
rged into dunfell-nut. I am not sure how kirkstone patch mail is showing as=
 a <b>reply</b> on dunfell patch mail. In the mail details as well as on th=
e list, it&#39;s showing the correct subject: <a href=3D"https://lists.open=
embedded.org/g/openembedded-core/message/179232">https://lists.openembedded=
.org/g/openembedded-core/message/179232</a></div><div><br></div><div>Apolog=
ies for the inconvenience caused. Please consider this patch for kirkstone =
to fix CVE-2022-41723 <a href=3D"http://golang.org/x/net/http2">golang.org/=
x/net/http2</a>: avoid quadratic complexity in HPACK decoding.</div><div><b=
r></div><div>Regards,</div><div>Shubham Kulkarni</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 28, 2023=
 at 6:14=E2=80=AFPM Shubham Kulkarni via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;skulkarni=3D<a href=3D"mailto:mvista=
.com@lists.openembedded.org">mvista.com@lists.openembedded.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Shubham=
 Kulkarni &lt;<a href=3D"mailto:skulkarni@mvista.com" target=3D"_blank">sku=
lkarni@mvista.com</a>&gt;<br>
<br>
Disable cmd/internal/moddeps test, since this update includes PRIVATE<br>
track fixes.<br>
<br>
Backport from <a href=3D"https://github.com/golang/go/commit/5c3e11bd0b5c0a=
86e5beffcd4339b86a902b21c3" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/golang/go/commit/5c3e11bd0b5c0a86e5beffcd4339b86a902b21c3</a><br>
<br>
Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvista.com"=
 target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-1.17.13.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0.../go/go-1.18/CVE-2022-41723.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 156 ++++++++++++++++++<br>
=C2=A02 files changed, 157 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41723.pa=
tch<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtool=
s/go/go-1.17.13.inc<br>
index 99662bd298..971e38a744 100644<br>
--- a/meta/recipes-devtools/go/go-1.17.13.inc<br>
+++ b/meta/recipes-devtools/go/go-1.17.13.inc<br>
@@ -20,6 +20,7 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0001-net-http-httputil-avoid-query-parameter-smu=
ggling.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2022-41715.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2022-41717.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2022-41723.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[main.sha256sum] =3D &quot;a1a48b23afb206f95e7bbaa9b898d965f90=
826f6f1d1fc0c1d784ada0cd300fd&quot;<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-41723.patch b/meta/r=
ecipes-devtools/go/go-1.18/CVE-2022-41723.patch<br>
new file mode 100644<br>
index 0000000000..a93fa31dcd<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-41723.patch<br>
@@ -0,0 +1,156 @@<br>
+From 451766789f646617157c725e20c955d4a9a70d4e Mon Sep 17 00:00:00 2001<br>
+From: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.com" target=
=3D"_blank">bracewell@google.com</a>&gt;<br>
+Date: Mon, 6 Feb 2023 10:03:44 -0800<br>
+Subject: [PATCH] net/http: update bundled <a href=3D"http://golang.org/x/n=
et/http2" rel=3D"noreferrer" target=3D"_blank">golang.org/x/net/http2</a><b=
r>
+<br>
+Disable cmd/internal/moddeps test, since this update includes PRIVATE<br>
+track fixes.<br>
+<br>
+Fixes CVE-2022-41723<br>
+Fixes #58355<br>
+Updates #57855<br>
+<br>
+Change-Id: Ie870562a6f6e44e4e8f57db6a0dde1a41a2b090c<br>
+Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/golang/g=
o-private/+/1728939+Reviewed-by" rel=3D"noreferrer" target=3D"_blank">https=
://team-review.git.corp.google.com/c/golang/go-private/+/1728939<br>
+Reviewed-by</a>: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" targe=
t=3D"_blank">dneil@google.com</a>&gt;<br>
+Reviewed-by: Julie Qiu &lt;<a href=3D"mailto:julieqiu@google.com" target=
=3D"_blank">julieqiu@google.com</a>&gt;<br>
+Reviewed-by: Tatiana Bradley &lt;<a href=3D"mailto:tatianabradley@google.c=
om" target=3D"_blank">tatianabradley@google.com</a>&gt;<br>
+Run-TryBot: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.com" t=
arget=3D"_blank">bracewell@google.com</a>&gt;<br>
+Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/468118" =
rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.com/c/g=
o/+/468118</a><br>
+TryBot-Result: Gopher Robot &lt;<a href=3D"mailto:gobot@golang.org" target=
=3D"_blank">gobot@golang.org</a>&gt;<br>
+Run-TryBot: Michael Pratt &lt;<a href=3D"mailto:mpratt@google.com" target=
=3D"_blank">mpratt@google.com</a>&gt;<br>
+Auto-Submit: Michael Pratt &lt;<a href=3D"mailto:mpratt@google.com" target=
=3D"_blank">mpratt@google.com</a>&gt;<br>
+Reviewed-by: Than McIntosh &lt;<a href=3D"mailto:thanm@google.com" target=
=3D"_blank">thanm@google.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/golang/go/commit/=
5c3e11bd0b5c0a86e5beffcd4339b86a902b21c3" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/golang/go/commit/5c3e11bd0b5c0a86e5beffcd4339b86a902=
b21c3</a>]<br>
+CVE: CVE-2022-41723<br>
+Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvista.com=
" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
+---<br>
+ src/vendor/<a href=3D"http://golang.org/x/net/http2/hpack/hpack.go" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/net/http2/hpack/hpack.go</a>=
 | 79 +++++++++++++++---------<br>
+ 1 file changed, 49 insertions(+), 30 deletions(-)<br>
+<br>
+diff --git a/src/vendor/<a href=3D"http://golang.org/x/net/http2/hpack/hpa=
ck.go" rel=3D"noreferrer" target=3D"_blank">golang.org/x/net/http2/hpack/hp=
ack.go</a> b/src/vendor/<a href=3D"http://golang.org/x/net/http2/hpack/hpac=
k.go" rel=3D"noreferrer" target=3D"_blank">golang.org/x/net/http2/hpack/hpa=
ck.go</a><br>
+index 85f18a2..02e80e3 100644<br>
+--- a/src/vendor/<a href=3D"http://golang.org/x/net/http2/hpack/hpack.go" =
rel=3D"noreferrer" target=3D"_blank">golang.org/x/net/http2/hpack/hpack.go<=
/a><br>
++++ b/src/vendor/<a href=3D"http://golang.org/x/net/http2/hpack/hpack.go" =
rel=3D"noreferrer" target=3D"_blank">golang.org/x/net/http2/hpack/hpack.go<=
/a><br>
+@@ -359,6 +359,7 @@ func (d *Decoder) parseFieldLiteral(n uint8, it indexT=
ype) error {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var hf HeaderField<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wantStr :=3D d.emitEnabled || it.indexed()<br>
++=C2=A0 =C2=A0 =C2=A0 var undecodedName undecodedString<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if nameIdx &gt; 0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ihf, ok :=3D <a hre=
f=3D"http://d.at" rel=3D"noreferrer" target=3D"_blank">d.at</a>(nameIdx)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if !ok {<br>
+@@ -366,15 +367,27 @@ func (d *Decoder) parseFieldLiteral(n uint8, it inde=
xType) error {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hf.Name =3D ihf.Nam=
e<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hf.Name, buf, err =3D d.=
readString(buf, wantStr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 undecodedName, buf, err =
=3D d.readString(buf)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 hf.Value, buf, err =3D d.readString(buf, wantStr)<br=
>
++=C2=A0 =C2=A0 =C2=A0 undecodedValue, buf, err :=3D d.readString(buf)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 if wantStr {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if nameIdx &lt;=3D 0 {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hf.Name, err =3D d.decodeString(undecodedName)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hf.Value, err =3D d.deco=
deString(undecodedValue)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return err<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d.buf =3D buf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if it.indexed() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.dynTab.add(hf)<br=
>
+@@ -459,46 +472,52 @@ func readVarInt(n byte, p []byte) (i uint64, remain =
[]byte, err error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0, origP, errNeedMore<br>
+ }<br>
+<br>
+-// readString decodes an hpack string from p.<br>
++// readString reads an hpack string from p.<br>
+ //<br>
+-// wantStr is whether s will be used. If false, decompression and<br>
+-// []byte-&gt;string garbage are skipped if s will be ignored<br>
+-// anyway. This does mean that huffman decoding errors for non-indexed<br=
>
+-// strings past the MAX_HEADER_LIST_SIZE are ignored, but the server<br>
+-// is returning an error anyway, and because they&#39;re not indexed, the=
 error<br>
+-// won&#39;t affect the decoding state.<br>
+-func (d *Decoder) readString(p []byte, wantStr bool) (s string, remain []=
byte, err error) {<br>
++// It returns a reference to the encoded string data to permit deferring =
decode costs<br>
++// until after the caller verifies all data is present.<br>
++func (d *Decoder) readString(p []byte) (u undecodedString, remain []byte,=
 err error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p) =3D=3D 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;&quot;, p, =
errNeedMore<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return u, p, errNeedMore=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0isHuff :=3D p[0]&amp;128 !=3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0strLen, p, err :=3D readVarInt(7, p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;&quot;, p, =
err<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return u, p, err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if d.maxStrLen !=3D 0 &amp;&amp; strLen &gt; ui=
nt64(d.maxStrLen) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;&quot;, nil=
, ErrStringLength<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Returning an error he=
re means Huffman decoding errors<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // for non-indexed strin=
gs past the maximum string length<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // are ignored, but the =
server is returning an error anyway<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // and because the strin=
g is not indexed the error will not<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // affect the decoding s=
tate.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return u, nil, ErrString=
Length<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if uint64(len(p)) &lt; strLen {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;&quot;, p, =
errNeedMore<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 if !isHuff {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if wantStr {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 s =3D string(p[:strLen])<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s, p[strLen:], ni=
l<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return u, p, errNeedMore=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 u.isHuff =3D isHuff<br>
++=C2=A0 =C2=A0 =C2=A0 u.b =3D p[:strLen]<br>
++=C2=A0 =C2=A0 =C2=A0 return u, p[strLen:], nil<br>
++}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 if wantStr {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf :=3D bufPool.Get().(=
*bytes.Buffer)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf.Reset() // don&#39;t=
 trust others<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defer bufPool.Put(buf)<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D huffmanDecod=
e(buf, d.maxStrLen, p[:strLen]); err !=3D nil {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 buf.Reset()<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return &quot;&quot;, nil, err<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++type undecodedString struct {<br>
++=C2=A0 =C2=A0 =C2=A0 isHuff bool<br>
++=C2=A0 =C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0 []byte<br>
++}<br>
++<br>
++func (d *Decoder) decodeString(u undecodedString) (string, error) {<br>
++=C2=A0 =C2=A0 =C2=A0 if !u.isHuff {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return string(u.b), nil<=
br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 buf :=3D bufPool.Get().(*bytes.Buffer)<br>
++=C2=A0 =C2=A0 =C2=A0 buf.Reset() // don&#39;t trust others<br>
++=C2=A0 =C2=A0 =C2=A0 var s string<br>
++=C2=A0 =C2=A0 =C2=A0 err :=3D huffmanDecode(buf, d.maxStrLen, u.b)<br>
++=C2=A0 =C2=A0 =C2=A0 if err =3D=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D buf.String()<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf.Reset() // be nice t=
o GC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 return s, p[strLen:], nil<br>
++=C2=A0 =C2=A0 =C2=A0 buf.Reset() // be nice to GC<br>
++=C2=A0 =C2=A0 =C2=A0 bufPool.Put(buf)<br>
++=C2=A0 =C2=A0 =C2=A0 return s, err<br>
+ }<br>
+--<br>
+2.7.4<br>
-- <br>
2.33.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179232): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179232" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179232</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97904222/7032=
091" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97904222/7032091</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:skulkarni@mvista.com" targ=
et=3D"_blank">skulkarni@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000764caa05f86be557--

