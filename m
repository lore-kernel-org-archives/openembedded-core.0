Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDYs2-0000vr-OD for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 12:15:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2UA6l0Q012076
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 11:06:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11886-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 11:06:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2UA6bQl012070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 11:06:38 +0100
Message-ID: <1333101996.18082.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2012 11:06:36 +0100
In-Reply-To: <20120330070028.GI25815@jama.jama.net>
References: <20120329225332.0e8cc2f4@eb-e6520> <1333058593.18082.40.camel@ted>
	<CADkTA4MvYRmsLQogaQMHwUeP5y7ws5NvmXiBMgvsreiGNQrsJw@mail.gmail.com>
	<20120330070028.GI25815@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Fetch time optimization (svn : gcc/eglibc - git : linux-yocto)
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
X-List-Received-Date: Fri, 30 Mar 2012 10:15:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-30 at 09:00 +0200, Martin Jansa wrote:
> On Thu, Mar 29, 2012 at 09:03:15PM -0400, Bruce Ashfield wrote:
> > On Thu, Mar 29, 2012 at 6:03 PM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >> - do the same thing for the linux-yocto kernel or add a --reference
> > >>   option to the git fetcher so that we can provide a local tree as a
> > >>   reference ?
> > >
> > > This is effectively how the repositories in DL_DIR are used. If you
> > > place a tree in the right place there, it should reuse references...
> > 
> > Agreed .. they definitely do here.
> 
> What's right place?
> 
> I guess the idea was to use --reference for e.g. some other kernel recipe
> sources checkout.
> 
> And I guess that building linux-foo won't notice that there is e.g.
> /OE/downloads/git2/gitorious.org.shr.linux.git:
> from which it can share a lot of objects using --reference
> 
> Bob Ham (rah on #oe) said that he is working on some sort of support
> for --reference with bitbake after I've refused to add just another
> linux-bar recipe to meta-smartphone, but not sure how he plans to
> implement it to be usefull and working oob in different env with
> different sources available in downloads dir.

You could conceivably symlink all your different kernel directories
together within git2/. As far as I can tell, the fetcher simply wouldn't
care in most cases. The branch structures could get a little mangled I
guess and you'd not want to share the resulting mirror tarballs.

There is an argument for using one large shared container for all the
git objects as another way of solving this. I don't know how well git
has that supported but at the object level its a non-issue at least.

Cheers,

Richard



