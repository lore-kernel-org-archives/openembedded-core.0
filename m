Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SmT6U-0003c2-He; Wed, 04 Jul 2012 19:11:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q64Gxx7J025349;
	Wed, 4 Jul 2012 17:59:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24073-09; Wed,  4 Jul 2012 17:59:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q64Gxp76025343
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 4 Jul 2012 17:59:52 +0100
Message-ID: <1341421189.19821.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jul 2012 17:59:49 +0100
In-Reply-To: <20120704162654.GE15100@jama.jama.net>
References: <20120704134932.B766810217@opal>
	<20120704162654.GE15100@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : meta/classes: Update recrdeptask fields for recursive dependency handling changes in bitbake
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
X-List-Received-Date: Wed, 04 Jul 2012 17:11:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-04 at 18:26 +0200, Martin Jansa wrote:
> On Wed, Jul 04, 2012 at 01:49:32PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 8229fb5d7205f5e5b198ab2860fbcc02054476eb
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=8229fb5d7205f5e5b198ab2860fbcc02054476eb
> > 
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Mon Jul  2 12:27:46 2012 +0000
> > 
> > meta/classes: Update recrdeptask fields for recursive dependency handling changes in bitbake
> > 
> > This also deletes the buildall task since I seen usecases for it.
> 
> Is there a typo in last sentence? :)
> 
> I've seen
> BB_DEFAULT_TASK = "buildall"
> in my local.conf and now it had to go..

Yes, it is a typo, sorry.

If someone can show me a good usecase for it we can add it back but I'm
not seeing one right now...

Cheers,

Richard



