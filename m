Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiTwK-0004jz-VT for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 17:43:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04GaQE2021359;
	Wed, 4 Jan 2012 16:36:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20888-06; Wed,  4 Jan 2012 16:36:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04GaI00021353
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 4 Jan 2012 16:36:19 GMT
Message-ID: <1325694978.20759.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 16:36:18 +0000
In-Reply-To: <4F047DE3.1080102@linux.intel.com>
References: <cover.1325115066.git.dvhart@linux.intel.com>
	<4F039FA4.6000709@linux.intel.com> <4F047DE3.1080102@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: koen@dominion.thruhere.net, martin.jansa@gmail.com
Subject: Re: [PATCH 0/4] Fixes for tiny distros and linux-yocto-tiny
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
X-List-Received-Date: Wed, 04 Jan 2012 16:43:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 08:27 -0800, Darren Hart wrote:
> 
> On 01/03/2012 04:39 PM, Saul Wold wrote:
> > On 12/28/2011 03:38 PM, Darren Hart wrote:
> 
> >> Darren Hart (3):
> >>    eglibc: Only add eglibc-utils to PACKAGES if wchar is supported
> > This patch was not taken at this time due to the comment on the Mailing List
> 
> Saul,
> 
> Koen raised some concerns and suggested modifying xtrace and tzselect to
> not depend on bash. I responded and suggested we keep that as a future
> enhancement as it also pulls in some additional repackaging work.
> 
> Koen, any further thoughts from you?
> 
> Saul, what are you looking for as a resolution?

The problem is bash depends on gettext, right? Would USE_NLS="no" as
policy in poky-tiny address this (see gettext.bbclass)?

I can't see you caring about NLS in tiny...

Cheers,

Richard




