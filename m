Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SvPt2-0001xj-H8 for openembedded-core@lists.openembedded.org;
	Sun, 29 Jul 2012 11:34:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9MVuk026925
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:22:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26851-02 for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:22:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9MKeP026919
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:22:22 +0100
Message-ID: <1343553740.16998.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 29 Jul 2012 10:22:20 +0100
In-Reply-To: <1343390587-27506-1-git-send-email-rongqing.li@windriver.com>
References: <1343390587-27506-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] usbutils 0.91: Fix NULL pointer crash.
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
X-List-Received-Date: Sun, 29 Jul 2012 09:34:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-27 at 20:03 +0800, rongqing.li@windriver.com wrote:
> From: Roy.Li <rongqing.li@windriver.com>
> 
> [YOCTO #2847]
> 
> Before use usbbuslist, we should check if it is valid.
> 
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  .../usbutils/usbutils/Fix-NULL-pointer-crash.patch |   28 ++++++++++++++++++++
>  meta/recipes-bsp/usbutils/usbutils_0.91.bb         |    5 ++-
>  2 files changed, 31 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-bsp/usbutils/usbutils/Fix-NULL-pointer-crash.patch


Merged to master, thanks.

Richard



