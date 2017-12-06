Return-Path: <limon.anibal@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 99F6471951
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 18:56:54 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l141so9005919wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 10:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hzQiDxPm77jdEybQ1zX/cHY4+0jiSRDwlfe3pTFqux8=;
	b=I0ArZO8v3BsNC0pGbi59qM7XrtSJAglRpGKLA/8j9YhsJM4MW9jGuJCJN/GUTtTuzD
	Vo2ouhWCT56/FMI3st9IlpmQi+HanMIL5In4zQbbtF6HqAd8w63dzjjROz954wPWDGK1
	wH1PU9vRtC9/Yy+QQAf/nPpu5OfBHeP8LeJ0Y92vLrpmMxWsnUD2Dh+wEGaySLsFyw+d
	I1/+9r+vHn4KCsHikCMDtVcTlWFNDgftPTRBMmGrocWIWDUQWIdFzr1jdAunkSUv/D1I
	Ybydt/UYehwsFHti+D7caIkvhuLRtgNFVBUMHelzPT8R5YmX/JhRugWDLNWwOkQskmSJ
	3PMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hzQiDxPm77jdEybQ1zX/cHY4+0jiSRDwlfe3pTFqux8=;
	b=Ggowm2N3Y9XX/y8EAzdWb0sDijJlsGatQljQryU1ob6ghnLls5EmvG6Jd94PiWpBjI
	/NSKbQ5XZRRb0SOYFqhAdNnMLXhRcRJaxEB4pWBeZ3pfi2ueoAr/ULrL/Y3xG/z+6z3m
	CepPYfDzDOdBBkA0JnJOqBcR7MVIAw9tYKp6Zy1XMpTsrN3iKzhgRabBjHPMwONbFeTc
	BfWqqYjdwc2FDdzqEH5APeDrDR4+a+Alxem4E0Nf75HVM/cr6fREQmUOXWTcSqWDP2lG
	ke/VZK0ssC4f5T3WycYGaVEK0d1KYkw8u34nUcIxlE5jGVfJWJeqyN/LdZo2hjm6ZCCk
	6yRg==
X-Gm-Message-State: AJaThX4z5HY0KyDPAVJRom0hBlHjYNOZNLbMTXgV2igFh6B3b9aALD23
	dwwPXmf3N+cPikckrYmB8xpjEEGqIzuIDyQg1iQ=
X-Google-Smtp-Source: AGs4zMbVjEuqusAaJ8XlHtH4FoxV8Kk9wOYXbzuxGwuhKtHw1ww2fwFC1JWVVRxkIB8Jf3v3lI66vB2AuD1FO5ZAQZk=
X-Received: by 10.80.151.125 with SMTP id d58mr40647766edb.236.1512586615343; 
	Wed, 06 Dec 2017 10:56:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.241.18 with HTTP; Wed, 6 Dec 2017 10:56:54 -0800 (PST)
In-Reply-To: <20171206111703.13684-1-otavio@ossystems.com.br>
References: <20171206111703.13684-1-otavio@ossystems.com.br>
From: =?UTF-8?Q?Anibal_Lim=C3=B3n?= <limon.anibal@gmail.com>
Date: Wed, 6 Dec 2017 12:56:54 -0600
Message-ID: <CAPS-YPA3mK19aDKB9VKzdxfMH6dnHa-brcTgKamt4gx7w6h6Fw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [rocko PATCH 1/3] Revert "go: Fix build with PIE on musl"
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
X-List-Received-Date: Wed, 06 Dec 2017 18:56:55 -0000
Content-Type: multipart/alternative; boundary="f403045c2392e651b6055fb083e2"

--f403045c2392e651b6055fb083e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2017 at 5:17 AM, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> This reverts commit d6fcf91c06a3d118e8741273fac6903100141db4.
>
> This commit was included on the rocko update by mistake. It ended
> being dropped from master merge queue but forgotten in rocko one.
>

Also causes a build failure on sd-600 [1] when linking containerd-docker
(meta-virtualization) to libgcc due to pass -shared and -pie by default.

