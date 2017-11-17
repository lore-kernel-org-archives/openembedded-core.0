Return-Path: <matt@madison.systems>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9F83F60119
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 15:49:34 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id f134so3167164lfg.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 07:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jh0phNM8W6c+9rulZBSczIJJ0G78H7JMAt9VCRdsyB8=;
	b=02wHYGNh18cFa7l/ZOQZN1rhz9Xvj8jOZwOkzlBJeaFP9xmvKO0XmvWXfNjl5c24b/
	PFQlMBUdv3b9DWjayajjFzz1NY/7LDS5JNdif/AJlhlGNUalyN5rFXIcE/NnxGlw8rpX
	CB59o1zZzO3BloWfPV2ks6EftPIe/71+OwbUx2xjrzcvzJAt2bFyRrX/z4aYLltPQCPt
	XRDGpiEfHVFdyjk/f5DxYDkwWHKNbHTgs9LrlNwYVrMzLX0647J/MlS0t1byJfqfrGb1
	NaQLhmNJUinCBqmNUp0cu+87lupkE1ho2gJq7TzrnoROFEheUCs4kFDqg8JCy2FrBYW3
	Ze6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jh0phNM8W6c+9rulZBSczIJJ0G78H7JMAt9VCRdsyB8=;
	b=g7yGqxsUTlIsmvP0fIwNQ5g4U44X2oQBDeO25YUFawxGPRkAIVIfnod2Z5ZAZyxvmK
	rk/hwIejgpw4qx/HENjYzQtcGNikw2cftBKGkFavPXMmgUff8l/Avja0BK7cEEdvTTfO
	o4sZVFiHQr3I2tc6R5YbgbaN6O8D854wddOwMcrphjMaPISWR0dwCs3HsBFAL4ekNmyy
	M9sqrhn6sVlipTK6vk275OUGeWKu83BejUv+rgg3aJmN+lHQAxXaUZDiyBeDRtQXRpYu
	0mBzQ0vYrOLUAHqcbCk4cV+7Sg+HClEiT9kn3yt9Wcva7lY5l14bENx9au4T0TQGc4o6
	IXcQ==
X-Gm-Message-State: AJaThX4M1kvbxb3FBJl9+ScrtYEd0gNPcjjjAfBmLp356LYH/9KvmZZs
	clT46gzR+NI1q9NjDkjHLDwV4rgY177cEsa65gEpmw==
X-Google-Smtp-Source: AGs4zMbV7HM/R/V//cQSGgCgm0067kE6gFzvuzREqj036HdcMpRlQAIZuy6cedacFg2vOnoxaUE9m+4+VFVoj8cGzfI=
X-Received: by 10.46.41.68 with SMTP id u65mr1193829lje.47.1510933774780; Fri,
	17 Nov 2017 07:49:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.158.198 with HTTP; Fri, 17 Nov 2017 07:49:33 -0800 (PST)
In-Reply-To: <CAGgRHJo0hCR7WCzf0j0UzQnV9SvKufMHvJ72f-xNdj4oVBm_3Q@mail.gmail.com>
References: <1510679926-24611-1-git-send-email-matt@madison.systems>
	<CAP9ODKr6V9rtuVzx8uN6Mr-ke1jW=Q411b=unZn+hZo1t_zh7g@mail.gmail.com>
	<CAGgRHJoGLRhhyjPzWGna9wSPK1Y33f9FqgsRJPHr_XPj_=ZEyg@mail.gmail.com>
	<CAJTo0LZhfw5cViLMfXTTk8bvDdp_pN3p9g2uhAPDsSCbaZygOQ@mail.gmail.com>
	<CAGgRHJo0hCR7WCzf0j0UzQnV9SvKufMHvJ72f-xNdj4oVBm_3Q@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Fri, 17 Nov 2017 07:49:33 -0800
