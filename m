Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0sUK-00079w-NK for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 11:34:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OAQY84004280;
	Fri, 24 Feb 2012 10:26:34 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03283-06; Fri, 24 Feb 2012 10:26:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OAQPAO004274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 24 Feb 2012 10:26:27 GMT
Message-ID: <1330079186.32006.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2012 10:26:26 +0000
In-Reply-To: <4F473702.7020909@bluegiga.com>
References: <1328890565-8304-1-git-send-email-gary@mlbassoc.com>
	<4F473702.7020909@bluegiga.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] initscripts: Make /etc/timestamp consistent again.
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
X-List-Received-Date: Fri, 24 Feb 2012 10:34:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-02-24 at 09:06 +0200, Lauri Hintsala wrote:
> On 02/10/2012 06:16 PM, Gary Thomas wrote:
> > Commit cc8695 changed the way timestamps were handled
> > and added some extra munging to be able to compare them
> > reliably.  This change makes the timestamp value the same
> > everywhere and simplifies how the check to set the system
> > clock based on the timestamp is done.
> >
> > Also, if the value stored in /etc/timestamp is newer
> > [at all] than the current system time, set the system clock
> > from the stored value, down to the minute, not just the day.
> >
> > Signed-off-by: Gary Thomas<gary@mlbassoc.com>
> > ---
> >   .../initscripts/initscripts-1.0/bootmisc.sh        |    4 ++--
> >   .../initscripts/initscripts-1.0/save-rtc.sh        |    2 +-
> >   meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
> >   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> 
> Hi Gary,
> 
> You should do the same changes to meta/classes/image.bbclass where the 
> /etc/timestamp file is generated to filesystem image.

Agreed, this is a nasty inconsistency. I've pushed a patch into master
which fixes this.

Cheers,

Richard



