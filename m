Return-Path: <matt@madison.systems>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6EAA76010D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 23:29:23 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id x68so755740lff.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 15:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ghJ9odQ9nsOptMIdYqFJmSOYu4QPAdjozeK3RnI117M=;
	b=PaQoru4AG4ffI0jBZ6dvc8kDDw5p6RwKkWYakFreFpNF4CL2p0oCH/Zg3xcddMnxyf
	niV5OhizmvggA8PSvKzTNvGfV0PUPl5FyFQLtzoFbULI4g95OzGAjOj1SpeKIbnks/mx
	vuXui9P6B98PodheDMzt3J7rvNQ4Fm05txk9avcy5gV0O99NAstmTHRFc8d74DlLxn9F
	7jYMyjfwHUrsSMH6r42KLuRnPRR+hQXE3HnfUG7rQEIOTSySqKTUeJvoQxOmZBIAcbNh
	ubLUxWYGxSjGm+8LLNk1IZU32ZSIbn0Tdw5vCiS2ZhqnpdCCgOr/oG5Xs/9XXUMqgd2r
	Qmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ghJ9odQ9nsOptMIdYqFJmSOYu4QPAdjozeK3RnI117M=;
	b=i80YNfL2r7JquWF0qTtUbjZLEVzNRgLBPxESOlQiE8KUmF/+UFiUw+U5BSG7qpKClQ
	eD4ebujBBNZuxhdN3lgWgPunuX+HXAfWzT0HKyYqpyV1tvBNHqtZCRuDWU3A6TqsAdYK
	5RfjSsxT2FEkVGR0YglBogGDRNqArzSgXakLy9UVSh70a2phWONQ0jDTtU786VPMJxOT
	jrbWFvIJj1Esx0MVGrgI+fgjYSw/DTzduk/DgETbDv7PeaHIX5PoF96lURUAeg+WBLF8
	KEbkGtO5PUuq2UXuXaO7s9Qo9SbialwpiOiOyVbhN0wipUW7evcHngDSWfDVi4hRZMcX
	1O1g==
X-Gm-Message-State: AJaThX45NcxhFKBKFvWrEfGVGJjFbZDOJHLl6yaRElOSN3f/tb1TBK9w
	IpLOiR0jigvaGFj/7ffI5MfExo2aZRu9JBLzS9jNAQ==
X-Google-Smtp-Source: AGs4zMYn4jSrRdEZufpp7IFH+d31Bry6X+xnkqhSudstiSJXvAANqOGSA2Q4r3ARpWGupOGG9w3vod9iFuG3BOUbEJg=
X-Received: by 10.25.150.67 with SMTP id y64mr150353lfd.124.1510874963906;
	Thu, 16 Nov 2017 15:29:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.158.198 with HTTP; Thu, 16 Nov 2017 15:29:23 -0800 (PST)
In-Reply-To: <CAJTo0LZhfw5cViLMfXTTk8bvDdp_pN3p9g2uhAPDsSCbaZygOQ@mail.gmail.com>
References: <1510679926-24611-1-git-send-email-matt@madison.systems>
	<CAP9ODKr6V9rtuVzx8uN6Mr-ke1jW=Q411b=unZn+hZo1t_zh7g@mail.gmail.com>
	<CAGgRHJoGLRhhyjPzWGna9wSPK1Y33f9FqgsRJPHr_XPj_=ZEyg@mail.gmail.com>
	<CAJTo0LZhfw5cViLMfXTTk8bvDdp_pN3p9g2uhAPDsSCbaZygOQ@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Thu, 16 Nov 2017 15:29:23 -0800
Message-ID: <CAGgRHJo0hCR7WCzf0j0UzQnV9SvKufMHvJ72f-xNdj4oVBm_3Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Thu, 16 Nov 2017 23:29:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 16, 2017 at 12:29 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Looks like this is failing on some of our autobuilders, such as
> https://autobuilder.yocto.io/builders/nightly-musl-x86-64/builds/58/steps/BuildImages/logs/stdio

I'm looking into it.

Thanks,
-Matt

