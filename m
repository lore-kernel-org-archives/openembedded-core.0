Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Soczf-0006im-2H for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 18:08:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6AFvdOH018764;
	Tue, 10 Jul 2012 16:57:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18084-07; Tue, 10 Jul 2012 16:57:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6AFvSYo018757
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 10 Jul 2012 16:57:31 +0100
Message-ID: <1341935849.1294.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 16:57:29 +0100
In-Reply-To: <CAEsOVNf0SDnxATQog_8Li1oeK6wkqhVH+m=Bt=L0bBbR02B05Q@mail.gmail.com>
References: <1341927124.24837.8.camel@ted>
	<CAEsOVNf0SDnxATQog_8Li1oeK6wkqhVH+m=Bt=L0bBbR02B05Q@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: bitbake.conf: Add git-native to ASSUME_PROVIDED
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
X-List-Received-Date: Tue, 10 Jul 2012 16:08:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-10 at 15:00 +0000, McClintock Matthew-B29882 wrote:
> On Tue, Jul 10, 2012 at 8:32 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Originally, git was something new, not installed everywhere and had commandline
> > stability problems. This has changed and git it no longer makes sense to
> > continually build this when the system installed version is likely sufficient.
> >
> > This speeds up build since recipes no longer have to wait for git-native to build
> > if they're fetched from a git:// SRC_URI.
> >
> > Also add git to the sanity checks and drop the no unneeded svn reference.
> 
> What about testing the host system for presence of certain things?
> Then one could
> 
> 1) yum/apt/etc install the needed items
> 
> or
> 
> 2) Build it if it's not present

Every time we put an if statement in like this, it basically means we
should double the amount of QA, one for one path and one for the other.

So whilst I've wondered about it, do we really need to do something like
this?

Cheers,

Richard



