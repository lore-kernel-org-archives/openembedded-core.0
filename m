Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6FBF17F23C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 14:26:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46FNxZ1VPcz3P;
	Fri, 23 Aug 2019 16:26:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566570386;
	bh=UtywZI4HpZJ70vuc5oJZXMbhcl4YMTNDGMhlhC66JLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQ15JGrM45rYAzNa8oNLvE5PWAg7ATqEGEQO6N7VZUTS437pPH+hh3n87pq9a2JFr
	EscCdwSg03kOXCiA6FD7dh+V1IuPrqlzZHfN+5RNDNULdux8GaIdgtQ6mqa5AgMO0e
	pHv4OtQ3tzLh0pTlztMCqQ4mD7e4DmgeNnEjQnQsk1z1QaqDS9U+QQbr0xNXpVXrb3
	kdSA6lRxcqAqghwPuQF2HhwxYNK/VFBdBd4WvwvtsCQxuDuQmAlC7wCb3ERW0kDwY3
	ZcHiZA6maBDJNuBIfXD7Pp4bor719Y0kfwBIYQsvX1o8iFi0uNv9jmGjI3l0nq7QcS
	emEK1H2H3ec+V8soj0uAju/IV3PaH1EINhMSCX4llGwjhr0sMkawsgb9zMYzSbrRJb
	futi6UppEaPm4nzyPHaiiqFpm0VoY7sWrJijySqZ8oN9K4HFr+DkNdnWbasPTBm1/3
	FqnASlb+Q3q8H66TEMPKRAChs8x4p5Zq1Q3kmJe7rl29VIf4qZpac3stUYn+iqiN5d
	nXorOGbX2E+rDlk3kPuJvAtvpsdr9yD4rQs8Gw3vRTtJuCtEIyJgNpqU49KComwd55
	ukYm30Qq7vqYiHGFDFHQaATR+ob2FBJIfidwiAnTAhNQhzWUdtdqGK+SmjgAzc+8o2
	vzHJnSCKgOtCglZ+KPIvc4rY=
Date: Fri, 23 Aug 2019 17:26:23 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20190823142623.GA30097@localhost>
References: <1566438018-16251-1-git-send-email-hongxu.jia@windriver.com>
	<1566438018-16251-3-git-send-email-hongxu.jia@windriver.com>
	<20190822170111.GA2069@localhost>
	<e73ede01-3f54-232c-a97a-db4890527a7f@windriver.com>
MIME-Version: 1.0
In-Reply-To: <e73ede01-3f54-232c-a97a-db4890527a7f@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] elfutils: 0.176 -> 0.177
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
X-List-Received-Date: Fri, 23 Aug 2019 14:26:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Aug 23, 2019 at 09:28:11AM +0800, Hongxu Jia wrote:
> On 8/23/19 1:01 AM, Adrian Bunk wrote:
> > On Thu, Aug 22, 2019 at 09:40:18AM +0800, Hongxu Jia wrote:
> > > - Update Debian patches
> > >    http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz
> > > 
> > > - Rebase Debian patches to 0.177
> > >    debian/hppa_backend.diff
> > >    debian/mips_backend.diff
> > >    debian/arm_backend.diff
> > >    debian/mips_readelf_w.patch
> > >    debian/testsuite-ignore-elflint.diff
> > >    debian/mips_cfi.patch
> > > ...
> > >   ...1-fix-compile-failure-with-debian-patches.patch |  48 ++++++++
> > > ...
> > >   .../elfutils/files/debian/hppa_backend.diff        |  57 +++++----
> > >   .../elfutils/files/debian/hurd_path.patch          |  17 +--
> > > ...
> > >   .../elfutils/files/debian/kfreebsd_path.patch      |  13 +-
> > > ...
> > >   .../elfutils/files/debian/mips_cfi.patch           | 131 +++++++++++++++++++++
> > > ...
> > Why are we following Debian patches in a package with active upstream?
> 
> I am afraid no, we need to rebase them (0.176) to 0.177

The part about rebasing existing patches is clear.

But why are we for example adding mips_cfi.patch when this is not upstream?
There might be a good reason for doing so, but "because it is a Debian patch"
is not a good reason.

And the existing hppa/hurd/kfreebsd patches from Debian are unlikely to 
make sense in OE.

> //Hongxu

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


