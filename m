Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UcuxI-0003e8-15 for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 11:58:39 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4G9hOwq010071; Thu, 16 May 2013 10:43:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yxXnweM2F5cV; Thu, 16 May 2013 10:43:24 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4G9hE6a010053
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 16 May 2013 10:43:18 +0100
Message-ID: <1368697200.18324.142.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jesse Zhang <sen.zhang@windriver.com>
Date: Thu, 16 May 2013 12:40:00 +0300
In-Reply-To: <51948307.5070608@windriver.com>
References: <51948307.5070608@windriver.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: should perl modules go in oe-core? (possibly python and ruby ones too)
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
X-List-Received-Date: Thu, 16 May 2013 09:58:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-16 at 14:56 +0800, Jesse Zhang wrote:
> We've accumulated quite a few perl modules and would like to contribute
> some/all of them to oe-core. But I think we'd better ask how everyone
> thinks before doing so, since the number of the modules are pretty
> large, and the policy may as well apply to python/ruby packages.
> 
> Most of the modules are simple cpan recipes. They are easy to maintain,
> but do consume *some* manpower.
> 
> I think there are a few alternatives.
> 
> 1. decide on each module on a case-by-case basis.
> 
> 2. keep all of them in some special layer other than oe-core.
> 
> 3. everyone maintain what they need in-house.
> 
> None of them seems perfect. Is there already some policy?

I think the best approach would be to put these into meta-openembedded,
at least at first and then we can think about whether we want to move
any into OE-Core. I don't think we would want to take everything.

Cheers,

Richard





