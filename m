Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THaeR-0005P3-Ib for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 15:30:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SDHnhw010379;
	Fri, 28 Sep 2012 14:17:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09843-06; Fri, 28 Sep 2012 14:17:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SDHfo7010373
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 28 Sep 2012 14:17:43 +0100
Message-ID: <1348838263.15753.47.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 28 Sep 2012 14:17:43 +0100
In-Reply-To: <5064B298.4030200@windriver.com>
References: <1348748457-7215-1-git-send-email-christian.glindkamp@taskit.de>
	<50647177.5090105@linux.intel.com> <5064B298.4030200@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl: Fix nativesdk install path
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
X-List-Received-Date: Fri, 28 Sep 2012 13:30:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-27 at 15:10 -0500, Mark Hatle wrote:
> I had to revert this patch.  With it enabled, if I enable multilibs and build 
> for x86_64 (so my libdir == /usr/lib64), perl no longer finishes do_install().
> 
> When I revert it fixes that issue, but of course then the nativesdk is broken again.

Please try with the patch I've just sent which should fix it.

Cheers,

Richard



