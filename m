Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T9ORE-0004gx-6I for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 00:51:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q85MclGp031121;
	Wed, 5 Sep 2012 23:38:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28994-06; Wed,  5 Sep 2012 23:38:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q85McdNM031115
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 5 Sep 2012 23:38:41 +0100
Message-ID: <1346884719.21985.133.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chris Larson <clarson@kergoth.com>
Date: Wed, 05 Sep 2012 23:38:39 +0100
In-Reply-To: <CABcZANk7NaXkEUzYRof5OS22keHLNPN6cfYr0gy=5AS+Lbh9Qg@mail.gmail.com>
References: <cover.1346837268.git.liezhi.yang@windriver.com>
	<a30f2ce625990ccfb3e1e06794b353dc1f1257cb.1346837268.git.liezhi.yang@windriver.com>
	<32CDFC5F-610C-45E8-A239-A3387A8839FB@dominion.thruhere.net>
	<1346845447.21985.50.camel@ted>
	<E182019A-4B42-4F70-BA82-EDC685EDFA9A@dominion.thruhere.net>
	<1346879977.21985.88.camel@ted>
	<CABcZANk7NaXkEUzYRof5OS22keHLNPN6cfYr0gy=5AS+Lbh9Qg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>, Zhenfeng.Zhao@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 2/2] package_ipk.bbclass: use "--force-arch" when install package
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
X-List-Received-Date: Wed, 05 Sep 2012 22:51:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-05 at 15:19 -0700, Chris Larson wrote:
> On Wed, Sep 5, 2012 at 2:19 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > What I really need here is help with coming up with some working
> > solution. Putting our heads in the sand and arguing whether its even a
> > problem isn't going to go anywhere :(.
> 
> This doesn't make any sense. Deciding whether something is or isn't an
> actual problem / is or isn't expected behavior is a good thing to be
> doing, and is the opposite of putting heads in the sand, as it's
> debating user expectations vs tool behavior. If you really think it's
> better to blindly make changes before figuring out how the tool should
> behave relative to user expectations, or think figuring out what
> should be done first is "putting our heads in the sand", then 

This isn't what I was suggesting and is misinterpretation. Given the
following comment I'm not sure its worth taking the discuss further.

> I think
> we have serious problems with you in charge of the project.

Your opinion is duly noted, thanks ;-).

Cheers,

Richard



