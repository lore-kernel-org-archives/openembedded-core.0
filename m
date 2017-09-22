Return-Path: <matt@madison.systems>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7B67B6E671
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 13:32:47 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id u21so1152780lfk.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 06:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D9142lNkAbnpjIZhPPLoaf0H7OuC/q0OQa/bHQL+9oY=;
	b=oSaKaRoBt7drLQ8dXqnYtK5/smNgKrLkZ1R9XI6lX1eRU8bYWydtKPJHVRAwkUpeOx
	UArU0kKq1DBZrMswxzj44TWcfDplu9E+NUW+k8/otEM6t2sY+VWcdSHuxIE3tzKB8yBg
	GLitcZmm1/uEkZ0ct3ojgAKW5R2j98zM55Rh6X2LguujyKorwKVtJ7D2Izi9+c38aPuF
	hLv8JMxher8iYophE9kapEjz2le2vaJRC8j4tnjC6IF9+Tg9WDHJ6vXKXomDJLnaz9J3
	ANp4Q665IfTvpsWnoYwznS9BGThAYH733xmnVGiVd3IiLMl2GfSrGgIuxXoJKeAqob6u
	gRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D9142lNkAbnpjIZhPPLoaf0H7OuC/q0OQa/bHQL+9oY=;
	b=QLMYZpsFP46IWczbkeCjDIlm3QlZcr+9x8YPqRz2zzaQyInpcQ68ygDo+tvKEeXcA2
	beNiZEVpWPSFuOHWveN5Qd+FubBobn+N5zMYWhTwxiHXbwYGHKJURVnLoMOfP4m8/W5r
	hsKXBfJCowJ0+XO0Ll2QovzDYkZvZTlJtLiNRBVS+HiuhObIv2yCI0Ug6AyKvBc8Cy2p
	n0zEJKHjSgmKj3kSVswo5nrFRCf4DlvD9jW5AC0YrntilCYTFlMcBb3zFDM7Ojb/98Ji
	MFUkSj0MPGNHlc9q4dHbQF2OGFVxfpIV/CCY5J5aiAYfqRbsfQg7pJl/FU9C7qXpgZgT
	SHNQ==
X-Gm-Message-State: AHPjjUgS7wajpd0BLwT1s8mjwinWTIkPSXNup5dOqN3vDuXz+XwnxUxT
	mqsszQ7vePXIodfp2bgzDTa9I0HnRPaedOW3pnwb9g==
X-Google-Smtp-Source: AOwi7QAJmYNZbo1PJl4bpHptLl2HJbHc24izF1EwAa26T/h1vCW4P7HlRnXzPI7ED1jc6zLaz3LL4wWUYrfy0E2IcZY=
X-Received: by 10.25.213.143 with SMTP id m137mr2099693lfg.126.1506087168007; 
	Fri, 22 Sep 2017 06:32:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.213.146 with HTTP; Fri, 22 Sep 2017 06:32:47 -0700 (PDT)
In-Reply-To: <20170921174216.33386-2-raj.khem@gmail.com>
References: <20170921174216.33386-1-raj.khem@gmail.com>
	<20170921174216.33386-2-raj.khem@gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Fri, 22 Sep 2017 06:32:47 -0700
Message-ID: <CAGgRHJpUfSJ8bCd8ZquvZEDJ=0Zkw0uMDAADrK04OZBLnKmOdg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] go: Remove mips32r2 from march to get cgo working
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
X-List-Received-Date: Fri, 22 Sep 2017 13:32:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 21, 2017 at 10:42 AM, Khem Raj <raj.khem@gmail.com> wrote:
> on mips, cgo used mips32r1 and that conflicts with mips32r2
> lets remove it for now and work go upstream to make it work
> for golang as well

There is already someone working on expanding MIPS support for go,
based on some mailing list discussions I've seen.  Doesn't look like
the changes have made it in yet, but looked like they could for 1.10.

>
> Fixes
> | # runtime/cgo
> | cc1: error: '-mips32r2' conflicts with the other architecture options, which specify a mips32 processor
>
> Fixes [YOCTO #12108]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/go/go-common.inc | 4 ++++
>  meta/recipes-devtools/go/go_1.9.bb     | 2 --
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
> index ce1eb86812..41f661bc4e 100644
> --- a/meta/recipes-devtools/go/go-common.inc
> +++ b/meta/recipes-devtools/go/go-common.inc
> @@ -20,3 +20,7 @@ B = "${S}"
>
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  SSTATE_SCAN_CMD = "true"
> +
> +TUNE_CCARGS_remove = "-march=mips32r2"

The rework for this should probably go into goarch.bblcass, so it
applies to go packages as well as the toolchain.  The mips checks in
goarch.bbclass need some refinement anyway, since Go only supports o32
ABI and hard-float.  I can send along a patch that should cover what's
needed.

-Matt


> +SECURITY_CFLAGS = "${SECURITY_NOPIE_CFLAGS}"
> +SECURITY_LDFLAGS = ""
> diff --git a/meta/recipes-devtools/go/go_1.9.bb b/meta/recipes-devtools/go/go_1.9.bb
> index 08ab793f86..c67e2cb050 100644
> --- a/meta/recipes-devtools/go/go_1.9.bb
> +++ b/meta/recipes-devtools/go/go_1.9.bb
> @@ -1,4 +1,2 @@
>  require go-${PV}.inc
>  require go-target.inc
> -TUNE_CCARGS_remove = "-march=mips32r2"
> -SECURITY_PIE_CFLAGS_remove = "-fPIE -pie"
>
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

