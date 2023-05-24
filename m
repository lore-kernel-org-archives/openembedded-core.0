Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31537C7EE31
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 08:33:14 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web10.4205.1684917190167078302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 01:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PLsjfWLE;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-456f7ea8694so248712e0c.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 01:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684917189; x=1687509189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ghjn3phPYW50Wv5uh5wgAuInXBYFz/C6/EOo0GVTcUo=;
        b=PLsjfWLENlR5QBqHqNd5x2o/JMsZj3a5ZwmOdHmqQ/ckirEgfjSz6oo2Pyg5DnB7ik
         2RxUPeLc3ORThvAekLhNIF04lSgfionvLupb5dt/oyMQd0SWAkrj0S6pG4ng7pMtAhD1
         idyiAeuT3LFYVhJAZ5FpLh5tMlL9AKe+Vvb9UAa9HE+p5nQfmTY/JI4AE1Av7Ji8fEuf
         EgruaAARwBLUOxYKYPu2aINbiuP7QD8zOIUbRmb5VvObMvv/GkzCyVyUjMiCsKIALiaJ
         UBY9vp27fY1GFvMClIMcLbqUOq/C0YNCgV6SrMDrubgprKhUj24emNXHmONXbnX7TOej
         fyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684917189; x=1687509189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghjn3phPYW50Wv5uh5wgAuInXBYFz/C6/EOo0GVTcUo=;
        b=KDvTJ7sIAYIBgjli9qHPcwizXN3kETgYRxyYR4ydzI1vNEoL00k7mxVY5cBVxM3sX4
         MFQaiyCdSuz+G4SYm9tOC1RJucs6gejf+gstfm0RG3dJEubgVMKDLRVE4vUFQGdey5CS
         KTZfLuzaX+M7/4rwiY9NRZtn4Z3mweNNYp6lhLLdP+Bmp7QGP6xwusIW6qnLbzMb/I8N
         SrypnM6UAW4CZF/cTB0Ar8HW4XGqBsKYci4m0WGutjBIMcgd+11QoPiHYOnfwJ53wp0b
         v1d+scyT0//45biJOdY3kVY6A6L6WnffuO2RLMTIhehldaBKbvZqHaj3YrT9vcoLxWIi
         Lsdg==
X-Gm-Message-State: AC+VfDyEv9p1pn4czBbnXlEwfHdlmy7iaurkTgT9BAaGV6bU5eR7/XIC
	tMVRXlLv6HyFDG6n2Fmfv8YQA2aFFVl9xwyRd1Nyxgl4hly4gQ==
X-Google-Smtp-Source: ACHHUZ4T8BRC4QScX4RK+gDhCETpUsJ0rT+/98ez+t959+N1/Jgcp8WT+Q/LatxWs459lIsbNovO8NMSNsyGLc1Nk34=
X-Received: by 2002:a67:cd13:0:b0:42c:37cb:8b26 with SMTP id
 u19-20020a67cd13000000b0042c37cb8b26mr4342956vsl.24.1684917188885; Wed, 24
 May 2023 01:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230524065548.3044226-1-sakib.sajal@windriver.com>
In-Reply-To: <20230524065548.3044226-1-sakib.sajal@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 24 May 2023 09:32:50 +0100
Message-ID: <CANPvuRni2t+10-PGjQspHojvMkHQ+pvT8kk1V0o-f-ko0yP9xA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go: update 1.20.1 -> 1.20.4
To: sakib.sajal@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000085031c05fc6c5af2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 08:33:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181667

--00000000000085031c05fc6c5af2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakib,

it was sent yesterday too
https://lists.openembedded.org/g/openembedded-core/message/181646

jose

Sakib Sajal via lists.openembedded.org <sakib.sajal=3D
windriver.com@lists.openembedded.org> escreveu no dia quarta, 24/05/2023
=C3=A0(s) 07:56:

