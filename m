Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPXSM-0004bR-OD for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 12:06:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4QA3COS011751;
	Thu, 26 May 2011 11:03:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11310-04; Thu, 26 May 2011 11:03:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4QA354R011745
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 26 May 2011 11:03:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306400440-10173-1-git-send-email-koen@dominion.thruhere.net>
References: <1306400440-10173-1-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 26 May 2011 11:03:03 +0100
Message-ID: <1306404183.27470.102.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/3] dbus: split X11 dependant dbus-launch into its own subpackage
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
X-List-Received-Date: Thu, 26 May 2011 10:06:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-26 at 11:00 +0200, Koen Kooi wrote:
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

Merged to master, thanks (along with patches 2 and 3)

Cheers,

Richard



