Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcPum-0003SI-7J for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 00:40:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UMb8FR030140
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 23:37:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27728-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 23:37:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UMb3ul030126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 23:37:03 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1308687821.git.nitin.a.kamble@intel.com>
References: <cover.1308687821.git.nitin.a.kamble@intel.com>
Date: Thu, 30 Jun 2011 23:36:44 +0100
Message-ID: <1309473404.20015.479.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [btrfs patch 0/6] enable btrfs images
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
X-List-Received-Date: Thu, 30 Jun 2011 22:40:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 13:27 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> These patches enable the btrfs image support in the poky tree.
> Other than kernel parts all the parts are ready here. linux-yocto-2.6.37 
> kernel need some work to get latest btrfs working, and that part will 
> be sent separately.
> 
> The following changes since commit 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:
> 
>   systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16 22:14:06 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib nitin/btrfs
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/btrfs
> 
> Nitin A Kamble (6):
>   btrfs-tools: new recipe for tools to operate on btrfs images
>   image-types.bbclass: get the image size in the whole number
>   image_types.bbclass: enable btrfs as one of the image type
>   qemu machine: enable btrfs as one of the supported filesystem
>   base-files: add btrfs to /etc/filesystems
>   scripts/runqemu: enable btrfs

Merged to master, thanks.

Richard



