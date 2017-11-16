Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6D51E787CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 20:30:06 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id x63so6531506ioe.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 12:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rAcr78zotf3MtiSm+hPK11sqp3jVSN8ZikWF7yzTu6Q=;
	b=EHkgdd7MD2HLPtkZNzFnJ4LknJh0jBxKQ98NtDYn/1z45FSQmf9049NtDoVWGyRzWI
	3SoW/4oTKkp8uNcpMdulnPufIdHB5PJUXh6+Sx5ahmQAKpcPgKLj4t43u7IIlzVlUeDo
	H3W2kLO5bKh+IdVhP00zrAsTStzmg11kaggZ9NSjSq9D8vMJqtogxyaHSUKWsKNd3BEq
	q1vBK/rQzQcam9qvLgwAtEvQ9iW6JNEOADqLt7oUI/9gHXsNCkf/8BSj03O7cg6jqKBl
	L0rv+zEO8uc9sP6vBdmulzNNyFojOaB57ar0K6vNVYD+YnCfoToBkV3ymEfEmZxVBSMi
	88Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rAcr78zotf3MtiSm+hPK11sqp3jVSN8ZikWF7yzTu6Q=;
	b=JZjvLVuiOg0yhfL/6gMCXd49cYCUA4tQGGgQzT5QYu4lGioTShAakoZJ434I2ToAfJ
	thhDim4m2OdBaotN5mp/V3/whkL3Y5yuXQbbINPhkPvMwZ8VVbMuaiYlr+tAFYbh/EOF
	2zT77vekXgzqGBQxbaNANvd36UPJu+j+gRVrkiYTTBvTIP7JrcKhsfDx733AFNor890+
	EPBDw7xkJVugnwVD9HZEdpeL57fKb9hddF+BwQwaCOQFXEl5wsToxK4yy06FbOtYtI+f
	gKPq6zD3GRJoEd3s9rsQr+Xi8CTD7HyIHZPB745Ttd+XcpkoDe9B04t0Dx2s7PkXiC0P
	o+Ew==
X-Gm-Message-State: AJaThX4RrwLLXRnx26NbfiplAPZ+Q5T/+VQpPuHihE0KCG58HFYPZTT2
	FlPMYTeO63JH8z3h5E8gr7fqDDUmUeWV15MCAsDTSrSh
X-Google-Smtp-Source: AGs4zMZQHtxOaUM0/ZRX3CC6voKiFoirTjIJL3rojcdsiK1OO0uX8QXXqfUbX3kFF3DwHvuAgOrCoo6E3ehUC8MOFPU=
X-Received: by 10.107.32.18 with SMTP id g18mr104473iog.227.1510864207274;
	Thu, 16 Nov 2017 12:30:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Thu, 16 Nov 2017 12:29:46 -0800 (PST)
In-Reply-To: <CAGgRHJoGLRhhyjPzWGna9wSPK1Y33f9FqgsRJPHr_XPj_=ZEyg@mail.gmail.com>
References: <1510679926-24611-1-git-send-email-matt@madison.systems>
	<CAP9ODKr6V9rtuVzx8uN6Mr-ke1jW=Q411b=unZn+hZo1t_zh7g@mail.gmail.com>
	<CAGgRHJoGLRhhyjPzWGna9wSPK1Y33f9FqgsRJPHr_XPj_=ZEyg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Nov 2017 20:29:46 +0000
Message-ID: <CAJTo0LZhfw5cViLMfXTTk8bvDdp_pN3p9g2uhAPDsSCbaZygOQ@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: "Eggleton, Paul" <paul.eggleton@linux.intel.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] go: ensure use of BUILD_CC when building bootstrap tools
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
X-List-Received-Date: Thu, 16 Nov 2017 20:30:06 -0000
Content-Type: multipart/alternative; boundary="001a1141b49861000f055e1f7cf7"

--001a1141b49861000f055e1f7cf7
Content-Type: text/plain; charset="UTF-8"

Looks like this is failing on some of our autobuilders, such as
https://autobuilder.yocto.io/builders/nightly-musl-x86-64/builds/58/steps/BuildImages/logs/stdio

