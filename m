Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RMHU3-0006fR-F2 for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 11:58:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA4Aqh1W008641;
	Fri, 4 Nov 2011 10:52:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07309-09; Fri,  4 Nov 2011 10:52:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA4AqXpI008635
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 4 Nov 2011 10:52:35 GMT
Message-ID: <1320403953.20107.111.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 04 Nov 2011 10:52:33 +0000
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE522C@GSX300A.mxchg.m.corp>
References: <0C757E680E33864AB113392C7E83F910BE522C@GSX300A.mxchg.m.corp>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Clean of qt4-embedded don't cleanup sysroot and deploy
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
X-List-Received-Date: Fri, 04 Nov 2011 10:58:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-04 at 10:18 +0100, Hauser, Wolfgang (external) wrote:
> if I do a bitbake -c clean for qt4-embedded or qt4-native all libraries
> and binaries of QT are left in the sysroots and all created packages are
> left in deploy. This is an result of splitting qt into several sub
> packages and install them.

When you clean a package, everything it installed into the sysroot
should get removed. If this doesn't happen there is a bug somewhere and
we need to fix that bug...

Cheers,

Richard



