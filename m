Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SVKam-0006rv-NE for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 12:39:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4IATNqY004280;
	Fri, 18 May 2012 11:29:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02892-01; Fri, 18 May 2012 11:29:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4IATDEP004274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 18 May 2012 11:29:15 +0100
Message-ID: <1337336951.28145.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 18 May 2012 11:29:11 +0100
In-Reply-To: <73807C59-D904-44D4-89D6-50B9C268B911@dominion.thruhere.net>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1srxyZkjFe+aypM_X+Wgyd-8b1X664Y8jWQuPF=xijeg+w@mail.gmail.com>
	<1337286572.7473.10.camel@ted>
	<0FEE2025-8E84-4CBB-8568-483A55233BD7@dominion.thruhere.net>
	<1337288563.7473.24.camel@ted>
	<73807C59-D904-44D4-89D6-50B9C268B911@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kmod: Use base_libdir for installing libkmod"
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
X-List-Received-Date: Fri, 18 May 2012 10:39:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-05-18 at 09:52 +0200, Koen Kooi wrote:
> Op 17 mei 2012, om 23:02 heeft Richard Purdie het vo
> Those QA checks are a joke. I can fix the QA warnings by moving all
> kmod binaries to $bindir or $sbindir since binaries in /usr/bin
> and /usr/bin are exempt from the checks. That would break the
> split /usr case as well.  These checks are global as well when they
> only should apply to recipes needed to get /usr mounted.
> 
> That's why I consider the current checks misguided and harmfull. As
> seen from the breakage it allows people to break pkgconfig, which
> didn't get picked up by QA checks. And then it turns out that you an
> fix the QA warnings in such a way that it breaks the intent of the
> warnings.

So we need to improve the QA checks, no argument here.

> But this is all a false dillemma, you could have merged Otavio's patch
> (which I Ack'ed) which supports split /usr and puts the pkgconfig in
> the right place.

I likely still will but I was worried when he replied saying it still needed more
testing. I took your reply to the consolidated pull request to refer to
your patch.

Cheers,

Richard






