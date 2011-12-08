Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYm2M-0000ot-LX for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 23:01:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8Lt5eD006392
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 21:55:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02430-04 for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2011 21:55:00 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8Lsui2006375
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 21:54:57 GMT
Message-ID: <1323381307.5309.62.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 21:55:07 +0000
In-Reply-To: <4EE124A8.7060200@windriver.com>
References: <cover.1323360188.git.mark.hatle@windriver.com>
	<ed534a9d15bc3a952b9a4ca736e0c25c13b670af.1323360188.git.mark.hatle@windriver.com>
	<CAMKF1soxFdTkTQNVXLC=AVakA9MAiY31Npp4Rrjn-aDPKYG7og@mail.gmail.com>
	<4EE124A8.7060200@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] Rename leftover POKY references to OE in image variables
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
X-List-Received-Date: Thu, 08 Dec 2011 22:01:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-08 at 14:57 -0600, Mark Hatle wrote:
> On 12/8/11 2:27 PM, Khem Raj wrote:
> > On Thu, Dec 8, 2011 at 8:03 AM, Mark Hatle<mark.hatle@windriver.com>  wrote:
> >> The names POKY_BASE_INSTALL and POKY_EXTRA_INSTALL have been renamed
> >> to OE_BASE_INSTALL and OE_EXTRA_INSTALL.
> >>
> >
> > How about calling it IMAGE_* instead ?
> 
> I don't have any objections to that.  (All I did was rename POKY to OE, as I 
> believe that was originally intended...)
> 
> Richard, anyone else, have any comments before I make that change?

I'd suggest COREIMAGE since that is what it actually influences. The
reason being this is used by core-image.bbclass (which used to be
poky-image.bbclass).

Cheers,

Richard




