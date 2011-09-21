Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6MFd-0005Tc-Ss for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 14:50:10 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8LCp4Bc000608 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 13:51:05 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 77DMMIq9wvgy
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 13:51:04 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8LCow8f000604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 13:51:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Sep 2011 13:44:44 +0100
In-Reply-To: <cover.1316597628.git.sgw@linux.intel.com>
References: <cover.1316597628.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316609090.13085.43.camel@ted>
Mime-Version: 1.0
Subject: Re: [RC Fixes 00/19] Fixes for Multi-Lib & other patches
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
X-List-Received-Date: Wed, 21 Sep 2011 12:50:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-21 at 02:39 -0700, Saul Wold wrote:
> I have build (not booted) these fixes and for the most part
> they seem to address alot of the issues we have seen.  There
> is still some problems with python and gtk+ needing to be 
> cleaned before do_rootfs is sucessful.
> 
> This is a major step forward based on some of the issues we 
> have seen and may require some additional fixes for an RC4.

> 
> The following changes since commit 81274f4488fbc4d68d150870735ec0181b60b451:
> 
>   freetype: disable bzip2 compressed font support (2011-09-19 13:14:03 +0100)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib sgw/stage
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/stage
> 
> Anders Darander (3):
>   libzypp: git repo moved to github
>   sat-solver: git repo moved to github
>   zypper: git repo moved to github
> 
> Daniel Lazzari (1):
>   Fix alsa-utils package dependencies
> 
> Dexuan Cui (1):
>   deb packages support: switch from /var/dpkg to /var/lib/dpkg
> 
> Dongxiao Xu (4):
>   rpm: add multilib prefix for archs under deploy/rpm
>   multilib: install MULTILIB_IMAGE_INSTALL
>   libpng: avoid dangling link in libpng package

I took all the above.

>   libpng: add libpng12-dev packages

I did not take this since I believe it was incorrect. Instead I've
pushed an RPROVIDES addition.
> 
> Mark Hatle (5):
>   Fix RPM dependencies
>   Add a run-time dependency that eglibc support GNU_HASH
>   Update python dependencies to be simply to "python"

This change wasn't what I meant to invalidate the sstate cache. I've
changed it to do what I was meaning.

>   busybox: Enhance to add dynamic per-file provides
>   multilib_global.bbclass: Fix non-multilib package provides
> 
> Paul Eggleton (1):
>   scripts/combo-layer: fix still overzealous regex in default hook
>     script
> 
> Saul Wold (4):
>   distrodata: fix distro_check code
>   distro tracking: Update Distro Aliases
>   avahi: Refactor recipe to move UI to avahi-ui
>   oprofileui: Change avahi to avahi-ui depends

and I took the rest of the above apart from the patch Koen is
questioning.

Cheers,

Richard



