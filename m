Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3C68B72579
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 13:12:20 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id gd6so2394906lab.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 05:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dFfgdEChdavwlS7atx06o41jF2zxwWHdRS2v5ajOjsA=;
	b=ZnPQVQmfer2ZuVIkGTBDfPy8/8figzA8kPgmP8ZQ5MWBSHkVm6bUurLguZJBlUbf02
	aRH+0cJyFlYffKzjqIG/rl939T6KgXY1+OdZ3h0OZwNd8vJ9Yujx45NN/2cmKYZUNc0l
	fIlNPFoc+kMg/riCoxnYd3gln/cNLue+f1fPChqU+5wfLRGoXdeiQubOswO+jT0MmKzV
	YkwCdDX8qEG34PsOxD6HeNl3aPzgfb98J/GSGelnJ397XZ/w0XwZefGAWIsEnr8Woavq
	mG9Pu8Ba5pxL7uMS1W5Gv9LY5NAtXZwkSMSRwd0CwSNZNdbdHz2bh7vnihTdxcayTkxW
	WDBw==
MIME-Version: 1.0
X-Received: by 10.112.150.71 with SMTP id ug7mr3949567lbb.73.1418217140419;
	Wed, 10 Dec 2014 05:12:20 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Wed, 10 Dec 2014 05:12:20 -0800 (PST)
In-Reply-To: <cover.1418207729.git.bruce.ashfield@windriver.com>
References: <cover.1418207729.git.bruce.ashfield@windriver.com>
Date: Wed, 10 Dec 2014 08:12:20 -0500
Message-ID: <CADkTA4OD2-sWThuMisuNZjR07mis1RF44wvGHqjoMJSm6mvXUg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] kernel: version updates
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
X-List-Received-Date: Wed, 10 Dec 2014 13:12:23 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 10, 2014 at 5:38 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Richard,
>
> Here are the pending series of kernel updates. I've kep the commits to the
> granulatary that I did the version bumps, since they represent known good
> working points in time.
>
> Nothing too exciting, these are standard kernel -stable updates (and the
> typical lttng build fix for a tracepoint changing).
>
> The only item of note is that the 3.14 tree now has LTSI content merged into
> a dedicated branch and also into all BSPs.
>
> I've built this everywhere that I can, and I still have more builds running,
> but there's no sense sitting on this longer .. so I'm sending it out now, and
> will monitor for any issues that pop up.

When fixing my other series on my contrib  branch .. I now notices that the pull
request script isn't including the branches in the 0000 email on my laptop, but
is putting it in a pull-msg, which isn't going with the series.

These changes are on poky-contrib zedd/kernel-updates

I can resend the series if required.

Bruce

>
> Cheers,
>
> Bruce
>
> Bruce Ashfield (9):
>   linux-yocto/3.17: update to v3.17.1
>   linux-libc-headers: update to 3.17
>   linux-yocto/3.17: update to v3.17.2
>   linux-yocto/3.10: update to v3.10.59
>   linux-yocto/3.14: update to v3.14.24
>   lttng-modules: fix mm_compaction_isolate_template build
>   linux-yocto/3.17: update to v3.17.6
>   linux-yocto/3.10: update to v3.10.62
>   linux-yocto/3.14: update to 3.14.26, integrate ltsi and -rt updates
>
>  meta/conf/distro/include/tcmode-default.inc        |  2 +-
>  .../linux-libc-headers/linux-libc-headers_3.16.bb  |  7 ----
>  .../linux-libc-headers/linux-libc-headers_3.17.bb  |  7 ++++
>  meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++---
>  meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++-----
>  meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++-----
>  meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 18 +++++-----
>  ...-fix-mm_compaction_isolate_template-build.patch | 41 ++++++++++++++++++++++
>  meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb   |  1 +
>  13 files changed, 94 insertions(+), 52 deletions(-)
>  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.16.bb
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.bb
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/compaction-fix-mm_compaction_isolate_template-build.patch
>
> --
> 2.1.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