Message-ID: <CAGgRHJobiDANiCPVHy=n-obx7JhNGO86yavV81zc9LvgD6xG_w@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 Nov 2017 15:49:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 16, 2017 at 3:29 PM, Matt Madison <matt@madison.systems> wrote:
> On Thu, Nov 16, 2017 at 12:29 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> Looks like this is failing on some of our autobuilders, such as
>> https://autobuilder.yocto.io/builders/nightly-musl-x86-64/builds/58/steps/BuildImages/logs/stdio
>
> I'm looking into it.

OK, from my testing, it's not this patch that's causing the build
failures, it's Khem's "go: Fix build with PIE on musl" patch.

The added patch there that changes the default buildmode to 'pie' is
causing the external linker to be used for building go_bootstrap and
target Go compiler and forcing inclusion of the cgo runtime. It will
take some recipe modifications and another patch to Go's make.bash to
deal with this, but I'm not sure that this particular patch is even a
good idea.  Making PIE builds work with musl is OK, but the additional
buildmode default change is too much.

-Matt

>
> Thanks,
> -Matt
>
>>
>> | cmd/go/internal/vet
>> | # cmd/api
>> |
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/go/1.9-r0/go/src/host-tools/link:
>> running x86_64-poky-linux-musl-gcc failed: exit status 1
>> |
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/go/1.9-r0/build-tmp/go-link-213113620/000000.o:
>> In function `vfprintf':
>> | /usr/include/x86_64-linux-gnu/bits/stdio2.h:127: undefined reference to
>> `__vfprintf_chk'
>> |
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/go/1.9-r0/build-tmp/go-link-213113620/000000.o:
>> In function `fprintf':
>> | /usr/include/x86_64-linux-gnu/bits/stdio2.h:97: undefined reference to
>> `__fprintf_chk'
>> | collect2: error: ld returned 1 exit status
>>
>> It's running x86-64-poky-linux-musl-gcc but using headers from /usr, which
>> looks wrong.
>>
>> Ross
>>
>>
>> On 14 November 2017 at 17:21, Matt Madison <matt@madison.systems> wrote:
>>>
>>> Yes, drat it, v3 should fix that.
>>>
>>> Thanks,
>>> -Matt
>>>
>>> On Tue, Nov 14, 2017 at 9:20 AM, Otavio Salvador
>>> <otavio.salvador@ossystems.com.br> wrote:
>>> > Hello Matt,
>>> >
>>> > A minor thing:
>>> >
>>> > Upstream-Status: Pending
>>> >
>>> > On Tue, Nov 14, 2017 at 3:18 PM, Matt Madison <matt@madison.systems>
>>> > wrote:
>>> >> For cross-canadian builds, we were accidentally using
>>> >> the crosssdk C compiler when building the Go compiler
>>> >> bootstrap.  Add a patch to the make script to let us
>>> >> use BUILD_CC, and prepend do_compile to set it in
>>> >> the local environment to ensure that the trailing
>>> >> blank gets stripped, since that confuses Go.
>>> >>
>>> >> [YOCTO #12341]
>>> >>
>>> >> Signed-off-by: Matt Madison <matt@madison.systems>
>>> >> ---
>>> >>  meta/recipes-devtools/go/go-1.9.inc                |  1 +
>>> >>  ...verride-CC-when-building-dist-and-go_boot.patch | 43
>>> >> ++++++++++++++++++++++
>>> >>  meta/recipes-devtools/go/go-common.inc             |  4 ++
>>> >>  3 files changed, 48 insertions(+)
>>> >>  create mode 100644
>>> >> meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>>> >>
>>> >> diff --git a/meta/recipes-devtools/go/go-1.9.inc
>>> >> b/meta/recipes-devtools/go/go-1.9.inc
>>> >> index 65adaa8..1dbb5ef 100644
>>> >> --- a/meta/recipes-devtools/go/go-1.9.inc
>>> >> +++ b/meta/recipes-devtools/go/go-1.9.inc
>>> >> @@ -15,6 +15,7 @@ SRC_URI += "\
>>> >>          file://0007-ld-add-soname-to-shareable-objects.patch \
>>> >>
>>> >> file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
>>> >>
>>> >> file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
>>> >> +
>>> >> file://0010-make.bash-override-CC-when-building-dist-and-go_boot.patch \
>>> >>  "
>>> >>  SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
>>> >>  SRC_URI[main.sha256sum] =
>>> >> "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
>>> >> diff --git
>>> >> a/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>>> >> b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>>> >> new file mode 100644
>>> >> index 0000000..94ea197
>>> >> --- /dev/null
>>> >> +++
>>> >> b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>>> >> @@ -0,0 +1,43 @@
>>> >> +From 36787fbf0e0a6298ba1038bbbae526654597eee4 Mon Sep 17 00:00:00 2001
>>> >> +From: Matt Madison <matt@madison.systems>
>>> >> +Date: Tue, 14 Nov 2017 07:38:42 -0800
>>> >> +Subject: [PATCH 10/10] make.bash: override CC when building dist and
>>> >> + go_bootstrap
>>> >> +
>>> >> +For cross-canadian builds, dist and go_bootstrap
>>> >> +run on the build host, so CC needs to point to the
>>> >> +build host's C compiler.  Add a BUILD_CC environment
>>> >> +for this, falling back to $CC if not present.
>>> >> +
>>> >> +Upstream-Status: pending
>>> >> +
>>> >> +Signed-off-by: Matt Madison <matt@madison.systems>
>>> >> +---
>>> >> + src/make.bash | 4 ++--
>>> >> + 1 file changed, 2 insertions(+), 2 deletions(-)
>>> >> +
>>> >> +diff --git a/src/make.bash b/src/make.bash
>>> >> +index 0bdadc6..f199349 100755
>>> >> +--- a/src/make.bash
>>> >> ++++ b/src/make.bash
>>> >> +@@ -131,7 +131,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
>>> >> +       exit 1
>>> >> + fi
>>> >> + rm -f cmd/dist/dist
>>> >> +-GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH=""
>>> >> "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
>>> >> ++CC=${BUILD_CC:-${CC}} GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH=""
>>> >> "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
>>> >> +
>>> >> + # -e doesn't propagate out of eval, so check success by hand.
>>> >> + eval $(./cmd/dist/dist env -p || echo FAIL=true)
>>> >> +@@ -167,7 +167,7 @@ elif [ "$1" = "--host-only" ]; then
>>> >> + fi
>>> >> +
>>> >> + if [ "$do_host_build" = "yes" ]; then
>>> >> +-      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds
>>> >> go_bootstrap
>>> >> ++      CC=${BUILD_CC:-${CC}} ./cmd/dist/dist bootstrap $buildall
>>> >> $GO_DISTFLAGS -v # builds go_bootstrap
>>> >> +       # Delay move of dist tool to now, because bootstrap may clear
>>> >> tool directory.
>>> >> +       mv cmd/dist/dist "$GOTOOLDIR"/dist
>>> >> +       echo
>>> >> +--
>>> >> +2.7.4
>>> >> +
>>> >> diff --git a/meta/recipes-devtools/go/go-common.inc
>>> >> b/meta/recipes-devtools/go/go-common.inc
>>> >> index ce1eb86..9af6873 100644
>>> >> --- a/meta/recipes-devtools/go/go-common.inc
>>> >> +++ b/meta/recipes-devtools/go/go-common.inc
>>> >> @@ -20,3 +20,7 @@ B = "${S}"
>>> >>
>>> >>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>>> >>  SSTATE_SCAN_CMD = "true"
>>> >> +
>>> >> +do_compile_prepend() {
>>> >> +       BUILD_CC=${BUILD_CC}
>>> >> +}
>>> >> --
>>> >> 2.7.4
>>> >>
>>> >> --
>>> >> _______________________________________________
>>> >> Openembedded-core mailing list
>>> >> Openembedded-core@lists.openembedded.org
>>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>> >
>>> >
>>> >
>>> > --
>>> > Otavio Salvador                             O.S. Systems
>>> > http://www.ossystems.com.br        http://code.ossystems.com.br
>>> > Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

