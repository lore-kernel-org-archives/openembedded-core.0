Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1B65678299
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 12:31:56 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id l196so2133048itl.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 05:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zKsx1CpEq08SPRdywpiJh5JCLaxDLTkBcGwfqz5Ljx4=;
	b=Ds8zrwKMyqtZRGs+mGtnMb3f+SimdrjuGRJoC5zpb/k51sh9yNDuck7Ip0O+S2CzmD
	Leyqw3T+u2Do0MZgBsgzy9yjPcpn/DS+lvUD1ROKlUX3Ir4BQUI7UlOiJYD3L/+4udls
	MPvS4VhZ2zOmglwfoNItE9TRBj826+oAdSW9py6yK9x2gdSdXNYvZa2M/etO1b0jZYQa
	e2gvbeEFyQhZlf83c9r3f9/68J9ymZS49JOkDT09eUz3Ry/NhwrRvY4v4V5/TOaiVSIt
	YnlM7gFtgAYuJhDFf+vtoohZg6RXCqT82YucaPLA+2DtYJEq+Mql2ZKwJw/Go1yXuhC1
	KK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zKsx1CpEq08SPRdywpiJh5JCLaxDLTkBcGwfqz5Ljx4=;
	b=mjJoeM+sB5nftMc2VbqhTqG5oQmHlvqJBbx0gjBmFhUJ5wdaM/nTy+YDnnk2e6OafS
	77kS8r5Zu2RbBUmERO8ytWJWk78gkeeFDpUwHQdJAP+AhMfAc7DBKOzfJraIuPki634e
	M3IecLO1i5a8cWLbJYHHiYIHLfLXLeKUAE1RvOJ5cRnVaY88+mDpxK3KtJhENkj+66Wh
	3q4db8rj2F6Uh4+n/nRxXFVOK+fCRfjJe7hWPHwdzERu0ylP6aW4N7LBQXiZz86Ogu9i
	dqvjvME71knJfGgSK+Tr2u8Jmcq6Q/6S4W80nHtlxSrg5qp0UHXsfyWA8ke9fAt9fzA2
	zbFA==
X-Gm-Message-State: AMCzsaWI0/VmI6ZrvdjrISzhvsfaB/8LicLjIQhtfzV4+czzP6cAT5cy
	LWlLYfdsYEbx4tJ8QU9JIRDKvQGMwrDvG4cA+FJW+g==
X-Google-Smtp-Source: ABhQp+SDPUoIYXDrFc50iIo+sN+NPZxp+sMrBNlLtO2Aarut0E6HmpkXsXRtRZ3iRvzPFc2loJAi7jccWNfU9e/Qm4s=
X-Received: by 10.36.138.133 with SMTP id v127mr5414468itd.151.1508243517885; 
	Tue, 17 Oct 2017 05:31:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Tue, 17 Oct 2017 05:31:37 -0700 (PDT)
In-Reply-To: <20171014154858.35123-2-raj.khem@gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-2-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Oct 2017 13:31:37 +0100
Message-ID: <CAJTo0La06f6Y44sF13F1v5zv1xnei0XVju2FgUpTmsPurYL56A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] go: Fix build with PIE on musl
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
X-List-Received-Date: Tue, 17 Oct 2017 12:31:57 -0000
Content-Type: multipart/alternative; boundary="94eb2c0800861e8728055bbd4f95"

--94eb2c0800861e8728055bbd4f95
Content-Type: text/plain; charset="UTF-8"

The patches have no header, upstream-status, or signed-off-by.

Ross

