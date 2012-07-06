Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sn4Ft-0007nw-Hz for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 10:51:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q668e6ZX007967;
	Fri, 6 Jul 2012 09:40:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05156-07; Fri,  6 Jul 2012 09:40:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q668dtqa007954
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 6 Jul 2012 09:39:57 +0100
Message-ID: <1341563994.3104.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jul 2012 09:39:54 +0100
In-Reply-To: <4FF6073D.7070709@linux.intel.com>
References: <4f44ff83fd87ca9ee470f3ee789bb5550aa5101a.1341511739.git.dvhart@linux.intel.com>
	<1341518766.6761.50.camel@trz-ThinkPad-T420>
	<4FF6073D.7070709@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: saul.wold@intel.com
Subject: Re: [PATCH] bootimg: Use STAGING_KERNEL_DIR
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
X-List-Received-Date: Fri, 06 Jul 2012 08:51:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-05 at 14:29 -0700, Darren Hart wrote:
> 
> On 07/05/2012 01:06 PM, Tom Zanussi wrote:
> > On Thu, 2012-07-05 at 11:08 -0700, Darren Hart wrote:
> >> bootimg.bbclass using STAGING_DIR_HOST/kernel instead of
> >> STAGING_KERNEL_DIR, resulting in build failure of live images.
> >>
> >> | install: cannot stat `/usr/local/dev/yocto/fishriver-test/build/tmp/sysroots/fishriver/kernel/bzImage': No such file or directory
> >>
> >> Replace it with STAGING_KERNEL_DIR.
> >>
> >> UNTESTED - PLEASE TEST PRIOR TO PULL.
> > 
> > Fixed the build problem here.
> > 
> > Tested-by: Tom Zanussi <tom.zanussi@intel.com>
> 
> Great. I'm getting bags packed and kids ready to go. Can someone please
> pull this one in and clean up the commit log to remove the UNTESTED line
> and add Tom's Tested-by?

Done, thanks!

Richard



