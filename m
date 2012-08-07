Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SykMa-0004On-Id for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 16:02:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77DodOD011567;
	Tue, 7 Aug 2012 14:50:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10824-06; Tue,  7 Aug 2012 14:50:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77DoWcR011561
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Aug 2012 14:50:33 +0100
Message-ID: <1344347435.9756.251.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 07 Aug 2012 14:50:35 +0100
In-Reply-To: <50211706.1050707@windriver.com>
References: <1344338236.9756.218.camel@ted> <50211706.1050707@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-3.4: Disable extra slang header search path
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
X-List-Received-Date: Tue, 07 Aug 2012 14:02:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-07 at 09:24 -0400, Bruce Ashfield wrote:
> On 12-08-07 07:17 AM, Richard Purdie wrote:
> > Add in a workaround to avoid host infection detection build failures
> > from the slang include directory in perf. I'll defer to Bruce to
> > fix this properly but we need a workaround now as this is breaking
> > builds.
> 
> I just followed up on a patch from 3 days ago, but I'll follow up here
> as well .. just to make sure the message gets through.
> 
> We had a pending patch to fix this issue from Liang Li here @ windriver.
> 
> Did that patch not fix the problem, or did it fall through the cracks ?

It is not correct. It adds in another search path and just hides the
issue. We should *never* be putting -I/usr/include/slang on the compiler
commandline at all period.

I'd assumed in all the email traffic that this was clear and that
another solution was being worked on that would be acceptable upstream
too.

Perhaps a better option might be: -I=/usr/include/slang ? That assumes
that all kernel gcc versions would accept the = notation, that should be
true by now?

Cheers,

Richard






