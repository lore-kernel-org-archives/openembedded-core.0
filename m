Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tbf5B-0001X9-Hb for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 23:17:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAMM38jI029830;
	Thu, 22 Nov 2012 22:03:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27637-07; Thu, 22 Nov 2012 22:03:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAMM2x7r029824
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 22 Nov 2012 22:03:01 GMT
Message-ID: <1353621779.10459.67.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Thu, 22 Nov 2012 22:02:59 +0000
In-Reply-To: <1353621014.2000.16.camel@x121e.pbcl.net>
References: <1353620179.10459.59.camel@ted>
	<1353621014.2000.16.camel@x121e.pbcl.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross: Explicitly depend on linux-libc-headers
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
X-List-Received-Date: Thu, 22 Nov 2012 22:17:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-11-22 at 21:50 +0000, Phil Blundell wrote:
> On Thu, 2012-11-22 at 21:36 +0000, Richard Purdie wrote:
> > -DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc ${NATIVEDEPS}"
> > +DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc linux-libc-headers ${NATIVEDEPS}"
> 
> gcc-cross isn't particularly specific to linux targets and ideally we
> don't want to be adding more linuxisms to the recipe.  It is,
> admittedly, not entirely obvious how we could conveniently get that
> dependency added only for linux targets (since I don't think there's any
> existing OVERRIDE that's helpful here) but perhaps we should find a way
> to address that problem rather than just sticking it in unconditionally.

virtual/${TARGET_OS}-headers with a suitable provider entry?

I was assuming someone who cares about non-linux wouldn't find this
particularly hard to deal with...

Cheers,

Richard



