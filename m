Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QS8bD-0000Bq-6j for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 16:10:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52E70SM013741
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 15:07:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13073-06 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2011 15:06:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52E6pwP013731
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 15:06:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE6A836.3040004@mentor.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
	<4DE67440.1020405@mentor.com> <1306950977.27470.461.camel@rex>
	<4DE69582.2090508@mentor.com>
	<1306958729.3119.3.camel@lenovo.internal.reciva.com>
	<4DE6A43A.3050401@mentor.com>
	<1306961135.3119.13.camel@lenovo.internal.reciva.com>
	<4DE6A836.3040004@mentor.com>
Date: Thu, 02 Jun 2011 15:06:31 +0100
Message-ID: <1307023591.27470.549.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC v1 PATCH 00/16] populate perl-native into its own	directory
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
X-List-Received-Date: Thu, 02 Jun 2011 14:10:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 13:59 -0700, Tom Rini wrote:
> On 06/01/2011 01:45 PM, Phil Blundell wrote:
> > On Wed, 2011-06-01 at 13:42 -0700, Tom Rini wrote:
> >> What falls down in this case is that  once
> >> perl-native is built (and in our PATH), if it's a different version than
> >> system-wide perl, stuff starts failing on version mis-match.
> > 
> > I think that's the bit that I'm not properly understanding.  Which
> > versions are mismatching, exactly?  
> > 
> > Surely the local perl from the sysroot ought to be completely
> > self-contained and shouldn't be using any bits from the host perl
> > install at that point.
> 
> So this jogs my memory a bit!  It's not so much perl itself but stuff
> that uses perl that can get dirty and then no, you have stuff thats
> built for system perl and stuff that's built with perl-native clashing.
> 
> Relying even more on memory, I think help2man was one of the "easy"
> culprits and since we also modify the env, we do things like have
> help2man run with PERL5LIB and so on pointing system-wide perl at
> perl-native's lib directory and so forth.

But with the proposed patch series either:

a) help2man depends perlnative.bbclass

In this case it can depend on perl-native being there, its in path and
things work as per OE.dev.

b) help2man doesn't depend in perlnative.bbclass

It only sees the system perl.

So I'm still not clear where the problem is?

Cheers,

Richard






