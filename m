Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 036A27883C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 16:02:29 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id n134so4590229itg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 08:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jm19wVtVoN1ksMU8YniKzv3+VPB/6R6f6zhe2u1O7xM=;
	b=LhMK2SZIR//gTMkir1pQFRVam9dwpPGc140rPig4LmHLQe8ne4Pry5Na81GscwtFWu
	Er/em755oM3vkxXT7vZziu+OWQKp2LL83YQyBnHzsmdu4X5qiqlJEixmkn2u0tPciUuS
	/3JkU9f0TxwxJQMDHTTvYs64cRESBZa7M7QPCmeXIvKWlu/VSundA2lgfwXju7L0Ikup
	MwKWDnz1jBQOirpD+TgMa619fg0A2K2ByMJrExxERImvKxUulVu5ZCmtvhD47yld4q91
	2iRUNv2ep7I3Lwli1jiQkXC8ebd2Eyt5X2JHcUDApCvpXENjY26XzYH+/Mle6eAaHwXs
	dkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jm19wVtVoN1ksMU8YniKzv3+VPB/6R6f6zhe2u1O7xM=;
	b=B/+ae0wEANP4A+E5u2vfaEDXH9MXD24ifAZ5KL/NtN3WSngT2sFj2sRJhN8SFF/wtd
	I1nlnjC5/GlzEmddYLWEQvxIC56wvcg4k7I5NIDwvgPl5uShMG1mmwWuHoVEb7NjWZT1
	a3Po0Y70CT0FdK9aoFBhbZW86abxn9BEwgMmBZuc8uRp5mA19fEFn1l7x89/3/pu2aCN
	iRRtlrUrZZOC5prX+tDRD+x+sTpTrRvfazbP0yBqwdKrMU7GP19DybIgDZcvm17R/JEK
	iLk9OlOv+4v9ufKq8F9TNA4JCc1KLyhcFV0cVbqw1gokTX/Z2LwOmfT8tge7OR1iqwvn
	uelg==
X-Gm-Message-State: AJaThX7qJqGacUrjysaKDgBd3gpdOitmnhW9mp9lyWZt4YvefEYC0tpT
	N/7pdpLC+e8uTIaYHqMWbIeI8V7Gufw+0ahaWmdqGQ==
X-Google-Smtp-Source: AGs4zMbplTWfSog05uvglr5jEP+CYReKDHAdqDcQZNT1HTkAS+53w7SMG4qEXkhbLW540/X9LbT5cOIKyy1/ULW+a8o=
X-Received: by 10.36.162.65 with SMTP id o1mr6984142iti.85.1510934551239; Fri,
	17 Nov 2017 08:02:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Fri, 17 Nov 2017 08:02:10 -0800 (PST)
In-Reply-To: <CAGgRHJobiDANiCPVHy=n-obx7JhNGO86yavV81zc9LvgD6xG_w@mail.gmail.com>
References: <1510679926-24611-1-git-send-email-matt@madison.systems>
	<CAP9ODKr6V9rtuVzx8uN6Mr-ke1jW=Q411b=unZn+hZo1t_zh7g@mail.gmail.com>
	<CAGgRHJoGLRhhyjPzWGna9wSPK1Y33f9FqgsRJPHr_XPj_=ZEyg@mail.gmail.com>
	<CAJTo0LZhfw5cViLMfXTTk8bvDdp_pN3p9g2uhAPDsSCbaZygOQ@mail.gmail.com>
	<CAGgRHJo0hCR7WCzf0j0UzQnV9SvKufMHvJ72f-xNdj4oVBm_3Q@mail.gmail.com>
	<CAGgRHJobiDANiCPVHy=n-obx7JhNGO86yavV81zc9LvgD6xG_w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Nov 2017 16:02:10 +0000
Message-ID: <CAJTo0LZJ-kUE3H2443g-Ez5r_hp3a_pEv8Pu9+SL2YNr11GBgw@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 Nov 2017 16:02:30 -0000
Content-Type: multipart/alternative; boundary="f403045fbd8434b9e4055e2fdd22"

--f403045fbd8434b9e4055e2fdd22
Content-Type: text/plain; charset="UTF-8"

