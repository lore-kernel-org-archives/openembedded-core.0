Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1C7467C6FC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Mar 2019 12:20:24 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id h9so15040678itl.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Mar 2019 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7R/5f3W8p1vXmvjYLF6+0MlwGE4e3NIpb8I0lYrPjO4=;
	b=Ds+b09GpdN+a9ZlR/zoYEOP9q2yjXCUsUatl1iE04KWYRjZD7tba/0PDhYnxTHXvA8
	Y2ftGHz4X5RSrh36QSNX/lU2lBMjz7VdbNpJmWYb6k8DbGIXJhBA4PUhwhsouvmIcVAe
	GIvtVobM+WE8BtyJRwkHFfFrtxLVcg7zmLWsRkB/cqbK1yeXksJCbqAE8aMUxX7a8m0G
	0hRwDI0ZZjgnMu2exIsRFpLuZyRZ5601A15FY6WWbzMhvnS+xHiVvUYJt7YCqC2sioOl
	Hz6468BLh/HUMaHOYrrkRbPldO2d/3dzmTiGQ6izmGTuFbfbbPlS4npDKHsqXQfhaEfG
	ub0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7R/5f3W8p1vXmvjYLF6+0MlwGE4e3NIpb8I0lYrPjO4=;
	b=mR+SQT7bPprKN0RVTTIV5KHrPKSfIoUiyPWhG7MSl8CCp3EoeDh9KSATmrMj4d5yYN
	znOQftaKF32yGZ++zpsTKRcxBleN+ZBLODSsl2T0Y1wgI+sqlpRBhdCd1z9v9EqQ75EJ
	jUcPEt0PR9qvD7ay1X8egZ5YhpksgkDDMhxdGy08vOCQvOyY4E243dyDHh3NVKWstPg0
	9rsLuDnnkh95TPA2esHVO+Ync9KCgZRGyoCoGGs29R5DsKOisgiPUA9ah9DNOjlVUdyJ
	L3aKa3El/UXNyLb3WtwNjYYsqkrJVFlQtzeFSHW0veNNB2D9Zx+zDypnEIJYXE6ai7/m
	I8eA==
X-Gm-Message-State: APjAAAVUoWpay2pAcWc8jsAjwn9WePK5lHaprzPT4j/AQ483Kw7ySnKt
	uCCvb/dvdmqrKm8ecVIyH2gzsyBjmc0F4uQXEb4=
X-Google-Smtp-Source: APXvYqwZ8qMiDj+lWaiN24sAAp5AdVTDTgPaAB5YR9mGC9gREPm1o+NnO2zASE8N5iKXhgmy2DG/RYom7mFs/wkHkM8=
X-Received: by 2002:a24:5c47:: with SMTP id q68mr5153896itb.81.1552738825122; 
	Sat, 16 Mar 2019 05:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <154947113576.452.14618413373824638023@git.openembedded.org>
	<CALbNGRRLfW_ih43gr8n_rG5YcLQizAs4Mhi0rU_TVjoCCyw1Ag@mail.gmail.com>
	<CALbNGRR0PjTSJWT=FARJrLNn4BPPV+XkS_RL2CiqSiOnj4Tfbg@mail.gmail.com>
	<d897cca3-2471-ecfa-c99a-da0df5649d37@gmail.com>
In-Reply-To: <d897cca3-2471-ecfa-c99a-da0df5649d37@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 16 Mar 2019 13:20:12 +0100
Message-ID: <CALbNGRQBHySVaqLXNNTbM5xvo5fOh-UxzogyjC6Rm1_6_WETcw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] branch thud updated (ad0a553 -> 748f946)
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
X-List-Received-Date: Sat, 16 Mar 2019 12:20:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 16, 2019 at 12:11 PM akuster808 <akuster808@gmail.com> wrote:
> On 3/15/19 10:24 AM, Andreas M=C3=BCller wrote:
> > Replied to wrong mailing
> >
> > On Wed, Feb 6, 2019 at 5:38 PM <git@git.openembedded.org> wrote:
> >> This is an automated email from the git hooks/post-receive script.
> >>
> >> rpurdie pushed a change to branch thud
> >> in repository openembedded-core.
> >>
> >>     from ad0a553  build-appliance-image: Update to thud head revision
> >>      add 0bbe3d5  kernel: use olddefconfig as the primary target for K=
ERNEL_CONFIG_COMMAND
> >>      add 933712e  linux-yocto/4.18: update to v4.18.22
> >>      add 193eb75  icecc: readlink -f on the recipe-sysroot gcc/g++
> >>      add 57673fe  icecc: Trivial simplification
> >>      add d4ec470  icecc: Syntax error meant that we weren't waiting fo=
r tarball generation
> >>      add 46db052  icecc: Don't generate recipe-sysroot symlinks at rec=
ipe-parsing time
> >>      add 9d3587d  icecc: patchelf is needed by icecc-create-env
> >>      add d8bf7e5  eudev: upgrade 3.2.5 -> 3.2.7
> >>      add a316146  gsettings-desktop-schemas: upgrade 3.28.0 -> 3.28.1
> >>      add 88581ac  libatomic-ops: upgrade 7.6.6 -> 7.6.8
> >>      add 7c6e9f5  libpng: upgrade 1.6.35 -> 1.6.36
> >>      add be1429b  common-licenses: update Libpng license text
> >>      add 93c76fe  i2c-tools: upgrade 4.0 -> 4.1
> >>      add b09f261  oeqa/utils/qemurunner: Print output when failed to l=
ogin
> >>      add 47731b4  grub2: Fix passing null to printf formats
> >>      add e3ef28a  gnupg: Upgrade to 2.2.12 release
> >>      add a44c7ba  tzdata/tzcode-native: update to 2018i
> >>      add 4a7945c  lighttpd: update to 1.4.51
> >>      add 4f14eac  boost: update to 1.69.0
> > In my infinite naivety I just updated thud.
> >
> > * Many updates here - wasn't there some policy just to update in case
> > of 'emergency'?
> Nope the process does not say that. I will update recipes when they
> bugfix updates.  I have been doing that for years. In fact, you should
> be seeing something on the arch list to make the process standard.
> > * How can you update boost on a stable branch - a first class citizen
> > for build trouble?
> Don't recall the thought process on a given backport especial when its 3
> months back. Can't tell why I decided to update boost.
>
> - armin
>
> > Wonder which further fallout I'll get...
> >
> > Andreas
Just for the record:

1. In [1] I read at policies:

* No recipe upgrades unless:
  * The old version is completely broken
  * The new version contains a security patch or other critical bugfix
that is too difficult to backport to the version already in the stable
branch

2. This was applied on Feb 6th which is not 3 month back exactly.

[1] https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance#Point_rele=
ase

Andreas

