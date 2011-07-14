Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QhMk3-0005rZ-D6 for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 16:18:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6EE2Tuk008048
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:02:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06949-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:02:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6EE2Km4008042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:02:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <b9a1119e3bcda45e83325f054bd75376dc864dc3.1310587697.git.mark.hatle@windriver.com>
References: <cover.1310587697.git.mark.hatle@windriver.com>
	<b9a1119e3bcda45e83325f054bd75376dc864dc3.1310587697.git.mark.hatle@windriver.com>
Date: Thu, 14 Jul 2011 15:02:17 +0100
Message-ID: <1310652137.20015.1151.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] ncurses: Fix site_config
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
X-List-Received-Date: Thu, 14 Jul 2011 14:18:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-13 at 15:09 -0500, Mark Hatle wrote:
> The site_config directory should have been attached to ncurses.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  .../recipes-core/{ => ncurses}/site_config/headers |    0
>  1 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta/recipes-core/{ => ncurses}/site_config/headers (100%)
> 

Merged to master, thanks.

Richard



