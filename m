Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id EB3FB7C4A0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 10:20:11 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p4so6439202wrt.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 02:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=voNq0HRBSPblHu0pxcG51yNWG0+YdjRwJejqLRpivFs=;
	b=PmFG0JAFWPHGx+dC9RU9THbhz+tClbCYJkwZtawtkNjuAnisB1zDgencq1szVcea+5
	wJQbJyLvW3fpS3DmCG4h9adh8PlqeVPVLlbnPFbtliccUXsQx90085VnbynA6fP8K+SE
	Zy6/Hz/HrsxVv0b3Dxz37AXGpDMZct8kEfKhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=voNq0HRBSPblHu0pxcG51yNWG0+YdjRwJejqLRpivFs=;
	b=ny+lx4cEsWz0jOHdmYhKicjs8kOXISaueKk6ciUw/5JMm7OoQcTwlPgXEZrPx37FEY
	eSd/toRjoLrMgXfB1xgquY2O1rgbNwpFN18pVX5Z3GCtJWlaAWqDddnPR7FGZH92V0ep
	tESBc18bB50CPt6CJZGXFumZiKxpsHaUHSy4Cm2KNHBDeg/7g4M1n3/ce+Fb3oYv9OcM
	+6oFhfbpEF2LT6FpqrMGN6IV4PJLisOOrdO5dXjdiRmbu8DBSubMLJfVZaytX0pId+no
	Wxytk7GVmZHrazS3R6+y3imeJAy9FYl7v+wXD4awxaIkJ/2YP1xZbPQZ4LLSK+jUvldl
	XLXw==
X-Gm-Message-State: AJcUukfvAblrmtxarGfpVhZg5LEBbJeWx4qJZDHRZ86WlBdPuHsJDZgE
	aIWMuZzKPIyu+OhlpN3PPz9ysrORZqI=
X-Google-Smtp-Source: ALg8bN43Vzzp+gSZi4MBIzvYB8vddEm5TZgAMjDDehmxT1N3PJZ1QbCaAcqlaDVe9X7l9Rxh2/5SLw==
X-Received: by 2002:adf:e846:: with SMTP id d6mr38890835wrn.72.1549016412518; 
	Fri, 01 Feb 2019 02:20:12 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id q12sm1030630wmf.2.2019.02.01.02.20.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Feb 2019 02:20:11 -0800 (PST)
Message-ID: <3e0560e858598be43db31dac6ff4d8ff6f88d768.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Fri, 01 Feb 2019 10:20:10 +0000
In-Reply-To: <a8f5b5c4bf1d9004c564500f7b6f1fd3da1715b1.camel@pbcl.net>
References: <a8f5b5c4bf1d9004c564500f7b6f1fd3da1715b1.camel@pbcl.net>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] go, go-common: Add missing quotes in shell variable assignment
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
X-List-Received-Date: Fri, 01 Feb 2019 10:20:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-31 at 12:43 +0000, Phil Blundell wrote:
> Otherwise we will lose if ${BUILD_CC} happens to contain a space.
> 
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>  meta/recipes-devtools/go/go-common.inc | 2 +-
>  meta/recipes-devtools/go/go_1.9.bb     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-
> devtools/go/go-common.inc
> index 11d55c4d36..d6dc455813 100644
> --- a/meta/recipes-devtools/go/go-common.inc
> +++ b/meta/recipes-devtools/go/go-common.inc
> @@ -29,5 +29,5 @@ export GOCACHE = "off"
>  export CGO_ENABLED = "1"
>  
>  do_compile_prepend() {
> -	BUILD_CC=${BUILD_CC}
> +	BUILD_CC="${BUILD_CC}"
>  }
> diff --git a/meta/recipes-devtools/go/go_1.9.bb b/meta/recipes-
> devtools/go/go_1.9.bb
> index ec5a314e7d..e121e2790f 100644
> --- a/meta/recipes-devtools/go/go_1.9.bb
> +++ b/meta/recipes-devtools/go/go_1.9.bb
> @@ -9,7 +9,7 @@ export CXX_FOR_TARGET = "${CXX}"
>  do_compile() {
>  	export GOBIN="${B}/bin"
>  	export TMPDIR="$GOTMPDIR"
> -	export CC=$BUILD_CC
> +	export CC="$BUILD_CC"
>  
>  	cd src
>  	./make.bash
> 

Whilst this looks like a fine idea in principle, something doesn't like
it and the regression tests fail:

ERROR: go-native-1.11.4-r0 do_compile: Function failed: do_compile (log file is located at /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86_64-linux/go-native/1.11.4-r0/temp/log.do_compile.15400)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86_64-linux/go-native/1.11.4-r0/temp/log.do_compile.15400
Log data follows:
| DEBUG: Executing shell function do_compile
| Building Go cmd/dist using /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86_64-linux/go-native/1.11.4-r0/go1.4/go.
| go tool dist: cannot invoke C compiler "gcc ": exec: "gcc ": executable file not found in $PATH
| 
| Go needs a system C compiler for use with cgo.
| To set a C compiler, set CC=the-compiler.
| To disable cgo, set CGO_ENABLED=0.
| 

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/244/steps/7/logs/step1b

Cheers,

Richard


