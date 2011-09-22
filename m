Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6aRI-0003oe-1x for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 05:59:09 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M3xw7R020201; Thu, 22 Sep 2011 04:59:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 33sV2jKoNZ5q; Thu, 22 Sep 2011 04:59:58 +0100 (BST)
Received: from [10.251.10.153] ([192.102.205.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M3xmJF020195
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 22 Sep 2011 04:59:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Thu, 22 Sep 2011 04:53:23 +0100
In-Reply-To: <cover.1316632767.git.bruce.ashfield@windriver.com>
References: <cover.1316632767.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316663623.13622.5.camel@ted>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/3] linux-yocto: kernel config updates
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
X-List-Received-Date: Thu, 22 Sep 2011 03:59:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-21 at 15:25 -0400, Bruce Ashfield wrote:
> Richard/Saul,
> 
> Here's another small series of kernel config updates from the linux-yocto
> tree. During some build/boot and regression testing I noticed that some
> configuration warnings weren't being dumped to a visible location. When
> I moved all the warnings (patch 3/3) to the kernel audit phase, there were
> some obvious clenaups to the configs to get us a clean audit.
> 
> I've built and booted all the qemu machine. The net result here is
> that we don't have any runtime config changes and we have met the clean
> kernel configuration goal.
> 
> The following changes since commit bcfff457f63f43f53bcaf04f116e09bb2bba9bd6:
> 
>   Fix mercurial fetcher in fetch2 (2011-09-21 14:07:31 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (3):
>   linux-yocto: simplify kernel configuration check expression
>   linux-yocto: add blktrace feature
>   linux-yocto: kernel configuration cleanups

Merged to master. I'm a little worried we're still finding issues like
this at this late stage :/.

Cheers,

Richard



