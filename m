Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QJsGk-0000l4-Ud for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 21:06:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4AJ49Wo009664
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 20:04:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09491-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 20:04:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4AJ41wb009657
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 20:04:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DC98507.6070103@mentor.com>
References: <BANLkTi=424KO0PMR6b_2QC98qtUryMykdQ@mail.gmail.com>
	<4DC8CA7E.4020302@linux.intel.com>
	<BANLkTi=G0wk3a5N4hvTzRcC09U7n-HFH1Q@mail.gmail.com>
	<4DC97D27.9080602@linux.intel.com>
	<20110510181314.GF3673@jama.jama.net> <4DC98507.6070103@mentor.com>
Date: Tue, 10 May 2011 20:03:57 +0100
Message-ID: <1305054238.30391.283.camel@rex>
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
X-List-Received-Date: Tue, 10 May 2011 19:06:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 11:33 -0700, Tom Rini wrote:
> On 05/10/2011 11:13 AM, Martin Jansa wrote:
> > I'm using slightly modified script for pull requests from gitorious.
> > 
> > send-pull-request are the same as long as you use git send-email and
> > have sendemail.to defined in repo.
> > 
> > To modify it for github is as simple as this I guess.
> > 
> > $ diff -uNr shr-core/openembedded-core/scripts/create-pull-request ~/bin/meta-efl-create-pull-request 
> > --- shr-core/openembedded-core/scripts/create-pull-request 2011-04-04 09:35:47.973626385 +0200
> > +++ /OE/bin/meta-efl-create-pull-request        2011-05-10 13:33:20.349688815 +0200
> > @@ -2,9 +2,11 @@
> >  ODIR=pull-$$
> >  RELATIVE_TO="master"
> >  COMMIT_ID="HEAD"
> > -PULL_URL="git://git.openembedded.org/openembedded-core-contrib"
> > -WEB_URL_PREFIX="http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h="
> > -PREFIX="PATCH"
> > +#PULL_URL="git://git.openembedded.org/meta-openembedded-contrib"
> > +#WEB_URL_PREFIX="http://git.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h="
> > +PULL_URL="git://gitorious.org/shr/meta-openembedded.git"
> > +WEB_URL_PREFIX="http://gitorious.org/shr/meta-openembedded/commits/"
> > +PREFIX="meta-efl][PATCH"
> >  
> >  usage() {
> >  CMD=$(basename $0)
> 
> Hmmm.  I'm going to take a stab at making this a create-pull-request
> option...

Martin/Tom: Serious question - why not use the contrib repo for this?

I have nightmares about all the development being spread to all the
corners of the globe and people not being able to see what is being
worked on. For short lived branches its not so much of a problem but as
we take on longer lived feature development it will be a problem. I'd
therefore like to understand why the dislike of it...

Cheers,

Richard



