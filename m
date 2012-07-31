Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SwAmX-0002JH-I8 for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 13:38:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VBQu0X020343
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:26:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20153-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:26:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VBQnYb020337
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:26:50 +0100
Message-ID: <1343734010.9756.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2012 12:26:50 +0100
In-Reply-To: <1343674860-1523-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120730175903.GN3261@jama.jama.net>
	<1343674860-1523-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] udev-extraconf: change LICENSE to MIT
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
X-List-Received-Date: Tue, 31 Jul 2012 11:38:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-30 at 21:01 +0200, Martin Jansa wrote:
> * original recipe added by RP in fc128ab1e4fec27d44cebfa690a9bc233eda0caf was saying GPL
> * later it was changed to GPLv2
> * COPYING.GPL was added to reflect that
> * meta-oe has similar recipe with MIT license and even more scripts, so lets change LICENSE here too
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/udev/udev-extraconf/COPYING.GPL |  339 ---------------------
>  meta/recipes-core/udev/udev-extraconf_1.0.bb      |    8 +-
>  2 files changed, 4 insertions(+), 343 deletions(-)
>  delete mode 100644 meta/recipes-core/udev/udev-extraconf/COPYING.GPL

Er, I think we need to be a little more careful than this. Just because
you want something to be so, doesn't make it happen just like that...

Looking at the commit, I've just copied the license from the original
source which was a GPLv2 recipe (udev). Where did mount.blacklist come
from originally? Is there evidence its MIT licensed? How did meta-oe
conclude this was MIT licensed?

Cheers,

Richard



