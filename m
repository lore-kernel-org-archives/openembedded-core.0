Return-Path: <danismostlikely@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4A44A744AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 14:28:18 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id p89-v6so31035925ljb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N8rdkhj46kShUjl1BG27LJR0zQSHnVvd+vzE3EDWnSQ=;
	b=W4Xk2WsMFudUK29o0sd/q93YQVkZNAs11x8ImjFe6QMfa8wAAW5a7e5Of52E9aDqKz
	Ezo0zdie926HPk/YItRO0xZi4YBnLOKc1nsZiNAbZt5Sq135hTt/WHBnWQBYgn2PevaI
	Dx6jKrg1NWBYWjNix5qOpJmLwFbk51IwJK4LmA74AhdhhhG5bzNhh1aW+QAnksRiB60N
	vr7cMlUPZ3OXR01w7nQV/SVn9yX5+BPMRlETC+WIblWZVhZfKIAX068WPzFxoe1zTigC
	bIEu/cZsSRQ2oeYNTuLF1fju5O4pq/MxGFd5XGRu6M5u3vW/GH2N1bztJFqQanl8whiC
	fp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N8rdkhj46kShUjl1BG27LJR0zQSHnVvd+vzE3EDWnSQ=;
	b=c+vZ7vhdiRhEnEMM8SXZJ3TXLRIf4qTdCEEI/fMgwZmGHnNnTG4rXqAmaL3uZYxNU3
	i+wZmx9YOdevW43JLTwjK6S42bE7kQM6lNR20CquzpK0puzc7JntoStHXDYA5yqLxA+Q
	VOtSwqPDDPvZxTJQqycUoavjf+TkwspxjKPCbi6sCr9VxZKQLsihW8HxNYhVTrvymoy8
	9EVR7HeqEljxT45zIOCv3RiR73SBxpF8VpxrXMFsxQQG3Akferkwv1+f5QuVL0Qg+FDc
	atgLyqnM4bwB4ato1A18XlgibvhFOj4cr1m5fiG90gWBjaidsL9zXqBqvgUj8qn2evxH
	miiQ==
X-Gm-Message-State: ABuFfoj6AOzyTRh0M25zAWUK1fP2qqgZRYm/D8TsPEvPYROETNkhpRfS
	GsYrTPeMIpBRaIjQSfvV9QsnzEHlJemZBxVQpa8=
X-Google-Smtp-Source: ACcGV61am8t7T5eTb0Ht8lTkGBpI/hGJT5eyCenLburyszRSucnvgmm1ojghwJgfc2xqUK1jWOf+mSkeM1aTQEl/szk=
X-Received: by 2002:a2e:1456:: with SMTP id
	22-v6mr22692184lju.116.1539959298547; 
	Fri, 19 Oct 2018 07:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20181018152215.23525-1-danismostlikely@gmail.com>
	<fa65fef901b5056d730703ce1c01a1594b2dc37c.camel@linuxfoundation.org>
	<64558ddd-8865-a96b-cc19-5c0e6d270754@windriver.com>
	<ade6aec7-e193-bc8e-531f-811a17cb6bbf@windriver.com>
In-Reply-To: <ade6aec7-e193-bc8e-531f-811a17cb6bbf@windriver.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Fri, 19 Oct 2018 08:28:06 -0600
Message-ID: <CACS+7ZTbhUxqBPHNB+SkFxSmU70cJ1q623zywjkmJ5v8c3Nb5Q@mail.gmail.com>
To: randy.macleod@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] util-linux: alternatify cal, rev, and ionice
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
X-List-Received-Date: Fri, 19 Oct 2018 14:28:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Oct 2018 at 08:24, Randy MacLeod <randy.macleod@windriver.com> wrote:
>
> On 10/19/18 10:18 AM, Randy MacLeod wrote:
> > On 10/19/18 9:47 AM, Richard Purdie wrote:
> >> On Thu, 2018-10-18 at 09:22 -0600, Dan McGregor wrote:
> >>> From: Dan McGregor <dan.mcgregor@usask.ca>
> >>>
> >>> These are also provided by toybox in its default configuration,
> >>> and can be turned on in busybox.
> >>>
> >>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> >>> ---
> >>>   meta/recipes-core/util-linux/util-linux.inc | 10 ++++++----
> >>>   1 file changed, 6 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/meta/recipes-core/util-linux/util-linux.inc
> >>> b/meta/recipes-core/util-linux/util-linux.inc
> >>> index 3d8b3ff592c..2f99e8409f5 100644
> >>> --- a/meta/recipes-core/util-linux/util-linux.inc
> >>> +++ b/meta/recipes-core/util-linux/util-linux.inc
> >>> @@ -93,7 +93,7 @@ FILES_util-linux-findfs = "${sbindir}/findfs"
> >>>   FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
> >>>   FILES_util-linux-runuser = "${sbindir}/runuser"
> >>>   FILES_util-linux-prlimit = "${bindir}/prlimit"
> >>> -FILES_util-linux-ionice = "${bindir}/ionice"
> >>> +FILES_util-linux-ionice = "${bindir}/ionice.${BPN}"
> >>>   FILES_util-linux-su = "${bindir}/su.util-linux
> >>> ${sysconfdir}/pam.d/su-l"
> >>>   CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
> >>> @@ -209,7 +209,7 @@ ALTERNATIVE_${PN}  = " \
> >>>       dmesg kill more mkswap blockdev pivot_root \
> >>>       hexdump last lastb logger mesg renice wall \
> >>>       setsid chrt flock utmpdump eject nologin taskset fallocate \
> >>> -    fsfreeze nsenter \
> >>> +    fsfreeze nsenter cal rev \
> >>>   "
> >>>   ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
> >>> @@ -218,8 +218,10 @@ ALTERNATIVE_LINK_NAME[more] =
> >>> "${base_bindir}/more"
> >>>   ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
> >>>   ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
> >>>   ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
> >>> +ALTERNATIVE_LINK_NAME[cal] = "${bindir}/cal"
> >>>   ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
> >>>   ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
> >>> +ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
> >>>   ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
> >>>   ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
> >>> @@ -293,8 +295,8 @@ ALTERNATIVE_LINK_NAME[mountpoint] =
> >>> "${base_bindir}/mountpoint"
> >>>   ALTERNATIVE_util-linux-unshare = "unshare"
> >>>   ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
> >>> -ALTERNATIVE_util-linux-switch-root = "switch_root"
> >>> -ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
> >>> +ALTERNATIVE_util-linux-ionice = "ionice"
> >>> +ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
> >>
> >>
> >> The rebase went wrong here. I'll try and fix this up in -next and
> >> retest so we can figure out if switch_root really is broken (cc
> >> Randy)...
> >
> > Ah, so it seems. Deleting switch-root alternatives, eh... WTF Dan! :)
> >
> Oh, the oe-core commit log for master-next shows that Dan's
> commit is fine so it's *Richard's" rebase. I rescind my humorous WTF.

Nope, I just looked at my reflog. Somehow it was indeed me that
removed switch_root. My bad.

That's what review on mailing lists is for ;)

>
> ../Randy
>
> > Thanks Richard.
> >
> > ../Randy
> >
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> >
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux

