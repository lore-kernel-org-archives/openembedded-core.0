Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1C4377D2A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 08:27:27 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id b6so19924606iog.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 01:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cpss+lku2IxUvNW7FXn+OX2mmcAkMU5MzJqT7whVtYk=;
	b=TtsnAYbN4JwcorwAFVBYlZRJkJJ+gkMzk+Q/Qz7syYpyfbsQtHf7ElZivBgdiFxd9d
	aJNINQrkVG8fQmwKcgcGIySZyuWNFPXwMeOhUaH7gp1I5CqTq3sygqQqd/+FpviC2fp1
	RxXwZvuftPSJElf2dTGjUGAeQKT7pjZYNZkGopYwB3YrtHs1HLVPb4EXG+BuuRDV+KPF
	VCEjF3JBMBeq1F+WnNvzMiCNWA7tJ6W4aO4Q6X6w66d9azEovTdgotW9FF723FHG8bRq
	2Hi+n+GXq5z56VbqH3KRbgOQ+sGpsUntTRm4EXwwotP/EtS9soHrYwYMvYi6f60k5SlJ
	LL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cpss+lku2IxUvNW7FXn+OX2mmcAkMU5MzJqT7whVtYk=;
	b=nHBsNmtnr7/lCy4vr2LtUmR+l51mnvVsOPSv7i24OQwdxWM+H9bRPofqpbgCwqved2
	ZPBPD+mCAo/tE1X4YG2ujD6gbN8Us+c9cKohbYQtV+EqKesw4kL4U43fqIt1xtggib8t
	5/sBEf42v2ggwyGdfzFtZadcuCsKTC/cEHXyuOXPiKQgSREsOhT92d217WOopG2m5qL/
	M3FCeL3hDhPlN8wSC6JIHFP3orf+296dKS1PgJUo9SJ+nUG2lt/0opHj4MoKH4KThV/p
	B7NMgvjyUohczscz1eiYyCioEw5VwKW1sHImkt+nOhWTiTlDMVKE5ElqgijTDZUxjdbf
	GYwQ==
X-Gm-Message-State: APjAAAVmDtgEE2WMOeaD2c1goSjrMSzfu4KMvMpHCcL380Fn0JacgeXg
	+NBPlL3hcImS/6TAT7HDLbCdpDqZ6KH3REh+h4E=
X-Google-Smtp-Source: APXvYqzhniZ9SWXc65fx8egyBAyNmID2OFcAq7q/133/xMvAoNHo2ktLIrartFlWGSB2AheID6510ntPCP50G1eObjY=
X-Received: by 2002:a6b:440b:: with SMTP id r11mr50157241ioa.48.1555489649002; 
	Wed, 17 Apr 2019 01:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <1555408184-375724-1-git-send-email-changqing.li@windriver.com>
	<6ca03a74bb0c22fb2f483afac0d9e8ec13d6e29d.camel@linuxfoundation.org>
	<52db974d-c320-7f53-2fb4-75f353ed1b60@windriver.com>
In-Reply-To: <52db974d-c320-7f53-2fb4-75f353ed1b60@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 17 Apr 2019 10:27:17 +0200
Message-ID: <CALbNGRTETs9tpwurh_dwAKbyCo4o7Di8mc=Bz5w3rOqaVvRbtQ@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] systemd: change default locale from C.UTF-8 to C
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
X-List-Received-Date: Wed, 17 Apr 2019 08:27:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 17, 2019 at 3:06 AM Changqing Li <changqing.li@windriver.com> wrote:
>
>
> On 4/16/19 6:22 PM, Richard Purdie wrote:
> > On Tue, 2019-04-16 at 17:49 +0800, changqing.li@windriver.com wrote:
> >> From: Changqing Li <changqing.li@windriver.com>
> >>
> >> current default locale is set to C.UTF-8, but glibc not support
> >> locale C.UTF-8. so set to the default locale C.
> >>
> >> [snip]
> >>          if not meson.is_cross_build()
> >>                  choose_default_locale_sh =
> >> find_program('tools/choose-default-locale.sh')
> >>                  default_locale =
> >> run_command(choose_default_locale_sh).stdout().strip()
> >>          else
> >>                  default_locale = 'C.UTF-8'
> >>          endif
> >>
> >> if default locale set to C.UTF-8, it will cause libpcre ptest fail:
> >>
> >>    re> //8+L
> >> ** Failed to set locale ""
> > Doesn't your second patch mean we don't need this one?
>
> 1.  No ,  we need this one.
>
> because image maybe don't  install any locale except glibc default C
> locale, like below:
>
> root@qemux86:~# locale -a
> C
> POSIX
>
> if systemd set to C.UTF-8,   any image need to install C.UTF-8 locale by
> default, but only C is default locale.
>
> with this patch,  sysVinit and systemd both set to default C locale.
>
>
> 2. patch 2/2 glibc: Add a C.UTF-8 locale
>
> This patch is not necessary, it is just for add support of C.UTF-8
> locale.  if any package depend on it in the future,  it can install
>
> this locale.
>
>
> Add this patch just because I noticed most of major distro have support
> this locale. not for fix  "** Failed to set locale "".
>
> >
> > Cheers,
> >
> > Richard
> >
> >
> --
> BRs
>
> Sandy(Li Changqing)
>
Can we make default locale overridable please so distros have a chance
to choose different?

Andreas

