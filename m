Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPLin-00050a-6Z for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 23:34:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4PLVQux005152;
	Wed, 25 May 2011 22:31:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04653-08; Wed, 25 May 2011 22:31:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4PLVH30005146
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 25 May 2011 22:31:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DDD60E3.606@linux.intel.com>
References: <4DDBDE9D.5000709@linux.intel.com>
	<20110524172330.GC18086@sakrah.homelinux.org>
	<6D7346D0-2F4B-44EC-A04B-2F443B33E544@dominion.thruhere.net>
	<1306260430.2491.2.camel@elmorro> <1306333690.2491.82.camel@elmorro>
	<1306334330.2525.236.camel@phil-desktop>
	<4DDD50D3.4090202@linux.intel.com>
	<1306350664.3120.28.camel@lenovo.internal.reciva.com>
	<4DDD60E3.606@linux.intel.com>
Date: Wed, 25 May 2011 22:31:16 +0100
Message-ID: <1306359076.27470.65.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: adding meta-intel layers breaks parsing, was Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Wed, 25 May 2011 21:34:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-25 at 13:04 -0700, Darren Hart wrote:
> 
> On 05/25/2011 12:11 PM, Phil Blundell wrote:
> > On Wed, 2011-05-25 at 11:56 -0700, Darren Hart wrote:
> >> If it is indeed space separated then I should be able to remedy both
> >> issues by simply using the append operator and not self-referencing.
> >> Correct?
> > 
> > I think that's true, yes.  But, space separation is fairly undesirable
> > for anything involving paths (particularly absolute ones) and it is
> > tempting to say that we should change that variable to have a different
> > separator. 
> > 
> 
> The only example I see of concatenating this variable is a prepend which
> uses colons. RP also mentioned he was pretty sure it should be colons.
> I'll figure it out for certain and fix the path assignments in meta-intel.

I checked the code and it is currently setup to use spaces but all the
users I've seen use colons.

There is significant precedent for *PATH* variables (FILESPATH, BBPATH,
PATH) being colon delimited so I'm tempted to say the utils.bbclass code
handling this should be fixed for EXTRAFILESPATH.

Also, the self referencing of that variable is correct. What is missing
is a default value for it, again that needs fixing in the core...

Cheers,

Richard



 




