Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web12.2890.1597174590797561306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 12:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LfikfDmv;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id x10so7654203ybj.13
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 12:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BkDNWY0rJDAdcIAtqwPIzJNIf8EPAIcYFBv1otDIZX8=;
        b=LfikfDmv7vdHAmEU3GL5ghO+xWhWsyoQCPmpij2VP8jmefmy6sHyEODfdZ5H+Mq+BD
         v2csCPP8bsjYSJhy6WMc2+7j529Jy44mFIobnBXcgJSyxI0yctTbnyRZrM2959OGjpk7
         0tnIcli9MWtiMmUXCO7JlmrBxQefLfENNQNVbwhiYOwiWDLXg40QdY06S67qSec7XZFa
         LTMR981kc0GJwn64BcTb4a1WSMshLO2uNIccV3tK7H3qG9rq4n/0biQUYJs+10wTxb5O
         nmMjYd3k5N/XGJTfXfCt26C6CBEpMHjCa9tNkQ4vgvLYG129n/AFU+Ox/hskIhvzU+5v
         ANIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BkDNWY0rJDAdcIAtqwPIzJNIf8EPAIcYFBv1otDIZX8=;
        b=WpDhVTRlNsiATFnfMvsDitnwuN2Vl4VHDK4kmA6nqy7DzV0hRuRBA6IbSfTmMpnQh2
         GE3th1q5G4IxycRvlSdqPq8i6flsXH1Fh0/kNDIveG6l2K1G74S5I0+5mjdnKMmgUsbX
         /S4TyHqlZO8yQOo1dyu2cQkd3WtZLNSgnHJIAZ0SvEBHGPo66wL5/zEL9slVmfUw+Q24
         JbPWWpoLWiHXS4MNQJz4ZFjBoez4hPP8P7vORH+plAFLRPAcFqCfmuqIjJTLqcCrfTEg
         pR9E5NCyGbOvpTu3OMBnNCaXNYT0lHM04nC361IVNrtGEH/uQREWS9u4cJcSDCx2j8dY
         BajQ==
X-Gm-Message-State: AOAM532PBToyUP94QS8BR252NziUv+v1R/51FlvssyE1kf030EG1N99Z
	LMzX3AmjUVdxU/CrpL/okoYsBjJeKAGHQo1EAAI=
X-Google-Smtp-Source: ABdhPJylpQrGRnkW6tOQOCgOwg5Vsro7RlccYp52pCmI4+GSIVUhp6W9RqCaCcbz74Hk51oWQeHNYwUUmLxkfG6JZQY=
X-Received: by 2002:a25:ca83:: with SMTP id a125mr52557221ybg.513.1597174589936;
 Tue, 11 Aug 2020 12:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200811083853.83841-1-zhixiong.chi@windriver.com>
In-Reply-To: <20200811083853.83841-1-zhixiong.chi@windriver.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Tue, 11 Aug 2020 09:36:18 -1000
Message-ID: <CAGDS+nmujHQNE2qg35EP-7AXXXVrQ0rrNbktHvh0byM8cp2QVw@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] go: CVE-2020-16845
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Since this CVE will be covered in a pending version upgrade, there
isn't a need to take this patch.

Thanks, though!  I really appreciate the help in reducing the number
of outrstanding CVE's!

Steve

