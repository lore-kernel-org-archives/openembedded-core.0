Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TW6yI-0007v2-Qt for openembedded-core@lists.openembedded.org;
	Wed, 07 Nov 2012 15:51:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qA7EbS7d003035;
	Wed, 7 Nov 2012 14:37:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02931-01; Wed,  7 Nov 2012 14:37:23 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qA7EbKGW003029
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 7 Nov 2012 14:37:22 GMT
Message-ID: <1352299040.8467.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 07 Nov 2012 15:37:20 +0100
In-Reply-To: <509A30ED.2070905@windriver.com>
References: <1352222654.13864.316.camel@phil-desktop>
	<509A30ED.2070905@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] insane: detect and warn about relocations in .text
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
X-List-Received-Date: Wed, 07 Nov 2012 14:51:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-11-07 at 10:59 +0100, Mark Hatle wrote:
> On 11/6/12 6:24 PM, Phil Blundell wrote:
> > Ping?
> 
> I do think we need this.  Having the textrel does prevent prelinking as well.

Coming up to release I didn't really want to add more warnings and its
slipped through the cracks. I'll likely take this next week when things
quieten down a bit, ELC-E, the OE-GA, Yocto Project Dev day and so on
are making this one a little hectic.

Does anyone know how many warnings this is going to generate on an
OE-Core world build?

The biggest issue I have with these new tests is people also stepping up
and fixing the warnings they generate since often its a non-trivial
effort. The Yocto Project has been doing a lot here, quietly fixing a
lot of them up but more help would be much appreciated.

Cheers,

Richard





