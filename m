Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R87VC-0000YC-AA for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 11:29:30 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8Q9UOUV011958 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 10:30:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JoULqsAktMR8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 10:30:24 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8Q9UIAx011947
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 10:30:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2011 10:23:55 +0100
In-Reply-To: <CAP9ODKoqywvZQyAJ=Jz8wh4hVoucJvo-QpyTZ_cpP8MhnEXb3w@mail.gmail.com>
References: <CAP9ODKpF7hQQmB7YWE4RCWDbEfZwv8432KJrBmvpwe1u_SaCTg@mail.gmail.com>
	<1316734501.28323.18.camel@ted>
	<CAP9ODKqWLVrKRE+HT4k82f+BYdY96N_h581dp8u0AETWBTQV0w@mail.gmail.com>
	<1316799031.3125.3.camel@ted>
	<CAP9ODKoqywvZQyAJ=Jz8wh4hVoucJvo-QpyTZ_cpP8MhnEXb3w@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317029042.26109.29.camel@ted>
Mime-Version: 1.0
Subject: Re: Branch management for OE-Core release
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
X-List-Received-Date: Mon, 26 Sep 2011 09:29:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-23 at 15:12 -0300, Otavio Salvador wrote:
> On Fri, Sep 23, 2011 at 14:30, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> ...
> > I don't really see the point of this. Basically you're asking that every
> > time there is a commit to the branch there is also a merge commit. You
> > can just as easily either force a checkout of master, or merge against
> > master with a one sided merge. Git doesn't have the confidence to do
> > that automatically but I'm pretty sure there is a simple way to tell git
> > to do a one sided merge...
> 
> Not every time but at every release and point release.
> 
> one sided merge make you lose all local changes you did. Doesn't seems
> a valid upgrade path but a "replace path".

Equally, merging against master would make things much more difficult
for anyone wanting to cherry-pick patches over which we've not picked in
the main release branch. Since creating "enhanced" rellease branches is
something we want to support/encourage, I'm still not convinced a load
of merge commits are a good idea.

FWIW, something like git cherry can identify your local changes so you
could apply them on top of master so there are other ways to make your
usecase work...

Cheers,

Richard








