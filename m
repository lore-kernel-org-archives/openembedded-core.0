Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 231897DDBA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 10:55:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45217D41Btz5R;
	Sun, 12 May 2019 12:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557658505;
	bh=Pr09Vv/RfsU5I34uELdqHYTXbNTYAZ7DENrlbRdlXp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XUk6Uexsl6493NdAUtwsQ9XpCR+uHesktkY1vgnBl0WBkDQjNmo47fW7cNHoHQnD/
	MSyBhhXqqkjgneiR3enRCpB0aUjkE51/APhZb7OLNBFLjHD3ZxUD7Cu6DarhNHiQ1D
	lNA9yFQDGuX6GJBJ3m63bUmWHHJlxuQPz7uza37LXUNSSA0EqoAySn3BQdZcVZYQvc
	mtR9CVyaeE7kR1CAcAuUSD5f1ebeL2O0hrh2mQEKlfMbHe9bni9Ehq9jtsdRTv7q7H
	XuvK0cON48rvNJ+pSQp8xRM0Z6a6ePLBMLHF+JpzpiqyEGzcl3TRra6b4jE/E6gbOJ
	JnFZ7fBw/KAGNOteUlrsqRXrm8qF+BcXnB/aCpZ01sWdfJeBZnqRNZrrAONj10Ae+Q
	jC940lBkqF/7PIKj6v8on5stg8ifTaz9Q67j490G9zr0tEtM2BSgdKVLFheKCf1PvL
	+FMxiUUT/v6NAZN9JTJppksUnP4v8ZkuaVkYJqGzslE91TA/drtMcr0b8eW0OFznNw
	gH+I41PoSXCXUllM3dW4bCIiSrXI4bh/Bg1WkExk1wJ8PmWQLiVcRqmLjtEEnZEL0s
	6bcidMiKRWfiy1hClUCyVYzKBVVpKvsin2bzS4hd1H0naDFoixUMltiiEBHgBtH1zV
	q8S8E4DgCChf6P5RDH8M5REA=
Date: Sun, 12 May 2019 13:54:57 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20190512105457.GA26911@localhost>
References: <cover.1557628550.git.hongxu.jia@windriver.com>
	<6dbeb5070ef6a86368ebcf1934ff543e963ba0fc.1557628550.git.hongxu.jia@windriver.com>
	<20190512083010.GA15611@localhost>
	<a84d947c-9d0e-1265-e944-8730b04f4b88@windriver.com>
MIME-Version: 1.0
In-Reply-To: <a84d947c-9d0e-1265-e944-8730b04f4b88@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/10] bash: upgrade 4.4.18 -> 5.0
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
X-List-Received-Date: Sun, 12 May 2019 10:55:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, May 12, 2019 at 06:17:08PM +0800, Hongxu Jia wrote:
> On 5/12/19 4:30 PM, Adrian Bunk wrote:
> > On Sun, May 12, 2019 at 04:16:24PM +0800, Hongxu Jia wrote:
> > > ...
> > >   ...1-help-fix-printf-format-security-warning.patch | 35 -----------------
> > >   meta/recipes-extended/bash/bash/build-tests.patch  |  7 +++-
> > >   meta/recipes-extended/bash/bash/execute_cmd.patch  | 19 ++++++---
> > >   meta/recipes-extended/bash/bash/pathexp-dep.patch  | 13 -------
> > >   meta/recipes-extended/bash/bash_4.4.18.bb          | 41 --------------------
> > >   meta/recipes-extended/bash/bash_5.0.bb             | 45 ++++++++++++++++++++++
> > >   6 files changed, 64 insertions(+), 96 deletions(-)
> > >   delete mode 100644 meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-warning.patch
> > >   delete mode 100644 meta/recipes-extended/bash/bash/pathexp-dep.patch
> > >   delete mode 100644 meta/recipes-extended/bash/bash_4.4.18.bb
> > >   create mode 100644 meta/recipes-extended/bash/bash_5.0.bb
> > > ...
> > > -           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-019;apply=yes;striplevel=0;name=patch019 \
> > > -           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-020;apply=yes;striplevel=0;name=patch020 \
> > > -           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-021;apply=yes;striplevel=0;name=patch021 \
> > > -           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-022;apply=yes;striplevel=0;name=patch022 \
> > > -           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-023;apply=yes;striplevel=0;name=patch023 \
> > > ...
> > > +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-001;apply=yes;striplevel=0;name=patch001 \
> > > +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-002;apply=yes;striplevel=0;name=patch002 \
> > > +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-003;apply=yes;striplevel=0;name=patch003 \
> > > +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-004;apply=yes;striplevel=0;name=patch004 \
> > > +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-005;apply=yes;striplevel=0;name=patch005 \
> > > +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-006;apply=yes;striplevel=0;name=patch006 \
> > > +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-007;apply=yes;striplevel=0;name=patch007 \
> > > ...
> > Some "git add/rm" seems to be missing around these patches.
> 
> Do you mean I miss the patches? They should be fetch from remote upstream.
>...

Sorry, I missed that.

> //Hongxu

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