On Mon, Aug 10, 2020 at 10:38 PM Zhixiong Chi
<zhixiong.chi@windriver.com> wrote:
>
> Backport CVE patch from the upstream:
> https://github.com/golang/go.git
> commit 027d7241ce050d197e7fabea3d541ffbe3487258
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  meta/recipes-devtools/go/go-1.14.inc          |   1 +
>  .../go/go-1.14/CVE-2020-16845.patch           | 110 ++++++++++++++++++
>  2 files changed, 111 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2020-16845.patc=
h
>
> diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtool=
s/go/go-1.14.inc
> index c52593db6b..8db7f4e4e4 100644
> --- a/meta/recipes-devtools/go/go-1.14.inc
> +++ b/meta/recipes-devtools/go/go-1.14.inc
> @@ -16,6 +16,7 @@ SRC_URI +=3D "\
>      file://0006-cmd-dist-separate-host-and-target-builds.patch \
>      file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
>      file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
> +    file://CVE-2020-16845.patch \
>  "
>  SRC_URI_append_libc-musl =3D " file://0009-ld-replace-glibc-dynamic-lin=
ker-with-musl.patch"
>
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2020-16845.patch b/met=
a/recipes-devtools/go/go-1.14/CVE-2020-16845.patch
> new file mode 100644
> index 0000000000..80f467522f
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2020-16845.patch
> @@ -0,0 +1,110 @@
> +From 027d7241ce050d197e7fabea3d541ffbe3487258 Mon Sep 17 00:00:00 2001
> +From: Katie Hockman <katie@golang.org>
> +Date: Tue, 4 Aug 2020 11:45:32 -0400
> +Subject: [PATCH] encoding/binary: read at most MaxVarintLen64 bytes in
> + ReadUvarint
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This CL ensures that ReadUvarint consumes only a limited
> +amount of input (instead of an unbounded amount).
> +
> +On some inputs, ReadUvarint could read an arbitrary number
> +of bytes before deciding to return an overflow error.
> +After this CL, ReadUvarint returns that same overflow
> +error sooner, after reading at most MaxVarintLen64 bytes.
> +
> +Fix authored by Robert Griesemer and Filippo Valsorda.
> +
> +Thanks to Diederik Loerakker, Jonny Rhea, Ra=C3=BAl Kripalani,
> +and Preston Van Loon for reporting this.
> +
> +Fixes #40618
> +Fixes CVE-2020-16845
> +
> +Change-Id: Ie0cb15972f14c38b7cf7af84c45c4ce54909bb8f
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-privat=
e/+/812099
> +Reviewed-by: Filippo Valsorda <valsorda@google.com>
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/247120
> +Run-TryBot: Katie Hockman <katie@golang.org>
> +TryBot-Result: Gobot Gobot <gobot@golang.org>
> +Reviewed-by: Alexander Rakoczy <alex@golang.org>
> +
> +Upstream-Status: Backport [https://github.com/golang/go.git]
> +CVE: CVE-2020-16845
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +---
> + src/encoding/binary/varint.go      |  5 +++--
> + src/encoding/binary/varint_test.go | 18 ++++++++++++------
> + 2 files changed, 15 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/encoding/binary/varint.go b/src/encoding/binary/varint=
.go
> +index bcb8ac9a45..38af61075c 100644
> +--- a/src/encoding/binary/varint.go
> ++++ b/src/encoding/binary/varint.go
> +@@ -106,13 +106,13 @@ var overflow =3D errors.New("binary: varint overf=
lows a 64-bit integer")
> + func ReadUvarint(r io.ByteReader) (uint64, error) {
> +       var x uint64
> +       var s uint
> +-      for i :=3D 0; ; i++ {
> ++      for i :=3D 0; i < MaxVarintLen64; i++ {
> +               b, err :=3D r.ReadByte()
> +               if err !=3D nil {
> +                       return x, err
> +               }
> +               if b < 0x80 {
> +-                      if i > 9 || i =3D=3D 9 && b > 1 {
> ++                      if i =3D=3D 9 && b > 1 {
> +                               return x, overflow
> +                       }
> +                       return x | uint64(b)<<s, nil
> +@@ -120,6 +120,7 @@ func ReadUvarint(r io.ByteReader) (uint64, error) {
> +               x |=3D uint64(b&0x7f) << s
> +               s +=3D 7
> +       }
> ++      return x, overflow
> + }
> +
> + // ReadVarint reads an encoded signed integer from r and returns it as=
 an int64.
> +diff --git a/src/encoding/binary/varint_test.go b/src/encoding/binary/v=
arint_test.go
> +index ca411ecbd6..6ef4c99505 100644
> +--- a/src/encoding/binary/varint_test.go
> ++++ b/src/encoding/binary/varint_test.go
> +@@ -121,21 +121,27 @@ func TestBufferTooSmall(t *testing.T) {
> +       }
> + }
> +
> +-func testOverflow(t *testing.T, buf []byte, n0 int, err0 error) {
> ++func testOverflow(t *testing.T, buf []byte, x0 uint64, n0 int, err0 er=
ror) {
> +       x, n :=3D Uvarint(buf)
> +       if x !=3D 0 || n !=3D n0 {
> +               t.Errorf("Uvarint(%v): got x =3D %d, n =3D %d; want 0, %=
d", buf, x, n, n0)
> +       }
> +
> +-      x, err :=3D ReadUvarint(bytes.NewReader(buf))
> +-      if x !=3D 0 || err !=3D err0 {
> +-              t.Errorf("ReadUvarint(%v): got x =3D %d, err =3D %s; wan=
t 0, %s", buf, x, err, err0)
> ++      r :=3D bytes.NewReader(buf)
> ++      len :=3D r.Len()
> ++      x, err :=3D ReadUvarint(r)
> ++      if x !=3D x0 || err !=3D err0 {
> ++              t.Errorf("ReadUvarint(%v): got x =3D %d, err =3D %s; wan=
t %d, %s", buf, x, err, x0, err0)
> ++      }
> ++      if read :=3D len - r.Len(); read > MaxVarintLen64 {
> ++              t.Errorf("ReadUvarint(%v): read more than MaxVarintLen64=
 bytes, got %d", buf, read)
> +       }
> + }
> +
> + func TestOverflow(t *testing.T) {
> +-      testOverflow(t, []byte{0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,=
 0x80, 0x80, 0x2}, -10, overflow)
> +-      testOverflow(t, []byte{0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,=
 0x80, 0x80, 0x80, 0x80, 0x80, 0x1, 0, 0}, -13, overflow)
> ++      testOverflow(t, []byte{0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,=
 0x80, 0x80, 0x2}, 0, -10, overflow)
> ++      testOverflow(t, []byte{0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,=
 0x80, 0x80, 0x80, 0x80, 0x80, 0x1, 0, 0}, 0, -13, overflow)
> ++      testOverflow(t, []byte{0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,=
 0xFF, 0xFF, 0xFF, 0xFF}, 1<<64-1, 0, overflow) // 11 bytes, should overflo=
w
> + }
> +
> + func TestNonCanonicalZero(t *testing.T) {
> +--
> +2.17.0
> +
> --
> 2.17.1
>
>=20
