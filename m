Received: from [77.241.230.245] (helo=waldorf.attingo.nl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R79uh-00043O-Ks for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 19:51:51 +0200
Received: from ndx.aas.attingo.nl ([77.241.230.246]:10833 helo=[10.0.5.155])
	by waldorf.attingo.nl with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.74) (envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R79Yv-0000dX-Ss for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 19:29:24 +0200
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 Sep 2011 18:30:10 +0100
In-Reply-To: <CAP9ODKqWLVrKRE+HT4k82f+BYdY96N_h581dp8u0AETWBTQV0w@mail.gmail.com>
References: <CAP9ODKpF7hQQmB7YWE4RCWDbEfZwv8432KJrBmvpwe1u_SaCTg@mail.gmail.com>
	<1316734501.28323.18.camel@ted>
	<CAP9ODKqWLVrKRE+HT4k82f+BYdY96N_h581dp8u0AETWBTQV0w@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316799031.3125.3.camel@ted>
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
X-List-Received-Date: Fri, 23 Sep 2011 17:51:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-23 at 13:41 -0300, Otavio Salvador wrote:
> On Thu, Sep 22, 2011 at 20:33, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2011-09-22 at 09:49 -0300, Otavio Salvador wrote:
> >> I noticed the 2011-1 branch today and it seems it is not fully merged
> >> into master; this is a mistake since it will create an upgrade path
> >> problem for users of it.
> >
> > Its a branch, master continues on, that branch just gets fixes suitable
> > for a stable/release branch. I appreciate people have different
> > definitions of stable and we need to do a better job of documenting what
> > those criteria are. As a quick attempt:
> 
> The point here is not about what is allowed to get into it or not but
> how it is going to work related to master.
> 
> The point is that if we keep it as a branch and doesn't merge it into master.
> 
> If we merge the stable branch into master, from time to time, users
> that want to go to move to master can merge master into their branch
> as it has a common parent and the conflicts fixed. If it is done too
> late, it becomes a nightmare.
> 
> This is something I'd like to discuss and see how people think about
> the process and what way we ought to use.

I don't really see the point of this. Basically you're asking that every
time there is a commit to the branch there is also a merge commit. You
can just as easily either force a checkout of master, or merge against
master with a one sided merge. Git doesn't have the confidence to do
that automatically but I'm pretty sure there is a simple way to tell git
to do a one sided merge...

Cheers,

Richard



