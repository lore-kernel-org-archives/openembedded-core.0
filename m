Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9437F0CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 09:19:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45lS7L1f1bz63;
	Fri, 12 Jul 2019 11:19:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562923199;
	bh=FXHhYQmf9mpoHpwZbtzhKaIfULBBugjJlI2ONcMMQMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+E8jgpG7S/XLXvjk8X/cF0WJ66yZfhBzASHkyts2MBa/HR5bRliClmdMjemgloX+
	pjgv5VatJb6MucIgCz2btKVsxKm5Ldk1p80GsQBh8H8fPkDkjyQUH1FTSFLd/sgsbB
	d2y5JYaHVwTswvtxz16ew091CEO9zn9SBMQf2dQq9v+9aOz7BHHYs054tDgtwms8uW
	uVXqQLveTl/xOOL3tvzH1tCzqxceuj3jBzfItBpW9G1oXRxzyrg/eF46YkpvmziPpF
	7R0V1QvjRR1VCZjMHaH0VuagHJC+clpirjbNwM78R1LkmO48q1cXJYdiC9mIryiWgY
	rPRUtk7cWfrtcP0Iy5hwAwBGL6bC+zQsYDxJH0fxoJUOj8kDGZSyE0HX5QeD+x+WeT
	hdtkeGkjo8MA/tJI1asoshg5RT0UubxFD5Fr/CQqIhOBcT2R69XonrMfuID32QX/lx
	jm2/KWRtV0/mw+gB0XhVmnJpT63Ehrj+G+cern2JqKMApgKY17ZZ5BVvG+HeOnIJnp
	YVXe0Vq33YPF7jbC+qfhTKEDLeFbM0tciManwZ8qzBgBdtppwMdhoXPZwZu0IlbSan
	CvC4KI+LbuCFVIfS9oXTDO0rrL3OMYSVw1e/yNzbdTbsYy+PCRREXiKefHYtsBMhN6
	wQpuC3HLgg89piJI8VQaMvUc=
Date: Fri, 12 Jul 2019 12:19:55 +0300
From: Adrian Bunk <bunk@stusta.de>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190712091955.GA21468@localhost>
References: <20190711202739.131168-1-joe.slater@windriver.com>
	<20190711204424.GA2092@localhost>
	<CAJTo0LYnXYrkfa_HrU=QPxxngpP0qHsAUMkFENYGU=MCFGDZyA@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84FA81B717@ALA-MBD.corp.ad.wrs.com>
	<20190712063040.GB2092@localhost>
	<CAJTo0LaE0JvnsF9uTshyiXMzX5X6+2tzkx3jxjN1vdWFSDNAZg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaE0JvnsF9uTshyiXMzX5X6+2tzkx3jxjN1vdWFSDNAZg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libtool: allow for use of reproducible_build bbclass
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
X-List-Received-Date: Fri, 12 Jul 2019 09:19:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jul 12, 2019 at 09:33:59AM +0100, Burton, Ross wrote:
> On Fri, 12 Jul 2019 at 07:30, Adrian Bunk <bunk@stusta.de> wrote:
> > Debian has already done a lot of work regarding reproducible,
> > so checking there for existing patches first is always a good idea.
> 
> To expand on this for people who don't know how to mine Debian: first,
> identify the source package.  In this case it's libtool but otherwise
> you can search packages.debian.org.  Then search
> https://sources.debian.org/patches for libtool and you find
> https://sources.debian.org/patches/libtool/2.4.6-10/no_hostname.patch/.

Another useful resource is https://tracker.debian.org/

https://tracker.debian.org/pkg/libtool has some useful links,
e.g. "browse source code" (links to sources.debian.org)
or "reproducibility" (see if it is reproducible in Debian unstable).

> Ross

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


