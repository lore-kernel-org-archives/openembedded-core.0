Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QqPgh-0006cn-F0 for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 15:16:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78DBfcs002894;
	Mon, 8 Aug 2011 14:11:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02202-07; Mon,  8 Aug 2011 14:11:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78DBW4F002888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 8 Aug 2011 14:11:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312615528-23732-1-git-send-email-koen@dominion.thruhere.net>
References: <1312615528-23732-1-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 08 Aug 2011 14:11:02 +0100
Message-ID: <1312809062.14274.197.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] gtk-icon-cache: fix RDEPENDS append bug
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
X-List-Received-Date: Mon, 08 Aug 2011 13:16:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-08-06 at 09:25 +0200, Koen Kooi wrote:
> python += doesn't add a leading space, which we do need:
> 
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-gnome-themes:
> |  *    gnome-icon-themehicolor-icon-theme *
> |  * opkg_install_cmd: Cannot install package task-gnome-themes.
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-gnome-apps:
> |  *    iso-codeshicolor-icon-theme *
> |  * opkg_install_cmd: Cannot install package task-gnome-apps.
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-gnome:
> |  *    grephicolor-icon-theme *
> |  * opkg_install_cmd: Cannot install package task-gnome.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/classes/gtk-icon-cache.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Squashed into the original commit since that hadn't merged yet and both
merged into master, thanks.

Richard



