Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SvPsm-0001vY-B2 for openembedded-core@lists.openembedded.org;
	Sun, 29 Jul 2012 11:33:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9MFA8026915;
	Sun, 29 Jul 2012 10:22:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18628-10; Sun, 29 Jul 2012 10:22:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9M0Gb026909
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 29 Jul 2012 10:22:05 +0100
Message-ID: <1343553719.16998.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 29 Jul 2012 10:21:59 +0100
In-Reply-To: <1343390292-30326-1-git-send-email-ross.burton@intel.com>
References: <1343390292-30326-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Damien Lespiau <damien.lespiau@intel.com>
Subject: Re: [PATCH] libpciaccess: lpci access does not depend on X
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
X-List-Received-Date: Sun, 29 Jul 2012 09:33:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-27 at 12:58 +0100, Ross Burton wrote:
> From: Damien Lespiau <damien.lespiau@intel.com>
> 
> So let's remove the X dependencies from DEPENDS and white list it in
> xorg-lib-common.inc.
> 
> Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/xorg-lib/libpciaccess_0.13.1.bb |    4 +---
>  meta/recipes-graphics/xorg-lib/xorg-lib-common.inc    |    2 +-
>  2 files changed, 2 insertions(+), 4 deletions(-)


Merged to master, thanks.

Richard