On 14 October 2017 at 16:48, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/go/go-1.9.inc                |   3 +
>  .../go/go-1.9/default-buildmode-pie.patch          |  13 +++
>  .../go/go-1.9/set-external-linker.patch            | 104
> +++++++++++++++++++++
>  3 files changed, 120 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.
> 9/default-buildmode-pie.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.
> 9/set-external-linker.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.9.inc
> b/meta/recipes-devtools/go/go-1.9.inc
> index 65adaa8d72..f52abb5735 100644
> --- a/meta/recipes-devtools/go/go-1.9.inc
> +++ b/meta/recipes-devtools/go/go-1.9.inc
> @@ -15,6 +15,9 @@ SRC_URI += "\
>          file://0007-ld-add-soname-to-shareable-objects.patch \
>          file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
> \
>          file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
> \
> +        file://default-buildmode-pie.patch \
>  "
> +SRC_URI_append_libc-musl = " file://set-external-linker.patch"
> +
>  SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
>  SRC_URI[main.sha256sum] = "a4ab229028ed167ba1986825751463
> 605264e44868362ca8e7accc8be057e993"
> diff --git a/meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch
> b/meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch
> new file mode 100644
> index 0000000000..cc8aef0ad0
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch
> @@ -0,0 +1,13 @@
> +diff -upr src/go.orig/src/cmd/go/internal/work/build.go
> src/go/src/cmd/go/internal/work/build.go
> +--- go.orig/src/cmd/go/internal/work/build.go  2017-08-27
> 17:38:26.354750979 +0200
> ++++ go/src/cmd/go/internal/work/build.go       2017-08-27
> 17:40:27.555130105 +0200
> +@@ -304,7 +304,8 @@ func BuildModeInit() {
> +               ldBuildmode = "c-shared"
> +       case "default":
> +               switch platform {
> +-              case "android/arm", "android/arm64", "android/amd64",
> "android/386":
> ++              case "linux/386", "linux/amd64", "linux/arm",
> "linux/arm64", "linux/ppc64le", "linux/s390x",
> ++                      "android/arm", "android/arm64", "android/amd64",
> "android/386":
> +                       codegenArg = "-shared"
> +                       ldBuildmode = "pie"
> +               case "darwin/arm", "darwin/arm64":
> diff --git a/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
> b/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
> new file mode 100644
> index 0000000000..79eaff7205
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
> @@ -0,0 +1,104 @@
> +Index: go/src/cmd/link/internal/amd64/obj.go
> +===================================================================
> +--- go.orig/src/cmd/link/internal/amd64/obj.go
> ++++ go/src/cmd/link/internal/amd64/obj.go
> +@@ -67,7 +67,7 @@ func Init() {
> +       ld.Thearch.Append64 = ld.Append64l
> +       ld.Thearch.TLSIEtoLE = tlsIEtoLE
> +
> +-      ld.Thearch.Linuxdynld = "/lib64/ld-linux-x86-64.so.2"
> ++      ld.Thearch.Linuxdynld = "/lib/ld-musl-x86_64.so.1"
> +       ld.Thearch.Freebsddynld = "/libexec/ld-elf.so.1"
> +       ld.Thearch.Openbsddynld = "/usr/libexec/ld.so"
> +       ld.Thearch.Netbsddynld = "/libexec/ld.elf_so"
> +Index: go/src/cmd/link/internal/arm/obj.go
> +===================================================================
> +--- go.orig/src/cmd/link/internal/arm/obj.go
> ++++ go/src/cmd/link/internal/arm/obj.go
> +@@ -63,7 +63,7 @@ func Init() {
> +       ld.Thearch.Append32 = ld.Append32l
> +       ld.Thearch.Append64 = ld.Append64l
> +
> +-      ld.Thearch.Linuxdynld = "/lib/ld-linux.so.3" // 2 for OABI, 3 for
> EABI
> ++      ld.Thearch.Linuxdynld = "/lib/ld-musl-armhf.so.1"
> +       ld.Thearch.Freebsddynld = "/usr/libexec/ld-elf.so.1"
> +       ld.Thearch.Openbsddynld = "/usr/libexec/ld.so"
> +       ld.Thearch.Netbsddynld = "/libexec/ld.elf_so"
> +Index: go/src/cmd/link/internal/arm64/obj.go
> +===================================================================
> +--- go.orig/src/cmd/link/internal/arm64/obj.go
> ++++ go/src/cmd/link/internal/arm64/obj.go
> +@@ -62,7 +62,7 @@ func Init() {
> +       ld.Thearch.Append32 = ld.Append32l
> +       ld.Thearch.Append64 = ld.Append64l
> +
> +-      ld.Thearch.Linuxdynld = "/lib/ld-linux-aarch64.so.1"
> ++      ld.Thearch.Linuxdynld = "/lib/ld-musl-aarch64.so.1"
> +
> +       ld.Thearch.Freebsddynld = "XXX"
> +       ld.Thearch.Openbsddynld = "XXX"
> +Index: go/src/cmd/link/internal/mips/obj.go
> +===================================================================
> +--- go.orig/src/cmd/link/internal/mips/obj.go
> ++++ go/src/cmd/link/internal/mips/obj.go
> +@@ -77,7 +77,7 @@ func Init() {
> +               ld.Thearch.Append64 = ld.Append64b
> +       }
> +
> +-      ld.Thearch.Linuxdynld = "/lib/ld.so.1"
> ++      ld.Thearch.Linuxdynld = "/lib/ld-musl-mipsle.so.1"
> +
> +       ld.Thearch.Freebsddynld = "XXX"
> +       ld.Thearch.Openbsddynld = "XXX"
> +Index: go/src/cmd/link/internal/mips64/obj.go
> +===================================================================
> +--- go.orig/src/cmd/link/internal/mips64/obj.go
> ++++ go/src/cmd/link/internal/mips64/obj.go
> +@@ -75,7 +75,7 @@ func Init() {
> +               ld.Thearch.Append64 = ld.Append64b
> +       }
> +
> +-      ld.Thearch.Linuxdynld = "/lib64/ld64.so.1"
> ++      ld.Thearch.Linuxdynld = "/lib64/ld-musl-mips64le.so.1"
> +
> +       ld.Thearch.Freebsddynld = "XXX"
> +       ld.Thearch.Openbsddynld = "XXX"
> +Index: go/src/cmd/link/internal/ppc64/obj.go
> +===================================================================
> +--- go.orig/src/cmd/link/internal/ppc64/obj.go
> ++++ go/src/cmd/link/internal/ppc64/obj.go
> +@@ -77,7 +77,7 @@ func Init() {
> +       }
> +
> +       // TODO(austin): ABI v1 uses /usr/lib/ld.so.1
> +-      ld.Thearch.Linuxdynld = "/lib64/ld64.so.1"
> ++      ld.Thearch.Linuxdynld = "/lib/ld-musl-powerpc64le.so.1"
> +
> +       ld.Thearch.Freebsddynld = "XXX"
> +       ld.Thearch.Openbsddynld = "XXX"
> +Index: go/src/cmd/link/internal/s390x/obj.go
> +===================================================================
> +--- go.orig/src/cmd/link/internal/s390x/obj.go
> ++++ go/src/cmd/link/internal/s390x/obj.go
> +@@ -62,7 +62,7 @@ func Init() {
> +       ld.Thearch.Append32 = ld.Append32b
> +       ld.Thearch.Append64 = ld.Append64b
> +
> +-      ld.Thearch.Linuxdynld = "/lib64/ld64.so.1"
> ++      ld.Thearch.Linuxdynld = "/lib/ld-musl-s390x.so.1"
> +
> +       // not relevant for s390x
> +       ld.Thearch.Freebsddynld = "XXX"
> +Index: go/src/cmd/link/internal/x86/obj.go
> +===================================================================
> +--- go.orig/src/cmd/link/internal/x86/obj.go
> ++++ go/src/cmd/link/internal/x86/obj.go
> +@@ -63,7 +63,7 @@ func Init() {
> +       ld.Thearch.Append32 = ld.Append32l
> +       ld.Thearch.Append64 = ld.Append64l
> +
> +-      ld.Thearch.Linuxdynld = "/lib/ld-linux.so.2"
> ++      ld.Thearch.Linuxdynld = "/lib/ld-musl-i386.so.1"
> +       ld.Thearch.Freebsddynld = "/usr/libexec/ld-elf.so.1"
> +       ld.Thearch.Openbsddynld = "/usr/libexec/ld.so"
> +       ld.Thearch.Netbsddynld = "/usr/libexec/ld.elf_so"
> --
> 2.14.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0800861e8728055bbd4f95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The patches have no header, upstream-status, or signed-off=
-by.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">On 14 October 2017 at 16:48, Khem Raj <span dir=3D"l=
tr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gm=
ail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-=
by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</=
a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-1.<wbr>9.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0.../go/go-1.9/default-<wbr>buildmode-pie.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 13 +++<br>
=C2=A0.../go/go-1.9/set-external-<wbr>linker.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 104 +++++++++++++++++++++<br>
=C2=A03 files changed, 120 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.<wbr>9/default-build=
mode-pie.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.<wbr>9/set-external-=
linker.patch<br>
<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9.inc b/meta/recipes-devtoo=
ls/go/go-<wbr>1.9.inc<br>
index 65adaa8d72..f52abb5735 100644<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9.inc<br>
+++ b/meta/recipes-devtools/go/go-<wbr>1.9.inc<br>
@@ -15,6 +15,9 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-ld-add-soname-to-<wbr>shareab=
le-objects.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-make.bash-add-<wbr>GOHOSTxx-i=
ndirection-for-<wbr>cross-canadia.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-cmd-go-buildmode-<wbr>pie-for=
ces-external-linking-<wbr>mode-on.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://default-buildmode-pie.<wbr>patch \<br>
=C2=A0&quot;<br>
+SRC_URI_append_libc-musl =3D &quot; file://set-external-linker.<wbr>patch&=
quot;<br>
+<br>
=C2=A0SRC_URI[main.md5sum] =3D &quot;<wbr>da2d44ea384076efec43ee1f8b7d45<wb=
r>d2&quot;<br>
=C2=A0SRC_URI[main.sha256sum] =3D &quot;<wbr>a4ab229028ed167ba1986825751463=
<wbr>605264e44868362ca8e7accc8be057<wbr>e993&quot;<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9/default-buildmode-pie.<wb=
r>patch b/meta/recipes-devtools/go/go-<wbr>1.9/default-buildmode-pie.<wbr>p=
atch<br>
new file mode 100644<br>
index 0000000000..cc8aef0ad0<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-<wbr>1.9/default-buildmode-pie.<wbr>patch=
<br>
@@ -0,0 +1,13 @@<br>
+diff -upr src/go.orig/src/cmd/go/<wbr>internal/work/build.go src/go/src/cm=
d/go/internal/<wbr>work/build.go<br>
+--- go.orig/src/cmd/go/internal/<wbr>work/build.go=C2=A0 2017-08-27 17:38:=
26.354750979 +0200<br>
++++ go/src/cmd/go/internal/work/<wbr>build.go=C2=A0 =C2=A0 =C2=A0 =C2=A020=
17-08-27 17:40:27.555130105 +0200<br>
+@@ -304,7 +304,8 @@ func BuildModeInit() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldBuildmode =3D &qu=
ot;c-shared&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;default&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch platform {<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;android/arm&q=
uot;, &quot;android/arm64&quot;, &quot;android/amd64&quot;, &quot;android/3=
86&quot;:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;linux/386&quo=
t;, &quot;linux/amd64&quot;, &quot;linux/arm&quot;, &quot;linux/arm64&quot;=
, &quot;linux/ppc64le&quot;, &quot;linux/s390x&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;android/arm&quot;, &quot;android/arm64&quot;, &quot;android/amd64=
&quot;, &quot;android/386&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0codegenArg =3D &quot;-shared&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ldBuildmode =3D &quot;pie&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;darwin/a=
rm&quot;, &quot;darwin/arm64&quot;:<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9/set-external-linker.patch=
 b/meta/recipes-devtools/go/go-<wbr>1.9/set-external-linker.patch<br>
new file mode 100644<br>
index 0000000000..79eaff7205<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-<wbr>1.9/set-external-linker.patch<br>
@@ -0,0 +1,104 @@<br>
+Index: go/src/cmd/link/internal/<wbr>amd64/obj.go<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- go.orig/src/cmd/link/internal/<wbr>amd64/obj.go<br>
++++ go/src/cmd/link/internal/<wbr>amd64/obj.go<br>
+@@ -67,7 +67,7 @@ func Init() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64 =3D ld.Append64l<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.TLSIEtoLE =3D tlsIEtoLE<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib64/ld-linux-x86-=
64.so.2&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-x86_64.=
so.1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;/libexec/ld-e=
lf.so.1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;/usr/libexec/=
ld.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Netbsddynld =3D &quot;/libexec/ld.el=
f_so&quot;<br>
+Index: go/src/cmd/link/internal/arm/<wbr>obj.go<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- go.orig/src/cmd/link/internal/<wbr>arm/obj.go<br>
++++ go/src/cmd/link/internal/arm/<wbr>obj.go<br>
+@@ -63,7 +63,7 @@ func Init() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append32 =3D ld.Append32l<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64 =3D ld.Append64l<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-linux.so.3&q=
uot; // 2 for OABI, 3 for EABI<br>
++=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-armhf.s=
o.1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;/usr/libexec/=
ld-elf.so.1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;/usr/libexec/=
ld.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Netbsddynld =3D &quot;/libexec/ld.el=
f_so&quot;<br>
+Index: go/src/cmd/link/internal/<wbr>arm64/obj.go<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- go.orig/src/cmd/link/internal/<wbr>arm64/obj.go<br>
++++ go/src/cmd/link/internal/<wbr>arm64/obj.go<br>
+@@ -62,7 +62,7 @@ func Init() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append32 =3D ld.Append32l<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64 =3D ld.Append64l<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-linux-aarch6=
4.so.1&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-aarch64=
.so.1&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;XXX&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;XXX&quot;<br>
+Index: go/src/cmd/link/internal/mips/<wbr>obj.go<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- go.orig/src/cmd/link/internal/<wbr>mips/obj.go<br>
++++ go/src/cmd/link/internal/mips/<wbr>obj.go<br>
+@@ -77,7 +77,7 @@ func Init() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64=
 =3D ld.Append64b<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld.so.1&quot;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-mipsle.=
so.1&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;XXX&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;XXX&quot;<br>
+Index: go/src/cmd/link/internal/<wbr>mips64/obj.go<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- go.orig/src/cmd/link/internal/<wbr>mips64/obj.go<br>
++++ go/src/cmd/link/internal/<wbr>mips64/obj.go<br>
+@@ -75,7 +75,7 @@ func Init() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64=
 =3D ld.Append64b<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib64/ld64.so.1&quo=
t;<br>
++=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib64/ld-musl-mips6=
4le.so.1&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;XXX&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;XXX&quot;<br>
+Index: go/src/cmd/link/internal/<wbr>ppc64/obj.go<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- go.orig/src/cmd/link/internal/<wbr>ppc64/obj.go<br>
++++ go/src/cmd/link/internal/<wbr>ppc64/obj.go<br>
+@@ -77,7 +77,7 @@ func Init() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO(austin): ABI v1 uses /usr/lib/ld.so.1<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib64/ld64.so.1&quo=
t;<br>
++=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-powerpc=
64le.so.<wbr>1&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;XXX&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;XXX&quot;<br>
+Index: go/src/cmd/link/internal/<wbr>s390x/obj.go<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- go.orig/src/cmd/link/internal/<wbr>s390x/obj.go<br>
++++ go/src/cmd/link/internal/<wbr>s390x/obj.go<br>
+@@ -62,7 +62,7 @@ func Init() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append32 =3D ld.Append32b<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64 =3D ld.Append64b<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib64/ld64.so.1&quo=
t;<br>
++=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-s390x.s=
o.1&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// not relevant for s390x<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;XXX&quot;<br>
+Index: go/src/cmd/link/internal/x86/<wbr>obj.go<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- go.orig/src/cmd/link/internal/<wbr>x86/obj.go<br>
++++ go/src/cmd/link/internal/x86/<wbr>obj.go<br>
+@@ -63,7 +63,7 @@ func Init() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append32 =3D ld.Append32l<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Append64 =3D ld.Append64l<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-linux.so.2&q=
uot;<br>
++=C2=A0 =C2=A0 =C2=A0 ld.Thearch.Linuxdynld =3D &quot;/lib/ld-musl-i386.so=
.1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Freebsddynld =3D &quot;/usr/libexec/=
ld-elf.so.1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Openbsddynld =3D &quot;/usr/libexec/=
ld.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld.Thearch.Netbsddynld =3D &quot;/usr/libexec/l=
d.elf_so&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c0800861e8728055bbd4f95--