> Update go to latest 1.20.x release.
>
> Removed patches contained in new version:
>   - 0010-cmd-compile-re-compile-instantiated-generic-methods-.patch
>   - CVE-2023-24532.patch
>   - CVE-2023-24537.patch
>
> go.git$ git log --oneline go1.20.1..go1.20.4
> 324c3ace2d (tag: go1.20.4) [release-branch.go1.20] go1.20.4
> 337dd75343 [release-branch.go1.20] html/template: emit filterFailsafe for
> empty unquoted attr value
> 4a28cad666 [release-branch.go1.20] html/template: handle all JS whitespac=
e
> characters
> 090590fdcc [release-branch.go1.20] html/template: disallow angle brackets
> in CSS values
> 25b4f40625 [release-branch.go1.20] Revert "net/http: FileServer method
> check + minimal OPTIONS implementation"
> 484535e67b cmd/compile/internal/importer,go/internal/gcimporter: use the
> 'go' command from build.Default.GOROOT in lookupGorootExport
> 813a811d33 [release-branch.go1.20] crypto/tls: fix PSK binder calculation
> ee42d468f5 [release-branch.go1.20] cmd/compile: fix reproducible build of
> aliased generic types
> 446493f5b8 [release-branch.go1.20] cmd/compile: remove broken LEA
> "optimization"
> 0684cecad5 [release-branch.go1.20] cmd/compile: use correct type for
> byteswaps on multi-byte stores
> ecf7e00db8 [release-branch.go1.20] syscall: restore original NOFILE rlimi=
t
> in child process
> 1dbbac7d79 [release-branch.go1.20] cmd/compile: fix ir.StaticValue for
> ORANGE
> 99001c460e [release-branch.go1.20] cmd/compile: don't set range expr
> key/value type if already set
> dcc9bdf380 [release-branch.go1.20] crypto/subtle: don't cast to *uintptr
> when word size is 0
> 5c7c20e262 [release-branch.go1.20] html/template,mime/multipart: document
> new GODEBUG settings
> 7c47a6b157 (tag: go1.20.3) [release-branch.go1.20] go1.20.3
> 20374d1d75 [release-branch.go1.20] html/template: disallow actions in JS
> template literals
> e7c4b07ecf [release-branch.go1.20] go/scanner: reject large line and
> column numbers in //line directives
> bf8c7c575c [release-branch.go1.20] mime/multipart: limit parsed mime
> message sizes
> ec18f62df5 [release-branch.go1.20] net/textproto, mime/multipart: improve
> accounting of non-file data
> ea6b5a64dd [release-branch.go1.20] mime/multipart: avoid excessive copy
> buffer allocations in ReadForm
> 3991f6c41c [release-branch.go1.20] net/textproto: avoid overpredicting th=
e
> number of MIME header keys
> 9a164d1c41 [release-branch.go1.20] cmd/internal/obj/ppc64: fix incorrect
> base reg causing segv
> 8dce4ca8df [release-branch.go1.20] cmd/compile: don't assume pointer of a
> slice is non-nil
> 94c02a3cc4 [release-branch.go1.20] cmd/compile: re-compile instantiated
> generic methods in linkshared mode
> 65fa8a6931 [release-branch.go1.20] time: fix timezone lookup logic for
> non-DST zones
> b52a6963bf [release-branch.go1.20] cmd/link/internal/arm: fix off-by-1 in
> trampoline reachability computation
> 3ff6dbdf5b [release-branch.go1.20] cmd/go,cmd/link: prefer external
> linking when strange cgo flags seen
> fa42da156a [release-branch.go1.20] cmd/link: use label symbols for Duff's
> devices on darwin/arm64
> 5c7cc468a8 [release-branch.go1.20] Revert "cmd/compile: enable address
> folding for global symbols of shared library"
> b852f39511 [release-branch.go1.20] cmd/go: avoid running slow tests on
> non-longtest builders
> 4df95d5145 [release-branch.go1.20] internal/testpty: fix error handling
> aee9a19c55 (tag: go1.20.2) [release-branch.go1.20] go1.20.2
> 26eeaec89c [release-branch.go1.20] cmd/compile: relax overly strict
> assertion
> 9629fa1874 [release-branch.go1.20] crypto/x509: fix broken tests
> 3243f93747 [release-branch.go1.20] crypto/x509: fix system root tests +
> darwin intermediate handling
> d2d0ee2049 [release-branch.go1.20] syscall: fix invalid unsafe.Pointer
> conversion on Windows
> 230765a11a [release-branch.go1.20] net: delete TestTCPSelfConnect
> bdd86bda09 [release-branch.go1.20] crypto/x509: fix ParsePKCS8PrivateKey
> comment
> aef8a8cd42 [release-branch.go1.20] syscall: Faccessat: check for
> CAP_DAC_OVERRIDE on Linux
> ef793801f8 [release-branch.go1.20] crypto/internal/bigmod: flag amd64
> assembly as noescape
> aaace6dda7 [release-branch.go1.20] crypto/ecdh: explicitly reject
> mismatched curves in ECDH
> 0f4483cfdc [release-branch.go1.20] cmd/compile/internal/noder: correct
> positions for synthetic closures
> 1362737f50 [release-branch.go1.20] cmd/link: better fix for arm32 trampge=
n
> problem with duff routines
> 602eeaab38 [release-branch.go1.20] crypto/internal/nistec: reduce P-256
> scalar
> ac556f35a2 [release-branch.go1.20] cmd/internal/cov: fix misuse of
> bufio.Reader.Read in read helper
> 1acd39cc92 [release-branch.go1.20] Revert "internal/poll: drop redundant
> ENOSYS in CopyFileRange"
> 7b398b1ff7 [release-branch.go1.20] runtime: check for overflow in sweep
> assist
> 2d01f3695b [release-branch.go1.20] cmd/compile: fix wrong escape analysis
> for go/defer generic calls
> 965e9ba0fb [release-branch.go1.20] cmd/compile: disable inline static ini=
t
> optimization
> 85ded85b78 [release-branch.go1.20] runtime: fix signature for linked
> functions
> 828b05cc64 [release-branch.go1.20] all: update vendored golang.org/x/net
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  .../go/{go-1.20.1.inc =3D> go-1.20.4.inc}       |   5 +-
>  ...e_1.20.1.bb =3D> go-binary-native_1.20.4.bb} |   6 +-
>  ..._1.20.1.bb =3D> go-cross-canadian_1.20.4.bb} |   0
>  ...{go-cross_1.20.1.bb =3D> go-cross_1.20.4.bb} |   0
>  ...osssdk_1.20.1.bb =3D> go-crosssdk_1.20.4.bb} |   0
>  ...o-native_1.20.1.bb =3D> go-native_1.20.4.bb} |   0
>  ...runtime_1.20.1.bb =3D> go-runtime_1.20.4.bb} |   0
>  ...ompile-instantiated-generic-methods-.patch |  90 --------
>  .../go/go/CVE-2023-24532.patch                | 208 ------------------
>  .../go/go/CVE-2023-24537.patch                |  89 --------
>  .../go/{go_1.20.1.bb =3D> go_1.20.4.bb}         |   0
>  11 files changed, 4 insertions(+), 394 deletions(-)
>  rename meta/recipes-devtools/go/{go-1.20.1.inc =3D> go-1.20.4.inc} (77%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.20.1.bb =3D>
> go-binary-native_1.20.4.bb} (78%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.20.1.bb =3D>
> go-cross-canadian_1.20.4.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.20.1.bb =3D> go-cross_1.20.4=
.bb}
> (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.20.1.bb =3D>
> go-crosssdk_1.20.4.bb} (100%)
>  rename meta/recipes-devtools/go/{go-native_1.20.1.bb =3D>
> go-native_1.20.4.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.20.1.bb =3D>
> go-runtime_1.20.4.bb} (100%)
>  delete mode 100644
> meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instantiated-gene=
ric-methods-.patch
>  delete mode 100644 meta/recipes-devtools/go/go/CVE-2023-24532.patch
>  delete mode 100644 meta/recipes-devtools/go/go/CVE-2023-24537.patch
>  rename meta/recipes-devtools/go/{go_1.20.1.bb =3D> go_1.20.4.bb} (100%)
>
> diff --git a/meta/recipes-devtools/go/go-1.20.1.inc
> b/meta/recipes-devtools/go/go-1.20.4.inc
> similarity index 77%
> rename from meta/recipes-devtools/go/go-1.20.1.inc
> rename to meta/recipes-devtools/go/go-1.20.4.inc
> index 179f0e29eb..05bc168e0c 100644
> --- a/meta/recipes-devtools/go/go-1.20.1.inc
> +++ b/meta/recipes-devtools/go/go-1.20.4.inc
> @@ -14,8 +14,5 @@ SRC_URI +=3D "\
>      file://0007-exec.go-do-not-write-linker-flags-into-buildids.patch \
>
>  file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
>      file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
> -
> file://0010-cmd-compile-re-compile-instantiated-generic-methods-.patch \
> -    file://CVE-2023-24532.patch \
> -    file://CVE-2023-24537.patch \
>  "
> -SRC_URI[main.sha256sum] =3D
> "b5c1a3af52c385a6d1c76aed5361cf26459023980d0320de7658bae3915831a2"
> +SRC_URI[main.sha256sum] =3D
> "9f34ace128764b7a3a4b238b805856cc1b2184304df9e5690825b0710f4202d6"
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.1.bb
> b/meta/recipes-devtools/go/go-binary-native_1.20.4.bb
> similarity index 78%
> rename from meta/recipes-devtools/go/go-binary-native_1.20.1.bb
> rename to meta/recipes-devtools/go/go-binary-native_1.20.4.bb
> index 239334552a..87ce8a558f 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.20.1.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.20.4.bb
> @@ -9,9 +9,9 @@ PROVIDES =3D "go-native"
>
>  # Checksums available at https://go.dev/dl/
>  SRC_URI =3D "
> https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;nam=
e=3Dgo_${BUILD_GOTUPLE}
> "
> -SRC_URI[go_linux_amd64.sha256sum] =3D
> "000a5b1fca4f75895f78befeb2eecf10bfff3c428597f3f1e69133b63b911b02"
> -SRC_URI[go_linux_arm64.sha256sum] =3D
> "5e5e2926733595e6f3c5b5ad1089afac11c1490351855e87849d0e7702b1ec2e"
> -SRC_URI[go_linux_ppc64le.sha256sum] =3D
> "85cfd4b89b48c94030783b6e9e619e35557862358b846064636361421d0b0c52"
> +SRC_URI[go_linux_amd64.sha256sum] =3D
> "698ef3243972a51ddb4028e4a1ac63dc6d60821bf18e59a807e051fee0a385bd"
> +SRC_URI[go_linux_arm64.sha256sum] =3D
> "105889992ee4b1d40c7c108555222ca70ae43fccb42e20fbf1eebb822f5e72c6"
> +SRC_URI[go_linux_ppc64le.sha256sum] =3D
> "8c6f44b96c2719c90eebabe2dd866f9c39538648f7897a212cac448587e9a408"
>
>  UPSTREAM_CHECK_URI =3D "https://golang.org/dl/"
>  UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.1.bb
> b/meta/recipes-devtools/go/go-cross-canadian_1.20.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.20.1.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.20.4.bb
> diff --git a/meta/recipes-devtools/go/go-cross_1.20.1.bb
> b/meta/recipes-devtools/go/go-cross_1.20.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.20.1.bb
> rename to meta/recipes-devtools/go/go-cross_1.20.4.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.1.bb
> b/meta/recipes-devtools/go/go-crosssdk_1.20.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.20.1.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.20.4.bb
> diff --git a/meta/recipes-devtools/go/go-native_1.20.1.bb
> b/meta/recipes-devtools/go/go-native_1.20.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-native_1.20.1.bb
> rename to meta/recipes-devtools/go/go-native_1.20.4.bb
> diff --git a/meta/recipes-devtools/go/go-runtime_1.20.1.bb
> b/meta/recipes-devtools/go/go-runtime_1.20.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.20.1.bb
> rename to meta/recipes-devtools/go/go-runtime_1.20.4.bb
> diff --git
> a/meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instantiated-ge=
neric-methods-.patch
> b/meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instantiated-ge=
neric-methods-.patch
> deleted file mode 100644
> index f9ac202421..0000000000
> ---
> a/meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instantiated-ge=
neric-methods-.patch
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -From 7a3bb16b43efba73674629eae4369f9004e37f22 Mon Sep 17 00:00:00 2001
> -From: Cuong Manh Le <cuong.manhle.vn@gmail.com>
> -Date: Sat, 18 Mar 2023 00:53:07 +0700
> -Subject: [PATCH] cmd/compile: re-compile instantiated generic methods in
> - linkshared mode
> -
> -For G[T] that was seen and compiled in imported package, it is not added
> -to typecheck.Target.Decls, prevent wasting compile time re-creating
> -DUPOKS symbols. However, the linker do not support a type symbol
> -referencing a method symbol across DSO boundary. That causes unreachable
> -sym error when building under -linkshared mode.
> -
> -To fix it, always re-compile generic methods in linkshared mode.
> -
> -Fixes #58966
> -
> -Change-Id: I894b417cfe8234ae1fe809cc975889345df22cef
> -Reviewed-on: https://go-review.googlesource.com/c/go/+/477375
> -Run-TryBot: Cuong Manh Le <cuong.manhle.vn@gmail.com>
> -Reviewed-by: Cherry Mui <cherryyz@google.com>
> -Reviewed-by: Matthew Dempsky <mdempsky@google.com>
> -TryBot-Result: Gopher Robot <gobot@golang.org>
> -
> -Upstream-Status: Backport [
> https://github.com/golang/go/commit/bcd82125f85c7c552493e863fa1bb14e6c444=
557
> ]
> -
> -Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ----
> - misc/cgo/testshared/shared_test.go              |  7 ++++++-
> - misc/cgo/testshared/testdata/issue58966/main.go | 15 +++++++++++++++
> - src/cmd/compile/internal/noder/unified.go       |  6 +++++-
> - 3 files changed, 26 insertions(+), 2 deletions(-)
> - create mode 100644 misc/cgo/testshared/testdata/issue58966/main.go
> -
> -diff --git a/misc/cgo/testshared/shared_test.go
> b/misc/cgo/testshared/shared_test.go
> -index b14fb1cb3a..03da8f9435 100644
> ---- a/misc/cgo/testshared/shared_test.go
> -+++ b/misc/cgo/testshared/shared_test.go
> -@@ -1112,8 +1112,13 @@ func TestStd(t *testing.T) {
> -               t.Skip("skip in short mode")
> -       }
> -       t.Parallel()
> -+      tmpDir :=3D t.TempDir()
> -       // Use a temporary pkgdir to not interfere with other tests, and
> not write to GOROOT.
> -       // Cannot use goCmd as it runs with cloned GOROOT which is
> incomplete.
> -       runWithEnv(t, "building std", []string{"GOROOT=3D" + oldGOROOT},
> --              filepath.Join(oldGOROOT, "bin", "go"), "install",
> "-buildmode=3Dshared", "-pkgdir=3D"+t.TempDir(), "std")
> -+              filepath.Join(oldGOROOT, "bin", "go"), "install",
> "-buildmode=3Dshared", "-pkgdir=3D"+tmpDir, "std")
> -+
> -+      // Issue #58966.
> -+      runWithEnv(t, "testing issue #58966", []string{"GOROOT=3D" +
> oldGOROOT},
> -+              filepath.Join(oldGOROOT, "bin", "go"), "run",
> "-linkshared", "-pkgdir=3D"+tmpDir, "./issue58966/main.go")
> - }
> -diff --git a/misc/cgo/testshared/testdata/issue58966/main.go
> b/misc/cgo/testshared/testdata/issue58966/main.go
> -new file mode 100644
> -index 0000000000..2d923c3607
> ---- /dev/null
> -+++ b/misc/cgo/testshared/testdata/issue58966/main.go
> -@@ -0,0 +1,15 @@
> -+// Copyright 2023 The Go Authors. All rights reserved.
> -+// Use of this source code is governed by a BSD-style
> -+// license that can be found in the LICENSE file.
> -+
> -+package main
> -+
> -+import "crypto/elliptic"
> -+
> -+var curve elliptic.Curve
> -+
> -+func main() {
> -+      switch curve {
> -+      case elliptic.P224():
> -+      }
> -+}
> -diff --git a/src/cmd/compile/internal/noder/unified.go
> b/src/cmd/compile/internal/noder/unified.go
> -index ed97a09302..25136e6aad 100644
> ---- a/src/cmd/compile/internal/noder/unified.go
> -+++ b/src/cmd/compile/internal/noder/unified.go
> -@@ -158,7 +158,11 @@ func readBodies(target *ir.Package, duringInlining
> bool) {
> -                       // Instantiated generic function: add to Decls fo=
r
> typechecking
> -                       // and compilation.
> -                       if fn.OClosure =3D=3D nil && len(pri.dict.targs) =
!=3D 0 {
> --                              if duringInlining {
> -+                              // cmd/link does not support a type symbo=
l
> referencing a method symbol
> -+                              // across DSO boundary, so force
> re-compiling methods on a generic type
> -+                              // even it was seen from imported package
> in linkshared mode, see #58966.
> -+                              canSkipNonGenericMethod :=3D
> !(base.Ctxt.Flag_linkshared && ir.IsMethod(fn))
> -+                              if duringInlining &&
> canSkipNonGenericMethod {
> -                                       inlDecls =3D append(inlDecls, fn)
> -                               } else {
> -                                       target.Decls =3D
> append(target.Decls, fn)
> diff --git a/meta/recipes-devtools/go/go/CVE-2023-24532.patch
> b/meta/recipes-devtools/go/go/CVE-2023-24532.patch
> deleted file mode 100644
> index 22f080dbd4..0000000000
> --- a/meta/recipes-devtools/go/go/CVE-2023-24532.patch
> +++ /dev/null
> @@ -1,208 +0,0 @@
> -From 602eeaab387f24a4b28c5eccbb50fa934f3bc3c4 Mon Sep 17 00:00:00 2001
> -From: Filippo Valsorda <filippo@golang.org>
> -Date: Mon, 13 Feb 2023 15:16:27 +0100
> -Subject: [PATCH] [release-branch.go1.20] crypto/internal/nistec: reduce
> P-256
> - scalar
> -
> -Unlike the rest of nistec, the P-256 assembly doesn't use complete
> -addition formulas, meaning that p256PointAdd[Affine]Asm won't return the
> -correct value if the two inputs are equal.
> -
> -This was (undocumentedly) ignored in the scalar multiplication loops
> -because as long as the input point is not the identity and the scalar is
> -lower than the order of the group, the addition inputs can't be the same=
.
> -
> -As part of the math/big rewrite, we went however from always reducing
> -the scalar to only checking its length, under the incorrect assumption
> -that the scalar multiplication loop didn't require reduction.
> -
> -Added a reduction, and while at it added it in P256OrdInverse, too, to
> -enforce a universal reduction invariant on p256OrdElement values.
> -
> -Note that if the input point is the infinity, the code currently still
> -relies on undefined behavior, but that's easily tested to behave
> -acceptably, and will be addressed in a future CL.
> -
> -Updates #58647
> -Fixes #58720
> -Fixes CVE-2023-24532
> -
> -(Filed with the "safe APIs like complete addition formulas are good"
> dept.)
> -
> -Change-Id: I7b2c75238440e6852be2710fad66ff1fdc4e2b24
> -Reviewed-on: https://go-review.googlesource.com/c/go/+/471255
> -TryBot-Result: Gopher Robot <gobot@golang.org>
> -Reviewed-by: Roland Shoemaker <roland@golang.org>
> -Run-TryBot: Filippo Valsorda <filippo@golang.org>
> -Auto-Submit: Filippo Valsorda <filippo@golang.org>
> -Reviewed-by: Damien Neil <dneil@google.com>
> -(cherry picked from commit 203e59ad41bd288e1d92b6f617c2f55e70d3c8e3)
> -Reviewed-on: https://go-review.googlesource.com/c/go/+/471695
> -Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> -Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
> -Reviewed-by: Filippo Valsorda <filippo@golang.org>
> -Run-TryBot: Roland Shoemaker <roland@golang.org>
> -
> -CVE: CVE-2023-24532
> -Upstream-Status: Backport [602eeaab387f24a4b28c5eccbb50fa934f3bc3c4]
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> ----
> - src/crypto/internal/nistec/nistec_test.go | 81 +++++++++++++++++++++++
> - src/crypto/internal/nistec/p256_asm.go    | 17 +++++
> - src/crypto/internal/nistec/p256_ordinv.go |  1 +
> - 3 files changed, 99 insertions(+)
> -
> -diff --git a/src/crypto/internal/nistec/nistec_test.go
> b/src/crypto/internal/nistec/nistec_test.go
> -index 309f68be16a9f..9103608c18a0f 100644
> ---- a/src/crypto/internal/nistec/nistec_test.go
> -+++ b/src/crypto/internal/nistec/nistec_test.go
> -@@ -8,6 +8,7 @@ import (
> -       "bytes"
> -       "crypto/elliptic"
> -       "crypto/internal/nistec"
> -+      "fmt"
> -       "internal/testenv"
> -       "math/big"
> -       "math/rand"
> -@@ -165,6 +166,86 @@ func testEquivalents[P nistPoint[P]](t *testing.T,
> newPoint func() P, c elliptic
> -       }
> - }
> -
> -+func TestScalarMult(t *testing.T) {
> -+      t.Run("P224", func(t *testing.T) {
> -+              testScalarMult(t, nistec.NewP224Point, elliptic.P224())
> -+      })
> -+      t.Run("P256", func(t *testing.T) {
> -+              testScalarMult(t, nistec.NewP256Point, elliptic.P256())
> -+      })
> -+      t.Run("P384", func(t *testing.T) {
> -+              testScalarMult(t, nistec.NewP384Point, elliptic.P384())
> -+      })
> -+      t.Run("P521", func(t *testing.T) {
> -+              testScalarMult(t, nistec.NewP521Point, elliptic.P521())
> -+      })
> -+}
> -+
> -+func testScalarMult[P nistPoint[P]](t *testing.T, newPoint func() P, c
> elliptic.Curve) {
> -+      G :=3D newPoint().SetGenerator()
> -+      checkScalar :=3D func(t *testing.T, scalar []byte) {
> -+              p1, err :=3D newPoint().ScalarBaseMult(scalar)
> -+              fatalIfErr(t, err)
> -+              p2, err :=3D newPoint().ScalarMult(G, scalar)
> -+              fatalIfErr(t, err)
> -+              if !bytes.Equal(p1.Bytes(), p2.Bytes()) {
> -+                      t.Error("[k]G !=3D ScalarBaseMult(k)")
> -+              }
> -+
> -+              d :=3D new(big.Int).SetBytes(scalar)
> -+              d.Sub(c.Params().N, d)
> -+              d.Mod(d, c.Params().N)
> -+              g1, err :=3D
> newPoint().ScalarBaseMult(d.FillBytes(make([]byte, len(scalar))))
> -+              fatalIfErr(t, err)
> -+              g1.Add(g1, p1)
> -+              if !bytes.Equal(g1.Bytes(), newPoint().Bytes()) {
> -+                      t.Error("[N - k]G + [k]G !=3D =E2=88=9E")
> -+              }
> -+      }
> -+
> -+      byteLen :=3D len(c.Params().N.Bytes())
> -+      bitLen :=3D c.Params().N.BitLen()
> -+      t.Run("0", func(t *testing.T) { checkScalar(t, make([]byte,
> byteLen)) })
> -+      t.Run("1", func(t *testing.T) {
> -+              checkScalar(t, big.NewInt(1).FillBytes(make([]byte,
> byteLen)))
> -+      })
> -+      t.Run("N-1", func(t *testing.T) {
> -+              checkScalar(t, new(big.Int).Sub(c.Params().N,
> big.NewInt(1)).Bytes())
> -+      })
> -+      t.Run("N", func(t *testing.T) { checkScalar(t,
> c.Params().N.Bytes()) })
> -+      t.Run("N+1", func(t *testing.T) {
> -+              checkScalar(t, new(big.Int).Add(c.Params().N,
> big.NewInt(1)).Bytes())
> -+      })
> -+      t.Run("all1s", func(t *testing.T) {
> -+              s :=3D new(big.Int).Lsh(big.NewInt(1), uint(bitLen))
> -+              s.Sub(s, big.NewInt(1))
> -+              checkScalar(t, s.Bytes())
> -+      })
> -+      if testing.Short() {
> -+              return
> -+      }
> -+      for i :=3D 0; i < bitLen; i++ {
> -+              t.Run(fmt.Sprintf("1<<%d", i), func(t *testing.T) {
> -+                      s :=3D new(big.Int).Lsh(big.NewInt(1), uint(i))
> -+                      checkScalar(t, s.FillBytes(make([]byte, byteLen))=
)
> -+              })
> -+      }
> -+      // Test N+1...N+32 since they risk overlapping with precomputed
> table values
> -+      // in the final additions.
> -+      for i :=3D int64(2); i <=3D 32; i++ {
> -+              t.Run(fmt.Sprintf("N+%d", i), func(t *testing.T) {
> -+                      checkScalar(t, new(big.Int).Add(c.Params().N,
> big.NewInt(i)).Bytes())
> -+              })
> -+      }
> -+}
> -+
> -+func fatalIfErr(t *testing.T, err error) {
> -+      t.Helper()
> -+      if err !=3D nil {
> -+              t.Fatal(err)
> -+      }
> -+}
> -+
> - func BenchmarkScalarMult(b *testing.B) {
> -       b.Run("P224", func(b *testing.B) {
> -               benchmarkScalarMult(b,
> nistec.NewP224Point().SetGenerator(), 28)
> -diff --git a/src/crypto/internal/nistec/p256_asm.go
> b/src/crypto/internal/nistec/p256_asm.go
> -index 6ea161eb49953..99a22b833f028 100644
> ---- a/src/crypto/internal/nistec/p256_asm.go
> -+++ b/src/crypto/internal/nistec/p256_asm.go
> -@@ -364,6 +364,21 @@ func p256PointDoubleAsm(res, in *P256Point)
> - // Montgomery domain (with R 2=C2=B2=E2=81=B5=E2=81=B6) as four uint64 =
limbs in little-endian
> order.
> - type p256OrdElement [4]uint64
> -
> -+// p256OrdReduce ensures s is in the range [0, ord(G)-1].
> -+func p256OrdReduce(s *p256OrdElement) {
> -+      // Since 2 * ord(G) > 2=C2=B2=E2=81=B5=E2=81=B6, we can just cond=
itionally subtract
> ord(G),
> -+      // keeping the result if it doesn't underflow.
> -+      t0, b :=3D bits.Sub64(s[0], 0xf3b9cac2fc632551, 0)
> -+      t1, b :=3D bits.Sub64(s[1], 0xbce6faada7179e84, b)
> -+      t2, b :=3D bits.Sub64(s[2], 0xffffffffffffffff, b)
> -+      t3, b :=3D bits.Sub64(s[3], 0xffffffff00000000, b)
> -+      tMask :=3D b - 1 // zero if subtraction underflowed
> -+      s[0] ^=3D (t0 ^ s[0]) & tMask
> -+      s[1] ^=3D (t1 ^ s[1]) & tMask
> -+      s[2] ^=3D (t2 ^ s[2]) & tMask
> -+      s[3] ^=3D (t3 ^ s[3]) & tMask
> -+}
> -+
> - // Add sets q =3D p1 + p2, and returns q. The points may overlap.
> - func (q *P256Point) Add(r1, r2 *P256Point) *P256Point {
> -       var sum, double P256Point
> -@@ -393,6 +408,7 @@ func (r *P256Point) ScalarBaseMult(scalar []byte)
> (*P256Point, error) {
> -       }
> -       scalarReversed :=3D new(p256OrdElement)
> -       p256OrdBigToLittle(scalarReversed, (*[32]byte)(scalar))
> -+      p256OrdReduce(scalarReversed)
> -
> -       r.p256BaseMult(scalarReversed)
> -       return r, nil
> -@@ -407,6 +423,7 @@ func (r *P256Point) ScalarMult(q *P256Point, scalar
> []byte) (*P256Point, error)
> -       }
> -       scalarReversed :=3D new(p256OrdElement)
> -       p256OrdBigToLittle(scalarReversed, (*[32]byte)(scalar))
> -+      p256OrdReduce(scalarReversed)
> -
> -       r.Set(q).p256ScalarMult(scalarReversed)
> -       return r, nil
> -diff --git a/src/crypto/internal/nistec/p256_ordinv.go
> b/src/crypto/internal/nistec/p256_ordinv.go
> -index 86a7a230bdce8..1274fb7fd3f5c 100644
> ---- a/src/crypto/internal/nistec/p256_ordinv.go
> -+++ b/src/crypto/internal/nistec/p256_ordinv.go
> -@@ -25,6 +25,7 @@ func P256OrdInverse(k []byte) ([]byte, error) {
> -
> -       x :=3D new(p256OrdElement)
> -       p256OrdBigToLittle(x, (*[32]byte)(k))
> -+      p256OrdReduce(x)
> -
> -       // Inversion is implemented as exponentiation by n - 2, per
> Fermat's little theorem.
> -       //
> diff --git a/meta/recipes-devtools/go/go/CVE-2023-24537.patch
> b/meta/recipes-devtools/go/go/CVE-2023-24537.patch
> deleted file mode 100644
> index 6b5dc2c8d9..0000000000
> --- a/meta/recipes-devtools/go/go/CVE-2023-24537.patch
> +++ /dev/null
> @@ -1,89 +0,0 @@
> -From 110e4fb1c2e3a21631704bbfaf672230b9ba2492 Mon Sep 17 00:00:00 2001
> -From: Damien Neil <dneil@google.com>
> -Date: Wed, 22 Mar 2023 09:33:22 -0700
> -Subject: [PATCH] go/scanner: reject large line and column numbers in
> //line
> - directives
> -
> -Setting a large line or column number using a //line directive can cause
> -integer overflow even in small source files.
> -
> -Limit line and column numbers in //line directives to 2^30-1, which
> -is small enough to avoid int32 overflow on all reasonbly-sized files.
> -
> -For #59180
> -Fixes CVE-2023-24537
> -
> -Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/1802456
> -Reviewed-by
> <https://team-review.git.corp.google.com/c/golang/go-private/+/1802456-Re=
viewed-by>:
> Julie Qiu <julieqiu@google.com>
> -Reviewed-by: Roland Shoemaker <bracewell@google.com>
> -Run-TryBot: Damien Neil <dneil@google.com>
> -Change-Id: I149bf34deca532af7994203fa1e6aca3c890ea14
> -Reviewed-on: https://go-review.googlesource.com/c/go/+/482078
> -Reviewed-by: Matthew Dempsky <mdempsky@google.com>
> -TryBot-Bypass: Michael Knyszek <mknyszek@google.com>
> -Run-TryBot: Michael Knyszek <mknyszek@google.com>
> -Auto-Submit: Michael Knyszek <mknyszek@google.com>
> -
> -CVE: CVE-2023-24537
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> ----
> - src/go/parser/parser_test.go | 16 ++++++++++++++++
> - src/go/scanner/scanner.go    |  7 +++++--
> - 2 files changed, 21 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/go/parser/parser_test.go b/src/go/parser/parser_test.go
> -index 153562df75068..22b11a0cc4535 100644
> ---- a/src/go/parser/parser_test.go
> -+++ b/src/go/parser/parser_test.go
> -@@ -764,3 +764,19 @@ func TestRangePos(t *testing.T) {
> -               })
> -       }
> - }
> -+
> -+// TestIssue59180 tests that line number overflow doesn't cause an
> infinite loop.
> -+func TestIssue59180(t *testing.T) {
> -+      testcases :=3D []string{
> -+              "package p\n//line :9223372036854775806\n\n//",
> -+              "package p\n//line :1:9223372036854775806\n\n//",
> -+              "package p\n//line file:9223372036854775806\n\n//",
> -+      }
> -+
> -+      for _, src :=3D range testcases {
> -+              _, err :=3D ParseFile(token.NewFileSet(), "", src,
> ParseComments)
> -+              if err =3D=3D nil {
> -+                      t.Errorf("ParseFile(%s) succeeded unexpectedly",
> src)
> -+              }
> -+      }
> -+}
> -diff --git a/src/go/scanner/scanner.go b/src/go/scanner/scanner.go
> -index 16958d22ce299..0cd9f5901d0bb 100644
> ---- a/src/go/scanner/scanner.go
> -+++ b/src/go/scanner/scanner.go
> -@@ -253,13 +253,16 @@ func (s *Scanner) updateLineInfo(next, offs int,
> text []byte) {
> -               return
> -       }
> -
> -+      // Put a cap on the maximum size of line and column numbers.
> -+      // 30 bits allows for some additional space before wrapping an
> int32.
> -+      const maxLineCol =3D 1<<30 - 1
> -       var line, col int
> -       i2, n2, ok2 :=3D trailingDigits(text[:i-1])
> -       if ok2 {
> -               //line filename:line:col
> -               i, i2 =3D i2, i
> -               line, col =3D n2, n
> --              if col =3D=3D 0 {
> -+              if col =3D=3D 0 || col > maxLineCol {
> -                       s.error(offs+i2, "invalid column number:
> "+string(text[i2:]))
> -                       return
> -               }
> -@@ -269,7 +272,7 @@ func (s *Scanner) updateLineInfo(next, offs int, tex=
t
> []byte) {
> -               line =3D n
> -       }
> -
> --      if line =3D=3D 0 {
> -+      if line =3D=3D 0 || line > maxLineCol {
> -               s.error(offs+i, "invalid line number: "+string(text[i:]))
> -               return
> -       }
> diff --git a/meta/recipes-devtools/go/go_1.20.1.bb
> b/meta/recipes-devtools/go/go_1.20.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go_1.20.1.bb
> rename to meta/recipes-devtools/go/go_1.20.4.bb
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181660):
> https://lists.openembedded.org/g/openembedded-core/message/181660
> Mute This Topic: https://lists.openembedded.org/mt/99103824/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000085031c05fc6c5af2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Sakib,<br><br>it was sent yesterday to=
o</div><div dir=3D"ltr"><a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/message/181646">https://lists.openembedded.org/g/openembedded-co=
re/message/181646</a><br></div><div><br></div>jose<div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Sakib Sajal via <a href=3D=
"http://lists.openembedded.org">lists.openembedded.org</a> &lt;sakib.sajal=
=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@li=
sts.openembedded.org</a>&gt; escreveu no dia quarta, 24/05/2023 =C3=A0(s) 0=
7:56:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Update go =
to latest 1.20.x release.<br>
<br>
Removed patches contained in new version:<br>
=C2=A0 - 0010-cmd-compile-re-compile-instantiated-generic-methods-.patch<br=
>
=C2=A0 - CVE-2023-24532.patch<br>
=C2=A0 - CVE-2023-24537.patch<br>
<br>
go.git$ git log --oneline go1.20.1..go1.20.4<br>
324c3ace2d (tag: go1.20.4) [release-branch.go1.20] go1.20.4<br>
337dd75343 [release-branch.go1.20] html/template: emit filterFailsafe for e=
mpty unquoted attr value<br>
4a28cad666 [release-branch.go1.20] html/template: handle all JS whitespace =
characters<br>
090590fdcc [release-branch.go1.20] html/template: disallow angle brackets i=
n CSS values<br>
25b4f40625 [release-branch.go1.20] Revert &quot;net/http: FileServer method=
 check + minimal OPTIONS implementation&quot;<br>
484535e67b cmd/compile/internal/importer,go/internal/gcimporter: use the &#=
39;go&#39; command from build.Default.GOROOT in lookupGorootExport<br>
813a811d33 [release-branch.go1.20] crypto/tls: fix PSK binder calculation<b=
r>
ee42d468f5 [release-branch.go1.20] cmd/compile: fix reproducible build of a=
liased generic types<br>
446493f5b8 [release-branch.go1.20] cmd/compile: remove broken LEA &quot;opt=
imization&quot;<br>
0684cecad5 [release-branch.go1.20] cmd/compile: use correct type for bytesw=
aps on multi-byte stores<br>
ecf7e00db8 [release-branch.go1.20] syscall: restore original NOFILE rlimit =
in child process<br>
1dbbac7d79 [release-branch.go1.20] cmd/compile: fix ir.StaticValue for ORAN=
GE<br>
99001c460e [release-branch.go1.20] cmd/compile: don&#39;t set range expr ke=
y/value type if already set<br>
dcc9bdf380 [release-branch.go1.20] crypto/subtle: don&#39;t cast to *uintpt=
r when word size is 0<br>
5c7c20e262 [release-branch.go1.20] html/template,mime/multipart: document n=
ew GODEBUG settings<br>
7c47a6b157 (tag: go1.20.3) [release-branch.go1.20] go1.20.3<br>
20374d1d75 [release-branch.go1.20] html/template: disallow actions in JS te=
mplate literals<br>
e7c4b07ecf [release-branch.go1.20] go/scanner: reject large line and column=
 numbers in //line directives<br>
bf8c7c575c [release-branch.go1.20] mime/multipart: limit parsed mime messag=
e sizes<br>
ec18f62df5 [release-branch.go1.20] net/textproto, mime/multipart: improve a=
ccounting of non-file data<br>
ea6b5a64dd [release-branch.go1.20] mime/multipart: avoid excessive copy buf=
fer allocations in ReadForm<br>
3991f6c41c [release-branch.go1.20] net/textproto: avoid overpredicting the =
number of MIME header keys<br>
9a164d1c41 [release-branch.go1.20] cmd/internal/obj/ppc64: fix incorrect ba=
se reg causing segv<br>
8dce4ca8df [release-branch.go1.20] cmd/compile: don&#39;t assume pointer of=
 a slice is non-nil<br>
94c02a3cc4 [release-branch.go1.20] cmd/compile: re-compile instantiated gen=
eric methods in linkshared mode<br>
65fa8a6931 [release-branch.go1.20] time: fix timezone lookup logic for non-=
DST zones<br>
b52a6963bf [release-branch.go1.20] cmd/link/internal/arm: fix off-by-1 in t=
rampoline reachability computation<br>
3ff6dbdf5b [release-branch.go1.20] cmd/go,cmd/link: prefer external linking=
 when strange cgo flags seen<br>
fa42da156a [release-branch.go1.20] cmd/link: use label symbols for Duff&#39=
;s devices on darwin/arm64<br>
5c7cc468a8 [release-branch.go1.20] Revert &quot;cmd/compile: enable address=
 folding for global symbols of shared library&quot;<br>
b852f39511 [release-branch.go1.20] cmd/go: avoid running slow tests on non-=
longtest builders<br>
4df95d5145 [release-branch.go1.20] internal/testpty: fix error handling<br>
aee9a19c55 (tag: go1.20.2) [release-branch.go1.20] go1.20.2<br>
26eeaec89c [release-branch.go1.20] cmd/compile: relax overly strict asserti=
on<br>
9629fa1874 [release-branch.go1.20] crypto/x509: fix broken tests<br>
3243f93747 [release-branch.go1.20] crypto/x509: fix system root tests + dar=
win intermediate handling<br>
d2d0ee2049 [release-branch.go1.20] syscall: fix invalid unsafe.Pointer conv=
ersion on Windows<br>
230765a11a [release-branch.go1.20] net: delete TestTCPSelfConnect<br>
bdd86bda09 [release-branch.go1.20] crypto/x509: fix ParsePKCS8PrivateKey co=
mment<br>
aef8a8cd42 [release-branch.go1.20] syscall: Faccessat: check for CAP_DAC_OV=
ERRIDE on Linux<br>
ef793801f8 [release-branch.go1.20] crypto/internal/bigmod: flag amd64 assem=
bly as noescape<br>
aaace6dda7 [release-branch.go1.20] crypto/ecdh: explicitly reject mismatche=
d curves in ECDH<br>
0f4483cfdc [release-branch.go1.20] cmd/compile/internal/noder: correct posi=
tions for synthetic closures<br>
1362737f50 [release-branch.go1.20] cmd/link: better fix for arm32 trampgen =
problem with duff routines<br>
602eeaab38 [release-branch.go1.20] crypto/internal/nistec: reduce P-256 sca=
lar<br>
ac556f35a2 [release-branch.go1.20] cmd/internal/cov: fix misuse of bufio.Re=
ader.Read in read helper<br>
1acd39cc92 [release-branch.go1.20] Revert &quot;internal/poll: drop redunda=
nt ENOSYS in CopyFileRange&quot;<br>
7b398b1ff7 [release-branch.go1.20] runtime: check for overflow in sweep ass=
ist<br>
2d01f3695b [release-branch.go1.20] cmd/compile: fix wrong escape analysis f=
or go/defer generic calls<br>
965e9ba0fb [release-branch.go1.20] cmd/compile: disable inline static init =
optimization<br>
85ded85b78 [release-branch.go1.20] runtime: fix signature for linked functi=
ons<br>
828b05cc64 [release-branch.go1.20] all: update vendored <a href=3D"http://g=
olang.org/x/net" rel=3D"noreferrer" target=3D"_blank">golang.org/x/net</a><=
br>
<br>
Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.com"=
 target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../go/{go-1.20.1.inc =3D&gt; go-1.20.4.inc}=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0...<a href=3D"http://e_1.20.1.bb" rel=3D"noreferrer" target=3D"_blank=
">e_1.20.1.bb</a> =3D&gt; <a href=3D"http://go-binary-native_1.20.4.bb" rel=
=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.4.bb</a>} |=C2=A0 =
=C2=A06 +-<br>
=C2=A0..._<a href=3D"http://1.20.1.bb" rel=3D"noreferrer" target=3D"_blank"=
>1.20.1.bb</a> =3D&gt; <a href=3D"http://go-cross-canadian_1.20.4.bb" rel=
=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.20.4.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0...{<a href=3D"http://go-cross_1.20.1.bb" rel=3D"noreferrer" target=
=3D"_blank">go-cross_1.20.1.bb</a> =3D&gt; <a href=3D"http://go-cross_1.20.=
4.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.20.4.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0...<a href=3D"http://osssdk_1.20.1.bb" rel=3D"noreferrer" target=3D"_=
blank">osssdk_1.20.1.bb</a> =3D&gt; <a href=3D"http://go-crosssdk_1.20.4.bb=
" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.4.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0...<a href=3D"http://o-native_1.20.1.bb" rel=3D"noreferrer" target=3D=
"_blank">o-native_1.20.1.bb</a> =3D&gt; <a href=3D"http://go-native_1.20.4.=
bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.20.4.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0...<a href=3D"http://runtime_1.20.1.bb" rel=3D"noreferrer" target=3D"=
_blank">runtime_1.20.1.bb</a> =3D&gt; <a href=3D"http://go-runtime_1.20.4.b=
b" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.4.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0...ompile-instantiated-generic-methods-.patch |=C2=A0 90 --------<br>
=C2=A0.../go/go/CVE-2023-24532.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 208 ------------------<br>
=C2=A0.../go/go/CVE-2023-24537.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 89 --------<br>
=C2=A0.../go/{<a href=3D"http://go_1.20.1.bb" rel=3D"noreferrer" target=3D"=
_blank">go_1.20.1.bb</a> =3D&gt; <a href=3D"http://go_1.20.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">go_1.20.4.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A00<br>
=C2=A011 files changed, 4 insertions(+), 394 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/go/{go-1.20.1.inc =3D&gt; go-1.20.4.inc}=
 (77%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-binary-native_1=
.20.1.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.1.bb</=
a> =3D&gt; <a href=3D"http://go-binary-native_1.20.4.bb" rel=3D"noreferrer"=
 target=3D"_blank">go-binary-native_1.20.4.bb</a>} (78%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross-canadian_=
1.20.1.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.20.1.bb=
</a> =3D&gt; <a href=3D"http://go-cross-canadian_1.20.4.bb" rel=3D"noreferr=
er" target=3D"_blank">go-cross-canadian_1.20.4.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross_1.20.1.bb=
" rel=3D"noreferrer" target=3D"_blank">go-cross_1.20.1.bb</a> =3D&gt; <a hr=
ef=3D"http://go-cross_1.20.4.bb" rel=3D"noreferrer" target=3D"_blank">go-cr=
oss_1.20.4.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-crosssdk_1.20.1=
.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.1.bb</a> =3D&gt;=
 <a href=3D"http://go-crosssdk_1.20.4.bb" rel=3D"noreferrer" target=3D"_bla=
nk">go-crosssdk_1.20.4.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-native_1.20.1.b=
b" rel=3D"noreferrer" target=3D"_blank">go-native_1.20.1.bb</a> =3D&gt; <a =
href=3D"http://go-native_1.20.4.bb" rel=3D"noreferrer" target=3D"_blank">go=
-native_1.20.4.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-runtime_1.20.1.=
bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.1.bb</a> =3D&gt; <=
a href=3D"http://go-runtime_1.20.4.bb" rel=3D"noreferrer" target=3D"_blank"=
>go-runtime_1.20.4.bb</a>} (100%)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go/0010-cmd-compile-re-co=
mpile-instantiated-generic-methods-.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go/CVE-2023-24532.patch<b=
r>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go/CVE-2023-24537.patch<b=
r>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go_1.20.1.bb" rel=
=3D"noreferrer" target=3D"_blank">go_1.20.1.bb</a> =3D&gt; <a href=3D"http:=
//go_1.20.4.bb" rel=3D"noreferrer" target=3D"_blank">go_1.20.4.bb</a>} (100=
%)<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.20.1.inc b/meta/recipes-devtools=
/go/go-1.20.4.inc<br>
similarity index 77%<br>
rename from meta/recipes-devtools/go/go-1.20.1.inc<br>
rename to meta/recipes-devtools/go/go-1.20.4.inc<br>
index 179f0e29eb..05bc168e0c 100644<br>
--- a/meta/recipes-devtools/go/go-1.20.1.inc<br>
+++ b/meta/recipes-devtools/go/go-1.20.4.inc<br>
@@ -14,8 +14,5 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0007-exec.go-do-not-write-linker-flags-into-buil=
dids.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-hos=
t-compile.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0009-go-Filter-build-paths-on-staticly-linked-ar=
ches.patch \<br>
-=C2=A0 =C2=A0 file://0010-cmd-compile-re-compile-instantiated-generic-meth=
ods-.patch \<br>
-=C2=A0 =C2=A0 file://CVE-2023-24532.patch \<br>
-=C2=A0 =C2=A0 file://CVE-2023-24537.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[main.sha256sum] =3D &quot;b5c1a3af52c385a6d1c76aed5361cf2645902398=
0d0320de7658bae3915831a2&quot;<br>
+SRC_URI[main.sha256sum] =3D &quot;9f34ace128764b7a3a4b238b805856cc1b218430=
4df9e5690825b0710f4202d6&quot;<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.=
20.1.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.1.bb</a=
> b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.20.4.bb" =
rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.4.bb</a><br>
similarity index 78%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.2=
0.1.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.1.bb</a>=
<br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.20.=
4.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.4.bb</a><b=
r>
index 239334552a..87ce8a558f 100644<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.20.1.bb=
" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.1.bb</a><br>
+++ b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.20.4.bb=
" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.4.bb</a><br>
@@ -9,9 +9,9 @@ PROVIDES =3D &quot;go-native&quot;<br>
<br>
=C2=A0# Checksums available at <a href=3D"https://go.dev/dl/" rel=3D"norefe=
rrer" target=3D"_blank">https://go.dev/dl/</a><br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://dl.google.com/go/go$%7BPV%7D.$%7=
BBUILD_GOOS%7D-$%7BBUILD_GOARCH%7D.tar.gz;name=3Dgo_$%7BBUILD_GOTUPLE%7D" r=
el=3D"noreferrer" target=3D"_blank">https://dl.google.com/go/go${PV}.${BUIL=
D_GOOS}-${BUILD_GOARCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}</a>&quot;<br>
-SRC_URI[go_linux_amd64.sha256sum] =3D &quot;000a5b1fca4f75895f78befeb2eecf=
10bfff3c428597f3f1e69133b63b911b02&quot;<br>
-SRC_URI[go_linux_arm64.sha256sum] =3D &quot;5e5e2926733595e6f3c5b5ad1089af=
ac11c1490351855e87849d0e7702b1ec2e&quot;<br>
-SRC_URI[go_linux_ppc64le.sha256sum] =3D &quot;85cfd4b89b48c94030783b6e9e61=
9e35557862358b846064636361421d0b0c52&quot;<br>
+SRC_URI[go_linux_amd64.sha256sum] =3D &quot;698ef3243972a51ddb4028e4a1ac63=
dc6d60821bf18e59a807e051fee0a385bd&quot;<br>
+SRC_URI[go_linux_arm64.sha256sum] =3D &quot;105889992ee4b1d40c7c108555222c=
a70ae43fccb42e20fbf1eebb822f5e72c6&quot;<br>
+SRC_URI[go_linux_ppc64le.sha256sum] =3D &quot;8c6f44b96c2719c90eebabe2dd86=
6f9c39538648f7897a212cac448587e9a408&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://golang.org/dl/" rel=
=3D"noreferrer" target=3D"_blank">https://golang.org/dl/</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;go(?P&lt;pver&gt;\d+(\.\d+)+)\.linux&q=
uot;<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1=
.20.1.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.20.1.bb<=
/a> b/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.20.4.b=
b" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.20.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.=
20.1.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.20.1.bb</=
a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.20=
.4.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.20.4.bb</a>=
<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross_1.20.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-cross_1.20.1.bb</a> b/meta/recipes=
-devtools/go/<a href=3D"http://go-cross_1.20.4.bb" rel=3D"noreferrer" targe=
t=3D"_blank">go-cross_1.20.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-cross_1.20.1.bb" =
rel=3D"noreferrer" target=3D"_blank">go-cross_1.20.1.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-cross_1.20.4.bb" re=
l=3D"noreferrer" target=3D"_blank">go-cross_1.20.4.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.20.1.=
bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.1.bb</a> b/meta/r=
ecipes-devtools/go/<a href=3D"http://go-crosssdk_1.20.4.bb" rel=3D"noreferr=
er" target=3D"_blank">go-crosssdk_1.20.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.20.1.b=
b" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.1.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.20.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.4.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-native_1.20.1.bb=
" rel=3D"noreferrer" target=3D"_blank">go-native_1.20.1.bb</a> b/meta/recip=
es-devtools/go/<a href=3D"http://go-native_1.20.4.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">go-native_1.20.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-native_1.20.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-native_1.20.1.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-native_1.20.4.bb" r=
el=3D"noreferrer" target=3D"_blank">go-native_1.20.4.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.20.1.b=
b" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.1.bb</a> b/meta/rec=
ipes-devtools/go/<a href=3D"http://go-runtime_1.20.4.bb" rel=3D"noreferrer"=
 target=3D"_blank">go-runtime_1.20.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.20.1.bb=
" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.1.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.20.4.bb" =
rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.4.bb</a><br>
diff --git a/meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instan=
tiated-generic-methods-.patch b/meta/recipes-devtools/go/go/0010-cmd-compil=
e-re-compile-instantiated-generic-methods-.patch<br>
deleted file mode 100644<br>
index f9ac202421..0000000000<br>
--- a/meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instantiated-=
generic-methods-.patch<br>
+++ /dev/null<br>
@@ -1,90 +0,0 @@<br>
-From 7a3bb16b43efba73674629eae4369f9004e37f22 Mon Sep 17 00:00:00 2001<br>
-From: Cuong Manh Le &lt;<a href=3D"mailto:cuong.manhle.vn@gmail.com" targe=
t=3D"_blank">cuong.manhle.vn@gmail.com</a>&gt;<br>
-Date: Sat, 18 Mar 2023 00:53:07 +0700<br>
-Subject: [PATCH] cmd/compile: re-compile instantiated generic methods in<b=
r>
- linkshared mode<br>
-<br>
-For G[T] that was seen and compiled in imported package, it is not added<b=
r>
-to typecheck.Target.Decls, prevent wasting compile time re-creating<br>
-DUPOKS symbols. However, the linker do not support a type symbol<br>
-referencing a method symbol across DSO boundary. That causes unreachable<b=
r>
-sym error when building under -linkshared mode.<br>
-<br>
-To fix it, always re-compile generic methods in linkshared mode.<br>
-<br>
-Fixes #58966<br>
-<br>
-Change-Id: I894b417cfe8234ae1fe809cc975889345df22cef<br>
-Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/477375" =
rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.com/c/g=
o/+/477375</a><br>
-Run-TryBot: Cuong Manh Le &lt;<a href=3D"mailto:cuong.manhle.vn@gmail.com"=
 target=3D"_blank">cuong.manhle.vn@gmail.com</a>&gt;<br>
-Reviewed-by: Cherry Mui &lt;<a href=3D"mailto:cherryyz@google.com" target=
=3D"_blank">cherryyz@google.com</a>&gt;<br>
-Reviewed-by: Matthew Dempsky &lt;<a href=3D"mailto:mdempsky@google.com" ta=
rget=3D"_blank">mdempsky@google.com</a>&gt;<br>
-TryBot-Result: Gopher Robot &lt;<a href=3D"mailto:gobot@golang.org" target=
=3D"_blank">gobot@golang.org</a>&gt;<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/golang/go/commit/=
bcd82125f85c7c552493e863fa1bb14e6c444557" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/golang/go/commit/bcd82125f85c7c552493e863fa1bb14e6c4=
44557</a>]<br>
-<br>
-Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries=
.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
----<br>
- misc/cgo/testshared/shared_test.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 7 ++++++-<br>
- misc/cgo/testshared/testdata/issue58966/main.go | 15 +++++++++++++++<br>
- src/cmd/compile/internal/noder/unified.go=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 6 +++++-<br>
- 3 files changed, 26 insertions(+), 2 deletions(-)<br>
- create mode 100644 misc/cgo/testshared/testdata/issue58966/main.go<br>
-<br>
-diff --git a/misc/cgo/testshared/shared_test.go b/misc/cgo/testshared/shar=
ed_test.go<br>
-index b14fb1cb3a..03da8f9435 100644<br>
---- a/misc/cgo/testshared/shared_test.go<br>
-+++ b/misc/cgo/testshared/shared_test.go<br>
-@@ -1112,8 +1112,13 @@ func TestStd(t *testing.T) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.Skip(&quot;skip i=
n short mode&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0t.Parallel()<br>
-+=C2=A0 =C2=A0 =C2=A0 tmpDir :=3D t.TempDir()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Use a temporary pkgdir to not interfere with=
 other tests, and not write to GOROOT.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Cannot use goCmd as it runs with cloned GORO=
OT which is incomplete.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0runWithEnv(t, &quot;building std&quot;, []strin=
g{&quot;GOROOT=3D&quot; + oldGOROOT},<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filepath.Join(oldGOROOT,=
 &quot;bin&quot;, &quot;go&quot;), &quot;install&quot;, &quot;-buildmode=3D=
shared&quot;, &quot;-pkgdir=3D&quot;+t.TempDir(), &quot;std&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filepath.Join(oldGOROOT,=
 &quot;bin&quot;, &quot;go&quot;), &quot;install&quot;, &quot;-buildmode=3D=
shared&quot;, &quot;-pkgdir=3D&quot;+tmpDir, &quot;std&quot;)<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 // Issue #58966.<br>
-+=C2=A0 =C2=A0 =C2=A0 runWithEnv(t, &quot;testing issue #58966&quot;, []st=
ring{&quot;GOROOT=3D&quot; + oldGOROOT},<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filepath.Join(oldGOROOT,=
 &quot;bin&quot;, &quot;go&quot;), &quot;run&quot;, &quot;-linkshared&quot;=
, &quot;-pkgdir=3D&quot;+tmpDir, &quot;./issue58966/main.go&quot;)<br>
- }<br>
-diff --git a/misc/cgo/testshared/testdata/issue58966/main.go b/misc/cgo/te=
stshared/testdata/issue58966/main.go<br>
-new file mode 100644<br>
-index 0000000000..2d923c3607<br>
---- /dev/null<br>
-+++ b/misc/cgo/testshared/testdata/issue58966/main.go<br>
-@@ -0,0 +1,15 @@<br>
-+// Copyright 2023 The Go Authors. All rights reserved.<br>
-+// Use of this source code is governed by a BSD-style<br>
-+// license that can be found in the LICENSE file.<br>
-+<br>
-+package main<br>
-+<br>
-+import &quot;crypto/elliptic&quot;<br>
-+<br>
-+var curve elliptic.Curve<br>
-+<br>
-+func main() {<br>
-+=C2=A0 =C2=A0 =C2=A0 switch curve {<br>
-+=C2=A0 =C2=A0 =C2=A0 case elliptic.P224():<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+}<br>
-diff --git a/src/cmd/compile/internal/noder/unified.go b/src/cmd/compile/i=
nternal/noder/unified.go<br>
-index ed97a09302..25136e6aad 100644<br>
---- a/src/cmd/compile/internal/noder/unified.go<br>
-+++ b/src/cmd/compile/internal/noder/unified.go<br>
-@@ -158,7 +158,11 @@ func readBodies(target *ir.Package, duringInlining bo=
ol) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// Instantiated generic function: add to Decls for typechecking<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// and compilation.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if fn.OClosure =3D=3D nil &amp;&amp; len(pri.dict.targs) !=3D 0 {=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if duringInlining {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // cmd/link does not support a type symbol =
referencing a method symbol<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // across DSO boundary, so force re-compili=
ng methods on a generic type<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // even it was seen from imported package i=
n linkshared mode, see #58966.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 canSkipNonGenericMethod :=3D !(base.Ctxt.Fl=
ag_linkshared &amp;&amp; ir.IsMethod(fn))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if duringInlining &amp;&amp; canSkipNonGene=
ricMethod {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inlDecls =
=3D append(inlDecls, fn)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target.De=
cls =3D append(target.Decls, fn)<br>
diff --git a/meta/recipes-devtools/go/go/CVE-2023-24532.patch b/meta/recipe=
s-devtools/go/go/CVE-2023-24532.patch<br>
deleted file mode 100644<br>
index 22f080dbd4..0000000000<br>
--- a/meta/recipes-devtools/go/go/CVE-2023-24532.patch<br>
+++ /dev/null<br>
@@ -1,208 +0,0 @@<br>
-From 602eeaab387f24a4b28c5eccbb50fa934f3bc3c4 Mon Sep 17 00:00:00 2001<br>
-From: Filippo Valsorda &lt;<a href=3D"mailto:filippo@golang.org" target=3D=
"_blank">filippo@golang.org</a>&gt;<br>
-Date: Mon, 13 Feb 2023 15:16:27 +0100<br>
-Subject: [PATCH] [release-branch.go1.20] crypto/internal/nistec: reduce P-=
256<br>
- scalar<br>
-<br>
-Unlike the rest of nistec, the P-256 assembly doesn&#39;t use complete<br>
-addition formulas, meaning that p256PointAdd[Affine]Asm won&#39;t return t=
he<br>
-correct value if the two inputs are equal.<br>
-<br>
-This was (undocumentedly) ignored in the scalar multiplication loops<br>
-because as long as the input point is not the identity and the scalar is<b=
r>
-lower than the order of the group, the addition inputs can&#39;t be the sa=
me.<br>
-<br>
-As part of the math/big rewrite, we went however from always reducing<br>
-the scalar to only checking its length, under the incorrect assumption<br>
-that the scalar multiplication loop didn&#39;t require reduction.<br>
-<br>
-Added a reduction, and while at it added it in P256OrdInverse, too, to<br>
-enforce a universal reduction invariant on p256OrdElement values.<br>
-<br>
-Note that if the input point is the infinity, the code currently still<br>
-relies on undefined behavior, but that&#39;s easily tested to behave<br>
-acceptably, and will be addressed in a future CL.<br>
-<br>
-Updates #58647<br>
-Fixes #58720<br>
-Fixes CVE-2023-24532<br>
-<br>
-(Filed with the &quot;safe APIs like complete addition formulas are good&q=
uot; dept.)<br>
-<br>
-Change-Id: I7b2c75238440e6852be2710fad66ff1fdc4e2b24<br>
-Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/471255" =
rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.com/c/g=
o/+/471255</a><br>
-TryBot-Result: Gopher Robot &lt;<a href=3D"mailto:gobot@golang.org" target=
=3D"_blank">gobot@golang.org</a>&gt;<br>
-Reviewed-by: Roland Shoemaker &lt;<a href=3D"mailto:roland@golang.org" tar=
get=3D"_blank">roland@golang.org</a>&gt;<br>
-Run-TryBot: Filippo Valsorda &lt;<a href=3D"mailto:filippo@golang.org" tar=
get=3D"_blank">filippo@golang.org</a>&gt;<br>
-Auto-Submit: Filippo Valsorda &lt;<a href=3D"mailto:filippo@golang.org" ta=
rget=3D"_blank">filippo@golang.org</a>&gt;<br>
-Reviewed-by: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D=
"_blank">dneil@google.com</a>&gt;<br>
-(cherry picked from commit 203e59ad41bd288e1d92b6f617c2f55e70d3c8e3)<br>
-Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/471695" =
rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.com/c/g=
o/+/471695</a><br>
-Reviewed-by: Dmitri Shuralyov &lt;<a href=3D"mailto:dmitshur@google.com" t=
arget=3D"_blank">dmitshur@google.com</a>&gt;<br>
-Auto-Submit: Dmitri Shuralyov &lt;<a href=3D"mailto:dmitshur@google.com" t=
arget=3D"_blank">dmitshur@google.com</a>&gt;<br>
-Reviewed-by: Filippo Valsorda &lt;<a href=3D"mailto:filippo@golang.org" ta=
rget=3D"_blank">filippo@golang.org</a>&gt;<br>
-Run-TryBot: Roland Shoemaker &lt;<a href=3D"mailto:roland@golang.org" targ=
et=3D"_blank">roland@golang.org</a>&gt;<br>
-<br>
-CVE: CVE-2023-24532<br>
-Upstream-Status: Backport [602eeaab387f24a4b28c5eccbb50fa934f3bc3c4]<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
-<br>
----<br>
- src/crypto/internal/nistec/nistec_test.go | 81 +++++++++++++++++++++++<br=
>
- src/crypto/internal/nistec/p256_asm.go=C2=A0 =C2=A0 | 17 +++++<br>
- src/crypto/internal/nistec/p256_ordinv.go |=C2=A0 1 +<br>
- 3 files changed, 99 insertions(+)<br>
-<br>
-diff --git a/src/crypto/internal/nistec/nistec_test.go b/src/crypto/intern=
al/nistec/nistec_test.go<br>
-index 309f68be16a9f..9103608c18a0f 100644<br>
---- a/src/crypto/internal/nistec/nistec_test.go<br>
-+++ b/src/crypto/internal/nistec/nistec_test.go<br>
-@@ -8,6 +8,7 @@ import (<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;bytes&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;crypto/elliptic&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;crypto/internal/nistec&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;fmt&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;internal/testenv&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;math/big&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;math/rand&quot;<br>
-@@ -165,6 +166,86 @@ func testEquivalents[P nistPoint[P]](t *testing.T, ne=
wPoint func() P, c elliptic<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
- <br>
-+func TestScalarMult(t *testing.T) {<br>
-+=C2=A0 =C2=A0 =C2=A0 t.Run(&quot;P224&quot;, func(t *testing.T) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 testScalarMult(t, nistec=
.NewP224Point, elliptic.P224())<br>
-+=C2=A0 =C2=A0 =C2=A0 })<br>
-+=C2=A0 =C2=A0 =C2=A0 t.Run(&quot;P256&quot;, func(t *testing.T) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 testScalarMult(t, nistec=
.NewP256Point, elliptic.P256())<br>
-+=C2=A0 =C2=A0 =C2=A0 })<br>
-+=C2=A0 =C2=A0 =C2=A0 t.Run(&quot;P384&quot;, func(t *testing.T) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 testScalarMult(t, nistec=
.NewP384Point, elliptic.P384())<br>
-+=C2=A0 =C2=A0 =C2=A0 })<br>
-+=C2=A0 =C2=A0 =C2=A0 t.Run(&quot;P521&quot;, func(t *testing.T) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 testScalarMult(t, nistec=
.NewP521Point, elliptic.P521())<br>
-+=C2=A0 =C2=A0 =C2=A0 })<br>
-+}<br>
-+<br>
-+func testScalarMult[P nistPoint[P]](t *testing.T, newPoint func() P, c el=
liptic.Curve) {<br>
-+=C2=A0 =C2=A0 =C2=A0 G :=3D newPoint().SetGenerator()<br>
-+=C2=A0 =C2=A0 =C2=A0 checkScalar :=3D func(t *testing.T, scalar []byte) {=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p1, err :=3D newPoint().=
ScalarBaseMult(scalar)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fatalIfErr(t, err)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p2, err :=3D newPoint().=
ScalarMult(G, scalar)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fatalIfErr(t, err)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if !bytes.Equal(p1.Bytes=
(), p2.Bytes()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 t.Error(&quot;[k]G !=3D ScalarBaseMult(k)&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d :=3D new(big.Int).SetB=
ytes(scalar)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.Sub(c.Params().N, d)<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.Mod(d, c.Params().N)<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g1, err :=3D newPoint().=
ScalarBaseMult(d.FillBytes(make([]byte, len(scalar))))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fatalIfErr(t, err)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g1.Add(g1, p1)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if !bytes.Equal(g1.Bytes=
(), newPoint().Bytes()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 t.Error(&quot;[N - k]G + [k]G !=3D =E2=88=9E&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 byteLen :=3D len(c.Params().N.Bytes())<br>
-+=C2=A0 =C2=A0 =C2=A0 bitLen :=3D c.Params().N.BitLen()<br>
-+=C2=A0 =C2=A0 =C2=A0 t.Run(&quot;0&quot;, func(t *testing.T) { checkScala=
r(t, make([]byte, byteLen)) })<br>
-+=C2=A0 =C2=A0 =C2=A0 t.Run(&quot;1&quot;, func(t *testing.T) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checkScalar(t, big.NewIn=
t(1).FillBytes(make([]byte, byteLen)))<br>
-+=C2=A0 =C2=A0 =C2=A0 })<br>
-+=C2=A0 =C2=A0 =C2=A0 t.Run(&quot;N-1&quot;, func(t *testing.T) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checkScalar(t, new(big.I=
nt).Sub(c.Params().N, big.NewInt(1)).Bytes())<br>
-+=C2=A0 =C2=A0 =C2=A0 })<br>
-+=C2=A0 =C2=A0 =C2=A0 t.Run(&quot;N&quot;, func(t *testing.T) { checkScala=
r(t, c.Params().N.Bytes()) })<br>
-+=C2=A0 =C2=A0 =C2=A0 t.Run(&quot;N+1&quot;, func(t *testing.T) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checkScalar(t, new(big.I=
nt).Add(c.Params().N, big.NewInt(1)).Bytes())<br>
-+=C2=A0 =C2=A0 =C2=A0 })<br>
-+=C2=A0 =C2=A0 =C2=A0 t.Run(&quot;all1s&quot;, func(t *testing.T) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s :=3D new(big.Int).Lsh(=
big.NewInt(1), uint(bitLen))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s.Sub(s, big.NewInt(1))<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checkScalar(t, s.Bytes()=
)<br>
-+=C2=A0 =C2=A0 =C2=A0 })<br>
-+=C2=A0 =C2=A0 =C2=A0 if testing.Short() {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; bitLen; i++ {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Run(fmt.Sprintf(&quot;=
1&lt;&lt;%d&quot;, i), func(t *testing.T) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 s :=3D new(big.Int).Lsh(big.NewInt(1), uint(i))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkScalar(t, s.FillBytes(make([]byte, byteLen)))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 // Test N+1...N+32 since they risk overlapping with =
precomputed table values<br>
-+=C2=A0 =C2=A0 =C2=A0 // in the final additions.<br>
-+=C2=A0 =C2=A0 =C2=A0 for i :=3D int64(2); i &lt;=3D 32; i++ {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Run(fmt.Sprintf(&quot;=
N+%d&quot;, i), func(t *testing.T) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkScalar(t, new(big.Int).Add(c.Params().N, big.NewInt(i)).Bytes())<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+}<br>
-+<br>
-+func fatalIfErr(t *testing.T, err error) {<br>
-+=C2=A0 =C2=A0 =C2=A0 t.Helper()<br>
-+=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatal(err)<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+}<br>
-+<br>
- func BenchmarkScalarMult(b *testing.B) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0b.Run(&quot;P224&quot;, func(b *testing.B) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0benchmarkScalarMult=
(b, nistec.NewP224Point().SetGenerator(), 28)<br>
-diff --git a/src/crypto/internal/nistec/p256_asm.go b/src/crypto/internal/=
nistec/p256_asm.go<br>
-index 6ea161eb49953..99a22b833f028 100644<br>
---- a/src/crypto/internal/nistec/p256_asm.go<br>
-+++ b/src/crypto/internal/nistec/p256_asm.go<br>
-@@ -364,6 +364,21 @@ func p256PointDoubleAsm(res, in *P256Point)<br>
- // Montgomery domain (with R 2=C2=B2=E2=81=B5=E2=81=B6) as four uint64 li=
mbs in little-endian order.<br>
- type p256OrdElement [4]uint64<br>
- <br>
-+// p256OrdReduce ensures s is in the range [0, ord(G)-1].<br>
-+func p256OrdReduce(s *p256OrdElement) {<br>
-+=C2=A0 =C2=A0 =C2=A0 // Since 2 * ord(G) &gt; 2=C2=B2=E2=81=B5=E2=81=B6, =
we can just conditionally subtract ord(G),<br>
-+=C2=A0 =C2=A0 =C2=A0 // keeping the result if it doesn&#39;t underflow.<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 t0, b :=3D bits.Sub64(s[0], 0xf3b9cac2fc632551, 0)<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 t1, b :=3D bits.Sub64(s[1], 0xbce6faada7179e84, b)<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 t2, b :=3D bits.Sub64(s[2], 0xffffffffffffffff, b)<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 t3, b :=3D bits.Sub64(s[3], 0xffffffff00000000, b)<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 tMask :=3D b - 1 // zero if subtraction underflowed<=
br>
-+=C2=A0 =C2=A0 =C2=A0 s[0] ^=3D (t0 ^ s[0]) &amp; tMask<br>
-+=C2=A0 =C2=A0 =C2=A0 s[1] ^=3D (t1 ^ s[1]) &amp; tMask<br>
-+=C2=A0 =C2=A0 =C2=A0 s[2] ^=3D (t2 ^ s[2]) &amp; tMask<br>
-+=C2=A0 =C2=A0 =C2=A0 s[3] ^=3D (t3 ^ s[3]) &amp; tMask<br>
-+}<br>
-+<br>
- // Add sets q =3D p1 + p2, and returns q. The points may overlap.<br>
- func (q *P256Point) Add(r1, r2 *P256Point) *P256Point {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0var sum, double P256Point<br>
-@@ -393,6 +408,7 @@ func (r *P256Point) ScalarBaseMult(scalar []byte) (*P2=
56Point, error) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0scalarReversed :=3D new(p256OrdElement)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0p256OrdBigToLittle(scalarReversed, (*[32]byte)(=
scalar))<br>
-+=C2=A0 =C2=A0 =C2=A0 p256OrdReduce(scalarReversed)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0r.p256BaseMult(scalarReversed)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return r, nil<br>
-@@ -407,6 +423,7 @@ func (r *P256Point) ScalarMult(q *P256Point, scalar []=
byte) (*P256Point, error)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0scalarReversed :=3D new(p256OrdElement)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0p256OrdBigToLittle(scalarReversed, (*[32]byte)(=
scalar))<br>
-+=C2=A0 =C2=A0 =C2=A0 p256OrdReduce(scalarReversed)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0r.Set(q).p256ScalarMult(scalarReversed)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return r, nil<br>
-diff --git a/src/crypto/internal/nistec/p256_ordinv.go b/src/crypto/intern=
al/nistec/p256_ordinv.go<br>
-index 86a7a230bdce8..1274fb7fd3f5c 100644<br>
---- a/src/crypto/internal/nistec/p256_ordinv.go<br>
-+++ b/src/crypto/internal/nistec/p256_ordinv.go<br>
-@@ -25,6 +25,7 @@ func P256OrdInverse(k []byte) ([]byte, error) {<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0x :=3D new(p256OrdElement)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0p256OrdBigToLittle(x, (*[32]byte)(k))<br>
-+=C2=A0 =C2=A0 =C2=A0 p256OrdReduce(x)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Inversion is implemented as exponentiation b=
y n - 2, per Fermat&#39;s little theorem.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//<br>
diff --git a/meta/recipes-devtools/go/go/CVE-2023-24537.patch b/meta/recipe=
s-devtools/go/go/CVE-2023-24537.patch<br>
deleted file mode 100644<br>
index 6b5dc2c8d9..0000000000<br>
--- a/meta/recipes-devtools/go/go/CVE-2023-24537.patch<br>
+++ /dev/null<br>
@@ -1,89 +0,0 @@<br>
-From 110e4fb1c2e3a21631704bbfaf672230b9ba2492 Mon Sep 17 00:00:00 2001<br>
-From: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D"_blank=
">dneil@google.com</a>&gt;<br>
-Date: Wed, 22 Mar 2023 09:33:22 -0700<br>
-Subject: [PATCH] go/scanner: reject large line and column numbers in //lin=
e<br>
- directives<br>
-<br>
-Setting a large line or column number using a //line directive can cause<b=
r>
-integer overflow even in small source files.<br>
-<br>
-Limit line and column numbers in //line directives to 2^30-1, which<br>
-is small enough to avoid int32 overflow on all reasonbly-sized files.<br>
-<br>
-For #59180<br>
-Fixes CVE-2023-24537<br>
-<br>
-Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/golang/g=
o-private/+/1802456-Reviewed-by" rel=3D"noreferrer" target=3D"_blank">https=
://team-review.git.corp.google.com/c/golang/go-private/+/1802456<br>
-Reviewed-by</a>: Julie Qiu &lt;<a href=3D"mailto:julieqiu@google.com" targ=
et=3D"_blank">julieqiu@google.com</a>&gt;<br>
-Reviewed-by: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.com" =
target=3D"_blank">bracewell@google.com</a>&gt;<br>
-Run-TryBot: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D"=
_blank">dneil@google.com</a>&gt;<br>
-Change-Id: I149bf34deca532af7994203fa1e6aca3c890ea14<br>
-Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/482078" =
rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.com/c/g=
o/+/482078</a><br>
-Reviewed-by: Matthew Dempsky &lt;<a href=3D"mailto:mdempsky@google.com" ta=
rget=3D"_blank">mdempsky@google.com</a>&gt;<br>
-TryBot-Bypass: Michael Knyszek &lt;<a href=3D"mailto:mknyszek@google.com" =
target=3D"_blank">mknyszek@google.com</a>&gt;<br>
-Run-TryBot: Michael Knyszek &lt;<a href=3D"mailto:mknyszek@google.com" tar=
get=3D"_blank">mknyszek@google.com</a>&gt;<br>
-Auto-Submit: Michael Knyszek &lt;<a href=3D"mailto:mknyszek@google.com" ta=
rget=3D"_blank">mknyszek@google.com</a>&gt;<br>
-<br>
-CVE: CVE-2023-24537<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
----<br>
- src/go/parser/parser_test.go | 16 ++++++++++++++++<br>
- src/go/scanner/scanner.go=C2=A0 =C2=A0 |=C2=A0 7 +++++--<br>
- 2 files changed, 21 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/src/go/parser/parser_test.go b/src/go/parser/parser_test.go<b=
r>
-index 153562df75068..22b11a0cc4535 100644<br>
---- a/src/go/parser/parser_test.go<br>
-+++ b/src/go/parser/parser_test.go<br>
-@@ -764,3 +764,19 @@ func TestRangePos(t *testing.T) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0})<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
-+<br>
-+// TestIssue59180 tests that line number overflow doesn&#39;t cause an in=
finite loop.<br>
-+func TestIssue59180(t *testing.T) {<br>
-+=C2=A0 =C2=A0 =C2=A0 testcases :=3D []string{<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;package p\n//line =
:9223372036854775806\n\n//&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;package p\n//line =
:1:9223372036854775806\n\n//&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;package p\n//line =
file:9223372036854775806\n\n//&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 for _, src :=3D range testcases {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _, err :=3D ParseFile(to=
ken.NewFileSet(), &quot;&quot;, src, ParseComments)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err =3D=3D nil {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 t.Errorf(&quot;ParseFile(%s) succeeded unexpectedly&quot;, src)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+}<br>
-diff --git a/src/go/scanner/scanner.go b/src/go/scanner/scanner.go<br>
-index 16958d22ce299..0cd9f5901d0bb 100644<br>
---- a/src/go/scanner/scanner.go<br>
-+++ b/src/go/scanner/scanner.go<br>
-@@ -253,13 +253,16 @@ func (s *Scanner) updateLineInfo(next, offs int, tex=
t []byte) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-+=C2=A0 =C2=A0 =C2=A0 // Put a cap on the maximum size of line and column =
numbers.<br>
-+=C2=A0 =C2=A0 =C2=A0 // 30 bits allows for some additional space before w=
rapping an int32.<br>
-+=C2=A0 =C2=A0 =C2=A0 const maxLineCol =3D 1&lt;&lt;30 - 1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0var line, col int<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0i2, n2, ok2 :=3D trailingDigits(text[:i-1])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ok2 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//line filename:lin=
e:col<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, i2 =3D i2, i<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0line, col =3D n2, n=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if col =3D=3D 0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if col =3D=3D 0 || col &=
gt; maxLineCol {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0s.error(offs+i2, &quot;invalid column number: &quot;+string(text[=
i2:]))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -269,7 +272,7 @@ func (s *Scanner) updateLineInfo(next, offs int, text =
[]byte) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0line =3D n<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 if line =3D=3D 0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 if line =3D=3D 0 || line &gt; maxLineCol {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s.error(offs+i, &qu=
ot;invalid line number: &quot;+string(text[i:]))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.20.1.bb" rel=
=3D"noreferrer" target=3D"_blank">go_1.20.1.bb</a> b/meta/recipes-devtools/=
go/<a href=3D"http://go_1.20.4.bb" rel=3D"noreferrer" target=3D"_blank">go_=
1.20.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go_1.20.1.bb" rel=3D=
"noreferrer" target=3D"_blank">go_1.20.1.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go_1.20.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">go_1.20.4.bb</a><br>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#181660): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/181660" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/181660</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99103824/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99103824/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div></div>

--00000000000085031c05fc6c5af2--

