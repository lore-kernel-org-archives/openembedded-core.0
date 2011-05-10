Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QJt46-0001Jp-Vx for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 21:57:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4AJt6BC010032
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 20:55:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09936-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 20:55:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4AJsrVf009998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 20:54:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTinT7bN=-QfQg24GtrOaRW4U3vv-zQ@mail.gmail.com>
References: <BANLkTi=424KO0PMR6b_2QC98qtUryMykdQ@mail.gmail.com>
	<4DC8CA7E.4020302@linux.intel.com>
	<BANLkTi=G0wk3a5N4hvTzRcC09U7n-HFH1Q@mail.gmail.com>
	<4DC97D27.9080602@linux.intel.com>
	<20110510181314.GF3673@jama.jama.net>
	<4DC98507.6070103@mentor.com> <1305054238.30391.283.camel@rex>
	<BANLkTinT7bN=-QfQg24GtrOaRW4U3vv-zQ@mail.gmail.com>
Date: Tue, 10 May 2011 20:32:50 +0100
Message-ID: <1305055971.30391.295.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Pull request with misc changes
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
X-List-Received-Date: Tue, 10 May 2011 19:57:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 16:15 -0300, Otavio Salvador wrote:
> On Tue, May 10, 2011 at 16:03, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >> Hmmm.  I'm going to take a stab at making this a create-pull-request
> >> option...
> >
> > Martin/Tom: Serious question - why not use the contrib repo for this?
> >
> > I have nightmares about all the development being spread to all the
> > corners of the globe and people not being able to see what is being
> > worked on. For short lived branches its not so much of a problem but as
> > we take on longer lived feature development it will be a problem. I'd
> > therefore like to understand why the dislike of it...
> 
> Welcome to Distribute Source Control Management World; this is the
> beauty of it and I see no reason to restrict or enforce people to use
> a repository.

Nobody wants to force anyone. I just asked for the reasons why people
weren't using it as if there was anything we could fix, we could look
into it.

> In my personal case we have been using GitHub as a central place to
> put projects that O.S. Systems is contributing and this is good to
> gather us some visibility so OE will be there too.
> 
> So I won't use contrib to share patches. I can send them to mailing
> list (as I have been doing). A merge on a topic branch is a git pull
> command from you so I see not much problem for you or whom is doing
> the pull job.
> 
> As an example:
> 
>  git checkout -b otavio-20110510-review
>  git pull git://github.com/OSSystems/oe-core.git master
>  git shortlog origin/master..
> 
> Is that so difficult?

I didn't say it was difficult ;-).

Thanks for answering the question, there is little we can do to change
your reasons for what you do and that's fine. I've ensured we're not
doing something that forces you elsewhere at least.

Cheers,

Richard