>
> | cmd/go/internal/vet
> | # cmd/api
> |
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/go/1.9-r0/go/src/host-tools/link:
> running x86_64-poky-linux-musl-gcc failed: exit status 1
> |
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/go/1.9-r0/build-tmp/go-link-213113620/000000.o:
> In function `vfprintf':
> | /usr/include/x86_64-linux-gnu/bits/stdio2.h:127: undefined reference to
> `__vfprintf_chk'
> |
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/go/1.9-r0/build-tmp/go-link-213113620/000000.o:
> In function `fprintf':
> | /usr/include/x86_64-linux-gnu/bits/stdio2.h:97: undefined reference to
> `__fprintf_chk'
> | collect2: error: ld returned 1 exit status
>
> It's running x86-64-poky-linux-musl-gcc but using headers from /usr, which
> looks wrong.
>
> Ross
>
>
> On 14 November 2017 at 17:21, Matt Madison <matt@madison.systems> wrote:
>>
>> Yes, drat it, v3 should fix that.
>>
>> Thanks,
>> -Matt
>>
>> On Tue, Nov 14, 2017 at 9:20 AM, Otavio Salvador
>> <otavio.salvador@ossystems.com.br> wrote:
>> > Hello Matt,
>> >
>> > A minor thing:
>> >
>> > Upstream-Status: Pending
>> >
>> > On Tue, Nov 14, 2017 at 3:18 PM, Matt Madison <matt@madison.systems>
>> > wrote:
>> >> For cross-canadian builds, we were accidentally using
>> >> the crosssdk C compiler when building the Go compiler
>> >> bootstrap.  Add a patch to the make script to let us
>> >> use BUILD_CC, and prepend do_compile to set it in
>> >> the local environment to ensure that the trailing
>> >> blank gets stripped, since that confuses Go.
>> >>
>> >> [YOCTO #12341]
>> >>
>> >> Signed-off-by: Matt Madison <matt@madison.systems>
>> >> ---
>> >>  meta/recipes-devtools/go/go-1.9.inc                |  1 +
>> >>  ...verride-CC-when-building-dist-and-go_boot.patch | 43
>> >> ++++++++++++++++++++++
>> >>  meta/recipes-devtools/go/go-common.inc             |  4 ++
>> >>  3 files changed, 48 insertions(+)
>> >>  create mode 100644
>> >> meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>> >>
>> >> diff --git a/meta/recipes-devtools/go/go-1.9.inc
>> >> b/meta/recipes-devtools/go/go-1.9.inc
>> >> index 65adaa8..1dbb5ef 100644
>> >> --- a/meta/recipes-devtools/go/go-1.9.inc
>> >> +++ b/meta/recipes-devtools/go/go-1.9.inc
>> >> @@ -15,6 +15,7 @@ SRC_URI += "\
>> >>          file://0007-ld-add-soname-to-shareable-objects.patch \
>> >>
>> >> file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
>> >>
>> >> file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
>> >> +
>> >> file://0010-make.bash-override-CC-when-building-dist-and-go_boot.patch \
>> >>  "
>> >>  SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
>> >>  SRC_URI[main.sha256sum] =
>> >> "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
>> >> diff --git
>> >> a/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>> >> b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>> >> new file mode 100644
>> >> index 0000000..94ea197
>> >> --- /dev/null
>> >> +++
>> >> b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>> >> @@ -0,0 +1,43 @@
>> >> +From 36787fbf0e0a6298ba1038bbbae526654597eee4 Mon Sep 17 00:00:00 2001
>> >> +From: Matt Madison <matt@madison.systems>
>> >> +Date: Tue, 14 Nov 2017 07:38:42 -0800
>> >> +Subject: [PATCH 10/10] make.bash: override CC when building dist and
>> >> + go_bootstrap
>> >> +
>> >> +For cross-canadian builds, dist and go_bootstrap
>> >> +run on the build host, so CC needs to point to the
>> >> +build host's C compiler.  Add a BUILD_CC environment
>> >> +for this, falling back to $CC if not present.
>> >> +
>> >> +Upstream-Status: pending
>> >> +
>> >> +Signed-off-by: Matt Madison <matt@madison.systems>
>> >> +---
>> >> + src/make.bash | 4 ++--
>> >> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> >> +
>> >> +diff --git a/src/make.bash b/src/make.bash
>> >> +index 0bdadc6..f199349 100755
>> >> +--- a/src/make.bash
>> >> ++++ b/src/make.bash
>> >> +@@ -131,7 +131,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
>> >> +       exit 1
>> >> + fi
>> >> + rm -f cmd/dist/dist
>> >> +-GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH=""
>> >> "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
>> >> ++CC=${BUILD_CC:-${CC}} GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH=""
>> >> "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
>> >> +
>> >> + # -e doesn't propagate out of eval, so check success by hand.
>> >> + eval $(./cmd/dist/dist env -p || echo FAIL=true)
>> >> +@@ -167,7 +167,7 @@ elif [ "$1" = "--host-only" ]; then
>> >> + fi
>> >> +
>> >> + if [ "$do_host_build" = "yes" ]; then
>> >> +-      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds
>> >> go_bootstrap
>> >> ++      CC=${BUILD_CC:-${CC}} ./cmd/dist/dist bootstrap $buildall
>> >> $GO_DISTFLAGS -v # builds go_bootstrap
>> >> +       # Delay move of dist tool to now, because bootstrap may clear
>> >> tool directory.
>> >> +       mv cmd/dist/dist "$GOTOOLDIR"/dist
>> >> +       echo
>> >> +--
>> >> +2.7.4
>> >> +
>> >> diff --git a/meta/recipes-devtools/go/go-common.inc
>> >> b/meta/recipes-devtools/go/go-common.inc
>> >> index ce1eb86..9af6873 100644
>> >> --- a/meta/recipes-devtools/go/go-common.inc
>> >> +++ b/meta/recipes-devtools/go/go-common.inc
>> >> @@ -20,3 +20,7 @@ B = "${S}"
>> >>
>> >>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>> >>  SSTATE_SCAN_CMD = "true"
>> >> +
>> >> +do_compile_prepend() {
>> >> +       BUILD_CC=${BUILD_CC}
>> >> +}
>> >> --
>> >> 2.7.4
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
>> >
>> >
>> > --
>> > Otavio Salvador                             O.S. Systems
>> > http://www.ossystems.com.br        http://code.ossystems.com.br
>> > Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