I had a hunch that was the problem this morning after looking again at the
patch set.  Thanks for confirming.

Ross

On 17 November 2017 at 15:49, Matt Madison <matt@madison.systems> wrote:

> On Thu, Nov 16, 2017 at 3:29 PM, Matt Madison <matt@madison.systems>
> wrote:
> > On Thu, Nov 16, 2017 at 12:29 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> >> Looks like this is failing on some of our autobuilders, such as
> >> https://autobuilder.yocto.io/builders/nightly-musl-x86-64/
> builds/58/steps/BuildImages/logs/stdio
> >
> > I'm looking into it.
>
> OK, from my testing, it's not this patch that's causing the build
> failures, it's Khem's "go: Fix build with PIE on musl" patch.
>
> The added patch there that changes the default buildmode to 'pie' is
> causing the external linker to be used for building go_bootstrap and
> target Go compiler and forcing inclusion of the cgo runtime. It will
> take some recipe modifications and another patch to Go's make.bash to
> deal with this, but I'm not sure that this particular patch is even a
> good idea.  Making PIE builds work with musl is OK, but the additional
> buildmode default change is too much.
>
> -Matt
>
> >
> > Thanks,
> > -Matt
> >
> >>
> >> | cmd/go/internal/vet
> >> | # cmd/api
> >> |
> >> /home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-
> linux-musl/go/1.9-r0/go/src/host-tools/link:
> >> running x86_64-poky-linux-musl-gcc failed: exit status 1
> >> |
> >> /home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-
> linux-musl/go/1.9-r0/build-tmp/go-link-213113620/000000.o:
> >> In function `vfprintf':
> >> | /usr/include/x86_64-linux-gnu/bits/stdio2.h:127: undefined reference
> to
> >> `__vfprintf_chk'
> >> |
> >> /home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-
> linux-musl/go/1.9-r0/build-tmp/go-link-213113620/000000.o:
> >> In function `fprintf':
> >> | /usr/include/x86_64-linux-gnu/bits/stdio2.h:97: undefined reference
> to
> >> `__fprintf_chk'
> >> | collect2: error: ld returned 1 exit status
> >>
> >> It's running x86-64-poky-linux-musl-gcc but using headers from /usr,
> which
> >> looks wrong.
> >>
> >> Ross
> >>
> >>
> >> On 14 November 2017 at 17:21, Matt Madison <matt@madison.systems>
> wrote:
> >>>
> >>> Yes, drat it, v3 should fix that.
> >>>
> >>> Thanks,
> >>> -Matt
> >>>
> >>> On Tue, Nov 14, 2017 at 9:20 AM, Otavio Salvador
> >>> <otavio.salvador@ossystems.com.br> wrote:
> >>> > Hello Matt,
> >>> >
> >>> > A minor thing:
> >>> >
> >>> > Upstream-Status: Pending
> >>> >
> >>> > On Tue, Nov 14, 2017 at 3:18 PM, Matt Madison <matt@madison.systems>
> >>> > wrote:
> >>> >> For cross-canadian builds, we were accidentally using
> >>> >> the crosssdk C compiler when building the Go compiler
> >>> >> bootstrap.  Add a patch to the make script to let us
> >>> >> use BUILD_CC, and prepend do_compile to set it in
> >>> >> the local environment to ensure that the trailing
> >>> >> blank gets stripped, since that confuses Go.
> >>> >>
> >>> >> [YOCTO #12341]
> >>> >>
> >>> >> Signed-off-by: Matt Madison <matt@madison.systems>
> >>> >> ---
> >>> >>  meta/recipes-devtools/go/go-1.9.inc                |  1 +
> >>> >>  ...verride-CC-when-building-dist-and-go_boot.patch | 43
> >>> >> ++++++++++++++++++++++
> >>> >>  meta/recipes-devtools/go/go-common.inc             |  4 ++
> >>> >>  3 files changed, 48 insertions(+)
> >>> >>  create mode 100644
> >>> >> meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-
> when-building-dist-and-go_boot.patch
> >>> >>
> >>> >> diff --git a/meta/recipes-devtools/go/go-1.9.inc
> >>> >> b/meta/recipes-devtools/go/go-1.9.inc
> >>> >> index 65adaa8..1dbb5ef 100644
> >>> >> --- a/meta/recipes-devtools/go/go-1.9.inc
> >>> >> +++ b/meta/recipes-devtools/go/go-1.9.inc
> >>> >> @@ -15,6 +15,7 @@ SRC_URI += "\
> >>> >>          file://0007-ld-add-soname-to-shareable-objects.patch \
> >>> >>
> >>> >> file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
> \
> >>> >>
> >>> >> file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
> \
> >>> >> +
> >>> >> file://0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
> \
> >>> >>  "
> >>> >>  SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
> >>> >>  SRC_URI[main.sha256sum] =
> >>> >> "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
> >>> >> diff --git
> >>> >> a/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-
> CC-when-building-dist-and-go_boot.patch
> >>> >> b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-
> CC-when-building-dist-and-go_boot.patch
> >>> >> new file mode 100644
> >>> >> index 0000000..94ea197
> >>> >> --- /dev/null
> >>> >> +++
> >>> >> b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-
> CC-when-building-dist-and-go_boot.patch
> >>> >> @@ -0,0 +1,43 @@
> >>> >> +From 36787fbf0e0a6298ba1038bbbae526654597eee4 Mon Sep 17 00:00:00
> 2001
> >>> >> +From: Matt Madison <matt@madison.systems>
> >>> >> +Date: Tue, 14 Nov 2017 07:38:42 -0800
> >>> >> +Subject: [PATCH 10/10] make.bash: override CC when building dist
> and
> >>> >> + go_bootstrap
> >>> >> +
> >>> >> +For cross-canadian builds, dist and go_bootstrap
> >>> >> +run on the build host, so CC needs to point to the
> >>> >> +build host's C compiler.  Add a BUILD_CC environment
> >>> >> +for this, falling back to $CC if not present.
> >>> >> +
> >>> >> +Upstream-Status: pending
> >>> >> +
> >>> >> +Signed-off-by: Matt Madison <matt@madison.systems>
> >>> >> +---
> >>> >> + src/make.bash | 4 ++--
> >>> >> + 1 file changed, 2 insertions(+), 2 deletions(-)
> >>> >> +
> >>> >> +diff --git a/src/make.bash b/src/make.bash
> >>> >> +index 0bdadc6..f199349 100755
> >>> >> +--- a/src/make.bash
> >>> >> ++++ b/src/make.bash
> >>> >> +@@ -131,7 +131,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
> >>> >> +       exit 1
> >>> >> + fi
> >>> >> + rm -f cmd/dist/dist
> >>> >> +-GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH=""
> >>> >> "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> >>> >> ++CC=${BUILD_CC:-${CC}} GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH=""
> >>> >> "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> >>> >> +
> >>> >> + # -e doesn't propagate out of eval, so check success by hand.
> >>> >> + eval $(./cmd/dist/dist env -p || echo FAIL=true)
> >>> >> +@@ -167,7 +167,7 @@ elif [ "$1" = "--host-only" ]; then
> >>> >> + fi
> >>> >> +
> >>> >> + if [ "$do_host_build" = "yes" ]; then
> >>> >> +-      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v #
> builds
> >>> >> go_bootstrap
> >>> >> ++      CC=${BUILD_CC:-${CC}} ./cmd/dist/dist bootstrap $buildall
> >>> >> $GO_DISTFLAGS -v # builds go_bootstrap
> >>> >> +       # Delay move of dist tool to now, because bootstrap may
> clear
> >>> >> tool directory.
> >>> >> +       mv cmd/dist/dist "$GOTOOLDIR"/dist
> >>> >> +       echo
> >>> >> +--
> >>> >> +2.7.4
> >>> >> +
> >>> >> diff --git a/meta/recipes-devtools/go/go-common.inc
> >>> >> b/meta/recipes-devtools/go/go-common.inc
> >>> >> index ce1eb86..9af6873 100644
> >>> >> --- a/meta/recipes-devtools/go/go-common.inc
> >>> >> +++ b/meta/recipes-devtools/go/go-common.inc
> >>> >> @@ -20,3 +20,7 @@ B = "${S}"
> >>> >>
> >>> >>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> >>> >>  SSTATE_SCAN_CMD = "true"
> >>> >> +
> >>> >> +do_compile_prepend() {
> >>> >> +       BUILD_CC=${BUILD_CC}
> >>> >> +}
> >>> >> --
> >>> >> 2.7.4
> >>> >>
> >>> >> --
> >>> >> _______________________________________________
> >>> >> Openembedded-core mailing list
> >>> >> Openembedded-core@lists.openembedded.org
> >>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>> >
> >>> >
> >>> >
> >>> > --
> >>> > Otavio Salvador                             O.S. Systems
> >>> > http://www.ossystems.com.br        http://code.ossystems.com.br
> >>> > Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045fbd8434b9e4055e2fdd22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I had a hunch that was the problem this morning after look=
ing again at the patch set.=C2=A0 Thanks for confirming.<div><br></div><div=
>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 November 2017 at 15:49, Matt Madison <span dir=3D"ltr">&lt;<a href=3D=
"mailto:matt@madison.systems" target=3D"_blank">matt@madison.systems</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, =
Nov 16, 2017 at 3:29 PM, Matt Madison &lt;matt@madison.systems&gt; wrote:<b=
r>
&gt; On Thu, Nov 16, 2017 at 12:29 PM, Burton, Ross &lt;<a href=3D"mailto:r=
oss.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;&gt; Looks like this is failing on some of our autobuilders, such as<br=
>
&gt;&gt; <a href=3D"https://autobuilder.yocto.io/builders/nightly-musl-x86-=
64/builds/58/steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_bl=
ank">https://autobuilder.yocto.io/<wbr>builders/nightly-musl-x86-64/<wbr>bu=
ilds/58/steps/BuildImages/<wbr>logs/stdio</a><br>
&gt;<br>
&gt; I&#39;m looking into it.<br>
<br>
</span>OK, from my testing, it&#39;s not this patch that&#39;s causing the =
build<br>
failures, it&#39;s Khem&#39;s &quot;go: Fix build with PIE on musl&quot; pa=
tch.<br>
<br>
The added patch there that changes the default buildmode to &#39;pie&#39; i=
s<br>
causing the external linker to be used for building go_bootstrap and<br>
target Go compiler and forcing inclusion of the cgo runtime. It will<br>
take some recipe modifications and another patch to Go&#39;s make.bash to<b=
r>
deal with this, but I&#39;m not sure that this particular patch is even a<b=
r>
good idea.=C2=A0 Making PIE builds work with musl is OK, but the additional=
<br>
buildmode default change is too much.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-Matt<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Thanks,<br>
&gt; -Matt<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; | cmd/go/internal/vet<br>
&gt;&gt; | # cmd/api<br>
&gt;&gt; |<br>
&gt;&gt; /home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>nightly-m=
usl-x86-64/build/<wbr>build/tmp/work/core2-64-poky-<wbr>linux-musl/go/1.9-r=
0/go/src/<wbr>host-tools/link:<br>
&gt;&gt; running x86_64-poky-linux-musl-gcc failed: exit status 1<br>
&gt;&gt; |<br>
&gt;&gt; /home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>nightly-m=
usl-x86-64/build/<wbr>build/tmp/work/core2-64-poky-<wbr>linux-musl/go/1.9-r=
0/build-<wbr>tmp/go-link-213113620/000000.<wbr>o:<br>
&gt;&gt; In function `vfprintf&#39;:<br>
&gt;&gt; | /usr/include/x86_64-linux-gnu/<wbr>bits/stdio2.h:127: undefined =
reference to<br>
&gt;&gt; `__vfprintf_chk&#39;<br>
&gt;&gt; |<br>
&gt;&gt; /home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>nightly-m=
usl-x86-64/build/<wbr>build/tmp/work/core2-64-poky-<wbr>linux-musl/go/1.9-r=
0/build-<wbr>tmp/go-link-213113620/000000.<wbr>o:<br>
&gt;&gt; In function `fprintf&#39;:<br>
&gt;&gt; | /usr/include/x86_64-linux-gnu/<wbr>bits/stdio2.h:97: undefined r=
eference to<br>
&gt;&gt; `__fprintf_chk&#39;<br>
&gt;&gt; | collect2: error: ld returned 1 exit status<br>
&gt;&gt;<br>
&gt;&gt; It&#39;s running x86-64-poky-linux-musl-gcc but using headers from=
 /usr, which<br>
&gt;&gt; looks wrong.<br>
&gt;&gt;<br>
&gt;&gt; Ross<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 14 November 2017 at 17:21, Matt Madison &lt;matt@madison.system=
s&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Yes, drat it, v3 should fix that.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt; -Matt<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Tue, Nov 14, 2017 at 9:20 AM, Otavio Salvador<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br">otavio=
.salvador@ossystems.<wbr>com.br</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt; Hello Matt,<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; A minor thing:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Upstream-Status: Pending<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; On Tue, Nov 14, 2017 at 3:18 PM, Matt Madison &lt;matt@ma=
dison.systems&gt;<br>
&gt;&gt;&gt; &gt; wrote:<br>
&gt;&gt;&gt; &gt;&gt; For cross-canadian builds, we were accidentally using=
<br>
&gt;&gt;&gt; &gt;&gt; the crosssdk C compiler when building the Go compiler=
<br>
&gt;&gt;&gt; &gt;&gt; bootstrap.=C2=A0 Add a patch to the make script to le=
t us<br>
&gt;&gt;&gt; &gt;&gt; use BUILD_CC, and prepend do_compile to set it in<br>
&gt;&gt;&gt; &gt;&gt; the local environment to ensure that the trailing<br>
&gt;&gt;&gt; &gt;&gt; blank gets stripped, since that confuses Go.<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; [YOCTO #12341]<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; Signed-off-by: Matt Madison &lt;matt@madison.systems&=
gt;<br>
&gt;&gt;&gt; &gt;&gt; ---<br>
&gt;&gt;&gt; &gt;&gt;=C2=A0 meta/recipes-devtools/go/go-1.<wbr>9.inc=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;&gt;&gt; &gt;&gt;=C2=A0 ...verride-CC-when-building-<wbr>dist-and-go_bo=
ot.patch | 43<br>
&gt;&gt;&gt; &gt;&gt; ++++++++++++++++++++++<br>
&gt;&gt;&gt; &gt;&gt;=C2=A0 meta/recipes-devtools/go/go-<wbr>common.inc=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++<br>
&gt;&gt;&gt; &gt;&gt;=C2=A0 3 files changed, 48 insertions(+)<br>
&gt;&gt;&gt; &gt;&gt;=C2=A0 create mode 100644<br>
&gt;&gt;&gt; &gt;&gt; meta/recipes-devtools/go/go-1.<wbr>9/0010-make.bash-o=
verride-CC-<wbr>when-building-dist-and-go_<wbr>boot.patch<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; diff --git a/meta/recipes-devtools/go/go-<wbr>1.9.inc=
<br>
&gt;&gt;&gt; &gt;&gt; b/meta/recipes-devtools/go/go-<wbr>1.9.inc<br>
&gt;&gt;&gt; &gt;&gt; index 65adaa8..1dbb5ef 100644<br>
&gt;&gt;&gt; &gt;&gt; --- a/meta/recipes-devtools/go/go-<wbr>1.9.inc<br>
&gt;&gt;&gt; &gt;&gt; +++ b/meta/recipes-devtools/go/go-<wbr>1.9.inc<br>
&gt;&gt;&gt; &gt;&gt; @@ -15,6 +15,7 @@ SRC_URI +=3D &quot;\<br>
&gt;&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0007-ld-add-=
soname-to-<wbr>shareable-objects.patch \<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; file://0008-make.bash-add-<wbr>GOHOSTxx-indirection-f=
or-<wbr>cross-canadia.patch \<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; file://0009-cmd-go-buildmode-<wbr>pie-forces-external=
-linking-<wbr>mode-on.patch \<br>
&gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt;&gt; &gt;&gt; file://0010-make.bash-<wbr>override-CC-when-building-=
<wbr>dist-and-go_boot.patch \<br>
&gt;&gt;&gt; &gt;&gt;=C2=A0 &quot;<br>
&gt;&gt;&gt; &gt;&gt;=C2=A0 SRC_URI[main.md5sum] =3D &quot;<wbr>da2d44ea384=
076efec43ee1f8b7d45<wbr>d2&quot;<br>
&gt;&gt;&gt; &gt;&gt;=C2=A0 SRC_URI[main.sha256sum] =3D<br>
&gt;&gt;&gt; &gt;&gt; &quot;<wbr>a4ab229028ed167ba1986825751463<wbr>605264e=
44868362ca8e7accc8be057<wbr>e993&quot;<br>
&gt;&gt;&gt; &gt;&gt; diff --git<br>
&gt;&gt;&gt; &gt;&gt; a/meta/recipes-devtools/go/go-<wbr>1.9/0010-make.bash=
-override-<wbr>CC-when-building-dist-and-go_<wbr>boot.patch<br>
&gt;&gt;&gt; &gt;&gt; b/meta/recipes-devtools/go/go-<wbr>1.9/0010-make.bash=
-override-<wbr>CC-when-building-dist-and-go_<wbr>boot.patch<br>
&gt;&gt;&gt; &gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; &gt;&gt; index 0000000..94ea197<br>
&gt;&gt;&gt; &gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; &gt;&gt; +++<br>
&gt;&gt;&gt; &gt;&gt; b/meta/recipes-devtools/go/go-<wbr>1.9/0010-make.bash=
-override-<wbr>CC-when-building-dist-and-go_<wbr>boot.patch<br>
&gt;&gt;&gt; &gt;&gt; @@ -0,0 +1,43 @@<br>
&gt;&gt;&gt; &gt;&gt; +From 36787fbf0e0a6298ba1038bbbae526<wbr>654597eee4 M=
on Sep 17 00:00:00 2001<br>
&gt;&gt;&gt; &gt;&gt; +From: Matt Madison &lt;matt@madison.systems&gt;<br>
&gt;&gt;&gt; &gt;&gt; +Date: Tue, 14 Nov 2017 07:38:42 -0800<br>
&gt;&gt;&gt; &gt;&gt; +Subject: [PATCH 10/10] make.bash: override CC when b=
uilding dist and<br>
&gt;&gt;&gt; &gt;&gt; + go_bootstrap<br>
&gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt;&gt; &gt;&gt; +For cross-canadian builds, dist and go_bootstrap<br>
&gt;&gt;&gt; &gt;&gt; +run on the build host, so CC needs to point to the<b=
r>
&gt;&gt;&gt; &gt;&gt; +build host&#39;s C compiler.=C2=A0 Add a BUILD_CC en=
vironment<br>
&gt;&gt;&gt; &gt;&gt; +for this, falling back to $CC if not present.<br>
&gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt;&gt; &gt;&gt; +Upstream-Status: pending<br>
&gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt;&gt; &gt;&gt; +Signed-off-by: Matt Madison &lt;matt@madison.systems=
&gt;<br>
&gt;&gt;&gt; &gt;&gt; +---<br>
&gt;&gt;&gt; &gt;&gt; + src/make.bash | 4 ++--<br>
&gt;&gt;&gt; &gt;&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt;&gt; &gt;&gt; +diff --git a/src/make.bash b/src/make.bash<br>
&gt;&gt;&gt; &gt;&gt; +index 0bdadc6..f199349 100755<br>
&gt;&gt;&gt; &gt;&gt; +--- a/src/make.bash<br>
&gt;&gt;&gt; &gt;&gt; ++++ b/src/make.bash<br>
&gt;&gt;&gt; &gt;&gt; +@@ -131,7 +131,7 @@ if [ &quot;$GOROOT_BOOTSTRAP&quo=
t; =3D &quot;$GOROOT&quot; ]; then<br>
&gt;&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt;&gt;&gt; &gt;&gt; + fi<br>
&gt;&gt;&gt; &gt;&gt; + rm -f cmd/dist/dist<br>
&gt;&gt;&gt; &gt;&gt; +-GOROOT=3D&quot;$GOROOT_BOOTSTRAP&quot; GOOS=3D&quot=
;&quot; GOARCH=3D&quot;&quot;<br>
&gt;&gt;&gt; &gt;&gt; &quot;$GOROOT_BOOTSTRAP/bin/go&quot; build -o cmd/dis=
t/dist ./cmd/dist<br>
&gt;&gt;&gt; &gt;&gt; ++CC=3D${BUILD_CC:-${CC}} GOROOT=3D&quot;$GOROOT_BOOT=
STRAP&quot; GOOS=3D&quot;&quot; GOARCH=3D&quot;&quot;<br>
&gt;&gt;&gt; &gt;&gt; &quot;$GOROOT_BOOTSTRAP/bin/go&quot; build -o cmd/dis=
t/dist ./cmd/dist<br>
&gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt;&gt; &gt;&gt; + # -e doesn&#39;t propagate out of eval, so check su=
ccess by hand.<br>
&gt;&gt;&gt; &gt;&gt; + eval $(./cmd/dist/dist env -p || echo FAIL=3Dtrue)<=
br>
&gt;&gt;&gt; &gt;&gt; +@@ -167,7 +167,7 @@ elif [ &quot;$1&quot; =3D &quot;=
--host-only&quot; ]; then<br>
&gt;&gt;&gt; &gt;&gt; + fi<br>
&gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt;&gt; &gt;&gt; + if [ &quot;$do_host_build&quot; =3D &quot;yes&quot;=
 ]; then<br>
&gt;&gt;&gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 ./cmd/dist/dist bootstrap $bui=
ldall $GO_DISTFLAGS -v # builds<br>
&gt;&gt;&gt; &gt;&gt; go_bootstrap<br>
&gt;&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 CC=3D${BUILD_CC:-${CC}} ./cmd/=
dist/dist bootstrap $buildall<br>
&gt;&gt;&gt; &gt;&gt; $GO_DISTFLAGS -v # builds go_bootstrap<br>
&gt;&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Delay move of dist tool=
 to now, because bootstrap may clear<br>
&gt;&gt;&gt; &gt;&gt; tool directory.<br>
&gt;&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mv cmd/dist/dist &quot;$G=
OTOOLDIR&quot;/dist<br>
&gt;&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0echo<br>
&gt;&gt;&gt; &gt;&gt; +--<br>
&gt;&gt;&gt; &gt;&gt; +2.7.4<br>
&gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt;&gt; &gt;&gt; diff --git a/meta/recipes-devtools/go/go-<wbr>common.=
inc<br>
&gt;&gt;&gt; &gt;&gt; b/meta/recipes-devtools/go/go-<wbr>common.inc<br>
&gt;&gt;&gt; &gt;&gt; index ce1eb86..9af6873 100644<br>
&gt;&gt;&gt; &gt;&gt; --- a/meta/recipes-devtools/go/go-<wbr>common.inc<br>
&gt;&gt;&gt; &gt;&gt; +++ b/meta/recipes-devtools/go/go-<wbr>common.inc<br>
&gt;&gt;&gt; &gt;&gt; @@ -20,3 +20,7 @@ B =3D &quot;${S}&quot;<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;=C2=A0 INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<b=
r>
&gt;&gt;&gt; &gt;&gt;=C2=A0 SSTATE_SCAN_CMD =3D &quot;true&quot;<br>
&gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt;&gt; &gt;&gt; +do_compile_prepend() {<br>
&gt;&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD_CC=3D${BUILD_CC}<br=
>
&gt;&gt;&gt; &gt;&gt; +}<br>
&gt;&gt;&gt; &gt;&gt; --<br>
&gt;&gt;&gt; &gt;&gt; 2.7.4<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; --<br>
&gt;&gt;&gt; &gt;&gt; ______________________________<wbr>_________________<=
br>
&gt;&gt;&gt; &gt;&gt; Openembedded-core mailing list<br>
&gt;&gt;&gt; &gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedde=
d.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt;&gt; &gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/list=
info/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.o=
penembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; --<br>
&gt;&gt;&gt; &gt; Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<=
br>
&gt;&gt;&gt; &gt; <a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer=
" target=3D"_blank">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <a href=3D"http://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_=
blank">http://code.ossystems.com.br</a><br>
&gt;&gt;&gt; &gt; Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" valu=
e=3D"+555399817854">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Mobile: <a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13=
479039750">+1 (347) 903-9750</a><br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Op=
enembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/open=
embedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedd=
ed.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--f403045fbd8434b9e4055e2fdd22--
