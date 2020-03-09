Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id DB09A60742
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 04:46:02 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id i19so600161lfl.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Mar 2020 21:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KQE9Qa5Jza3cgs01eybdllE1YnQfPykFGLzzCSRebl4=;
	b=LZYpoD4KDWQNZyPKyjsGxANCYkeU8EROukGvNPpmhCzdAemcH2eSj7M9FOL9EsrO4w
	4xx63tZrCE8GgsJdCj9HEojU/tb9F5GtQE/nCnD94/qyd+oTCpqLE3G557alHEvU0SYE
	hhvOEWZeiEC9s0PggaAU1ky3bOiuJctbsM3AxNtHbIPB+65RTxHmUhovLEnvIItmQQYv
	bA4VuH3Sq25GSjLb1WEFCpWkIOr4af0aPZgbGVoClhjaFn002gPdSelSCsZKJOJ7ohsL
	MBHeLir/U7eLGtc7Qehn1yJCszwXT8lUwqYbKl3NnwVJTYO/4jdOBGIFrpErQ5B1y5TR
	Ffgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KQE9Qa5Jza3cgs01eybdllE1YnQfPykFGLzzCSRebl4=;
	b=j3s5b5ys7MgaLeCdv38pDo3C0ZV2QwIiiShk1M0vw5atvKpq42ue0lh1AGyGNmXaR5
	g+6N9KGHBSVnrRZ7b8eWy/vp5AZaG8GbV/e/oejH2lJnTruSS87+rMvIlGgrpzGeboSu
	KuZBo3mvaQhGr4rdc/8PnSe9yeU+Yc88PU71T+4yQc4XjDhhsI1liBRvmEm5JzvYpN7R
	f9PoyWEgo/lVo5RAra4GPG1ds9rQPWarGYIzB7EEeMEYFOcEstnrG5Ia0nYQD8DAqe5C
	QCZQ6FJcxXe+mRMy7pvq742xpm/pWdH+zcL9E91rcfbxlJxeyNIiOLTMDtmwj7EQUYhg
	eihw==
X-Gm-Message-State: ANhLgQ137AUk11fQRIvGeEXIa2vsK+3k+aHFJKO1Oc3Bxcbrd7LZi5ZA
	bmc8sCzZ3JhhSooFoVg4hFRj1PB2AOS9O80dTBo=
X-Google-Smtp-Source: ADFU+vtNUcMaGuVg+EWjdA4yMq4gf+t1eb9+vzB2rBV0RLrxVZX47Mqbipsb29AAA1g0M67ZJNcF/siS57oauFGw6ok=
X-Received: by 2002:a19:6513:: with SMTP id z19mr6747388lfb.207.1583729163018; 
	Sun, 08 Mar 2020 21:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200307200330.23915-1-christopher.w.clark@gmail.com>
	<CAO5Uq5RJg=Drr1GfjywP_EUY7Z6W_ouwoaRTcUc_EBETWVy-Tw@mail.gmail.com>
In-Reply-To: <CAO5Uq5RJg=Drr1GfjywP_EUY7Z6W_ouwoaRTcUc_EBETWVy-Tw@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sun, 8 Mar 2020 21:45:51 -0700
Message-ID: <CACMJ4Gam_veydp47tJN-WJ=VJ7KodZqQrvkTVLvMsXHv3O4qZA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: fix SOURCE_DATE_EPOCH for non-git kernel builds
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
X-List-Received-Date: Mon, 09 Mar 2020 04:46:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 7, 2020 at 2:34 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Sat, Mar 7, 2020 at 8:04 PM <christopher.w.clark@gmail.com> wrote:
> >
> > From: Christopher Clark <christopher.w.clark@gmail.com>
> >
> > Only use git to set SOURCE_DATE_EPOCH if ${S} is the top level of a git
> > repository.
> >
> > Fixes the following errors with the prior logic when building a kernel
> > that is not obtained from a git repository:
> >
> > 1. With TMPDIR set to a directory outside any git repository on a
> > mounted filesystem, reproducible builds fail in do_compile with this git
> > error:
> >
> >   fatal: not a git repository (or any parent up to mount point <abspath>)
> >   Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
> >
> > aborting before the error handling logic.
> >
> > 2. With TMPDIR located within a subdirectory of a git repository, the
> > SOURCE_DATE_EPOCH timestamp would be that of said repository rather than
> > that of the kernel.
> >
> > Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> > ---
> >  meta/classes/kernel.bbclass | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 0eadd3efb8..2603f24709 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -296,10 +296,14 @@ kernel_do_compile() {
> >                 if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
> >                         olddir=`pwd`
> >                         cd ${S}
> > -                       SOURCE_DATE_EPOCH=`git log  -1 --pretty=%ct`
> > -                       # git repo not guaranteed, so fall back to REPRODUCIBLE_TIMESTAMP_ROOTFS
> > -                       if [ $? -ne 0 ]; then
> > -                               SOURCE_DATE_EPOCH=${REPRODUCIBLE_TIMESTAMP_ROOTFS}
> > +                       # This kernel dir is not necessarily a git repo and we
> > +                       # must ensure that git does not incorrectly query a
> > +                       # repository in a parent directory.
> > +                       GIT_TOP=`git rev-parse --show-toplevel 2>/dev/null || echo ""`
> > +                       if [ "${S}" = "${GIT_TOP}" ]; then
>
> Will that work if ${S} isn't a canonical path?

Good question; it would be better to avoid the comparison.

>
> > +                               SOURCE_DATE_EPOCH=`git log  -1 --pretty=%ct`
> > +                       else
> > +                               SOURCE_DATE_EPOCH="${REPRODUCIBLE_TIMESTAMP_ROOTFS}"
> >                         fi
> >                         cd $olddir
> >                 fi
>
> Would something like this resolve the problem (untested):

Thanks for the suggestion to use the git-dir option. git is somewhat
picky about argument ordering and any error encountered at that point
aborts the build rather than falling into error handling logic below,
but I have a revised v2 patch now that I will post shortly.

Christopher

>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 0eadd3efb8d9..a17ca7adccca 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -294,14 +294,11 @@ kernel_do_compile() {
>                 # kernel sources do not use do_unpack, so
> SOURCE_DATE_EPOCH may not
>                 # be set....
>                 if [ "${SOURCE_DATE_EPOCH}" = "" -o
> "${SOURCE_DATE_EPOCH}" = "0" ]; then
> -                       olddir=`pwd`
> -                       cd ${S}
> -                       SOURCE_DATE_EPOCH=`git log  -1 --pretty=%ct`
> +                       SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git}"
> log  -1 --pretty=%ct`
>                         # git repo not guaranteed, so fall back to
> REPRODUCIBLE_TIMESTAMP_ROOTFS
>                         if [ $? -ne 0 ]; then
>
> SOURCE_DATE_EPOCH=${REPRODUCIBLE_TIMESTAMP_ROOTFS}
>                         fi
> -                       cd $olddir
>                 fi
>
>                 ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
>
> --
> Alex Kiernan

