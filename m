Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UW2VG-0001TM-9M for openembedded-core@lists.openembedded.org;
	Sat, 27 Apr 2013 12:37:16 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3RAKkZN007382; Sat, 27 Apr 2013 11:20:46 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZKYzLpwa5rkS; Sat, 27 Apr 2013 11:20:46 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3RAKgx8007373
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 27 Apr 2013 11:20:43 +0100
Message-ID: <1367057955.29677.99.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 27 Apr 2013 11:19:15 +0100
In-Reply-To: <5E6BBD57-21F8-4282-97F0-567ACFB008CD@dominion.thruhere.net>
References: <5E6BBD57-21F8-4282-97F0-567ACFB008CD@dominion.thruhere.net>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Annoyances with dylan
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Apr 2013 10:37:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-04-26 at 16:47 +0200, Koen Kooi wrote:
> Hi,
> 
> I have 2 big annoyances with dylan:
> 
> 1) Multimachine builds trigger spurious warnings:
> 
> WARNING: The recipe bonescript is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
>    /build/v2013.06/deploy/eglibc/licenses/bonescript/LICENSE
>    /build/v2013.06/deploy/eglibc/licenses/bonescript/generic_MIT
> 
> I get that every time after switching machines for each recipe/license.

This sounds like a symptom of a deeper problem. At a guess bonescript
has some machine specific element in it but its not marked as machine
specific and hence the system is getting confused. Do you have a list of
the recipes/licenses that are showing this? It is just license issues?

> 2) PRSERV makes things go backwards:
> 
> ERROR: Package version for package gadget-init-network went backwards which would break package feeds from (0:1.0-r19.3 to 0:1.0-r19.0)
> 
> To trigger 2) I updated meta-linaro and switches meta-minnow to the
> new rebased branch, delete $TMPDIR (prserv db is outside out TMPDIR)
> and started building images. I only happens for some recipes, not all.
> I can't deduce a pattern or easily reproduce it. Bug filed some months
> ago.

IIRC we looked into that bug quite extensively and couldn't find a way
to reproduce it. If we want to get it fixed, we're going to need some
help distilling it down to a simpler test case to reproduce so we can
understand the issue, then we can look at fixing it.

> On the flip side: *ZERO* problems with sstate so far :)

Nice to know :)

Cheers,

Richard



