Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QKCru-00080P-37 for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 19:06:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BH3qQF022333
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 18:03:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22185-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 18:03:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BH3iHm022327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 18:03:44 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DC9C3B2.3050201@mentor.com>
References: <1305053706-19572-1-git-send-email-tom_rini@mentor.com>
	<BANLkTin42LTK6D9ui-C_SXmWiNLAz1T66Q@mail.gmail.com>
	<4DC9C3B2.3050201@mentor.com>
Date: Wed, 11 May 2011 18:03:38 +0100
Message-ID: <1305133418.30391.425.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] create-pull-request: Add -l location switch
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
X-List-Received-Date: Wed, 11 May 2011 17:06:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 16:01 -0700, Tom Rini wrote:
> On 05/10/2011 12:18 PM, Otavio Salvador wrote:
> > On Tue, May 10, 2011 at 15:55, Tom Rini <tom_rini@mentor.com> wrote:
> >> Add a -l switch that takes an argument of either github or gitorious
> >> and will make the cover letter have a fill-in-the-blank of where the
> >> changes are on either github or gitorious.
> > 
> > Another possibility would be to use git config interface to store
> > those. You might have something like:
> > 
> > [oe-core-pull-request]
> > mode = github
> > user = foo
> > 
> > or
> > 
> > [oe-core-pull-request]
> > mode = gitorious
> > user = bar
> > 
> > This could be used to fill the fields in a proper way since those are
> > predictable.
> 
> If I had a good bit more time, I might re-write the script in python and
> parse .ini files (same syntax as gitconfig) so that lots of useful
> defaults could be saved.  But here's the real test, given that you're an
> intended user, would you use the -l switch or just make a local change
> to the script like Martin showed?

FWIW, we could at least extract a url from the .config of the git
repository with a command like "git remote -v show oe-core-pull-request"

Cheers,

Richard




