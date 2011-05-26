Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPk3X-0002AM-9V for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 01:33:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4QNUP5b028685;
	Fri, 27 May 2011 00:30:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28361-06; Fri, 27 May 2011 00:30:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4QNUHvx028673
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 May 2011 00:30:17 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306439148-9595-1-git-send-email-koen@dominion.thruhere.net>
References: <1306439148-9595-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 27 May 2011 00:30:12 +0100
Message-ID: <1306452612.27470.217.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCHv3] dbus: clean up dbus-x11 packaging
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
X-List-Received-Date: Thu, 26 May 2011 23:33:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-26 at 21:45 +0200, Koen Kooi wrote:
> Martin Jansa spotted some differences with OE dev, which this commit fixes:
> 
>  * dbus-launch is mentioned twice in FILES
>  * dbus-x11 should drag in dbus-1
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> 
> Try 3, now with git --amend working properly. With a special thanks to Martin who tells me about these stupid typos on IRC
> 
>  meta/recipes-core/dbus/dbus.inc      |    2 +-
>  meta/recipes-core/dbus/dbus_1.4.1.bb |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Merged to master, thanks (although I screwed up merging the right patch
too).

Cheers,

Richard



