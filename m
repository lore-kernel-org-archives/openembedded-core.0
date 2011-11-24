Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTXYJ-0006n3-GP for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 12:33:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOBQaRB024107;
	Thu, 24 Nov 2011 11:26:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23685-06; Thu, 24 Nov 2011 11:26:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOBQS2k024101
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 24 Nov 2011 11:26:29 GMT
Message-ID: <1322133994.24143.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 24 Nov 2011 11:26:34 +0000
In-Reply-To: <B17E0298-4C9C-461A-A713-ADEE9771F8F0@dominion.thruhere.net>
References: <cover.1322120651.git.dvhart@linux.intel.com>
	<d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
	<B17E0298-4C9C-461A-A713-ADEE9771F8F0@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Josef Ahmad <josef.ahmad@intel.com>, Darren Hart <dvhart@linux.intel.com>,
	Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/5] grub-efi-native: New recipe to build GRUB EFI images
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
X-List-Received-Date: Thu, 24 Nov 2011 11:33:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-24 at 09:59 +0100, Koen Kooi wrote:
> Op 24 nov. 2011, om 09:05 heeft Darren Hart het volgende geschreven:
> 
> > Add a recipe to build the GRUB efi images. This recipe is written as
> > a native recipe as the resulting GRUB utils are required to assemble
> > the final image. Rather than build a native and a target recipe (and
> > increase build times), 
> 
> That's a false dilemma. If you write it as a regular recipe with
> BBCLASSEXTEND=native your buildtime doesn't increase

That isn't true, if you build a target and a native version your build
time does increase. Using BBCLASSEXTEND does improve parsing time over
having two separate recipes though.

>  and you leave open the option of adding more BBCLASSEXTENDS if
> someone wants to ship it in an SDK.

I did talk with Darren about why the recipe is the way it is and there
are some pretty nasty issues with the way grub builds itself. I'm
therefore ok with this as a version 1 and we can see whether there are
any issues that result which need us to rethink the way the recipe is
constructed. 

Its currently behaving very like the way the binutils/gcc cross recipes
will end up (see the separate thread with Matthew) Perhaps it should be
called grub-efi-cross even if it uses native.bbclass.

Cheers,

Richard



