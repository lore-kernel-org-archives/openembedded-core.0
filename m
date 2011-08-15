Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qsy3Y-0001Rn-R2 for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 16:22:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FEHiOG017524
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:17:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16444-09 for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:17:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FEHbER017518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:17:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1313400142.git.liezhi.yang@windriver.com>
References: <cover.1313400142.git.liezhi.yang@windriver.com>
Date: Mon, 15 Aug 2011 15:17:35 +0100
Message-ID: <1313417855.14274.583.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] The Skeleton initscript doesn't work on minimal image
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
X-List-Received-Date: Mon, 15 Aug 2011 14:22:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-15 at 18:18 +0800, Robert Yang wrote:
> Testing:
> 1) Edit meta/recipes-core/images/core-image-minimal.bb, add "service" to
>    the IMAGE_INSTALL
> 
> 2) Edit build/conf/local.conf, add "/path/to/poky/meta-skeleton" to the
>    BBLAYERS.
> 
> 3) $ bitbake core-image-minimal(or sato)
> 
> 3) start qemu, and run "/etc/init.d/skeleton start(or status stop ..)",
>    it works well
> 
> // Robert
> 
> The following changes since commit 30381645eefe4e3222fd3ce45823f143ce2fa82c:
> 
>   rt-tests: use an explicit commit ID (2011-08-12 21:07:02 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib robert/initscripts
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/initscripts
> 
> Robert Yang (1):
>   The Skeleton initscript doesn't work on minimal image

Merged to master, thanks.

Richard



