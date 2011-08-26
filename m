Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qx4DC-00011d-MU for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 23:45:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7QLeQtg009926
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 22:40:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07787-09-2 for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 22:40:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7QLeCZ9009905
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 22:40:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAP9ODKoei49fOtr7sySUQkbXY-yrdaF+cVydXXfwOXxtQ+8kyQ@mail.gmail.com>
References: <CAP9ODKoei49fOtr7sySUQkbXY-yrdaF+cVydXXfwOXxtQ+8kyQ@mail.gmail.com>
Date: Fri, 26 Aug 2011 22:40:05 +0100
Message-ID: <1314394806.5939.264.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Use of multiple GIT repositories in SRCREV but updating PV
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
X-List-Received-Date: Fri, 26 Aug 2011 21:45:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-26 at 18:06 -0300, Otavio Salvador wrote:
> We have two recipes that use a common static library and every time we
> change something on this library we need to bump PR of those recipes.
> We want to avoid that specially for daily builds that will  be using
> GIT AUTOREV support.
> 
> For it to work, we need to have a way to put two SRCREV in PV and then
> it will be rebuit every time the library changes.
> 
> Any clue how to do that?

Set the PV as usual in the recipe:

PV = "0.0+gitr${SRCPV}"

and then set:

SRCREV = "${AUTOREV}"

?

Cheers,

Richard




