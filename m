Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SNjVE-0003j0-3C for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 13:38:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3RBSg2U015257
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 12:28:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15064-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 12:28:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3RBSaCF015251
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 12:28:37 +0100
Message-ID: <1335526116.20130.67.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Apr 2012 12:28:36 +0100
In-Reply-To: <1335524357-16990-1-git-send-email-ken.werner@linaro.org>
References: <1335524357-16990-1-git-send-email-ken.werner@linaro.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] Qt 4.8 GCC 4.7 fixes
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
X-List-Received-Date: Fri, 27 Apr 2012 11:38:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-04-27 at 12:59 +0200, Ken Werner wrote:
> This change introduces two new patches to Qt 4.8. One prevents the build
> system from using the -fuse-ld=gold GCC flag as this isn't upstream and
> therefore not supported by many toolchains out there. The second patch
> fixes a compile time error when using toolchains based on GCC 4.7.
> 
> Signed-off-by: Ken Werner <ken.werner@linaro.org>
> ---
>  meta/recipes-qt/qt4/qt-4.8.1.inc                   |    2 +
>  .../qt4/qt-4.8.1/disable-fuse-gold-flag.patch      |   26 ++++++++++++++++
>  meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch       |   31 ++++++++++++++++++++
>  meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
>  4 files changed, 60 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-qt/qt4/qt-4.8.1/disable-fuse-gold-flag.patch
>  create mode 100644 meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch

Thanks, this is very timely as it happens. 

In the future could you put an "Upstream-Status:" header in any patches
which get added along with an indication of the author? This helps a lot
when you look at the patch in 12 months and wonder who wrote it (you
covered why) and also gives us an idea of which patches might be worth
prioritising to discuss with upstream. 

In this case, I've added your changes to master-next and added in the
missing patch header pieces myself. I've just been working through the
remaining gcc 4.7 issues and this looks like the main one left.

Cheers,

Richard




