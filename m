Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa12-04.prod.phx3.secureserver.net
	(p3plsmtpa12-04.prod.phx3.secureserver.net [68.178.252.233])
	by mail.openembedded.org (Postfix) with ESMTP id 9C4AE60424
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 08:47:32 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa12-04.prod.phx3.secureserver.net with 
	id eYnX1o0051mTNtu01YnXQe; Thu, 14 Aug 2014 01:47:33 -0700
Message-ID: <53EC77A2.9040809@pabigot.com>
Date: Thu, 14 Aug 2014 03:47:30 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: reconciling pending gcc recipe updates
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
X-List-Received-Date: Thu, 14 Aug 2014 08:47:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Khem and I both have pending patches to recipes-devtools/gcc.  A problem 
is that the first one of mine is a whitespace cleanup, and I don't think 
his are based on that.

What can be done to effectively reconcile any conflicts between these?

I'd really prefer to keep the cleanup patch, so I'd be happy to 
cherry-pick Khem's changes into my series.  I'm not sure if his "Looks 
good" follow-ups qualify for the addition of Signed-of-by in my other 
changes.  I also expect at least one more cleanup patch (a rename so the 
recipe nomenclature matches the GCC configuration option naming, viz. 
s/fpu/float/ when determining --with-float which is different from 
--with-fpu).

If my series stays live I'd be happy to add the gcc 4.9.x patch that got 
Torvalds' knickers in a twist to the set.

Peter

