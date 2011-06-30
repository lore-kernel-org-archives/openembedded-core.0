Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcCF4-0008Va-Gn for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 10:04:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5U81BIw015014
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 09:01:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14433-09 for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 09:01:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5U811Qe015008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 09:01:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTi=9ngg0yFnggOKLuccsdA7jTwTaZw@mail.gmail.com>
References: <cover.1309370038.git.anders@chargestorm.se>
	<BANLkTi=9ngg0yFnggOKLuccsdA7jTwTaZw@mail.gmail.com>
Date: Thu, 30 Jun 2011 09:00:44 +0100
Message-ID: <1309420844.20015.426.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC v3 PATCH 0/9] Linux 3.0 build support
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
X-List-Received-Date: Thu, 30 Jun 2011 08:04:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 20:02 +0200, Anders Darander wrote:
> On Wed, Jun 29, 2011 at 19:54, Anders Darander <anders@chargestorm.se> wrote:
> >
> > v3: - task-base.bb: fix a problem that *pcmia26 couldn't be found.
> 
> This third version fixes a bug introduced in v2. (task-base-pcmcia26
> weren't found). The fix is incorporated in patch 0008 (task-base).
> 
> Sofar, I've only got positive feedback on v2. (some feedback off-list
> (including some that probably should have been on-list if it hadn't
> been for some gmane problems).
> 
> Unless I find some more problems, or get such reports, I plan to send
> a pull request towards the end of this week.

It looks good to me apart from some ordering and PR bump type issues. 

Where you change the depmod dependency for example, we really need to
rebuild module-init-tools at the same time so the binary changes name at
the right point in the series. Patch 4 and patch 2 therefore probably
need to be together with a PR bump. I also wondered what the patch to
module-init-tools you're removing does (and why you just disabled rather
than deleted it).

Looks good though! I'm trying to resist merging some of the standalone
bits straight away :)

Cheers,

Richard



