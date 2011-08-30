Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QyR2P-0002s6-8y for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 18:19:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7UGEnYw019873;
	Tue, 30 Aug 2011 17:14:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18709-08; Tue, 30 Aug 2011 17:14:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7UGEcCr019867
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 30 Aug 2011 17:14:39 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.morscher@hs-augsburg.de, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
In-Reply-To: <4E5CCEF9.2090804@hs-augsburg.de>
References: <1312553937-29414-1-git-send-email-koen@dominion.thruhere.net>
	<4E5CCEF9.2090804@hs-augsburg.de>
Date: Tue, 30 Aug 2011 17:14:27 +0100
Message-ID: <1314720867.5939.361.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gtk-icon-cache: add hicolor-icon-theme to DEPENDS
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
X-List-Received-Date: Tue, 30 Aug 2011 16:19:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-30 at 13:52 +0200, Michael Morscher wrote:
> This is still not working for my xfce46-image, described here:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-August/034653.html 

Is this with a clean build and with master?

To be specific, this commit

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=4a5336d403bb0b8dfe2e5f863288a7d3489132c2

should have fixed the spacing issue (note the additional space being
added).

Cheers,

Richard



