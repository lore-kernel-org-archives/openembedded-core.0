Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgdRg-0007qb-7B for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 15:56:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CDqI1F020833
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 14:52:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19843-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 14:52:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CDq98J020827
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 14:52:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <47D9CE90-7C60-4233-9370-5734E841D8A0@dominion.thruhere.net>
References: <1310399223.20015.967.camel@rex>
	<47D9CE90-7C60-4233-9370-5734E841D8A0@dominion.thruhere.net>
Date: Tue, 12 Jul 2011 14:52:08 +0100
Message-ID: <1310478728.20015.1052.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] sysklogd: Drop ONLINE_PACKAGE_MANAGEMENT as per mailing list discussion
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
X-List-Received-Date: Tue, 12 Jul 2011 13:56:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-11 at 17:48 +0200, Koen Kooi wrote:
> Op 11 jul 2011, om 17:47 heeft Richard Purdie het volgende geschreven:
> 
> > Online package management decisions like this are now handled by image.bbclass
> > itself so this code is superfluous to requirements.
> 
> That's missing a PR bump :)

Merged to master with the addition of a PR bump.

Cheers,

Richard