...
08:51:05 | cd ctr && go build -ldflags "-w -extldflags -static -X
github.com/containerd/containerd.GitCommit=3D3addd840653146c90a254301d6c3a6=
63c7fd6429
" -tags "" -o ../bin/ctr
08:51:05 | cd containerd && go build -ldflags "-w -extldflags -static -X
github.com/containerd/containerd.GitCommit=3D3addd840653146c90a254301d6c3a6=
63c7fd6429
" -tags "" -o ../bin/containerd
08:51:05 | cd containerd-shim && go build -ldflags "-w -extldflags -static
-X
github.com/containerd/containerd.GitCommit=3D3addd840653146c90a254301d6c3a6=
63c7fd6429
" -tags "" -o ../bin/containerd-shim
08:51:05 | # github.com/containerd/containerd/containerd-shim
08:51:05 |
/srv/oe/build/tmp-rpb_wayland-glibc/work/armv7ahf-neon-linaro-linux-gnueabi=
/containerd-docker/v0.2.x+git3addd840653146c90a254301d6c3a663c7fd6429-r0/re=
cipe-sysroot-native/usr/lib/arm-linaro-linux-gnueabi/go/pkg/tool/linux_amd6=
4/link:
running arm-linaro-linux-gnueabi-gcc failed: exit status 1
08:51:05 |
/srv/oe/build/tmp-rpb_wayland-glibc/work/armv7ahf-neon-linaro-linux-gnueabi=
/containerd-docker/v0.2.x+git3addd840653146c90a254301d6c3a663c7fd6429-r0/re=
cipe-sysroot-native/usr/bin/arm-linaro-linux-gnueabi/../../libexec/arm-lina=
ro-linux-gnueabi/gcc/arm-linaro-linux-gnueabi/7.1.1/ld:
/srv/oe/build/tmp-rpb_wayland-glibc/work/armv7ahf-neon-linaro-linux-gnueabi=
/containerd-docker/v0.2.x+git3addd840653146c90a254301d6c3a663c7fd6429-r0/re=
cipe-sysroot/usr/lib/arm-linaro-linux-gnueabi/7.1.1/crtbeginT.o:
relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when
making a shared object; recompile with -fPIC
...

[1]
https://ci.linaro.org/job/lt-qcom-openembedded-rpb-rocko/6/DISTRO=3Drpb-way=
land,MACHINE=3Dsd-600eval,label=3Ddocker-stretch-amd64/console

Cheers,
Anibal


