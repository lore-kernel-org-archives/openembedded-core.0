Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qsy13-0001Mr-IQ for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 16:19:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FEF9Jg017504
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:15:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16444-08 for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:15:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FEF3Kf017490
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:15:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201108142050.37352.paul.eggleton@linux.intel.com>
References: <201108142050.37352.paul.eggleton@linux.intel.com>
Date: Mon, 15 Aug 2011 15:15:01 +0100
Message-ID: <1313417701.14274.581.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Machine specific sysroot issue
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
X-List-Received-Date: Mon, 15 Aug 2011 14:19:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-08-14 at 20:50 +0100, Paul Eggleton wrote:
> I've brought over the Opie recipes from OE in preparation for creating a 
> separate layer, and after making a few changes everything compiles OK; however 
> I'm finding that the change to machine-specific sysroots is causing some 
> problems.
> 
> libopie2, a non-machine specific package, among other things installs a file 
> called include.pro into ${OPIEDIR}, which is configured to be 
> ${STAGING_DIR_HOST}. In OE-classic ${STAGING_DIR_HOST} is not machine-specific, 
> so if you build libopie2 for machine A then build some other package that 
> needs include.pro for machine B, then everything is fine. In the OE-core case 
> with machine-specific sysroots it's looking for the file in the sysroot for the 
> current machine, which if you've been building for several different machines 
> may not be where it has actually been installed.
> 
> What's the correct way to fix this? Is libopie2 now installing this file in the 
> wrong place?

It sounds like its being installed to the right location but that opie
isn't looking for it in the right place later.

How does opie know where to look for the file?

Cheers,

Richard



