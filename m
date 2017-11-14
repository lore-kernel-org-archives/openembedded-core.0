Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 648EF7850D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 17:20:33 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id o23so6425417otd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 09:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=QB8GAVeAWRCABLzSTlZo8gRVb5HAlEfJpEHQj97VKok=;
	b=oSwBHQSjcxtMc9U+EnJX79gaB77kBoOXD2hG4payPL69AidaymaZRxRtAOU/jsmiz4
	/5hja18JiP3nNs5KnWPGWJNck8YAobLeRdv8dTzqpQtrmaD8z7k5y5AlkpJpofjblFrs
	+PNrsFgsseEvScSWdkCrCwYlSz+NVmDOFtoBC0PVKDU92ASz4jjvovkgMXUY6+Sc7oX1
	JhRIklYtU/jj+pPA54CmGbxXqyofpXz804ZPTweLe4yfXgNReoxkIy7VeeTsx3fC9v9w
	R+gK7kUpk2+HDXtKy9tufrE6Zt7vhQKOICj/rqm7MfjBKYDk/+TMIs65eSZ0dvTW7tkF
	pH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=QB8GAVeAWRCABLzSTlZo8gRVb5HAlEfJpEHQj97VKok=;
	b=dgP9b5nYPAgRKVK0/QrCgj6n+TBcMYSLMhUnk/on/owtHSLU/lyMWnv0xzj0hVjpA1
	vIvTXpW5B/NzG/aRlR7tZmt7e5w2+6mpNl6pBBVYKDiM54Fe++y7NCHwZbty59ItXsiD
	kKaBS0OLtMYigG1ZwL7/xJNvJZUW8KdkW+vMYeWTwPbl9sAz6MTebSPKx1f7zLU5BNTF
	bv7A5gGD9Qh+E5TEhalzHgfbhToIzdXqTJDIlrTmc84V41wPGA/UVpSQlk9U70MqsHED
	E/h1fNzG+MBxfOZ7keTlzQ6903d6gpIiQhVYuI6921g7/tkPwBz3LuOLOY+RqSFcBVYI
	cAEQ==
X-Gm-Message-State: AJaThX58/rax7YZ2/lNY7X7n/z1WARzLY31x6C67q1/dqfbmCwl6b5ls
	CM9e0pxTR4/p49ztopRH5eY7Sm1H
X-Google-Smtp-Source: AGs4zMZzd2nPMfW7pVxE3w08vEiq+dFdcRoWCRaJA9kWvRclqEkesmWCfDsZgDrtDCsfWmkdd4xjjw==
X-Received: by 10.157.46.41 with SMTP id q38mr8389134otb.180.1510680034054;
	Tue, 14 Nov 2017 09:20:34 -0800 (PST)
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com.
	[74.125.82.181])
	by smtp.gmail.com with ESMTPSA id y8sm9050305otd.60.2017.11.14.09.20.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 09:20:33 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f181.google.com with SMTP id s4so8039177ote.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 09:20:32 -0800 (PST)
X-Received: by 10.157.24.52 with SMTP id b49mr4642444ote.476.1510680032327;
	Tue, 14 Nov 2017 09:20:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Tue, 14 Nov 2017 09:20:31 -0800 (PST)
In-Reply-To: <1510679926-24611-1-git-send-email-matt@madison.systems>
References: <1510679926-24611-1-git-send-email-matt@madison.systems>
Date: Tue, 14 Nov 2017 15:20:31 -0200
X-Gmail-Original-Message-ID: <CAP9ODKr6V9rtuVzx8uN6Mr-ke1jW=Q411b=unZn+hZo1t_zh7g@mail.gmail.com>
Message-ID: <CAP9ODKr6V9rtuVzx8uN6Mr-ke1jW=Q411b=unZn+hZo1t_zh7g@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
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
X-List-Received-Date: Tue, 14 Nov 2017 17:20:33 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Matt,

A minor thing:

Upstream-Status: Pending

On Tue, Nov 14, 2017 at 3:18 PM, Matt Madison <matt@madison.systems> wrote:
> For cross-canadian builds, we were accidentally using
> the crosssdk C compiler when building the Go compiler
> bootstrap.  Add a patch to the make script to let us
> use BUILD_CC, and prepend do_compile to set it in
> the local environment to ensure that the trailing
> blank gets stripped, since that confuses Go.
>
> [YOCTO #12341]
>
> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>  meta/recipes-devtools/go/go-1.9.inc                |  1 +
>  ...verride-CC-when-building-dist-and-go_boot.patch | 43 ++++++++++++++++++++++
>  meta/recipes-devtools/go/go-common.inc             |  4 ++
>  3 files changed, 48 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
> index 65adaa8..1dbb5ef 100644
> --- a/meta/recipes-devtools/go/go-1.9.inc
> +++ b/meta/recipes-devtools/go/go-1.9.inc
> @@ -15,6 +15,7 @@ SRC_URI += "\
>          file://0007-ld-add-soname-to-shareable-objects.patch \
>          file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
>          file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
> +        file://0010-make.bash-override-CC-when-building-dist-and-go_boot.patch \
>  "
>  SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
>  SRC_URI[main.sha256sum] = "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
> diff --git a/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
> new file mode 100644
> index 0000000..94ea197
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
> @@ -0,0 +1,43 @@
> +From 36787fbf0e0a6298ba1038bbbae526654597eee4 Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Tue, 14 Nov 2017 07:38:42 -0800
> +Subject: [PATCH 10/10] make.bash: override CC when building dist and
> + go_bootstrap
> +
> +For cross-canadian builds, dist and go_bootstrap
> +run on the build host, so CC needs to point to the
> +build host's C compiler.  Add a BUILD_CC environment
> +for this, falling back to $CC if not present.
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +---
> + src/make.bash | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/make.bash b/src/make.bash
> +index 0bdadc6..f199349 100755
> +--- a/src/make.bash
> ++++ b/src/make.bash
> +@@ -131,7 +131,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
> +       exit 1
> + fi
> + rm -f cmd/dist/dist
> +-GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> ++CC=${BUILD_CC:-${CC}} GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> +
> + # -e doesn't propagate out of eval, so check success by hand.
> + eval $(./cmd/dist/dist env -p || echo FAIL=true)
> +@@ -167,7 +167,7 @@ elif [ "$1" = "--host-only" ]; then
> + fi
> +
> + if [ "$do_host_build" = "yes" ]; then
> +-      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstrap
> ++      CC=${BUILD_CC:-${CC}} ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstrap
> +       # Delay move of dist tool to now, because bootstrap may clear tool directory.
> +       mv cmd/dist/dist "$GOTOOLDIR"/dist
> +       echo
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
> index ce1eb86..9af6873 100644
> --- a/meta/recipes-devtools/go/go-common.inc
> +++ b/meta/recipes-devtools/go/go-common.inc
> @@ -20,3 +20,7 @@ B = "${S}"
>
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  SSTATE_SCAN_CMD = "true"
> +
> +do_compile_prepend() {
> +       BUILD_CC=${BUILD_CC}
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