| cmd/go/internal/vet
| # cmd/api
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/go/1.9-r0/go/src/host-tools/link:
running x86_64-poky-linux-musl-gcc failed: exit status 1
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/go/1.9-r0/build-tmp/go-link-213113620/000000.o:
In function `vfprintf':
| /usr/include/x86_64-linux-gnu/bits/stdio2.h:127: undefined reference to
`__vfprintf_chk'
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/go/1.9-r0/build-tmp/go-link-213113620/000000.o:
In function `fprintf':
| /usr/include/x86_64-linux-gnu/bits/stdio2.h:97: undefined reference to
`__fprintf_chk'
| collect2: error: ld returned 1 exit status

It's running x86-64-poky-linux-musl-gcc but using headers from /usr, which
looks wrong.

Ross


On 14 November 2017 at 17:21, Matt Madison <matt@madison.systems> wrote:
>
> Yes, drat it, v3 should fix that.
>
> Thanks,
> -Matt
>
> On Tue, Nov 14, 2017 at 9:20 AM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> > Hello Matt,
> >
> > A minor thing:
> >
> > Upstream-Status: Pending
> >
> > On Tue, Nov 14, 2017 at 3:18 PM, Matt Madison <matt@madison.systems>
wrote:
> >> For cross-canadian builds, we were accidentally using
> >> the crosssdk C compiler when building the Go compiler
> >> bootstrap.  Add a patch to the make script to let us
> >> use BUILD_CC, and prepend do_compile to set it in
> >> the local environment to ensure that the trailing
> >> blank gets stripped, since that confuses Go.
> >>
> >> [YOCTO #12341]
> >>
> >> Signed-off-by: Matt Madison <matt@madison.systems>
> >> ---
> >>  meta/recipes-devtools/go/go-1.9.inc                |  1 +
> >>  ...verride-CC-when-building-dist-and-go_boot.patch | 43
++++++++++++++++++++++
> >>  meta/recipes-devtools/go/go-common.inc             |  4 ++
> >>  3 files changed, 48 insertions(+)
> >>  create mode 100644
meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
> >>
> >> diff --git a/meta/recipes-devtools/go/go-1.9.inc
b/meta/recipes-devtools/go/go-1.9.inc
> >> index 65adaa8..1dbb5ef 100644
> >> --- a/meta/recipes-devtools/go/go-1.9.inc
> >> +++ b/meta/recipes-devtools/go/go-1.9.inc
> >> @@ -15,6 +15,7 @@ SRC_URI += "\
> >>          file://0007-ld-add-soname-to-shareable-objects.patch \
> >>
 file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
> >>
 file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
> >> +
 file://0010-make.bash-override-CC-when-building-dist-and-go_boot.patch \
> >>  "
> >>  SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
> >>  SRC_URI[main.sha256sum] =
"a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
> >> diff --git
a/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
> >> new file mode 100644
> >> index 0000000..94ea197
> >> --- /dev/null
> >> +++
b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
> >> @@ -0,0 +1,43 @@
> >> +From 36787fbf0e0a6298ba1038bbbae526654597eee4 Mon Sep 17 00:00:00 2001
> >> +From: Matt Madison <matt@madison.systems>
> >> +Date: Tue, 14 Nov 2017 07:38:42 -0800
> >> +Subject: [PATCH 10/10] make.bash: override CC when building dist and
> >> + go_bootstrap
> >> +
> >> +For cross-canadian builds, dist and go_bootstrap
> >> +run on the build host, so CC needs to point to the
> >> +build host's C compiler.  Add a BUILD_CC environment
> >> +for this, falling back to $CC if not present.
> >> +
> >> +Upstream-Status: pending
> >> +
> >> +Signed-off-by: Matt Madison <matt@madison.systems>
> >> +---
> >> + src/make.bash | 4 ++--
> >> + 1 file changed, 2 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/src/make.bash b/src/make.bash
> >> +index 0bdadc6..f199349 100755
> >> +--- a/src/make.bash
> >> ++++ b/src/make.bash
> >> +@@ -131,7 +131,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
> >> +       exit 1
> >> + fi
> >> + rm -f cmd/dist/dist
> >> +-GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH=""
"$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> >> ++CC=${BUILD_CC:-${CC}} GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH=""
"$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> >> +
> >> + # -e doesn't propagate out of eval, so check success by hand.
> >> + eval $(./cmd/dist/dist env -p || echo FAIL=true)
> >> +@@ -167,7 +167,7 @@ elif [ "$1" = "--host-only" ]; then
> >> + fi
> >> +
> >> + if [ "$do_host_build" = "yes" ]; then
> >> +-      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds
go_bootstrap
> >> ++      CC=${BUILD_CC:-${CC}} ./cmd/dist/dist bootstrap $buildall
$GO_DISTFLAGS -v # builds go_bootstrap
> >> +       # Delay move of dist tool to now, because bootstrap may clear
tool directory.
> >> +       mv cmd/dist/dist "$GOTOOLDIR"/dist
> >> +       echo
> >> +--
> >> +2.7.4
> >> +
> >> diff --git a/meta/recipes-devtools/go/go-common.inc
b/meta/recipes-devtools/go/go-common.inc
> >> index ce1eb86..9af6873 100644
> >> --- a/meta/recipes-devtools/go/go-common.inc
> >> +++ b/meta/recipes-devtools/go/go-common.inc
> >> @@ -20,3 +20,7 @@ B = "${S}"
> >>
> >>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> >>  SSTATE_SCAN_CMD = "true"
> >> +
> >> +do_compile_prepend() {
> >> +       BUILD_CC=${BUILD_CC}
> >> +}
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> > --
> > Otavio Salvador                             O.S. Systems
> > http://www.ossystems.com.br        http://code.ossystems.com.br
> > Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a1141b49861000f055e1f7cf7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like this is failing on some of our autobuilders, su=
ch as <a href=3D"https://autobuilder.yocto.io/builders/nightly-musl-x86-64/=
builds/58/steps/BuildImages/logs/stdio">https://autobuilder.yocto.io/builde=
rs/nightly-musl-x86-64/builds/58/steps/BuildImages/logs/stdio</a><br><br>| =
cmd/go/internal/vet<br>| # cmd/api<br>| /home/pokybuild/yocto-autobuilder/y=
octo-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-mu=
sl/go/1.9-r0/go/src/host-tools/link: running x86_64-poky-linux-musl-gcc fai=
led: exit status 1<br>| /home/pokybuild/yocto-autobuilder/yocto-worker/nigh=
tly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/go/1.9-r0/bui=
ld-tmp/go-link-213113620/000000.o: In function `vfprintf&#39;:<br>| /usr/in=
clude/x86_64-linux-gnu/bits/stdio2.h:127: undefined reference to `__vfprint=
f_chk&#39;<br>| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl=
-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/go/1.9-r0/build-tmp/g=
o-link-213113620/000000.o: In function `fprintf&#39;:<br>| /usr/include/x86=
_64-linux-gnu/bits/stdio2.h:97: undefined reference to `__fprintf_chk&#39;<=
br>| collect2: error: ld returned 1 exit status<div><br></div><div>It&#39;s=
 running x86-64-poky-linux-musl-gcc but using headers from /usr, which look=
s wrong.</div><div><br></div><div>Ross</div><div><br><br>On 14 November 201=
7 at 17:21, Matt Madison &lt;matt@madison.systems&gt; wrote:<br>&gt;<br>&gt=
; Yes, drat it, v3 should fix that.<br>&gt;<br>&gt; Thanks,<br>&gt; -Matt<b=
r>&gt;<br>&gt; On Tue, Nov 14, 2017 at 9:20 AM, Otavio Salvador<br>&gt; &lt=
;<a href=3D"mailto:otavio.salvador@ossystems.com.br">otavio.salvador@ossyst=
ems.com.br</a>&gt; wrote:<br>&gt; &gt; Hello Matt,<br>&gt; &gt;<br>&gt; &gt=
; A minor thing:<br>&gt; &gt;<br>&gt; &gt; Upstream-Status: Pending<br>&gt;=
 &gt;<br>&gt; &gt; On Tue, Nov 14, 2017 at 3:18 PM, Matt Madison &lt;matt@m=
adison.systems&gt; wrote:<br>&gt; &gt;&gt; For cross-canadian builds, we we=
re accidentally using<br>&gt; &gt;&gt; the crosssdk C compiler when buildin=
g the Go compiler<br>&gt; &gt;&gt; bootstrap.=C2=A0 Add a patch to the make=
 script to let us<br>&gt; &gt;&gt; use BUILD_CC, and prepend do_compile to =
set it in<br>&gt; &gt;&gt; the local environment to ensure that the trailin=
g<br>&gt; &gt;&gt; blank gets stripped, since that confuses Go.<br>&gt; &gt=
;&gt;<br>&gt; &gt;&gt; [YOCTO #12341]<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Sig=
ned-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>&gt; &gt;&gt; ---<=
br>&gt; &gt;&gt; =C2=A0meta/recipes-devtools/go/go-1.9.inc =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A01 +<br>&gt; &gt;&gt; =C2=
=A0...verride-CC-when-building-dist-and-go_boot.patch | 43 ++++++++++++++++=
++++++<br>&gt; &gt;&gt; =C2=A0meta/recipes-devtools/go/go-common.inc =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A04 ++<br>&gt; &gt;&gt; =C2=A03 f=
iles changed, 48 insertions(+)<br>&gt; &gt;&gt; =C2=A0create mode 100644 me=
ta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist=
-and-go_boot.patch<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; diff --git a/meta/reci=
pes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc<br>&gt; &g=
t;&gt; index 65adaa8..1dbb5ef 100644<br>&gt; &gt;&gt; --- a/meta/recipes-de=
vtools/go/go-1.9.inc<br>&gt; &gt;&gt; +++ b/meta/recipes-devtools/go/go-1.9=
.inc<br>&gt; &gt;&gt; @@ -15,6 +15,7 @@ SRC_URI +=3D &quot;\<br>&gt; &gt;&g=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-ld-add-soname-to-shareable=
-objects.patch \<br>&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://=
0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \<br>&gt; &=
gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-cmd-go-buildmode-pie-=
forces-external-linking-mode-on.patch \<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0file://0010-make.bash-override-CC-when-building-dist-and-go_bo=
ot.patch \<br>&gt; &gt;&gt; =C2=A0&quot;<br>&gt; &gt;&gt; =C2=A0SRC_URI[mai=
n.md5sum] =3D &quot;da2d44ea384076efec43ee1f8b7d45d2&quot;<br>&gt; &gt;&gt;=
 =C2=A0SRC_URI[main.sha256sum] =3D &quot;a4ab229028ed167ba19868257514636052=
64e44868362ca8e7accc8be057e993&quot;<br>&gt; &gt;&gt; diff --git a/meta/rec=
ipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-g=
o_boot.patch b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-w=
hen-building-dist-and-go_boot.patch<br>&gt; &gt;&gt; new file mode 100644<b=
r>&gt; &gt;&gt; index 0000000..94ea197<br>&gt; &gt;&gt; --- /dev/null<br>&g=
t; &gt;&gt; +++ b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-C=
C-when-building-dist-and-go_boot.patch<br>&gt; &gt;&gt; @@ -0,0 +1,43 @@<br=
>&gt; &gt;&gt; +From 36787fbf0e0a6298ba1038bbbae526654597eee4 Mon Sep 17 00=
:00:00 2001<br>&gt; &gt;&gt; +From: Matt Madison &lt;matt@madison.systems&g=
t;<br>&gt; &gt;&gt; +Date: Tue, 14 Nov 2017 07:38:42 -0800<br>&gt; &gt;&gt;=
 +Subject: [PATCH 10/10] make.bash: override CC when building dist and<br>&=
gt; &gt;&gt; + go_bootstrap<br>&gt; &gt;&gt; +<br>&gt; &gt;&gt; +For cross-=
canadian builds, dist and go_bootstrap<br>&gt; &gt;&gt; +run on the build h=
ost, so CC needs to point to the<br>&gt; &gt;&gt; +build host&#39;s C compi=
ler.=C2=A0 Add a BUILD_CC environment<br>&gt; &gt;&gt; +for this, falling b=
ack to $CC if not present.<br>&gt; &gt;&gt; +<br>&gt; &gt;&gt; +Upstream-St=
atus: pending<br>&gt; &gt;&gt; +<br>&gt; &gt;&gt; +Signed-off-by: Matt Madi=
son &lt;matt@madison.systems&gt;<br>&gt; &gt;&gt; +---<br>&gt; &gt;&gt; + s=
rc/make.bash | 4 ++--<br>&gt; &gt;&gt; + 1 file changed, 2 insertions(+), 2=
 deletions(-)<br>&gt; &gt;&gt; +<br>&gt; &gt;&gt; +diff --git a/src/make.ba=
sh b/src/make.bash<br>&gt; &gt;&gt; +index 0bdadc6..f199349 100755<br>&gt; =
&gt;&gt; +--- a/src/make.bash<br>&gt; &gt;&gt; ++++ b/src/make.bash<br>&gt;=
 &gt;&gt; +@@ -131,7 +131,7 @@ if [ &quot;$GOROOT_BOOTSTRAP&quot; =3D &quot=
;$GOROOT&quot; ]; then<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 exit 1<br>&g=
t; &gt;&gt; + fi<br>&gt; &gt;&gt; + rm -f cmd/dist/dist<br>&gt; &gt;&gt; +-=
GOROOT=3D&quot;$GOROOT_BOOTSTRAP&quot; GOOS=3D&quot;&quot; GOARCH=3D&quot;&=
quot; &quot;$GOROOT_BOOTSTRAP/bin/go&quot; build -o cmd/dist/dist ./cmd/dis=
t<br>&gt; &gt;&gt; ++CC=3D${BUILD_CC:-${CC}} GOROOT=3D&quot;$GOROOT_BOOTSTR=
AP&quot; GOOS=3D&quot;&quot; GOARCH=3D&quot;&quot; &quot;$GOROOT_BOOTSTRAP/=
bin/go&quot; build -o cmd/dist/dist ./cmd/dist<br>&gt; &gt;&gt; +<br>&gt; &=
gt;&gt; + # -e doesn&#39;t propagate out of eval, so check success by hand.=
<br>&gt; &gt;&gt; + eval $(./cmd/dist/dist env -p || echo FAIL=3Dtrue)<br>&=
gt; &gt;&gt; +@@ -167,7 +167,7 @@ elif [ &quot;$1&quot; =3D &quot;--host-on=
ly&quot; ]; then<br>&gt; &gt;&gt; + fi<br>&gt; &gt;&gt; +<br>&gt; &gt;&gt; =
+ if [ &quot;$do_host_build&quot; =3D &quot;yes&quot; ]; then<br>&gt; &gt;&=
gt; +- =C2=A0 =C2=A0 =C2=A0./cmd/dist/dist bootstrap $buildall $GO_DISTFLAG=
S -v # builds go_bootstrap<br>&gt; &gt;&gt; ++ =C2=A0 =C2=A0 =C2=A0CC=3D${B=
UILD_CC:-${CC}} ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # buil=
ds go_bootstrap<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 # Delay move of dis=
t tool to now, because bootstrap may clear tool directory.<br>&gt; &gt;&gt;=
 + =C2=A0 =C2=A0 =C2=A0 mv cmd/dist/dist &quot;$GOTOOLDIR&quot;/dist<br>&gt=
; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 echo<br>&gt; &gt;&gt; +--<br>&gt; &gt;&gt=
; +2.7.4<br>&gt; &gt;&gt; +<br>&gt; &gt;&gt; diff --git a/meta/recipes-devt=
ools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc<br>&gt; &gt;=
&gt; index ce1eb86..9af6873 100644<br>&gt; &gt;&gt; --- a/meta/recipes-devt=
ools/go/go-common.inc<br>&gt; &gt;&gt; +++ b/meta/recipes-devtools/go/go-co=
mmon.inc<br>&gt; &gt;&gt; @@ -20,3 +20,7 @@ B =3D &quot;${S}&quot;<br>&gt; =
&gt;&gt;<br>&gt; &gt;&gt; =C2=A0INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quo=
t;<br>&gt; &gt;&gt; =C2=A0SSTATE_SCAN_CMD =3D &quot;true&quot;<br>&gt; &gt;=
&gt; +<br>&gt; &gt;&gt; +do_compile_prepend() {<br>&gt; &gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 BUILD_CC=3D${BUILD_CC}<br>&gt; &gt;&gt; +}<br>&gt; &gt;&gt; -=
-<br>&gt; &gt;&gt; 2.7.4<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; --<br>&gt; &gt;&=
gt; _______________________________________________<br>&gt; &gt;&gt; Openem=
bedded-core mailing list<br>&gt; &gt;&gt; <a href=3D"mailto:Openembedded-co=
re@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>=
&gt; &gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded=
-core</a><br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; --<br>&gt; &g=
t; Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br>&gt; &gt; <a href=
=3D"http://www.ossystems.com.br">http://www.ossystems.com.br</a> =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br">http://code.ossys=
tems.com.br</a><br>&gt; &gt; Mobile: +55 (53) 9981-7854 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750<br>&gt; --<br>&gt; ______=
_________________________________________<br>&gt; Openembedded-core mailing=
 list<br>&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">O=
penembedded-core@lists.openembedded.org</a><br>&gt; <a href=3D"http://lists=
.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembe=
dded.org/mailman/listinfo/openembedded-core</a></div></div>

--001a1141b49861000f055e1f7cf7--
