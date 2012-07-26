Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SuMGF-00064V-N7 for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 13:29:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QBIDEP020488
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 12:18:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19989-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 12:18:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QBI5RC020480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 12:18:07 +0100
Message-ID: <1343301485.29991.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 12:18:05 +0100
In-Reply-To: <alpine.DEB.2.02.1207260439001.15208@oneiric>
References: <alpine.DEB.2.02.1207251558160.15120@oneiric>
	<1343251261.29991.4.camel@ted>
	<alpine.DEB.2.02.1207252009070.14124@oneiric>
	<1343288238.29991.21.camel@ted>
	<alpine.DEB.2.02.1207260439001.15208@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: how to properly use "EXTRA_ASSUME_PROVIDED"?
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
X-List-Received-Date: Thu, 26 Jul 2012 11:29:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-26 at 06:57 -0400, Robert P. J. Day wrote:
> On Thu, 26 Jul 2012, Richard Purdie wrote:
> 
> ... snip ...
> 
> > So its not a variable, its a parameter. You probably mean to run
> > something like:
> >
> > bitbake -I rday-native -e core-image-minimal
> > or
> > bitbake --ignore-deps=rday-native -e core-image-minimal
> 
>   ok, that was embarrassing :-(, but my original question still
> applies -- is there any way to see this additional ignored dependency
> in the environment of my bitbake command?

Not that I can think of offhand.

Cheers,

Richard



