Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RbaXj-0002Qw-Dq for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 17:21:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBGGEru5019567;
	Fri, 16 Dec 2011 16:14:53 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19538-01; Fri, 16 Dec 2011 16:14:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBGGEkJl019561
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 16 Dec 2011 16:14:47 GMT
Message-ID: <1324052087.4568.105.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Dec 2011 16:14:47 +0000
In-Reply-To: <cover.1324015417.git.dvhart@linux.intel.com>
References: <cover.1324015417.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 0/4] Fix grub efi menu, kernel messages, and live image dosfsck
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
X-List-Received-Date: Fri, 16 Dec 2011 16:21:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-15 at 22:12 -0800, Darren Hart wrote:
> This series moves the live image EFI content to the /EFI/BOOT directory where it
> belongs per the specification. It also adds support for the efi_gop framebuffer.
> This allows grub to start on boot and the kernel to log messages to the physical
> console. Also correct some live image filesystem issues.
> 
> The following changes since commit 0eb139619301d0efee330932eba3617dcb39284e:
> 
>   Patch Upstream Status Updates (2011-12-15 14:35:27 +0000)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/efi/dev
>   http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/efi/dev
> 
> Darren Hart (4):
>   grub-efi: Use /EFI/BOOT now that mkdosfs -d works with directories
>   grub-efi: Add efi_gop module to payload for physical console support
>   grub-efi: specify prefix so it can find grub.cfg
>   bootimg: Use dosfsck to clean up the generated live image

Merged to master, thanks.

Richard



