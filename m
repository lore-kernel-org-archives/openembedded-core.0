Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PzYwV-0000fp-NK for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 19:26:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2FIOFRk022909;
	Tue, 15 Mar 2011 18:24:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22654-04; Tue, 15 Mar 2011 18:24:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2FIO7Gs022903
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 15 Mar 2011 18:24:07 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <AANLkTikC7yWvzTzf1Od2WLiBhQjz1iactGCaPCN+aAmR@mail.gmail.com>
References: <161e1f47c2460d5b2463300e31bf5eebb46b8698.1300172958.git.dvhart@linux.intel.com>
	<ACE0CCC0-8D25-4FC2-93B2-73C60636721A@beagleboard.org>
	<4D7F9CC2.2030002@linux.intel.com>
	<AANLkTikC7yWvzTzf1Od2WLiBhQjz1iactGCaPCN+aAmR@mail.gmail.com>
Date: Tue, 15 Mar 2011 18:23:58 +0000
Message-ID: <1300213438.30423.1820.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>, Koen Kooi <koen@beagleboard.org>
Subject: Re: [PATCH] [RFC] kernel: rework kernel and module classes to allow for building out-of-tree modules
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
X-List-Received-Date: Tue, 15 Mar 2011 18:26:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-15 at 10:24 -0700, Khem Raj wrote:
> On Tue, Mar 15, 2011 at 10:07 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> >
> > What are the ownership and perms on those?
> >
> > I suppose we could avoid the .pc directory - but it's going to require
> > something more than cp or some additional scripting. Something like tar's
> > exclude functionality might be needed - but I hate to add the intermediate
> > step as the kernel recipes are already so slow.
> 
> 
> hmmm I wonder why those are marked non readable in .pc directory  that
> seems wrong to me

Its quilt that does this. Kind of annoying but its been doing that for a
few versions now...

Cheers,

Richard



