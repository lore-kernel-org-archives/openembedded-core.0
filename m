Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 05F997CEA2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 17:06:30 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id o129so14576835qke.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 10:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=saw4Rpeu5WnwNPIjoiD7CR/3G/TO55Ae3jyE0gZO39E=;
	b=ZrrIrf0dlM+OIfbtLuBq21KkiBtedpcE4umW84vSKZIfMN8/fbppKtJhuddHtpUNQi
	+Zh5avH/VvpW4VIbtHomUCoZS/ZV0R/ZaoPZEMb6JdB6Njw1CJKFSA2FapTnBxx0qeCS
	pnr2ed7MwL8fo20w1rtvuOIIo8HXoT+doJQqHFgNBGYgYfGUVBDi1YZW9gaJnhkLqJNc
	kMH0jUYAHoaH+DmDhK8RrwMbJDgJ2Xr3+8/ry4MkkyM06FZ/vx6Xoezxk7Y010gkS0Vz
	z/nSiAlPA6AjmVPZ472Inguf+8AmZLlM2bSOPAYkCGlEQanlFVp25wsBabHawCzNneSi
	bq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=saw4Rpeu5WnwNPIjoiD7CR/3G/TO55Ae3jyE0gZO39E=;
	b=BKRaN30aQHTnq0bfdQiWAFm3bYtx6OHlKFIns5vsQbS/BAa3DKHeF8KB9YDS6OrbIy
	+YLjFlOGbU9QzWKNZgo+Cm6sRYJ2+wrjttkWlb+/yXZHdLV+QWpbDauR0XoqnHNdg30F
	3TFfVTPYD7raoSqYzl6Tv8rX3/LSEIwQ0E4kt+8E0yrhMqJfrFCuScUqURyTk8phw1SB
	cZfswjYeRr35yI86sDqOHSkB9exsRMIzbJhO8LXoGJ7DsHPbpuIxnbiKwuHhxy6Lv7RQ
	/E4CmqaxDbUv6SSw9kssBmvTgP/VUQg2BtPLtJpAILdE102YIxBo7J/EKt2RW/q4ohYt
	EcHg==
X-Gm-Message-State: APjAAAVsOpmmnsJTDyDQk87TcolUxZNuoD2B7EOT0yuTreK+qC3cqTCT
	WELTfsVdPk2avscvYUtaxka5gtwsVFHiCpTposw=
X-Google-Smtp-Source: APXvYqzXwoglKIU5Fpho6QQ8AJQj0bG2QPaFqZWr+1snuRCvMXSY/a7KUru3+AbahY2dbjsDppXlilJ6vcxtUBd2/AI=
X-Received: by 2002:a37:c89b:: with SMTP id t27mr7421484qkl.223.1553101591659; 
	Wed, 20 Mar 2019 10:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <1552383718-62708-1-git-send-email-changqing.li@windriver.com>
	<20190315104552.GB14180@localhost>
	<CAMKF1spft7gbJ983GtbyVtjXO5hECMuTqg6TM1bV2ozu0Np_CQ@mail.gmail.com>
	<20190320052115.GA25499@localhost>
	<CAMKF1soQbssBdHEgmdGmeNFPWWQH+FdRbdzBuPDo_TOdnY0oRA@mail.gmail.com>
	<20190320150021.GB31018@localhost>
In-Reply-To: <20190320150021.GB31018@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Mar 2019 13:06:05 -0400
Message-ID: <CAMKF1sqFpCwy6vYqBdEuMi2dxUU32_DD3XbGt4t-VXoU6x_qYA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mdadm: fix gcc8 maybe-uninitialized/format-overflow warning
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
X-List-Received-Date: Wed, 20 Mar 2019 17:06:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 20, 2019 at 11:00 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Mar 20, 2019 at 08:59:39AM -0400, Khem Raj wrote:
> > On Wed, Mar 20, 2019 at 1:21 AM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Tue, Mar 19, 2019 at 11:51:47PM -0400, Khem Raj wrote:
> > > > On Fri, Mar 15, 2019 at 6:45 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > > >
> > > > > On Tue, Mar 12, 2019 at 05:41:58PM +0800, changqing.li@windriver.com wrote:
> > > > > > From: Changqing Li <changqing.li@windriver.com>
> > > > > >
> > > > > > while compiled with -Werror=maybe-uninitialized/-Werror=format-overflow=,
> > > > > > it failed
> > > > > >
> > > > > > [snip]
> > > > > > | Incremental.c: In function 'Incremental_container':
> > > > > > | Incremental.c:1593:3: error: 'mdfd' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > > > > > | close(mdfd);
> > > > > > | ^~~~~~~~~~~
> > > > > >
> > > > > > [snip]
> > > > > > super-intel.c: In function 'apply_takeover_update':
> > > > > > | super-intel.c:9615:15: error: '%d' directive writing between 1 and 11 bytes into a region of size 7 [-Werror=format-overflow=]
> > > > > > | " MISSING_%d", du->index);
> > > > > > | ^~
> > > > > >...
> > > > >
> > > > > I am seeing these warnings only with -Og, are you also seeing them with
> > > > > -Og (DEBUG_OPTIMIZATION) only?
> > > > >
> > > > > If this is true, I would consider
> > > > > https://sources.debian.org/src/mdadm/4.1-2/debian/patches/debian-no-Werror.diff/
> > > > > a better workaround.
> > > > >
> > > > This seems a broader brush, I really dont like to relegate Werror if
> > > > we dont have to, because it will force us
> > > > to fix the code.
> > >
> > > How are we getting such fixes properly reviewed?
> > >
> > > What actually happens is that the easiest change that silences a warning
> > > gets applied.
> > >
> > > And for such bogus -Og only warnings there was no problem in the code,
> >
> > so then probably a better fix is to add -Wno-error to DEBUG_FLAGS
> > which will limit it to -Og case, and revert the original fix.
>
> For mdadm this might work, for puzzles it would not.
>
> Order matters, and upstream can insert your flags before or after
> the -Werror. So unfortunately this would not cover all recipes.
>

suggestion was not global, but just for this recipe. I still would
suggest that we disable it only where needed

> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

