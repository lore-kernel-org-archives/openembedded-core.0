Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SNjfU-00040T-IL for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 13:48:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3RBdJI5015326
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 12:39:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15114-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 12:39:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3RBdANW015315
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 12:39:11 +0100
Message-ID: <1335526751.20130.73.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Apr 2012 12:39:11 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: gcc default version change (and qt4)
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
X-List-Received-Date: Fri, 27 Apr 2012 11:48:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'd like to warn people that I'm pretty close to throwing the version
switch to default to gcc 4.7 at the same time as merging in Khem's
patches. I don't think this will surprise anyone, we've talked about
doing it post release for long enough.

It also appears that qt 4.7.4 has issues with gcc 4.7 and 4.8.1 is fixed
so I'm going to change the default version on that at the same time.

Since the tests on the autobuilder are looking pretty good now, I'll
probably do this sooner than later, maybe on Monday.

I'll probably then give it a week, then assuming no reason to change
back to the older version, I'll remove gcc 4.6 and qt 4.7.4 from
OE-Core. They may get added to meta-oe's toolchain layer at that point
but that is up to the appropriate maintainers.

Cheers,

Richard








