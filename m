Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0LXR-0003xX-I9 for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 00:23:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MNFaho003246
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 23:15:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03118-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 23:15:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MNFQHT003240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 23:15:27 GMT
Message-ID: <1329952527.32110.43.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2012 23:15:27 +0000
In-Reply-To: <2449634.H5BiXpsY7e@helios>
References: <2449634.H5BiXpsY7e@helios>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: QEMU recipe cleanup
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
X-List-Received-Date: Wed, 22 Feb 2012 23:23:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-22 at 15:21 +0000, Paul Eggleton wrote:
> Hi all,
> 
> I was looking into Yocto bug #2020 today and I noticed we have some "old" QEMU 
> recipes kicking around. 0.15.1 is the latest version which AFAIK I've been 
> using since it was merged mid-October last year, and it seems to be working 
> fine. We also have 0.14.0 and a _git recipe which claims (via manually set PV) 
> to be 0.14.0 as well.
> 
> Do we need to keep all of these?

I'd axe the 0.14 version if nobody shouts. I think it was kept as 0.15
changed a lot of things and we had some issues. I think they're all
resolved now though.

Cheers,

Richard



