Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QOWDy-0003So-Mw for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 16:35:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4NEWFKj017467
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 15:32:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10692-08 for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 15:32:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4NEW8Wx017448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 15:32:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306152192.2525.73.camel@phil-desktop>
References: <cover.1306002889.git.sgw@linux.intel.com>
	<25cb5d89f245bcfdc7f0654ba7025e1e1a24bc64.1306002889.git.sgw@linux.intel.com>
	<1306152192.2525.73.camel@phil-desktop>
Date: Mon, 23 May 2011 15:32:06 +0100
Message-ID: <1306161126.3424.848.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/8] puzzles: update to r9173
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
X-List-Received-Date: Mon, 23 May 2011 14:35:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-23 at 13:03 +0100, Phil Blundell wrote:
> On Sat, 2011-05-21 at 11:37 -0700, Saul Wold wrote:
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >  .../puzzles/{puzzles_r9163.bb => puzzles_r9173.bb} |    0
> >  1 files changed, 0 insertions(+), 0 deletions(-)
> >  rename meta/recipes-sato/puzzles/{puzzles_r9163.bb => puzzles_r9173.bb} (100%)
> 
> No doubt the patch is fine, but why is this recipe in oe-core at all?
> It doesn't seem to fit any reasonable definition of "core" functionality
> that I can immediately think of.

This is a discussion that the TSC had. Somehow we need the ensure we had
the ability to test oe-core easily and extensively and sato is a pretty
contained way to do that. Originally I'd expected sato to get split into
its own layer but we didn't do that for this reason.

Cheers,

Richard







