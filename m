Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qe35o-0005rY-CF for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:43:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65Ad97a029850;
	Tue, 5 Jul 2011 11:39:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29515-07; Tue,  5 Jul 2011 11:39:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65Ad2k6029844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 5 Jul 2011 11:39:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309540367.20015.534.camel@rex>
References: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>
	<201106301633.48933.paul.eggleton@linux.intel.com>
	<4FC82E26-5A0C-48DF-99F5-7E2D9B8C7290@dominion.thruhere.net>
	<201106301659.54941.paul.eggleton@linux.intel.com>
	<1309537504.20015.531.camel@rex>  <1309540367.20015.534.camel@rex>
Date: Tue, 05 Jul 2011 11:38:31 +0100
Message-ID: <1309862311.20015.689.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] insane bbclass: turn fatal errors back into fatal errors
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
X-List-Received-Date: Tue, 05 Jul 2011 10:43:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

So to further update on this, I think with the fixes I've merged,
OE-Core should be clean for all the QA tests except desktop file
warnings and ldflags.

ldflags was a problem as the code wasn't triggering at all in Yocto due
to a bug in bitbake to do with the way ??= vs ?= was being handled.

I'll have to run some further builds to see how bad the ldflags problem
is and it may take a little longer to address those issues but its a
step in the right direction at least and we can go ahead and make all
the other areas apart from desktop and ldflags become errors whenever we
want IMO.

Cheers,

Richard



