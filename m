Return-Path: <rm.santos.caldas@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8782D7716C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 11:35:45 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id e3so31633957wme.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 04:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=rRmH+iZf5FUCOrGEBQgvx+yrRT9IDEAsbccd5pa0xQg=;
	b=F2V3SyHfbu7VO2Xt2p9u1WdvEMnivSK7QwCb6A4QSCUAuvr/aQvOJHOAHeYHoxbMWd
	9tQN/BFG0w8/QvsR9J27wWpw2XaTMBl2U3cLu8z8fT52bsaa20gbbuXxLkFs6sH4vzLl
	Fb9IdQ4w6mdWsNEwT0W7H5NXbOA781g65Zk9CmG2Lkc4rAxEGH8blTw52ByHHd1v2glU
	vnBegXWXP06x7qaeDdA4rOVgznE5dpr2+CBH9rdCKWS1Q452/qZnpv+cx76689rvtMlq
	7DO8jVNst0zFgptH/xgWfUfS3bNzaBtXjtWHnG4Oay1AZmlPgB65piKFIh9iWjngabaX
	+rYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=rRmH+iZf5FUCOrGEBQgvx+yrRT9IDEAsbccd5pa0xQg=;
	b=K1Q7TKiZ/dDEqpi7kktn013DOgxvyOHDzJOP8JV3iYXhkNvFLs2a3dQ2jJXiz8oAMV
	+vLd2RkVKIukypq3obAy50bzP/PYH4QFaVSP/NGfY9WHByBqtq+709qePu8JEn++GkBU
	EurJDt2gibu8VU1Z3rXppXIfR63qiRuoti1G0CNeotC+DmDtU/l56m3DaUUv0mDD37aS
	tzDEoKyfbizDtWuSrDC+HZAPTrHtXC9EqN+PztswbC0zzC1JHAZBTmuabgWZKhD/Szit
	ISU85PGS+nUc231/tOk083K7ljPU+pNKTeo4QlKgYV10ojZq2Q868c6QIGRVYJa05A74
	YGPw==
X-Gm-Message-State: ALyK8tJ9wPIaFVCgHwUb1eJoRwf/AfE+V7GcMxBLJdOcq6qhgIUMWbKfjTb/F0gANrpKzmKe1U9pWhVE/80AsA==
MIME-Version: 1.0
X-Received: by 10.194.242.65 with SMTP id wo1mr30354838wjc.54.1464694545456;
	Tue, 31 May 2016 04:35:45 -0700 (PDT)
Received: by 10.194.81.105 with HTTP; Tue, 31 May 2016 04:35:45 -0700 (PDT)
In-Reply-To: <1464613445-18617-1-git-send-email-ejo@pengutronix.de>
References: <20160528115341.4965-1-rm.santos.caldas@gmail.com>
	<1464613445-18617-1-git-send-email-ejo@pengutronix.de>
Date: Tue, 31 May 2016 12:35:45 +0100
Message-ID: <CA+21M5DUAvp1csE=kARmE2Fg3SyfzxDO0L2GuBsvpSMjiiN2Xg@mail.gmail.com>
From: Renato Caldas <rm.santos.caldas@gmail.com>
To: Enrico Jorns <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl-ptest.inc: fix tar call to prevent objcopy failure
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
X-List-Received-Date: Tue, 31 May 2016 11:35:48 -0000
Content-Type: text/plain; charset=UTF-8

Hi Enrico,

Sorry for the late reply, I missed this e-mail... Your suggestions are
very valid, although not strictly needed to fix this particular bug.

My suggestion is that you submit a new patch with those improvements
on top of the quick fix I made. I suggest you also add quotes to the
--exclude options per tar's man page.

You might also want to simplify the commit message a bit. I'm fairly
new to yocto (and my view may be wrong), but this is how I would do
it:
- change the component name from "perl-ptest.inc:" to "perl:"
- use the commit title to describe the change you made, not exactly
what bug it fixed. Example: "fix tar call according to its man page"
(or something like that)
- describe the change in simpler terms. Taking what you wrote, I would
rewrite it like this:

"The existing tar call on do_install_ptest() did not match the man
page, but worked with older tar versions. The new 1.29 version of tar
has stricter argument handling, and future versions may be even
stricter. Failure to use it according to its manual may result in
arguments being silently ignored and breaking the build."


So while changing the position of the "*" fixed it for tar 1.29, your
proposed changes are important to future-proof the perl recipe for
newer tar versions. As such, please do submit a new patch.

Cheers,
  Renato

2016-05-30 14:04 GMT+01:00 Enrico Jorns <ejo@pengutronix.de>:
> With tar version 1.29, the tar call used to copy the ptest files will
> not work anymore. While the call did not match the man page (but worked)
> before, anyway, the latest update of tar seems to have a more strict argument
> handling.
>
> With the current version of the tar call, the copying of files still
> works with latest tar version, but the excludes will not be handled
> properly anymore.
> This results in having binaries compiled with host GCC in the package.
> When doing the strip_and_split files in do_package() with the target
> objcopy, bitbake will fail with this error:
>
>   ERROR: objcopy failed with exit code 256 (cmd was [...])
>   [...]
>   File format not recognized
>
> Thus, the current argument issues and required changes are:
>
>  * Options must be placed _before_ the pathnames.
>
>  * --exclude must be followd by a '=' in order to work properly
>
>  * 'f' options is for providing an archive file, which is unnecessary in
>    this case
>
> Note that this could also be a candidate for backporting.
>
> Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
> ---
>
>
> I just wanted to send my patch when I saw you had already send it. Will send
> this one instead as I added some more changes that might be useful. Maybe we
> can squash this into yours if its found to be useful, too.
>
> Best regards, Enrico
>
>
>  meta/recipes-devtools/perl/perl-ptest.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
> index 948ea7c..5f0989f 100644
> --- a/meta/recipes-devtools/perl/perl-ptest.inc
> +++ b/meta/recipes-devtools/perl/perl-ptest.inc
> @@ -7,8 +7,8 @@ do_install_ptest () {
>         mkdir -p ${D}${PTEST_PATH}
>         sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
>         sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
> -       tar -cf - * --exclude \*.o --exclude libperl.so --exclude Makefile --exclude makefile --exclude hostperl \
> -               --exclude miniperl --exclude generate_uudmap --exclude patches | ( cd ${D}${PTEST_PATH} && tar -xf - )
> +       tar -c --exclude=\*.o --exclude=libperl.so --exclude=Makefile --exclude=makefile --exclude=hostperl \
> +               --exclude=miniperl --exclude=generate_uudmap --exclude=patches * | ( cd ${D}${PTEST_PATH} && tar -x )
>
>         sed -i -e "s,${D},,g" \
>                -e "s,--sysroot=${STAGING_DIR_HOST},,g" \
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

