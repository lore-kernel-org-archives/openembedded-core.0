Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3688D7E4E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 20:28:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 459dHc35Brz24;
	Fri, 24 May 2019 22:28:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558729724;
	bh=cNFtUXJVKRzbFbxFDB6SRFZ+f+pa5Y3hCRUAiEhTIQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/XTu8TZaiCgz7WPtpQbOLSmLgzVTAbH8sOfYhQ++77jgqTs12DqmqqeSnmfUPf7s
	iz728XcauRcMziNuWFmMyq5RWlLMlsMt8yGMgsVuk6BTw8PcV8ju27xwxnwF+8TmDA
	VoaAgWdos3OGMOkrdi0E1f076jWx5iZWq+NQMLvK9Yx1XR/gfCr79Mx2Oicp9I776Y
	/BRVGlwqPeh1X0ALKqPBUFFVlWSEE/JDDEwHQxzM7oEMCdXaDXGRs3JD1rECv5MiuV
	65pxT7qNS5OktRoOvuL7D/2bs2P+iM+6+qSxAjxIv7gt5slXfZ9Zl+ZmD75323G3Nd
	nulQl/LatST5PYm+Bg0AaHYtI5iHV6WrXm4qw1pSiMJZCeN/xDXQQbGObaOSZ0Loy1
	o9520iAvmLP7IQx/NH7NVD5AeY2NFpaoA65aQYuZWI/UeRWl2hsx92eUQetD44GyPx
	1IVq8G2ypGNuJupoBg7yD/DYBjNqVgvpQryMUm+yZvJRmknZ37NWHyMBxSTL6niSKa
	/a1Ab9qxgJXHH6eZcSqf8IO3cPLqeTsCVAeMG6UqujsGNfWCcZClfVN8M6BuH/sH3J
	8+Sua8ts8I0/XILh6Vm4P0Manroa0HuW0veSNj4EK0ik3NY+pqSx0WWo6wPfJNUxX3
	9XEUuXAUssbpCRpyd3NzWVdE=
Date: Fri, 24 May 2019 23:28:42 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20190524202842.GB12358@localhost>
References: <45b3b2b0-02c0-1073-df0b-2ab03df1bb29@windriver.com>
	<f9b4e583-3e93-6e6e-ebaf-891093a135b3@gmail.com>
	<20190524101211.GA25912@localhost>
	<f10fea91-06a4-529a-1b42-0c12dc46f54c@gmail.com>
	<20190524172737.GA6813@localhost>
	<CAMKF1sp8H7pOMvHLw+xJhOEE8KyPASmSrQJYxib-ugqrP-OS0Q@mail.gmail.com>
	<20190524175859.GB6813@localhost>
	<CAMKF1sr-JCp6HM1BwYE5T-hgK_2T2j7rfNiRZcD0r_AuC2F7LA@mail.gmail.com>
	<20190524184546.GA12358@localhost>
	<CAJ86T=Vr=BSX1fF3G-bHspzXQpXw6qEkUjFDt0==CwgDnpPGFA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Vr=BSX1fF3G-bHspzXQpXw6qEkUjFDt0==CwgDnpPGFA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should systemd be marked as incompatible with musl?
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
X-List-Received-Date: Fri, 24 May 2019 20:28:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 24, 2019 at 12:34:23PM -0700, Andre McCurdy wrote:
> On Fri, May 24, 2019 at 11:46 AM Adrian Bunk <bunk@stusta.de> wrote:
> > On Fri, May 24, 2019 at 11:04:50AM -0700, Khem Raj wrote:
>...
> > > I think we should put in plan for 2.8 and define the scope, since we
> > > are switching
> > > poky defaults to systemd,
> > 
> > Switching glibc builds to systemd as default is a reasonable decision.
> >
> > Switching musl builds to systemd as default would be very bad.
> >
> > Combining a tiny C library with a huge init system completely misses
> > the configurations where the tiny C library actually makes sense for
> > users.
> 
> For new projects yes. However I know of a project (a big project,
> shipping millions of devices) which picked systemd and glibc long ago
> and is now running out of space. They already have various solutions
> to free up Flash (some apps switched to being runtime downloadable,
> etc) but if/when more savings need to be found then switching from
> glibc to musl might be a less invasive change than switching from
> systemd to some other init system. We obviously shouldn't make
> decisions for OE today based on the historical decisions of one
> project, but I just want to make the point that real world projects
> have a lifetime and may end up with a combination of systemd + musl
> due on past decisions that may not make sense for a new project
> starting today.

I am feeling guilty that there are two only partially related
topics mixed in this discussion.

In this part of the discussion the topic was what the default 
(and CI-tested) init system for musl should be - it seems obvious
to me that systemd is not what users will usually want to use with musl.

But there is also the topic whether systemd on musl is
in a state that it should be made available at all.

Does any of these millions of devices have untrusted
users or an internet connection?

At that point my email that started this thread becomes relevant,
the fact that the systemd/musl patches in OE add new security 
vulnerabilities and other bugs - and none of the systemd-on-musl
proponents seems to consider this a problem they have to fix ASAP.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