>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta/recipes-devtools/go/go-1.9.inc                |   3 -
>  .../go/go-1.9/default-buildmode-pie.patch          |  18 ----
>  .../go/go-1.9/set-external-linker.patch            | 111
> ---------------------
>  3 files changed, 132 deletions(-)
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 9/default-buildmode-pie.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 9/set-external-linker.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.9.inc
> b/meta/recipes-devtools/go/go-1.9.inc
> index f52abb5735..65adaa8d72 100644
> --- a/meta/recipes-devtools/go/go-1.9.inc
> +++ b/meta/recipes-devtools/go/go-1.9.inc
> @@ -15,9 +15,6 @@ SRC_URI +=3D "\
>          file://0007-ld-add-soname-to-shareable-objects.patch \
>          file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia=
.patch
> \
>          file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on=
.patch
> \
> -        file://default-buildmode-pie.patch \
>  "
> -SRC_URI_append_libc-musl =3D " file://set-external-linker.patch"
> -
>  SRC_URI[main.md5sum] =3D "da2d44ea384076efec43ee1f8b7d45d2"
>  SRC_URI[main.sha256sum] =3D "a4ab229028ed167ba1986825751463
> 605264e44868362ca8e7accc8be057e993"
> diff --git a/meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch
> b/meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch
> deleted file mode 100644
> index a7933bd39e..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Default to PIE on linux platforms
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -diff -upr src/go.orig/src/cmd/go/internal/work/build.go
> src/go/src/cmd/go/internal/work/build.go
> ---- go.orig/src/cmd/go/internal/work/build.go  2017-08-27
> 17:38:26.354750979 +0200
> -+++ go/src/cmd/go/internal/work/build.go       2017-08-27
> 17:40:27.555130105 +0200
> -@@ -304,7 +304,8 @@ func BuildModeInit() {
> -               ldBuildmode =3D "c-shared"
> -       case "default":
> -               switch platform {
> --              case "android/arm", "android/arm64", "android/amd64",
> "android/386":
> -+              case "linux/386", "linux/amd64", "linux/arm",
> "linux/arm64", "linux/ppc64le", "linux/s390x",
> -+                      "android/arm", "android/arm64", "android/amd64",
> "android/386":
> -                       codegenArg =3D "-shared"
> -                       ldBuildmode =3D "pie"
> -               case "darwin/arm", "darwin/arm64":
> diff --git a/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
> b/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
> deleted file mode 100644
> index d6bd7fa39c..0000000000
> --- a/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
> +++ /dev/null
> @@ -1,111 +0,0 @@
> -Change the dynamic linker hardcoding to use musl when not using glibc
> -this should be applied conditional to musl being the system C library
> -
> -Upstream-Status: Inappropriate [Real Fix should be portable across libcs=
]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: go/src/cmd/link/internal/amd64/obj.go
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- go.orig/src/cmd/link/internal/amd64/obj.go
> -+++ go/src/cmd/link/internal/amd64/obj.go
> -@@ -67,7 +67,7 @@ func Init() {
> -       ld.Thearch.Append64 =3D ld.Append64l
> -       ld.Thearch.TLSIEtoLE =3D tlsIEtoLE
> -
> --      ld.Thearch.Linuxdynld =3D "/lib64/ld-linux-x86-64.so.2"
> -+      ld.Thearch.Linuxdynld =3D "/lib/ld-musl-x86_64.so.1"
> -       ld.Thearch.Freebsddynld =3D "/libexec/ld-elf.so.1"
> -       ld.Thearch.Openbsddynld =3D "/usr/libexec/ld.so"
> -       ld.Thearch.Netbsddynld =3D "/libexec/ld.elf_so"
> -Index: go/src/cmd/link/internal/arm/obj.go
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- go.orig/src/cmd/link/internal/arm/obj.go
> -+++ go/src/cmd/link/internal/arm/obj.go
> -@@ -63,7 +63,7 @@ func Init() {
> -       ld.Thearch.Append32 =3D ld.Append32l
> -       ld.Thearch.Append64 =3D ld.Append64l
> -
> --      ld.Thearch.Linuxdynld =3D "/lib/ld-linux.so.3" // 2 for OABI, 3 f=
or
> EABI
> -+      ld.Thearch.Linuxdynld =3D "/lib/ld-musl-armhf.so.1"
> -       ld.Thearch.Freebsddynld =3D "/usr/libexec/ld-elf.so.1"
> -       ld.Thearch.Openbsddynld =3D "/usr/libexec/ld.so"
> -       ld.Thearch.Netbsddynld =3D "/libexec/ld.elf_so"
> -Index: go/src/cmd/link/internal/arm64/obj.go
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- go.orig/src/cmd/link/internal/arm64/obj.go
> -+++ go/src/cmd/link/internal/arm64/obj.go
> -@@ -62,7 +62,7 @@ func Init() {
> -       ld.Thearch.Append32 =3D ld.Append32l
> -       ld.Thearch.Append64 =3D ld.Append64l
> -
> --      ld.Thearch.Linuxdynld =3D "/lib/ld-linux-aarch64.so.1"
> -+      ld.Thearch.Linuxdynld =3D "/lib/ld-musl-aarch64.so.1"
> -
> -       ld.Thearch.Freebsddynld =3D "XXX"
> -       ld.Thearch.Openbsddynld =3D "XXX"
> -Index: go/src/cmd/link/internal/mips/obj.go
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- go.orig/src/cmd/link/internal/mips/obj.go
> -+++ go/src/cmd/link/internal/mips/obj.go
> -@@ -77,7 +77,7 @@ func Init() {
> -               ld.Thearch.Append64 =3D ld.Append64b
> -       }
> -
> --      ld.Thearch.Linuxdynld =3D "/lib/ld.so.1"
> -+      ld.Thearch.Linuxdynld =3D "/lib/ld-musl-mipsle.so.1"
> -
> -       ld.Thearch.Freebsddynld =3D "XXX"
> -       ld.Thearch.Openbsddynld =3D "XXX"
> -Index: go/src/cmd/link/internal/mips64/obj.go
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- go.orig/src/cmd/link/internal/mips64/obj.go
> -+++ go/src/cmd/link/internal/mips64/obj.go
> -@@ -75,7 +75,7 @@ func Init() {
> -               ld.Thearch.Append64 =3D ld.Append64b
> -       }
> -
> --      ld.Thearch.Linuxdynld =3D "/lib64/ld64.so.1"
> -+      ld.Thearch.Linuxdynld =3D "/lib64/ld-musl-mips64le.so.1"
> -
> -       ld.Thearch.Freebsddynld =3D "XXX"
> -       ld.Thearch.Openbsddynld =3D "XXX"
> -Index: go/src/cmd/link/internal/ppc64/obj.go
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- go.orig/src/cmd/link/internal/ppc64/obj.go
> -+++ go/src/cmd/link/internal/ppc64/obj.go
> -@@ -77,7 +77,7 @@ func Init() {
> -       }
> -
> -       // TODO(austin): ABI v1 uses /usr/lib/ld.so.1
> --      ld.Thearch.Linuxdynld =3D "/lib64/ld64.so.1"
> -+      ld.Thearch.Linuxdynld =3D "/lib/ld-musl-powerpc64le.so.1"
> -
> -       ld.Thearch.Freebsddynld =3D "XXX"
> -       ld.Thearch.Openbsddynld =3D "XXX"
> -Index: go/src/cmd/link/internal/s390x/obj.go
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- go.orig/src/cmd/link/internal/s390x/obj.go
> -+++ go/src/cmd/link/internal/s390x/obj.go
> -@@ -62,7 +62,7 @@ func Init() {
> -       ld.Thearch.Append32 =3D ld.Append32b
> -       ld.Thearch.Append64 =3D ld.Append64b
> -
> --      ld.Thearch.Linuxdynld =3D "/lib64/ld64.so.1"
> -+      ld.Thearch.Linuxdynld =3D "/lib/ld-musl-s390x.so.1"
> -
> -       // not relevant for s390x
> -       ld.Thearch.Freebsddynld =3D "XXX"
> -Index: go/src/cmd/link/internal/x86/obj.go
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- go.orig/src/cmd/link/internal/x86/obj.go
> -+++ go/src/cmd/link/internal/x86/obj.go
> -@@ -63,7 +63,7 @@ func Init() {
> -       ld.Thearch.Append32 =3D ld.Append32l
> -       ld.Thearch.Append64 =3D ld.Append64l
> -
> --      ld.Thearch.Linuxdynld =3D "/lib/ld-linux.so.2"
> -+      ld.Thearch.Linuxdynld =3D "/lib/ld-musl-i386.so.1"
> -       ld.Thearch.Freebsddynld =3D "/usr/libexec/ld-elf.so.1"
> -       ld.Thearch.Openbsddynld =3D "/usr/libexec/ld.so"
> -       ld.Thearch.Netbsddynld =3D "/usr/libexec/ld.elf_so"
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045c2392e651b6055fb083e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Dec 6, 2017 at 5:17 AM, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.=
br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">This reverts commit d6fcf91c06a3d118e8741273fac690<wbr>3100141db4.<br>
<br>
This commit was included on the rocko update by mistake. It ended<br>
being dropped from master merge queue but forgotten in rocko one.<br></bloc=
kquote><div><br></div><div>Also causes a build failure on sd-600 [1] when l=
inking containerd-docker (meta-virtualization) to libgcc due to pass -share=
d and -pie by default.</div><div><br></div><div>...</div><div><div>08:51:05=
 | cd ctr &amp;&amp; go build -ldflags &quot;-w -extldflags -static -X <a h=
ref=3D"http://github.com/containerd/containerd.GitCommit=3D3addd840653146c9=
0a254301d6c3a663c7fd6429">github.com/containerd/containerd.GitCommit=3D3add=
d840653146c90a254301d6c3a663c7fd6429</a> &quot; -tags &quot;&quot; -o ../bi=
n/ctr</div><div>08:51:05 | cd containerd &amp;&amp; go build -ldflags &quot=
;-w -extldflags -static -X <a href=3D"http://github.com/containerd/containe=
rd.GitCommit=3D3addd840653146c90a254301d6c3a663c7fd6429">github.com/contain=
erd/containerd.GitCommit=3D3addd840653146c90a254301d6c3a663c7fd6429</a> &qu=
ot; -tags &quot;&quot; -o ../bin/containerd</div><div>08:51:05 | cd contain=
erd-shim &amp;&amp; go build -ldflags &quot;-w -extldflags -static -X <a hr=
ef=3D"http://github.com/containerd/containerd.GitCommit=3D3addd840653146c90=
a254301d6c3a663c7fd6429">github.com/containerd/containerd.GitCommit=3D3addd=
840653146c90a254301d6c3a663c7fd6429</a> &quot; -tags &quot;&quot; -o ../bin=
/containerd-shim</div><div>08:51:05 | # <a href=3D"http://github.com/contai=
nerd/containerd/containerd-shim">github.com/containerd/containerd/container=
d-shim</a></div><div>08:51:05 | /srv/oe/build/tmp-rpb_wayland-glibc/work/ar=
mv7ahf-neon-linaro-linux-gnueabi/containerd-docker/v0.2.x+git3addd840653146=
c90a254301d6c3a663c7fd6429-r0/recipe-sysroot-native/usr/lib/arm-linaro-linu=
x-gnueabi/go/pkg/tool/linux_amd64/link: running arm-linaro-linux-gnueabi-gc=
c failed: exit status 1</div><div>08:51:05 | /srv/oe/build/tmp-rpb_wayland-=
glibc/work/armv7ahf-neon-linaro-linux-gnueabi/containerd-docker/v0.2.x+git3=
addd840653146c90a254301d6c3a663c7fd6429-r0/recipe-sysroot-native/usr/bin/ar=
m-linaro-linux-gnueabi/../../libexec/arm-linaro-linux-gnueabi/gcc/arm-linar=
o-linux-gnueabi/7.1.1/ld: /srv/oe/build/tmp-rpb_wayland-glibc/work/armv7ahf=
-neon-linaro-linux-gnueabi/containerd-docker/v0.2.x+git3addd840653146c90a25=
4301d6c3a663c7fd6429-r0/recipe-sysroot/usr/lib/arm-linaro-linux-gnueabi/7.1=
.1/crtbeginT.o: relocation R_ARM_MOVW_ABS_NC against `a local symbol&#39; c=
an not be used when making a shared object; recompile with -fPIC</div></div=
><div>...<div><div><br></div><div>[1]=C2=A0<a href=3D"https://ci.linaro.org=
/job/lt-qcom-openembedded-rpb-rocko/6/DISTRO=3Drpb-wayland,MACHINE=3Dsd-600=
eval,label=3Ddocker-stretch-amd64/console">https://ci.linaro.org/job/lt-qco=
m-openembedded-rpb-rocko/6/DISTRO=3Drpb-wayland,MACHINE=3Dsd-600eval,label=
=3Ddocker-stretch-amd64/console</a><br></div></div></div><div><br></div><di=
v>Cheers,</div><div>Anibal</div><div>=C2=A0<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br>
---<br>
<br>
=C2=A0meta/recipes-devtools/go/go-1.<wbr>9.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 -<br>
=C2=A0.../go/go-1.9/default-<wbr>buildmode-pie.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 18 ----<br>
=C2=A0.../go/go-1.9/set-external-<wbr>linker.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 111 ---------------------<br>
=C2=A03 files changed, 132 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>9/default-build=
mode-pie.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>9/set-external-=
linker.patch<br>
<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9.inc b/meta/recipes-devtoo=
ls/go/go-<wbr>1.9.inc<br>
index f52abb5735..65adaa8d72 100644<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9.inc<br>
+++ b/meta/recipes-devtools/go/go-<wbr>1.9.inc<br>
@@ -15,9 +15,6 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-ld-add-soname-to-<wbr>shareab=
le-objects.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-make.bash-add-<wbr>GOHOSTxx-i=
ndirection-for-<wbr>cross-canadia.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-cmd-go-buildmode-<wbr>pie-for=
ces-external-linking-<wbr>mode-on.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://default-buildmode-pie.<wbr>patch \<br>
=C2=A0&quot;<br>
-SRC_URI_append_libc-musl =3D &quot; file://set-external-linker.<wbr>patch&=
quot;<br>
-<br>
=C2=A0SRC_URI[main.md5sum] =3D &quot;<wbr>da2d44ea384076efec43ee1f8b7d45<wb=
r>d2&quot;<br>
=C2=A0SRC_URI[main.sha256sum] =3D &quot;<wbr>a4ab229028ed167ba1986825751463=
<wbr>605264e44868362ca8e7accc8be057<wbr>e993&quot;<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9/default-buildmode-pie.<wb=
r>patch b/meta/recipes-devtools/go/go-<wbr>1.9/default-buildmode-pie.<wbr>p=
atch<br>
deleted file mode 100644<br>
index a7933bd39e..0000000000<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9/default-buildmode-pie.<wbr>patch=
<br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-Default to PIE on linux platforms<br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
-<br>
-diff -upr src/go.orig/src/cmd/go/<wbr>internal/work/build.go src/go/src/cm=
d/go/internal/<wbr>work/build.go<br>
---- go.orig/src/cmd/go/internal/<wbr>work/build.go=C2=A0 2017-08-27 17:38:=
26.354750979 +0200<br>
-+++ go/src/cmd/go/internal/work/<wbr>build.go=C2=A0 =C2=A0 =C2=A0 =C2=A020=
17-08-27 17:40:27.555130105 +0200<br>
-@@ -304,7 +304,8 @@ func BuildModeInit() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldBuildmode =3D &qu=
ot;c-shared&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;default&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch platform {<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;android/arm&q=
uot;, &quot;android/arm64&quot;, &quot;android/amd64&quot;, &quot;android/3=
86&quot;:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;linux/386&quo=
t;, &quot;linux/amd64&quot;, &quot;linux/arm&quot;, &quot;linux/arm64&quot;=
, &quot;linux/ppc64le&quot;, &quot;linux/s390x&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;android/arm&quot;, &quot;android/arm64&quot;, &quot;android/amd64=
&quot;, &quot;android/386&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0codegenArg =3D &quot;-shared&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ldBuildmode =3D &quot;pie&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;darwin/a=
rm&quot;, &quot;darwin/arm64&quot;:<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9/set-external-linker.patch=
 b/meta/recipes-devtools/go/go-<wbr>1.9/set-external-linker.patch<br>
deleted file mode 100644<br>
index d6bd7fa39c..0000000000<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9/set-external-linker.patch<br>
+++ /dev/null<br>
@@ -1,111 +0,0 @@<br>
-Change the dynamic linker hardcoding to use musl when not using glibc<br>
-this should be applied conditional to musl being the system C library<br>
-<br>
-Upstream-Status: Inappropriate [Real Fix should be portable across libcs]<=
br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
-<br>
-Index: go/src/cmd/link/internal/<wbr>amd64/obj.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/link/internal/<wbr>amd64/obj.go<br>
-+++ go/src/cmd/link/internal/<wbr>amd64/obj.go<br>
-@@ -67,7 +67,7 @@ func Init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64 =3D ld.Append64l<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.TLSIEtoLE =3D tlsIEtoLE<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib64/ld-linux-x86-=
64.so.2&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-x86_64.=
so.1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;/libexec/ld-e=
lf.so.1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;/usr/libexec/=
ld.so&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Netbsddynld =3D &quot;/libexec/ld.el=
f_so&quot;<br>
-Index: go/src/cmd/link/internal/arm/<wbr>obj.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/link/internal/<wbr>arm/obj.go<br>
-+++ go/src/cmd/link/internal/arm/<wbr>obj.go<br>
-@@ -63,7 +63,7 @@ func Init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append32 =3D ld.Append32l<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64 =3D ld.Append64l<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-linux.so.3&q=
uot; // 2 for OABI, 3 for EABI<br>
-+=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-armhf.s=
o.1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;/usr/libexec/=
ld-elf.so.1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;/usr/libexec/=
ld.so&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Netbsddynld =3D &quot;/libexec/ld.el=
f_so&quot;<br>
-Index: go/src/cmd/link/internal/<wbr>arm64/obj.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/link/internal/<wbr>arm64/obj.go<br>
-+++ go/src/cmd/link/internal/<wbr>arm64/obj.go<br>
-@@ -62,7 +62,7 @@ func Init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append32 =3D ld.Append32l<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64 =3D ld.Append64l<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-linux-aarch6=
4.so.1&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-aarch64=
.so.1&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;XXX&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;XXX&quot;<br>
-Index: go/src/cmd/link/internal/mips/<wbr>obj.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/link/internal/<wbr>mips/obj.go<br>
-+++ go/src/cmd/link/internal/mips/<wbr>obj.go<br>
-@@ -77,7 +77,7 @@ func Init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64=
 =3D ld.Append64b<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld.so.1&quot;<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-mipsle.=
so.1&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;XXX&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;XXX&quot;<br>
-Index: go/src/cmd/link/internal/<wbr>mips64/obj.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/link/internal/<wbr>mips64/obj.go<br>
-+++ go/src/cmd/link/internal/<wbr>mips64/obj.go<br>
-@@ -75,7 +75,7 @@ func Init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64=
 =3D ld.Append64b<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib64/ld64.so.1&quo=
t;<br>
-+=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib64/ld-musl-mips6=
4le.so.1&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;XXX&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;XXX&quot;<br>
-Index: go/src/cmd/link/internal/<wbr>ppc64/obj.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/link/internal/<wbr>ppc64/obj.go<br>
-+++ go/src/cmd/link/internal/<wbr>ppc64/obj.go<br>
-@@ -77,7 +77,7 @@ func Init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO(austin): ABI v1 uses /usr/lib/ld.so.1<b=
r>
--=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib64/ld64.so.1&quo=
t;<br>
-+=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-powerpc=
64le.so.<wbr>1&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;XXX&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;XXX&quot;<br>
-Index: go/src/cmd/link/internal/<wbr>s390x/obj.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/link/internal/<wbr>s390x/obj.go<br>
-+++ go/src/cmd/link/internal/<wbr>s390x/obj.go<br>
-@@ -62,7 +62,7 @@ func Init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append32 =3D ld.Append32b<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64 =3D ld.Append64b<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib64/ld64.so.1&quo=
t;<br>
-+=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-s390x.s=
o.1&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// not relevant for s390x<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;XXX&quot;<br>
-Index: go/src/cmd/link/internal/x86/<wbr>obj.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/link/internal/<wbr>x86/obj.go<br>
-+++ go/src/cmd/link/internal/x86/<wbr>obj.go<br>
-@@ -63,7 +63,7 @@ func Init() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append32 =3D ld.Append32l<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64 =3D ld.Append64l<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-linux.so.2&q=
uot;<br>
-+=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-i386.so=
.1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;/usr/libexec/=
ld-elf.so.1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;/usr/libexec/=
ld.so&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Netbsddynld =3D &quot;/usr/libexec/l=
d.elf_so&quot;<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br></div></div>

--f403045c2392e651b6055fb083e2--
