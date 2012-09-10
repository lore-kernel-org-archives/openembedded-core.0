Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBCVu-0004fp-1d for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 00:31:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8AMIvF0004168;
	Mon, 10 Sep 2012 23:18:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03643-02; Mon, 10 Sep 2012 23:18:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8AMIk5W004162
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 10 Sep 2012 23:18:48 +0100
Message-ID: <1347315527.31154.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Colin Walters <walters@verbum.org>
Date: Mon, 10 Sep 2012 23:18:47 +0100
In-Reply-To: <1347312212.1908.2.camel@lenny>
References: <1347292942-7241-1-git-send-email-ross.burton@intel.com>
	<1347311665.1908.1.camel@lenny> <1347312212.1908.2.camel@lenny>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkit-gtk: work around Make bug by re-running make
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
X-List-Received-Date: Mon, 10 Sep 2012 22:31:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-10 at 17:23 -0400, Colin Walters wrote:
> On Mon, 2012-09-10 at 17:14 -0400, Colin Walters wrote:
> > On Mon, 2012-09-10 at 17:02 +0100, Ross Burton wrote:
> > 
> > > +# fixed in Make CVS, so 3.83 won't have this problem.
> > 
> > I know this will be painful, but did you consider looking at the make
> > version and determine whether or not this workaround is necessary?
> 
> Or actually, why not just backport the make patch into core now?

We've gone around in circles on this several times.

The version check complicates the code more than I'd like. Adding a
make-native causes its own sets of pain and hoops we'd need to jump
through.

So I'm probably at the point I'll take this solution since its the
"least worst" :/.

Cheers,

Richard






