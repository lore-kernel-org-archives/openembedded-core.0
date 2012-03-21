Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SASGP-0000vJ-Bs for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 21:36:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LKREUV005648
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 20:27:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05471-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 20:27:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LKR5uj005642
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 20:27:06 GMT
Message-ID: <1332361627.9740.180.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 20:27:07 +0000
In-Reply-To: <FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
References: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
	<4F6A2F2F.2090607@linux.intel.com>
	<FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] giflib: Move to OE-Core
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
X-List-Received-Date: Wed, 21 Mar 2012 20:36:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-21 at 21:14 +0100, Koen Kooi wrote:
> Op 21 mrt. 2012, om 20:42 heeft Saul Wold het volgende geschreven:
> 
> > On 03/21/2012 07:25 AM, Samuel Stirtzel wrote:
> >> * This move will allow the testing of meta-kde for users without meta-openembedded.
> >> 
> > So what other layers are using giflib?
> > 
> > Your suggesting that we need to have it in oe-core so people don't need to add the meta-openembedded layer when using meta-kde?
> > 
> > I am just trying to get more data before making a decision.
> 
> Let's put everything in oe-core!

Let's try and be constructive ;-).

I think to make a good decision about this we need to understand which
layers use giflib. 

Is this really the only component from meta-oe that meta-kde needs? If
it is, I think the request is certainly worth thinking about as we do
want to try and minimise and untangle the dependency spider web if we
can.

Cheers,

Richard



