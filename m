Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Srbqt-0001h0-1H for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 23:32:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ILKn1X029128;
	Wed, 18 Jul 2012 22:20:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28111-04; Wed, 18 Jul 2012 22:20:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ILKcHh029122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 18 Jul 2012 22:20:40 +0100
Message-ID: <1342646442.513.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Colin Walters <walters@verbum.org>
Date: Wed, 18 Jul 2012 22:20:42 +0100
In-Reply-To: <1342635512.5148.0.camel@lenny>
References: <1342454838-31263-1-git-send-email-Martin.Jansa@gmail.com>
	<5006049E.40509@linux.intel.com> <1342572457.2860.11.camel@lenny>
	<1342635209.513.50.camel@ted> <1342635512.5148.0.camel@lenny>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 1/2] glib: upgrade to 2.32.4
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
X-List-Received-Date: Wed, 18 Jul 2012 21:32:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-18 at 14:18 -0400, Colin Walters wrote:
> On Wed, 2012-07-18 at 19:13 +0100, Richard Purdie wrote:
> 
> > Generally we kind of cheat and encode "/usr/bin/env xxx" into
> > native/nativesdk scripts and ${bindir}/env xxx into target scripts.
> 
> How is that accomplished?  Can you link me an example?

Basically using sed. I didn't claim it was pretty, it does get out of
various immediate problems. You can see the scope of the problem in:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=ac7a0311825e20c544d17bfd8be63546ad36e665

We're pretty sensitive to picking up that kind of issue.

Cheers,

Richard



