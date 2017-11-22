Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 98B9B783DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 21:12:02 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id 187so7975067iti.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 13:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZAT+gOxiE2ZsLZ/xd/snOJA1k61VXCV0I92H+R9dMjY=;
	b=X7LfQxWjMNVMkXPHYg2QDXJBiXl8GtXre4WDaG9F2npeUBjzDF5cro4FP3bJfRyqjk
	VT8kvLO4Pc1FS4LyDCVdRS3TmFJMokpMpA/MJTI/HZwamkMig21eGIh6DcX1yvdGQZxv
	rEo/6wFkTr2Ujgot9nwIigJXhl6xHnMEWEjyWbxQvwszHPWD7IPcMC9XzfpD1uqjBOpY
	32DmxN3aO5G391irAQxzqeCA3pwTPwXKTvfICUFFP/k6830OPDyFm0MilCi4wPyme6jn
	T+WQYWcEszHZ2bYOM2OqQQtvwQXz4gl1u0GniaJWVLGWS98KpzNQsP7lJeW3h8p2/yo5
	SGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZAT+gOxiE2ZsLZ/xd/snOJA1k61VXCV0I92H+R9dMjY=;
	b=e0hsjpyFpNpNbe8V3z3Tj7Hk26NeT/GVLA7llSfs3eI3GluOAEEkrZce2BW6n5MQDy
	QAJ8IKBgcWaq9A7MlTEyR4/AGVXOugBzWoLJahRJcjBO0sW63uEheVz8qnf/rEH8yVTJ
	tLB8Uxd2v7xUX83fzqdevkqQIYWpzsp6VrD14PmyiVJPdSHR2hUrOKZxzCEXggWlJWe3
	RHILCu3l5jmJfUYb4GkGzvJ9+P94n0y5d+KmOGlVa9P/VKn61ahCQel/0iTZKrMc+G8b
	Ilqvnm1oesqPKKdNcQ9SVJ8mcsBJTl6IQFk7GN1N8SqC3K80LYJR7iBzJkH3NyBbJxgU
	eQ3A==
X-Gm-Message-State: AJaThX5ljNlF25ihfqamFdtRRIfPNa3E4xIP96vuY4NpMnHq+CGi1tEy
	WHZgzje3c935g+6mf05qMDerqSA5W7VSVI/kMDlGsg==
X-Google-Smtp-Source: AGs4zMbD0VRJyBUkbSZIVf2GOEYSUMXnYod8hAiYl+qcCcKrARKYdnNJzy6y7g4BQZp1PAgOAMZIae9AkU7aVwqlEEQ=
X-Received: by 10.36.93.5 with SMTP id w5mr2926555ita.124.1511385123748; Wed,
	22 Nov 2017 13:12:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Wed, 22 Nov 2017 13:11:43 -0800 (PST)
In-Reply-To: <CAGgRHJoqveaeqmxkMVdYGVGGO-YFTjM_zgqnLawMQq-U1miNeg@mail.gmail.com>
References: <1510679926-24611-1-git-send-email-matt@madison.systems>
	<CAP9ODKr6V9rtuVzx8uN6Mr-ke1jW=Q411b=unZn+hZo1t_zh7g@mail.gmail.com>
	<CAGgRHJoGLRhhyjPzWGna9wSPK1Y33f9FqgsRJPHr_XPj_=ZEyg@mail.gmail.com>
	<CAJTo0LZhfw5cViLMfXTTk8bvDdp_pN3p9g2uhAPDsSCbaZygOQ@mail.gmail.com>
	<CAGgRHJo0hCR7WCzf0j0UzQnV9SvKufMHvJ72f-xNdj4oVBm_3Q@mail.gmail.com>
	<CAGgRHJobiDANiCPVHy=n-obx7JhNGO86yavV81zc9LvgD6xG_w@mail.gmail.com>
	<CAJTo0LZJ-kUE3H2443g-Ez5r_hp3a_pEv8Pu9+SL2YNr11GBgw@mail.gmail.com>
	<CAGgRHJoqveaeqmxkMVdYGVGGO-YFTjM_zgqnLawMQq-U1miNeg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Nov 2017 21:11:43 +0000
