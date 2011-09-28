Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8vca-0007su-By for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 17:00:28 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SF1IYa010944; Wed, 28 Sep 2011 16:01:18 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QRnXQUdUK8XP; Wed, 28 Sep 2011 16:01:17 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SF1FEx010933
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 28 Sep 2011 16:01:17 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 15:54:50 +0100
In-Reply-To: <0E901391-C9FC-48AE-88A4-C1064E57376E@dominion.thruhere.net>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-2-git-send-email-dbaryshkov@gmail.com>
	<CADkTA4NxfSaEinraLQMsLT4ZWQKOPAZ76uNujFXg0zSrRvVnFA@mail.gmail.com>
	<0E901391-C9FC-48AE-88A4-C1064E57376E@dominion.thruhere.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317221697.12332.13.camel@ted>
Mime-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 2/5] kernel.bbclass: respect MACHINE_KERNEL_PR
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
X-List-Received-Date: Wed, 28 Sep 2011 15:00:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-27 at 18:40 -0500, Koen Kooi wrote:
> 
> Op 27 sep. 2011 om 08:52 heeft Bruce Ashfield <bruce.ashfield@gmail.com> het volgende geschreven:
> 
> > On Sat, Sep 17, 2011 at 6:18 PM, Dmitry Eremin-Solenikov
> > <dbaryshkov@gmail.com> wrote:
> >> MACHINE_KERNEL_PR was introduced long ago in org.oe.dev. It's present in
> >> meta-oe kernel.bbclass. Several machines depend on this functionality.
> > 
> > I don' t have a big problem with this, since the change is obviously
> > harmless if it
> > doesn't need to be used. But similar to my comment on patch 3/5, is there any
> > history/technical reasons we can capture here ?
> > 
> > I did a quick search to dig up a bit on this myself, but a summary
> > would definitely
> > help, since I see that this has a long and sometimes twisting history. Is it as
> > simple as ?
> > 
> > "A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
> > rebuilds for kernel and external modules"
> 
> It is that simple :) 

I have reservations about this patch given we soon plan to stop needing
to bump PR values. This patch is actually a perfect example of how brain
dead the current manual PR bumping is and why we need something better.
I don't want half the code in the repo to be a mass of PR values which
need to be incremented manually under weird and wonderful circumstances
which is where the direction things are currently going...

I'd like to hold off on this one.

Cheers,

Richard





