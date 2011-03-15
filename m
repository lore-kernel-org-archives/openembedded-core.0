Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PzIpO-0002yJ-Va for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 02:13:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2F1BtQ5011010;
	Tue, 15 Mar 2011 01:11:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10827-03; Tue, 15 Mar 2011 01:11:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2F1BmBu011004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 15 Mar 2011 01:11:48 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <AANLkTikQ-kF5u6AAKmWojmuP3xGZB4EPR0RkhhSsWAns@mail.gmail.com>
References: <cover.1299940883.git.raj.khem@gmail.com>
	<4D7CE94A.5080706@mlbassoc.com>
	<CCDB3981-855D-444D-A271-A863C2765CC4@dominion.thruhere.net>
	<4D7CF827.60904@mlbassoc.com>
	<AANLkTikQ-kF5u6AAKmWojmuP3xGZB4EPR0RkhhSsWAns@mail.gmail.com>
Date: Tue, 15 Mar 2011 01:11:42 +0000
Message-ID: <1300151502.30423.939.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 0/1] Import own-mirrors class from OE
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
X-List-Received-Date: Tue, 15 Mar 2011 01:13:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-03-13 at 11:50 -0700, Chris Larson wrote:
> On Sun, Mar 13, 2011 at 10:00 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> > Ask Richard?  I was just pointing out that Poky/Yocto already has a
> > mechanism;
> > perhaps the OE one is better, who knows.
> 
> There seems to be some confusion here.  PREMIRRORS isn't a
> "poky/yocto" mechanism.  It started in OE, and stills works just fine
> there (it's implemented in bitbake).  own-mirrors is simply a
> convenience to make premirrors manipulation easier for the user.  If
> convenience and usability isn't a priority for poky/yocto, I'd be
> curious to hear the reasoning.

There were various fixes/improvements to PREMIRRORS as part of the
fetch2 work which is perhaps where the confusion has come from. 

This mirror enhancement is tangential to that and the patch is fine, I
just merged it.

Cheers,

Richard



