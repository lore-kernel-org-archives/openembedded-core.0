Return-Path: <matt@madison.systems>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA1D78507
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 17:21:35 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id n69so23209468lfn.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 09:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SELWLQWiczMHpSEONHcavknXTt38UnP43dyjBA+P/yY=;
	b=ag46NHmXvZ/L6NivAWNtbXdYVhY/0jHael0Ssv4VJQf2fHL/3pWP/vPH+er5+vUItN
	GN4jDSZhAgov/FRoStYdJhk30V5vaedjaE14QZ+CFF08T254+umpr8kvbIXQtQVmG31r
	4ACLEg3kCI1eB9LpwajTjNl/h8SX3cGCMANzzRsctj1H0zjyS9G8F7H+kFJ/AKV5OnS6
	xk7BKd4SsdGLjahvJ8Qk8BOPUnB0I65zoVrcEEWtbqt05r6bd9hOK1OXIrltKQ20S6BV
	bUH9yBESfgCrBre3/rA3/k1452QuRrvFn9z2Y4Cwnne9BqDRcXD98/sqMJW5InddVb8h
	4GIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SELWLQWiczMHpSEONHcavknXTt38UnP43dyjBA+P/yY=;
	b=QUN4hl66h+su46dL74XjMbkwRkilkf9hf+cg4KZ+gEqOMciEA7Od8my+YahGIbOfrl
	9RMKHpb3nEdJ3QZ7cR92hBXaattA0EILHM7jFESzP8g5J1Lz6BipGRG/Jmo8Ly9oSa23
	mDG6L5ZiHRA8cwoBE64eQ7EmO+8/YY1UpNrn3ya8b7jGMKzbfksB49dIREMNZEBPr+Nh
	pb2oFqWwb2QklvpgZ31IGufC6wnva3lxlsYscR8BpvX2w+HI6a/CuTYCSYn3k+S311pj
	vE/kXzPqh1NucW0I5eYDmoR0La09gJhuX6Jn44wii09WR9ZIgz0AQhUovyz89Xo8m2t9
	aw+A==
X-Gm-Message-State: AJaThX4LX3dgSejgPuqRU6x34Yej1GlMqWNhpMEmKYB0sagolP122t6t
	8/MFz1XELHkFhS1+NwnwmGAeUkJnWd4aLthd/D1l6A==
X-Google-Smtp-Source: AGs4zMZrOed0zKLk9bj+GrR5Zs6D/2RiKF8SpycdzlqlB0t6yD8tTL4yENXPqJLOdLCr+ZfeQN5GXX1Tq3FREncODFo=
X-Received: by 10.46.70.25 with SMTP id t25mr5585778lja.148.1510680095897;
	Tue, 14 Nov 2017 09:21:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.158.198 with HTTP; Tue, 14 Nov 2017 09:21:35 -0800 (PST)
In-Reply-To: <CAP9ODKr6V9rtuVzx8uN6Mr-ke1jW=Q411b=unZn+hZo1t_zh7g@mail.gmail.com>
References: <1510679926-24611-1-git-send-email-matt@madison.systems>
	<CAP9ODKr6V9rtuVzx8uN6Mr-ke1jW=Q411b=unZn+hZo1t_zh7g@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Tue, 14 Nov 2017 09:21:35 -0800
Message-ID: <CAGgRHJoGLRhhyjPzWGna9wSPK1Y33f9FqgsRJPHr_XPj_=ZEyg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: "Eggleton, Paul" <paul.eggleton@linux.intel.com>,
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
X-List-Received-Date: Tue, 14 Nov 2017 17:21:35 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, drat it, v3 should fix that.

Thanks,
-Matt

On Tue, Nov 14, 2017 at 9:20 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> Hello Matt,
>
> A minor thing:
>
> Upstream-Status: Pending
>
> On Tue, Nov 14, 2017 at 3:18 PM, Matt Madison <matt@madison.systems> wrote:
>> For cross-canadian builds, we were accidentally using
>> the crosssdk C compiler when building the Go compiler
>> bootstrap.  Add a patch to the make script to let us
>> use BUILD_CC, and prepend do_compile to set it in
>> the local environment to ensure that the trailing
>> blank gets stripped, since that confuses Go.
>>
>> [YOCTO #12341]
>>
>> Signed-off-by: Matt Madison <matt@madison.systems>
>> ---
>>  meta/recipes-devtools/go/go-1.9.inc                |  1 +
>>  ...verride-CC-when-building-dist-and-go_boot.patch | 43 ++++++++++++++++++++++
>>  meta/recipes-devtools/go/go-common.inc             |  4 ++
>>  3 files changed, 48 insertions(+)
>>  create mode 100644 meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>>
>> diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
>> index 65adaa8..1dbb5ef 100644
>> --- a/meta/recipes-devtools/go/go-1.9.inc
>> +++ b/meta/recipes-devtools/go/go-1.9.inc
>> @@ -15,6 +15,7 @@ SRC_URI += "\
>>          file://0007-ld-add-soname-to-shareable-objects.patch \
>>          file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
>>          file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
>> +        file://0010-make.bash-override-CC-when-building-dist-and-go_boot.patch \
>>  "
>>  SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
>>  SRC_URI[main.sha256sum] = "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
>> diff --git a/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>> new file mode 100644
>> index 0000000..94ea197
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>> @@ -0,0 +1,43 @@
>> +From 36787fbf0e0a6298ba1038bbbae526654597eee4 Mon Sep 17 00:00:00 2001
>> +From: Matt Madison <matt@madison.systems>
>> +Date: Tue, 14 Nov 2017 07:38:42 -0800
>> +Subject: [PATCH 10/10] make.bash: override CC when building dist and
>> + go_bootstrap
>> +
>> +For cross-canadian builds, dist and go_bootstrap
>> +run on the build host, so CC needs to point to the
>> +build host's C compiler.  Add a BUILD_CC environment
>> +for this, falling back to $CC if not present.
>> +
>> +Upstream-Status: pending
>> +
>> +Signed-off-by: Matt Madison <matt@madison.systems>
>> +---
>> + src/make.bash | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/make.bash b/src/make.bash
>> +index 0bdadc6..f199349 100755
>> +--- a/src/make.bash
>> ++++ b/src/make.bash
>> +@@ -131,7 +131,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
>> +       exit 1
>> + fi
>> + rm -f cmd/dist/dist
>> +-GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
>> ++CC=${BUILD_CC:-${CC}} GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
>> +
>> + # -e doesn't propagate out of eval, so check success by hand.
>> + eval $(./cmd/dist/dist env -p || echo FAIL=true)
>> +@@ -167,7 +167,7 @@ elif [ "$1" = "--host-only" ]; then
>> + fi
>> +
>> + if [ "$do_host_build" = "yes" ]; then
>> +-      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstrap
>> ++      CC=${BUILD_CC:-${CC}} ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstrap
>> +       # Delay move of dist tool to now, because bootstrap may clear tool directory.
>> +       mv cmd/dist/dist "$GOTOOLDIR"/dist
>> +       echo
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
>> index ce1eb86..9af6873 100644
>> --- a/meta/recipes-devtools/go/go-common.inc
>> +++ b/meta/recipes-devtools/go/go-common.inc
>> @@ -20,3 +20,7 @@ B = "${S}"
>>
>>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>>  SSTATE_SCAN_CMD = "true"
>> +
>> +do_compile_prepend() {
>> +       BUILD_CC=${BUILD_CC}
>> +}
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

