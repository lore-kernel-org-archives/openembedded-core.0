Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T89fC-00046c-1L for openembedded-core@lists.openembedded.org;
	Sun, 02 Sep 2012 14:52:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q82CeA0o017769;
	Sun, 2 Sep 2012 13:40:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14425-04; Sun,  2 Sep 2012 13:40:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q82CdxuA017742
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sun, 2 Sep 2012 13:40:02 +0100
Message-ID: <1346589598.30964.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zoltan Gaal <z.p.gaal@gmail.com>
Date: Sun, 02 Sep 2012 05:39:58 -0700
In-Reply-To: <50433775.2030101@gmail.com>
References: <CAJTo0LYYFvwD75PsXu2WtC+CvQ2ep0i5bDKZFcNKFyQXwDDGTQ@mail.gmail.com>
	<50433775.2030101@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: clean up PACKAGECONFIG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Sep 2012 12:52:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-09-02 at 12:39 +0200, Zoltan Gaal wrote:
> I've tried it, but mesa-dri is required for xserver and it won't compile 
> without it. libgles-omap3 cannot replace the mesa dependency, though I'm 
> not sure  if it is a simple config issue or some interface is missing 
> (libgl). And as libgles-omap3 also provides virtual/egl, the bitbake 
> process detects, there exists multiple projects with the same provided 
> feature:
> 
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> ERROR: Multiple .bb files are due to be built which each provide 
> virtual/egl 
> (/home/gzp/work/gumstix/oe/oe-meta/meta-ti/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb 
> /home/gzp/work/gumstix/oe/oe-core/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb).
>   This usually means one provides something the other doesn't and should.
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> 
> (in local.conf: PREFERRED_PROVIDER_virtual/egl="libgles-omap3")

Try also adding it to MULTI_PROVIDER_WHITELIST (see bitbake.conf).

This error message did use to just be a note but was turned into an
error at various user's requests. Sometimes it means there are serious
configuration issues, in a case like this, its ok though...

Cheers,

Richard



