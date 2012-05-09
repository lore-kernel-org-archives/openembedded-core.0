Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SSDHP-0003J2-DY for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 22:14:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49K4f3P025760;
	Wed, 9 May 2012 21:04:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23680-10; Wed,  9 May 2012 21:04:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49K4ZuF025754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 9 May 2012 21:04:35 +0100
Message-ID: <1336593873.2494.74.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 09 May 2012 21:04:33 +0100
In-Reply-To: <CADkTA4OZ+EnnW=4LWnUo5vkw1MQ6f+kpsySHBqpuMNcHEWo9EQ@mail.gmail.com>
References: <cover.1336504721.git.bruce.ashfield@windriver.com>
	<1336546278.30349.26.camel@ted>
	<CADkTA4NF0VtWXRg6--vXVfPabtOemx8j4N0Aa2C_+v8a1b8jhA@mail.gmail.com>
	<CADkTA4OZ+EnnW=4LWnUo5vkw1MQ6f+kpsySHBqpuMNcHEWo9EQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: saul.wold@intel.com
Subject: Re: [PATCH 0/1] kernel-yocto: export GUILT_BASE
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
X-List-Received-Date: Wed, 09 May 2012 20:14:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-09 at 09:08 -0400, Bruce Ashfield wrote:
> On Wed, May 9, 2012 at 8:42 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > On Wed, May 9, 2012 at 2:51 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> On Tue, 2012-05-08 at 15:23 -0400, Bruce Ashfield wrote:
> >>> Richard/Saul,
> >>>
> >>> As Frans Meulenbroeks noted this morning, guilt wasn't functional
> >>> in the devshell. The fix was simple enough, and by ensuring that
> >>> GUILT_BASE is exported, it works without any extra steps now.
> >>>
> >>> I wasn't sure if there a better way to call 'up' to the base
> >>> method, so I repeated the call to oe_terminal in the do_devshell()
> >>> in kernel-yocto.bbclass.
> >>>
> >>> If there's another approach, let me know and I'll respin the patch.
> >>
> >> Can't you just set:
> >>
> >> GUILT_BASE = "meta"
> >
> > Will that export to the subshell ? I didn't try it .. since I didn't
> > think it would.
> > I'll give that a go here :)
> 
> With just that set in kernel-yocto.bbclass, and I launch devshell, I get this:
> 
> % guilt applied
> Patches directory doesn't exist, try guilt-init
> 
> So unless I misunderstood what you are suggesting, I still need that explicit
> export.

Sorry, let me be more clear. I meant does:

OE_TERMINAL_EXPORTS += "GUILT_BASE"
GUILT_BASE = "meta"

work?

I'm not sure we need everything in the original patch...

Cheers,

Richard



