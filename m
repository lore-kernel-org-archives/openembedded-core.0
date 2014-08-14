Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B6DF1601A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 09:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7E9PMk6002854; Thu, 14 Aug 2014 10:25:22 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id k4h-PlOp0AHG; Thu, 14 Aug 2014 10:25:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7E9PIeD002850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 14 Aug 2014 10:25:19 +0100
Message-ID: <1408008318.22187.86.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Peter A. Bigot" <pab@pabigot.com>
Date: Thu, 14 Aug 2014 10:25:18 +0100
In-Reply-To: <53EC77A2.9040809@pabigot.com>
References: <53EC77A2.9040809@pabigot.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: reconciling pending gcc recipe updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Aug 2014 09:25:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-08-14 at 03:47 -0500, Peter A. Bigot wrote:
> Khem and I both have pending patches to recipes-devtools/gcc.  A problem 
> is that the first one of mine is a whitespace cleanup, and I don't think 
> his are based on that.
> 
> What can be done to effectively reconcile any conflicts between these?
> 
> I'd really prefer to keep the cleanup patch, so I'd be happy to 
> cherry-pick Khem's changes into my series.  I'm not sure if his "Looks 
> good" follow-ups qualify for the addition of Signed-of-by in my other 
> changes.  I also expect at least one more cleanup patch (a rename so the 
> recipe nomenclature matches the GCC configuration option naming, viz. 
> s/fpu/float/ when determining --with-float which is different from 
> --with-fpu).
> 
> If my series stays live I'd be happy to add the gcc 4.9.x patch that got 
> Torvalds' knickers in a twist to the set.

Rebasing Khem's patches on top of yours and adding the patch you mention
both sound like good things to me and it helps me, thanks!

Cheers,

Richard


