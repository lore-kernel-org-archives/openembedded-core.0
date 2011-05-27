Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPz7M-0000ei-Iy for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 17:38:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RFZJWY003669;
	Fri, 27 May 2011 16:35:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03111-08; Fri, 27 May 2011 16:35:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RFZCRp003660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 May 2011 16:35:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306507308-8674-1-git-send-email-koen@dominion.thruhere.net>
References: <1306507308-8674-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 27 May 2011 16:35:07 +0100
Message-ID: <1306510507.27470.274.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH v2] dbus 1.4.1: create UUIDDIR in postinst
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
X-List-Received-Date: Fri, 27 May 2011 15:38:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 16:41 +0200, Koen Kooi wrote:
> This fixes dbus usage in non-sysV init systems. Volatiles aren't needed in systemd land, since /run is tmpfs and the dbus units take care of all this.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> 
> Changes since v1:
> 
> 	* addressed pbs concerns about the || true and chgrp dots
> 	* check for volatiles before trying to run the script
> 
>  meta/recipes-core/dbus/dbus.inc      |   12 +++++++++---
>  meta/recipes-core/dbus/dbus_1.4.1.bb |    2 +-
>  2 files changed, 10 insertions(+), 4 deletions(-)

Applied to master, thanks.

Richard



