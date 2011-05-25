Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPLum-000597-Mj for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 23:46:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4PLhliP005361;
	Wed, 25 May 2011 22:43:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04879-08; Wed, 25 May 2011 22:43:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4PLhfd2005355
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 25 May 2011 22:43:41 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306354721-16325-1-git-send-email-koen@dominion.thruhere.net>
References: <1306354721-16325-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 25 May 2011 22:43:39 +0100
Message-ID: <1306359819.27470.68.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] dbus: split X11 dependant dbus-launch into its own subpackage
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
X-List-Received-Date: Wed, 25 May 2011 21:46:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-25 at 22:18 +0200, Koen Kooi wrote:
> This makes dbus usable in non-X enviroments like QT/e
> 
> From the original commit in OE .dev:
> 
> commit 8e25448fb01b6fa6ea3a86f9327f080cd753dfbc
> Author: John Lee <john_lee@openmoko.org>
> Date:   Fri Sep 5 11:37:39 2008 +0000
> 
>     dbus: enable x support and put dbus-launch into new package dbus-x11
>     * Enable x support only add rdepends to dbus-launch.  Make it a
>       seperate package so other packages like dbus does not rdepend on
>       libx11.

Which pieces of the system use dbus-launch and do we need to add
dependencies to them after this change to pull in the dbus-x11 package?

Cheers,

Richard