Message-ID: <CAJTo0LYG-iDAC3+Us38KOODO-UObHBD1Rwy0JfDF-R-44eunFQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Nov 2017 21:12:03 -0000
Content-Type: multipart/alternative; boundary="001a1143f14c6bad8e055e98c535"

--001a1143f14c6bad8e055e98c535
Content-Type: text/plain; charset="UTF-8"

Yes, just marked it.  Thanks for the reminder.

Ross

On 22 November 2017 at 20:58, Matt Madison <matt@madison.systems> wrote:

> On Fri, Nov 17, 2017 at 8:02 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > I had a hunch that was the problem this morning after looking again at
> the
> > patch set.  Thanks for confirming.
>
> Ross,
>
> Can the BUILD_CC patch go back into your queue again?
>
> Thanks,
> -Matt
>
> >
> > Ross
> >
> > On 17 November 2017 at 15:49, Matt Madison <matt@madison.systems> wrote:
> >>
> >> On Thu, Nov 16, 2017 at 3:29 PM, Matt Madison <matt@madison.systems>
> >> wrote:
> >> > On Thu, Nov 16, 2017 at 12:29 PM, Burton, Ross <ross.burton@intel.com
> >
> >> > wrote:
> >> >> Looks like this is failing on some of our autobuilders, such as
> >> >>
> >> >> https://autobuilder.yocto.io/builders/nightly-musl-x86-64/
> builds/58/steps/BuildImages/logs/stdio
> >> >
> >> > I'm looking into it.
> >>
> >> OK, from my testing, it's not this patch that's causing the build
> >> failures, it's Khem's "go: Fix build with PIE on musl" patch.
> >>
> >> The added patch there that changes the default buildmode to 'pie' is
> >> causing the external linker to be used for building go_bootstrap and
> >> target Go compiler and forcing inclusion of the cgo runtime. It will
> >> take some recipe modifications and another patch to Go's make.bash to
> >> deal with this, but I'm not sure that this particular patch is even a
> >> good idea.  Making PIE builds work with musl is OK, but the additional
> >> buildmode default change is too much.
> >>
> >> -Matt
> >>
> >> >
> >> > Thanks,
> >> > -Matt
> >> >
> >> >>
> >> >> | cmd/go/internal/vet
> >> >> | # cmd/api
> >> >> |
> >> >>
> >> >> /home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-
> linux-musl/go/1.9-r0/go/src/host-tools/link:
> >> >> running x86_64-poky-linux-musl-gcc failed: exit status 1
> >> >> |
> >> >>
> >> >> /home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-
> linux-musl/go/1.9-r0/build-tmp/go-link-213113620/000000.o:
> >> >> In function `vfprintf':
> >> >> | /usr/include/x86_64-linux-gnu/bits/stdio2.h:127: undefined
> reference
> >> >> to
> >> >> `__vfprintf_chk'
> >> >> |
> >> >>
> >> >> /home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-
> linux-musl/go/1.9-r0/build-tmp/go-link-213113620/000000.o:
> >> >> In function `fprintf':
> >> >> | /usr/include/x86_64-linux-gnu/bits/stdio2.h:97: undefined
> reference
> >> >> to
> >> >> `__fprintf_chk'
> >> >> | collect2: error: ld returned 1 exit status
> >> >>
> >> >> It's running x86-64-poky-linux-musl-gcc but using headers from /usr,
> >> >> which
> >> >> looks wrong.
> >> >>
> >> >> Ross
> >> >>
> >> >>
> >> >> On 14 November 2017 at 17:21, Matt Madison <matt@madison.systems>
> >> >> wrote:
> >> >>>
> >> >>> Yes, drat it, v3 should fix that.
> >> >>>
> >> >>> Thanks,
> >> >>> -Matt
> >> >>>
> >> >>> On Tue, Nov 14, 2017 at 9:20 AM, Otavio Salvador
> >> >>> <otavio.salvador@ossystems.com.br> wrote:
> >> >>> > Hello Matt,
> >> >>> >
> >> >>> > A minor thing:
> >> >>> >
> >> >>> > Upstream-Status: Pending
> >> >>> >
> >> >>> > On Tue, Nov 14, 2017 at 3:18 PM, Matt Madison
> <matt@madison.systems>
> >> >>> > wrote:
> >> >>> >> For cross-canadian builds, we were accidentally using
> >> >>> >> the crosssdk C compiler when building the Go compiler
> >> >>> >> bootstrap.  Add a patch to the make script to let us
> >> >>> >> use BUILD_CC, and prepend do_compile to set it in
> >> >>> >> the local environment to ensure that the trailing
> >> >>> >> blank gets stripped, since that confuses Go.
> >> >>> >>
> >> >>> >> [YOCTO #12341]
> >> >>> >>
> >> >>> >> Signed-off-by: Matt Madison <matt@madison.systems>
> >> >>> >> ---
> >> >>> >>  meta/recipes-devtools/go/go-1.9.inc                |  1 +
> >> >>> >>  ...verride-CC-when-building-dist-and-go_boot.patch | 43
> >> >>> >> ++++++++++++++++++++++
> >> >>> >>  meta/recipes-devtools/go/go-common.inc             |  4 ++
> >> >>> >>  3 files changed, 48 insertions(+)
> >> >>> >>  create mode 100644
> >> >>> >>
> >> >>> >> meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-
> when-building-dist-and-go_boot.patch
> >> >>> >>
> >> >>> >> diff --git a/meta/recipes-devtools/go/go-1.9.inc
> >> >>> >> b/meta/recipes-devtools/go/go-1.9.inc
> >> >>> >> index 65adaa8..1dbb5ef 100644
> >> >>> >> --- a/meta/recipes-devtools/go/go-1.9.inc
> >> >>> >> +++ b/meta/recipes-devtools/go/go-1.9.inc
> >> >>> >> @@ -15,6 +15,7 @@ SRC_URI += "\
> >> >>> >>          file://0007-ld-add-soname-to-shareable-objects.patch \
> >> >>> >>
> >> >>> >>
> >> >>> >> file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
> \
> >> >>> >>
> >> >>> >>
> >> >>> >> file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
> \
> >> >>> >> +
> >> >>> >>
> >> >>> >> file://0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
> \
> >> >>> >>  "
> >> >>> >>  SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
> >> >>> >>  SRC_URI[main.sha256sum] =
> >> >>> >> "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057
> e993"
> >> >>> >> diff --git
> >> >>> >>
> >> >>> >> a/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-
> CC-when-building-dist-and-go_boot.patch
> >> >>> >>
> >> >>> >> b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-
> CC-when-building-dist-and-go_boot.patch
> >> >>> >> new file mode 100644
> >> >>> >> index 0000000..94ea197
> >> >>> >> --- /dev/null
> >> >>> >> +++
> >> >>> >>
> >> >>> >> b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-
> CC-when-building-dist-and-go_boot.patch
> >> >>> >> @@ -0,0 +1,43 @@
> >> >>> >> +From 36787fbf0e0a6298ba1038bbbae526654597eee4 Mon Sep 17
> 00:00:00
> >> >>> >> 2001
> >> >>> >> +From: Matt Madison <matt@madison.systems>
> >> >>> >> +Date: Tue, 14 Nov 2017 07:38:42 -0800
> >> >>> >> +Subject: [PATCH 10/10] make.bash: override CC when building dist
> >> >>> >> and
> >> >>> >> + go_bootstrap
> >> >>> >> +
> >> >>> >> +For cross-canadian builds, dist and go_bootstrap
> >> >>> >> +run on the build host, so CC needs to point to the
> >> >>> >> +build host's C compiler.  Add a BUILD_CC environment
> >> >>> >> +for this, falling back to $CC if not present.
> >> >>> >> +
> >> >>> >> +Upstream-Status: pending
> >> >>> >> +
> >> >>> >> +Signed-off-by: Matt Madison <matt@madison.systems>
> >> >>> >> +---
> >> >>> >> + src/make.bash | 4 ++--
> >> >>> >> + 1 file changed, 2 insertions(+), 2 deletions(-)
> >> >>> >> +
> >> >>> >> +diff --git a/src/make.bash b/src/make.bash
> >> >>> >> +index 0bdadc6..f199349 100755
> >> >>> >> +--- a/src/make.bash
> >> >>> >> ++++ b/src/make.bash
> >> >>> >> +@@ -131,7 +131,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
> >> >>> >> +       exit 1
> >> >>> >> + fi
> >> >>> >> + rm -f cmd/dist/dist
> >> >>> >> +-GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH=""
> >> >>> >> "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> >> >>> >> ++CC=${BUILD_CC:-${CC}} GOROOT="$GOROOT_BOOTSTRAP" GOOS=""
> >> >>> >> GOARCH=""
> >> >>> >> "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> >> >>> >> +
> >> >>> >> + # -e doesn't propagate out of eval, so check success by hand.
> >> >>> >> + eval $(./cmd/dist/dist env -p || echo FAIL=true)
> >> >>> >> +@@ -167,7 +167,7 @@ elif [ "$1" = "--host-only" ]; then
> >> >>> >> + fi
> >> >>> >> +
> >> >>> >> + if [ "$do_host_build" = "yes" ]; then
> >> >>> >> +-      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v #
> >> >>> >> builds
> >> >>> >> go_bootstrap
> >> >>> >> ++      CC=${BUILD_CC:-${CC}} ./cmd/dist/dist bootstrap $buildall
> >> >>> >> $GO_DISTFLAGS -v # builds go_bootstrap
> >> >>> >> +       # Delay move of dist tool to now, because bootstrap may
> >> >>> >> clear
> >> >>> >> tool directory.
> >> >>> >> +       mv cmd/dist/dist "$GOTOOLDIR"/dist
> >> >>> >> +       echo
> >> >>> >> +--
> >> >>> >> +2.7.4
> >> >>> >> +
> >> >>> >> diff --git a/meta/recipes-devtools/go/go-common.inc
> >> >>> >> b/meta/recipes-devtools/go/go-common.inc
> >> >>> >> index ce1eb86..9af6873 100644
> >> >>> >> --- a/meta/recipes-devtools/go/go-common.inc
> >> >>> >> +++ b/meta/recipes-devtools/go/go-common.inc
> >> >>> >> @@ -20,3 +20,7 @@ B = "${S}"
> >> >>> >>
> >> >>> >>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> >> >>> >>  SSTATE_SCAN_CMD = "true"
> >> >>> >> +
> >> >>> >> +do_compile_prepend() {
> >> >>> >> +       BUILD_CC=${BUILD_CC}
> >> >>> >> +}
> >> >>> >> --
> >> >>> >> 2.7.4
> >> >>> >>
> >> >>> >> --
> >> >>> >> _______________________________________________
> >> >>> >> Openembedded-core mailing list
> >> >>> >> Openembedded-core@lists.openembedded.org
> >> >>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> >>> >
> >> >>> >
> >> >>> >
> >> >>> > --
> >> >>> > Otavio Salvador                             O.S. Systems
> >> >>> > http://www.ossystems.com.br        http://code.ossystems.com.br
> >> >>> > Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> >> >>> --
> >> >>> _______________________________________________
> >> >>> Openembedded-core mailing list
> >> >>> Openembedded-core@lists.openembedded.org
> >> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
>

--001a1143f14c6bad8e055e98c535
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, just marked it.=C2=A0 Thanks for the reminder.<div><b=
r></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On 22 November 2017 at 20:58, Matt Madison <span dir=3D"ltr">&l=
t;<a href=3D"mailto:matt@madison.systems" target=3D"_blank">matt@madison.sy=
stems</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On Fri, Nov 17, 2017 at 8:02 AM, Burton, Ross &lt;<a href=3D"mailto:r=
oss.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; I had a hunch that was the problem this morning after looking again at=
 the<br>
&gt; patch set.=C2=A0 Thanks for confirming.<br>
<br>
</span>Ross,<br>
<br>
Can the BUILD_CC patch go back into your queue again?<br>
<br>
Thanks,<br>
-Matt<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Ross<br>
&gt;<br>
&gt; On 17 November 2017 at 15:49, Matt Madison &lt;matt@madison.systems&gt=
; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Nov 16, 2017 at 3:29 PM, Matt Madison &lt;matt@madison.sys=
tems&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; On Thu, Nov 16, 2017 at 12:29 PM, Burton, Ross &lt;<a href=3D=
"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt;<br>
&gt;&gt; &gt; wrote:<br>
&gt;&gt; &gt;&gt; Looks like this is failing on some of our autobuilders, s=
uch as<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; <a href=3D"https://autobuilder.yocto.io/builders/nightly-=
musl-x86-64/builds/58/steps/BuildImages/logs/stdio" rel=3D"noreferrer" targ=
et=3D"_blank">https://autobuilder.yocto.io/<wbr>builders/nightly-musl-x86-6=
4/<wbr>builds/58/steps/BuildImages/<wbr>logs/stdio</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;m looking into it.<br>
&gt;&gt;<br>
&gt;&gt; OK, from my testing, it&#39;s not this patch that&#39;s causing th=
e build<br>
&gt;&gt; failures, it&#39;s Khem&#39;s &quot;go: Fix build with PIE on musl=
&quot; patch.<br>
&gt;&gt;<br>
&gt;&gt; The added patch there that changes the default buildmode to &#39;p=
ie&#39; is<br>
&gt;&gt; causing the external linker to be used for building go_bootstrap a=
nd<br>
&gt;&gt; target Go compiler and forcing inclusion of the cgo runtime. It wi=
ll<br>
&gt;&gt; take some recipe modifications and another patch to Go&#39;s make.=
bash to<br>
&gt;&gt; deal with this, but I&#39;m not sure that this particular patch is=
 even a<br>
&gt;&gt; good idea.=C2=A0 Making PIE builds work with musl is OK, but the a=
dditional<br>
&gt;&gt; buildmode default change is too much.<br>
&gt;&gt;<br>
&gt;&gt; -Matt<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks,<br>
&gt;&gt; &gt; -Matt<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; | cmd/go/internal/vet<br>
&gt;&gt; &gt;&gt; | # cmd/api<br>
&gt;&gt; &gt;&gt; |<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; /home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>=
nightly-musl-x86-64/build/<wbr>build/tmp/work/core2-64-poky-<wbr>linux-musl=
/go/1.9-r0/go/src/<wbr>host-tools/link:<br>
&gt;&gt; &gt;&gt; running x86_64-poky-linux-musl-gcc failed: exit status 1<=
br>
&gt;&gt; &gt;&gt; |<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; /home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>=
nightly-musl-x86-64/build/<wbr>build/tmp/work/core2-64-poky-<wbr>linux-musl=
/go/1.9-r0/build-<wbr>tmp/go-link-213113620/000000.<wbr>o:<br>
&gt;&gt; &gt;&gt; In function `vfprintf&#39;:<br>
&gt;&gt; &gt;&gt; | /usr/include/x86_64-linux-gnu/<wbr>bits/stdio2.h:127: u=
ndefined reference<br>
&gt;&gt; &gt;&gt; to<br>
&gt;&gt; &gt;&gt; `__vfprintf_chk&#39;<br>
&gt;&gt; &gt;&gt; |<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; /home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>=
nightly-musl-x86-64/build/<wbr>build/tmp/work/core2-64-poky-<wbr>linux-musl=
/go/1.9-r0/build-<wbr>tmp/go-link-213113620/000000.<wbr>o:<br>
&gt;&gt; &gt;&gt; In function `fprintf&#39;:<br>
&gt;&gt; &gt;&gt; | /usr/include/x86_64-linux-gnu/<wbr>bits/stdio2.h:97: un=
defined reference<br>
&gt;&gt; &gt;&gt; to<br>
&gt;&gt; &gt;&gt; `__fprintf_chk&#39;<br>
&gt;&gt; &gt;&gt; | collect2: error: ld returned 1 exit status<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; It&#39;s running x86-64-poky-linux-musl-gcc but using hea=
ders from /usr,<br>
&gt;&gt; &gt;&gt; which<br>
&gt;&gt; &gt;&gt; looks wrong.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Ross<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On 14 November 2017 at 17:21, Matt Madison &lt;matt@madis=
on.systems&gt;<br>
&gt;&gt; &gt;&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Yes, drat it, v3 should fix that.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Thanks,<br>
&gt;&gt; &gt;&gt;&gt; -Matt<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; On Tue, Nov 14, 2017 at 9:20 AM, Otavio Salvador<br>
&gt;&gt; &gt;&gt;&gt; &lt;<a href=3D"mailto:otavio.salvador@ossystems.com.b=
r">otavio.salvador@ossystems.<wbr>com.br</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt; &gt; Hello Matt,<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; A minor thing:<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; Upstream-Status: Pending<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; On Tue, Nov 14, 2017 at 3:18 PM, Matt Madison &l=
t;matt@madison.systems&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; For cross-canadian builds, we were accidenta=
lly using<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; the crosssdk C compiler when building the Go=
 compiler<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; bootstrap.=C2=A0 Add a patch to the make scr=
ipt to let us<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; use BUILD_CC, and prepend do_compile to set =
it in<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; the local environment to ensure that the tra=
iling<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; blank gets stripped, since that confuses Go.=
<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; [YOCTO #12341]<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; Signed-off-by: Matt Madison &lt;matt@madison=
.systems&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;=C2=A0 meta/recipes-devtools/go/go-1.<wbr>9.i=
nc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;=C2=A0 ...verride-CC-when-building-<wbr>dist-=
and-go_boot.patch | 43<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; ++++++++++++++++++++++<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;=C2=A0 meta/recipes-devtools/go/go-<wbr>commo=
n.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;=C2=A0 3 files changed, 48 insertions(+)<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;=C2=A0 create mode 100644<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; meta/recipes-devtools/go/go-1.<wbr>9/0010-ma=
ke.bash-override-CC-<wbr>when-building-dist-and-go_<wbr>boot.patch<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; diff --git a/meta/recipes-devtools/go/go-<wb=
r>1.9.inc<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; b/meta/recipes-devtools/go/go-<wbr>1.9.inc<b=
r>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; index 65adaa8..1dbb5ef 100644<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; --- a/meta/recipes-devtools/go/go-<wbr>1.9.i=
nc<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +++ b/meta/recipes-devtools/go/go-<wbr>1.9.i=
nc<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; @@ -15,6 +15,7 @@ SRC_URI +=3D &quot;\<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://000=
7-ld-add-soname-to-<wbr>shareable-objects.patch \<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; file://0008-make.bash-add-<wbr>GOHOSTxx-indi=
rection-for-<wbr>cross-canadia.patch \<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; file://0009-cmd-go-buildmode-<wbr>pie-forces=
-external-linking-<wbr>mode-on.patch \<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; file://0010-make.bash-<wbr>override-CC-when-=
building-<wbr>dist-and-go_boot.patch \<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;=C2=A0 &quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;=C2=A0 SRC_URI[main.md5sum] =3D &quot;<wbr>da=
2d44ea384076efec43ee1f8b7d45<wbr>d2&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;=C2=A0 SRC_URI[main.sha256sum] =3D<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &quot;<wbr>a4ab229028ed167ba1986825751463<wb=
r>605264e44868362ca8e7accc8be057<wbr>e993&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; diff --git<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; a/meta/recipes-devtools/go/go-<wbr>1.9/0010-=
make.bash-override-<wbr>CC-when-building-dist-and-go_<wbr>boot.patch<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; b/meta/recipes-devtools/go/go-<wbr>1.9/0010-=
make.bash-override-<wbr>CC-when-building-dist-and-go_<wbr>boot.patch<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; new file mode 100644<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; index 0000000..94ea197<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; --- /dev/null<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +++<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; b/meta/recipes-devtools/go/go-<wbr>1.9/0010-=
make.bash-override-<wbr>CC-when-building-dist-and-go_<wbr>boot.patch<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; @@ -0,0 +1,43 @@<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +From 36787fbf0e0a6298ba1038bbbae526<wbr>654=
597eee4 Mon Sep 17 00:00:00<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; 2001<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +From: Matt Madison &lt;matt@madison.systems=
&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +Date: Tue, 14 Nov 2017 07:38:42 -0800<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +Subject: [PATCH 10/10] make.bash: override =
CC when building dist<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; and<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; + go_bootstrap<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +For cross-canadian builds, dist and go_boot=
strap<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +run on the build host, so CC needs to point=
 to the<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +build host&#39;s C compiler.=C2=A0 Add a BU=
ILD_CC environment<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +for this, falling back to $CC if not presen=
t.<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +Upstream-Status: pending<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +Signed-off-by: Matt Madison &lt;matt@madiso=
n.systems&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +---<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; + src/make.bash | 4 ++--<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; + 1 file changed, 2 insertions(+), 2 deletio=
ns(-)<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +diff --git a/src/make.bash b/src/make.bash<=
br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +index 0bdadc6..f199349 100755<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +--- a/src/make.bash<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; ++++ b/src/make.bash<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +@@ -131,7 +131,7 @@ if [ &quot;$GOROOT_BOOT=
STRAP&quot; =3D &quot;$GOROOT&quot; ]; then<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; + fi<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; + rm -f cmd/dist/dist<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +-GOROOT=3D&quot;$GOROOT_BOOTSTRAP&quot; GOO=
S=3D&quot;&quot; GOARCH=3D&quot;&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &quot;$GOROOT_BOOTSTRAP/bin/go&quot; build -=
o cmd/dist/dist ./cmd/dist<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; ++CC=3D${BUILD_CC:-${CC}} GOROOT=3D&quot;$GO=
ROOT_BOOTSTRAP&quot; GOOS=3D&quot;&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; GOARCH=3D&quot;&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &quot;$GOROOT_BOOTSTRAP/bin/go&quot; build -=
o cmd/dist/dist ./cmd/dist<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; + # -e doesn&#39;t propagate out of eval, so=
 check success by hand.<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; + eval $(./cmd/dist/dist env -p || echo FAIL=
=3Dtrue)<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +@@ -167,7 +167,7 @@ elif [ &quot;$1&quot; =
=3D &quot;--host-only&quot; ]; then<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; + fi<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; + if [ &quot;$do_host_build&quot; =3D &quot;=
yes&quot; ]; then<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 ./cmd/dist/dist boots=
trap $buildall $GO_DISTFLAGS -v #<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; builds<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; go_bootstrap<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 CC=3D${BUILD_CC:-${CC=
}} ./cmd/dist/dist bootstrap $buildall<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; $GO_DISTFLAGS -v # builds go_bootstrap<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Delay move of =
dist tool to now, because bootstrap may<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; clear<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; tool directory.<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mv cmd/dist/dist=
 &quot;$GOTOOLDIR&quot;/dist<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0echo<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +--<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +2.7.4<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; diff --git a/meta/recipes-devtools/go/go-<wb=
