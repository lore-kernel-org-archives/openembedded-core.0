Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 749F87F2EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 03:40:24 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id l1so5031197lji.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 20:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dsU2T7WG5rymQocCZnTQGsFVPIszGpgdcX5iL53ddfM=;
	b=ONQfAGTi8BjoZjTMYFAkA/mmzudEwjpX7sR3WJXiZ2sxjbiZGV6ZxfgPkCEZno3MLH
	2HQHS/J4V9KMEM6BhH9dCLZlmada/8IwCefAROipttti90FPIApSzFIowqSQploEqGzB
	toDtn4697UlsVbIIfRiXn+G6KI0SHUUSaFZt+PkagkNFa6zXPlLpVp+f3P50ZzIvs8gm
	1nCaMPNYuUNCW1LXw1DAPxGpxJuW7N31UYG0mKBcQfZSqB916CWSZg5bmHSIRZIYzM3C
	3PXOCoOMHdLpznnwkn3NrM/vgs22r+DDnsVNCPAMziHSh/R4bmM9AzfMQx8Vl9bZvlTO
	0aOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dsU2T7WG5rymQocCZnTQGsFVPIszGpgdcX5iL53ddfM=;
	b=kkEgJiUnY89Z7WZNKwRieU8cyxRkBUsNHCe0aloGCmzjycTdwur9AqCzy2eRQfHsyp
	dGWDVgKHbyePjM4DPRR4q/bS04s58X3qNzK6ZZ1FOiiBYUN8nFhrowJ8szXusyfEXoTF
	NvGeiGZl3uz8UiKdyjculJ+w+e9QMKMmMFQ8zNUiwZRI8gxb1VgqP+j/oylMNwkyujCX
	a8xstTxdNKprD0tu3d5kevZD5FZkpmlmMGaFz3vK0MsJMZ+E08Ct3CtcgIM5Rlqs+wyX
	iEiIX1ITbWgmapk6SAoHd8jrsl4SvbuIOwUVXP3x2F6JALm3EgtoHYuiFDBWGmaBt8/g
	2g4A==
X-Gm-Message-State: APjAAAUHG/du6AfVWRNa4g9JVg9MuA2O4FiEaLUdJLQVFKbYN+aps2nV
	KB4flZNDVsV6VawbYH7Z0PZovlVac4QvwRM8zLfL52lL
X-Google-Smtp-Source: APXvYqw+EG06UudmPfCTNYc3QGKzIpoTtDeupj/mUKa0EAScSJ5XyixeliGESUShdlTy+xYqlo+bbSGpnYZlWIry5ME=
X-Received: by 2002:a05:651c:1111:: with SMTP id
	d17mr7070797ljo.87.1567136424875; 
	Thu, 29 Aug 2019 20:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
	<3a3fd8a7128901ab5fff8de55b789ecd3b633cc6.1565796002.git.bruce.ashfield@gmail.com>
	<b132395fc39af7592af4a4d1c5d8bc25ccf7a31a.camel@intel.com>
	<CADkTA4PdkcioYX4Va7ohMapxBPpAr5nirUM+mg3Uno6JroW3Yg@mail.gmail.com>
	<96b460f57943b96b9a6f493a67322f1688665c00.camel@intel.com>
In-Reply-To: <96b460f57943b96b9a6f493a67322f1688665c00.camel@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Aug 2019 23:40:13 -0400
Message-ID: <CADkTA4O4XuBaCpeS--Zp8o1wYwXuBPqBmWMZcGJOXyvMvz=+qg@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] kernel-devsrc: tweak for v5.3+
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
X-List-Received-Date: Fri, 30 Aug 2019 03:40:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 29, 2019 at 10:13 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Thu, 2019-08-29 at 08:27 -0400, Bruce Ashfield wrote:
> > On Thu, Aug 29, 2019 at 5:17 AM Mittal, Anuj <anuj.mittal@intel.com>
> > wrote:
> > > On Wed, 2019-08-14 at 11:31 -0400, bruce.ashfield@gmail.com wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > The 5.3 kernel has two changes that require tweaks to the minimal
> > > > kernel-devsrc package.
> > > >
> > > > - 4ce97317f [x86/purgatory: Do not use __builtin_memcpy and
> > > > __builtin_memset]
> > > >
> > > >   This change removes the need for arch/x86/purgatory/string.c
> > > > and
> > > >   instead reuses a copy in arch/x86/boot/compressed/, so we can't
> > > > copy
> > > >   the file anymore. To support older kernels, we make the copy
> > > > survive
> > > >   the non-existence of the file.
> > > >
> > >
> > > This change was merged in 4.19 stable kernel as well. Can this be
> > > merged in our stable branches as well please?
> >
> > It already is (just not pushed), I just wasn't doing -stable updates
> > along with 5.2 intro .. there's only so many things I can debug and
> > regression test at one time. Hopefully I'll get through the 5.2 work
> > soon and finish the rest of my queue.
>
> Thank you Bruce. I meant that this kernel-devsrc fix should be merged
> in yocto stable branch, warrior, regardless of the 4.19 kernel version
> there.

Aha. gotcha. I'll send it along to -stable once we've sorted out the
current set of issues.

Bruce

>
> Thanks,
>
> Anuj



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

