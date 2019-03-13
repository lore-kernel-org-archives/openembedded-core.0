Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 937FA6C3A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 22:45:45 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 7795D184F2F;
	Wed, 13 Mar 2019 18:45:46 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id Et4vOVMx2s3l; Wed, 13 Mar 2019 18:45:45 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 7EA4E184F2C;
	Wed, 13 Mar 2019 18:45:45 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 7EA4E184F2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552517145;
	bh=SCXOCdDmE6dn0O5p/DvKjLiubJU4ZtmQ88s02sZltY0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=gTrcmTM/RoWFvlH/4a9sE9kfKOKwBuRkyuLZKOoDRZl6Wieoe9Bl3TmQtj1Jp1eNk
	SjA+l7/24dMcrWsrXXOoFqm8TSM5RzbRNiadY5CKYZt3bI145K8rclHu0j34i0A+tl
	U5Mk6xs4gavYLzRoC7QVO5SC4RjBaZm8zGb+Ir8J0fkXrqd6KnzqAvk9YhT29Hwtuh
	YM0BSEYxNHb7koVZHhTP+gnQWrwVn/Wk4GNc0y7mEeesmKkIxdd74/7Wi3nHOFnGEl
	Pr9H07nxSgCWW1gdouAliK1z4m5jkgVkFeJI1P4hf2rMl/x1AnJJWDtqC2rTwzNLI3
	DYxMXyFvV3QGw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id 1v1NvYvUjZMn; Wed, 13 Mar 2019 18:45:45 -0400 (EDT)
Received: from joraj-alpa (unknown [107.159.43.215])
	by mail.efficios.com (Postfix) with ESMTPSA id 57BC4184F27;
	Wed, 13 Mar 2019 18:45:45 -0400 (EDT)
Date: Wed, 13 Mar 2019 18:45:38 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190313224538.GA14253@joraj-alpa>
References: <20190313205332.9674-1-jonathan.rajotte-julien@efficios.com>
	<CAJTo0La7dXYLasfbUwSn3R1tFUXaJn=qTsF0anPstGfsR_=WfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0La7dXYLasfbUwSn3R1tFUXaJn=qTsF0anPstGfsR_=WfA@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Sumo][PATCH 1/3] lttng-ust: update to 2.10.3
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
X-List-Received-Date: Wed, 13 Mar 2019 22:45:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 13, 2019 at 09:55:04PM +0000, Burton, Ross wrote:
> You need a *very* good reason to upgrade in stable releases, so please
> explain the rationale.

Yeah we got good reason, these are bugfix stable release, as a project we would
like our user to experience a good experience out-of-the box when using yocto.

More seriously, I simply skipped this part of the wiki...

...
   No recipe upgrades unless:
       The old version is completely broken
       The new version contains a security patch or other critical bugfix that is too difficult to
       backport to the version already in the stable branch
...

Sorry for the noise. These patches are "useless". I'll make sure to nack the
other series.

Still the modules update might be interesting to cover more kernel but at the
same time if the default kernels are also "frozen" there is not point in
updating.

I guess the yocto/bitbake way to ensure our user get the latest stablest is to
provide a meta-lttng layers and instruct them to use it.

Again sorry for the noise.

Cheers

> 
> Ross
> 
> On Wed, 13 Mar 2019 at 20:54, Jonathan Rajotte
> <jonathan.rajotte-julien@efficios.com> wrote:
> >
> > Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> > ---
> >  .../lttng/{lttng-ust_2.10.1.bb => lttng-ust_2.10.3.bb}        | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-kernel/lttng/{lttng-ust_2.10.1.bb => lttng-ust_2.10.3.bb} (90%)
> >
> > diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
> > similarity index 90%
> > rename from meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
> > rename to meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
> > index d79a47931c..b5c43200d6 100644
> > --- a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
> > +++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
> > @@ -23,8 +23,8 @@ PE = "2"
> >  SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
> >             file://lttng-ust-doc-examples-disable.patch \
> >            "
> > -SRC_URI[md5sum] = "4863cc2f9f0a070b42438bb646bbba06"
> > -SRC_URI[sha256sum] = "07cc3c0b71e7b77f1913d5b7f340a78a9af414440e4662712aef2d635b88ee9d"
> > +SRC_URI[md5sum] = "ffcfa8c1ba9a52f002d240e936e9afa2"
> > +SRC_URI[sha256sum] = "9e8420f90d5f963f7aa32bc6d44adc1e491136f687c69ffb7a3075d33b40852b"
> >
> >  CVE_PRODUCT = "ust"
> >
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Jonathan Rajotte-Julien
EfficiOS

