Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DF9857F89B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 15:36:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47JkDh092bz4c;
	Thu, 21 Nov 2019 16:36:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574350580;
	bh=e00eRXABAHkzE0qzCQiLZOyfw144mJOF4/XMeJ0WmsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNuPHwV5tAiipOoeJ/zOJW1wpKmyTjCmRFov71CaxRmGOn6kxzrd0zwTbt5mXwvMA
	3Fh1XVV8BZJWGeu5+VYDo9NcDNlFGP2/Fx6i2NCWv/BVUmDTJy53WpHuWS8UMWZtDb
	NmsDgZ/d46d2D1QV7kO+2MbmnuWPJ6Xylvq4krFuPB5iGRGZiKPWT6EN7R1dp8SkAR
	17yEKKm8GnXVgdvOa7//Y0jf5VDgzcPb3pKPRysQcBrwgGOBCiBwKsO+7g2l5xuDDT
	rj0m3lYc/dClT2o8XsKCtgZafrZx2NKMz4+KNq5jfc5xBg4gfA7+j63Q3VdJT+6qZn
	oma5FdsFVW4gsCQT83SdoKfQ1dgEdnPU7itfVSDc/+AMX24F/Q0ukpIwHqfTAQITrP
	+p/zKW+MSXZgUymzMhyFjqTUeS16QuejZVfJGL6ryBaoKpy3KLsDReCJ/u6F94e8M7
	z4li6dZZ8tOSo0Xj+gUgxNM/rhFE6xqLIvrqP6a2vRlCFAKGrcpU/ZfBSSueMxFXxq
	ODjzQh812PBqeTf7VKVwLu89Rjzu7m1dhSQmVbrfHemTqC4z1/pXTkhHZbp5u9g5nq
	4WDMzE4Cd6lJHeiOXcLwM9VlwFsE0IL9osXgmvkekvstLSTID6Ej5zCSh/UWSq4udG
	wWXj8ZqyA/jjXp8cs/BGjqLY=
Date: Thu, 21 Nov 2019 17:36:10 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191121153610.GA28013@localhost>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
	<20191120134455.125118-8-alex.kanavin@gmail.com>
	<20191120194927.GA28030@localhost>
	<CANNYZj_g1kDJ5CSbKg4DEaATCiyPPT=2GuYEsUyHr+7ZpH8EkQ@mail.gmail.com>
	<20191120213844.ome6ota74rmgosy3@pbcl.net>
	<CANNYZj9uAs5wQPya6R9q3gfSQm_Xyu9xViGBxOQ2COKKbcYeWg@mail.gmail.com>
	<20191120223207.6cuuklpgrzuhqug3@pbcl.net>
	<CANNYZj93tJxTsCwS3cg3J=0WB--A0Af26Y=nO9fOdfNb9okRYg@mail.gmail.com>
	<20191120231812.GB3962@localhost>
	<238a39c7-b794-aaa0-1da6-4b585078f447@intel.com>
MIME-Version: 1.0
In-Reply-To: <238a39c7-b794-aaa0-1da6-4b585078f447@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] lrzsz: remove the recipe
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
X-List-Received-Date: Thu, 21 Nov 2019 15:36:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Nov 21, 2019 at 09:24:34AM +0000, Ross Burton wrote:
>...
> So, if zmodem is still a useful feature to have in core, then is anyone
> willing to step up and either:
> 1) maintain the recipe.  I'd love someone who uses lrzsz to put a fork up on
> github, integrate all of our patches, and start maintaining it. Maybe then
> other distributions who still ship it will join in too.
>...

In embedded development there are some usecases left for this codebase 
from the 1980s that implements protocols that were widely popular in
the 1980s and early 1990s.

Ancient code implementing obsolete ancient stuff is not fun to maintain.


There are also two higher level topics that should be discussed:

1. Removal of maintainers.inc
There is some nitpicking that every recipe needs a maintainer.
For the package in question the maintainer is not involved in the 
discussion, and doesn't seem to have been asked for support or
asked regarding the suggested removal.

2. Who is responsible for fixing gettext breakages in meta-oe?
Alexander or Khem?


> Ross

cu
Adrian