r>common.inc<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; b/meta/recipes-devtools/go/go-<wbr>common.in=
c<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; index ce1eb86..9af6873 100644<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; --- a/meta/recipes-devtools/go/go-<wbr>commo=
n.inc<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +++ b/meta/recipes-devtools/go/go-<wbr>commo=
n.inc<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; @@ -20,3 +20,7 @@ B =3D &quot;${S}&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;=C2=A0 INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;=
1&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;=C2=A0 SSTATE_SCAN_CMD =3D &quot;true&quot;<b=
r>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +do_compile_prepend() {<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD_CC=3D${BUI=
LD_CC}<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; 2.7.4<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; ______________________________<wbr>_________=
________<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; <a href=3D"mailto:Openembedded-core@lists.op=
enembedded.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; <a href=3D"http://lists.openembedded.org/mai=
lman/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http:=
//lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><b=
r>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt;&gt; &gt; Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.=
S. Systems<br>
&gt;&gt; &gt;&gt;&gt; &gt; <a href=3D"http://www.ossystems.com.br" rel=3D"n=
oreferrer" target=3D"_blank">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <a href=3D"http://code.ossystems.com.br" rel=3D"noreferrer" t=
arget=3D"_blank">http://code.ossystems.com.br</a><br>
&gt;&gt; &gt;&gt;&gt; &gt; Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7=
854" value=3D"+555399817854">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Mobile: <a href=3D"tel:%2B1%20%28347%29%20903-9750" value=
=3D"+13479039750">+1 (347) 903-9750</a><br>
&gt;&gt; &gt;&gt;&gt; --<br>
&gt;&gt; &gt;&gt;&gt; ______________________________<wbr>_________________<=
br>
&gt;&gt; &gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; &gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedde=
d.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; &gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/list=
info/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.o=
penembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a1143f14c6bad8e055e98c535--
