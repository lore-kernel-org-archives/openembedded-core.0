Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SIMiF-0001Ow-PM for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 18:17:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3CG8E7Q024537;
	Thu, 12 Apr 2012 17:08:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23908-04; Thu, 12 Apr 2012 17:08:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3CG83G4024530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 Apr 2012 17:08:04 +0100
Message-ID: <1334246884.7309.40.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <sakoman@gmail.com>
Date: Thu, 12 Apr 2012 17:08:04 +0100
In-Reply-To: <CAGDS+nnQtcD7X4xLUnWTB1aBouceo99hE-zY+w57JHE0nBYV=g@mail.gmail.com>
References: <1334179880.31685.12.camel@ted> <4F85FACB.8080205@windriver.com>
	<CAGDS+nmSY2TD8HRzYfrcOeUjxwyb1D_dDQkTBtMseNG0cUbc6A@mail.gmail.com>
	<CAGDS+nntS5YWw0U8wSJYBdgdhnaGsnLr71F6SdMFECoMsCVHRw@mail.gmail.com>
	<4F86F8D2.2050402@windriver.com>
	<CAGDS+nnQtcD7X4xLUnWTB1aBouceo99hE-zY+w57JHE0nBYV=g@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches, the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm: Fix useradd preinst ordering issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Apr 2012 16:17:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-04-12 at 08:55 -0700, Steve Sakoman wrote:
> On Thu, Apr 12, 2012 at 8:46 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> > On 4/12/12 10:36 AM, Steve Sakoman wrote:
> >>
> >> On Thu, Apr 12, 2012 at 6:39 AM, Steve Sakoman<sakoman@gmail.com>  wrote:
> >
> >
> > That is very odd, the system is supposed to identify all of the dependencies
> > needed for the first set of packages... (the three base-passwd, base-files
> > and shadow).
> 
> Perhaps the issue is with the bash package -- for some reason rpm
> doesn't realize that bash provides /bin/sh?
> 
> > The end result is a list of 10-12 binaries to be installed that meet those
> > requirements, as well as the original three requested packages.
> >
> > We also shouldn't specify bash because busybox provides /bin/sh in a lot of
> > configurations.
> >
> > Which image did you try to build and I'll see what I can replicate here.
> 
> The images I built are not standard oe-core/yocto images, they are
> custom images that don't include busybox.  Perhaps that is why I am
> seeing the issue and others aren't.
> 
> If you are really interested in replicating let me know and I can
> provide you with pointers to my image recipes.

For what its worth, bash here does Provides: /bin/sh so I'm a little
puzzled about what is going on here. If its not doing that, it would
certainly cause the error you're reporting...

This is with master? Did you do anything like disable the per file
dependencies?

Cheers,

Richard





