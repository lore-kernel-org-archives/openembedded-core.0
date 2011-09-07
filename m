Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R1QDo-0001xE-LD for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 00:03:52 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87M4lDE029339 for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 23:04:47 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6d4nGNT+cKVE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2011 23:04:47 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87M4enH029336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 23:04:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1315384269.git.dongxiao.xu@intel.com>
References: <cover.1315384269.git.dongxiao.xu@intel.com>
Date: Wed, 07 Sep 2011 22:58:37 +0100
Message-ID: <1315432717.13021.28.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 0/2][PULL] multilib: Fix kernel-module dependency
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
X-List-Received-Date: Wed, 07 Sep 2011 22:03:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-07 at 16:33 +0800, Dongxiao Xu wrote:
> Hi Richard,
> 
> This pull request is to fix the dependency/recommends of kernel-module-* in
> other recipes. Besides, there is another patch to remove the linux-yocto
> extension in multilib.conf. Please help to review and pull.
> 
> Thanks,
> Dongxiao
> 
> 
> The following changes since commit 41b7c955cfdc7b4d5c667c8a8742237d5edaca4f:
> 
>   icu-3.6: fix building with big make -j (2011-09-05 20:38:50 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dxu4/ml
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml
> 
> Dongxiao Xu (2):
>   multilib_global.bbclass: handle kernel-module-* for multilib
>   multilib: Remove the multilib extension for linux-yocto

Merged to master, thanks.

Richard



