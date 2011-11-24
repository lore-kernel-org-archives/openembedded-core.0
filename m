Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTZe1-0006RB-QZ for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 14:47:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAODeeJ4025123;
	Thu, 24 Nov 2011 13:40:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24576-09; Thu, 24 Nov 2011 13:40:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAODeVfR025117
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 24 Nov 2011 13:40:33 GMT
Message-ID: <1322142038.24143.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 24 Nov 2011 13:40:38 +0000
In-Reply-To: <F0D09963-24D8-40FF-8609-881E776D03F8@dominion.thruhere.net>
References: <cover.1322032702.git.xiaofeng.yan@windriver.com>
	<5a1109761eb7eba8ddd028bea09ec12c63bc6bbb.1322032702.git.xiaofeng.yan@windriver.com>
	<27383A15-EAE2-4714-8E61-F9B194CFB581@dominion.thruhere.net>
	<4ECD4B23.1010604@linux.intel.com>
	<F0D09963-24D8-40FF-8609-881E776D03F8@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] directfb: change check sum
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
X-List-Received-Date: Thu, 24 Nov 2011 13:47:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-23 at 20:59 +0100, Koen Kooi wrote:
> Op 23 nov. 2011, om 20:36 heeft Saul Wold het volgende geschreven:
> 
> > On 11/22/2011 11:37 PM, Koen Kooi wrote:
> >> 
> >> Op 23 nov. 2011, om 08:21 heeft Xiaofeng Yan het volgende
> geschreven:
> >> 
> >>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> >>> 
> >>> Change check sum of directfb. The previous check sum is wrong.
> >> 
> >> Why is it wrong? What has changed?
> >> 
> >> 
> > Seems that when the recipe update occurred, the checksums where not
> properly updated at the same time, this is a valid and needed patch as
> it corrects the checksums for the 1.4.15 tarball.
> 
> Now put that in the commit message :)

I merged this with an updated commit message.

Cheers,

Richard



