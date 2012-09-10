Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TB2wE-0001sk-38 for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 14:18:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8AC5RxX030235;
	Mon, 10 Sep 2012 13:05:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04204-06; Mon, 10 Sep 2012 13:05:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8AC5GFF030198
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 10 Sep 2012 13:05:18 +0100
Message-ID: <1347278718.10278.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 10 Sep 2012 13:05:18 +0100
In-Reply-To: <cover.1347062288.git.sgw@linux.intel.com>
References: <cover.1347062288.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED REQUEST 00/32] LSB Perl, QEMU Update & Fixes (Cover Only)
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
X-List-Received-Date: Mon, 10 Sep 2012 12:18:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-07 at 17:08 -0700, Saul Wold wrote:
> Richard,
> 
> This has the set of perl/LSB related changes, I found that LSB 5.0
> is expected early next year, so we can pull these after it is released
> before 1.4!
> 
> This also adds a few (3) more simple sanity tests for sato.
> 
> I also included Robert's binary_package.bbclass, which matches up with 
> the bitbake change you have already taken.
> 
> I have done some light testing with the updated qemu, I will do more
> early next week, once we get past RC1 Testing next we we can have QA 
> test this more throughly.

I merged this in but I moved the perl recipes to recipes-lsb4 to make it
clear that whilst they're added at the moment, this is a temporary thing
until lsb5.

Cheers,

Richard



