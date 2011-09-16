Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4bUY-0000bC-2e for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 18:42:18 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GGhCwf030417 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 17:43:13 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id amOhRuBULSks
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 17:43:12 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GGh9N1030408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 17:43:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 17:36:57 +0100
In-Reply-To: <cover.1316177782.git.lianhao.lu@intel.com>
References: <cover.1316177782.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316191025.20858.33.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 0/3] Added multilib support for DEBIAN_NAME
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
X-List-Received-Date: Fri, 16 Sep 2011 16:42:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-16 at 21:01 +0800, Lianhao Lu wrote:
> This series of patches is meant to fix bug [YOCTO #1486].
> 
> It added multilib support in package_name_hook() so MLPREFIX is kept in the 
> package name after the debian package renaming. 
> 
> It changed the logic of multilib_sanity_check() that all the equal duplicated files 
> from different multilib variants are allowed to be installed into the same rootfs.
> 
> It also fixed several recipes to support the multilib in debian package renaming.
> 
> The following changes since commit bb4dad44432b2e40ac3cf16baa45befbae3e70f5:
>   Darren Hart (1):
>         Prevent IMAGE_FEATURES from contaminating initrd
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib llu/bug1486
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1486
> 
> Lianhao Lu (3):
>   debian/_ipk.bbclass: Added multilib support for package_name_hook()
>   Misc: Added MLPREFIX to final pkg names in case of DEBIAN_NAMES.
>   image/package.bbclass: Revise multilib support for DEBIAN_NAME.

Merged to master, thanks.

Richard



