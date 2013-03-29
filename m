Received: from mail-bk0-f41.google.com ([209.85.214.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1ULcvQ-00051C-00
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 18:17:12 +0100
Received: by mail-bk0-f41.google.com with SMTP id i18so239435bkv.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 10:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=hPH4qZh3rsWJOjLpHkkaz9yTQ+cJ80Yetrh+BAyUbbY=;
	b=btVi6izPGlwYr5BaKvqsLJYeT7pCtqNzyIFPNh/4C2nN00+3x8iz223zyjHWVWjTAf
	1TTj+0bZ10F+0tcSPX0TwLiFa/2cYvJwov3AMWgnm42PSQzD9hpRg8Sq81dlE+4KMley
	jWeJjfZL8MRyIfcuHUuWsnNDalLv88xiMKuXUnsVdtTPtTXyfT1ez34X+wrFBaQzaG/S
	aJCo8rSCZ0/fadAisAAnwLfY2ESyRmKTRZ3twpPhN5oqpqWzWwyW2DLFeyGWxAN7LlWf
	8kp2RrnPvhf8UfAnRmQd/z3o4UY0TbnqliwRnKcjNlc9T7CXT3Wu06fWOHxvA+6IAWSN
	VK3w==
X-Received: by 10.204.227.143 with SMTP id ja15mr1346576bkb.5.1364576407515;
	Fri, 29 Mar 2013 10:00:07 -0700 (PDT)
Received: from s42.loc (91-119-221-41.dynamic.xdsl-line.inode.at.
	[91.119.221.41])
	by mx.google.com with ESMTPS id x18sm711601bkw.4.2013.03.29.10.00.06
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 10:00:06 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1ULcep-00027P-Lr; Fri, 29 Mar 2013 18:00:03 +0100
Date: Fri, 29 Mar 2013 18:00:03 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
Message-ID: <20130329170003.GA7125@mx.loc>
References: <1364551510-8648-1-git-send-email-radu.moisan@intel.com>
MIME-Version: 1.0
In-Reply-To: <1364551510-8648-1-git-send-email-radu.moisan@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] busybox: Upgrade to v1.21.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2013 17:17:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 29, 2013 at 12:05:10PM +0200, Radu Moisan wrote:
>Removed obsolete patches
>Added a few new patches pending 1.21.1
>*busybox-1.21.0-mdev.patch
>*busybox-1.21.0-platform.patch
>*busybox-1.21.0-xz.patch
>
>Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>---
> .../busybox-1.20.2/busybox-1.20.2-kernel_ver.patch |   28 -
> .../busybox-mkfs-minix-tests_bigendian.patch       |   34 --
> .../fix-for-spurious-testsuite-failure.patch       |   27 -
> .../busybox/busybox-1.20.2/sys_resource.patch      |   99 ---
> .../busybox/busybox-1.20.2/wget_dl_dir_fix.patch   |   30 -
> .../B921600.patch                                  |    0
> .../busybox-1.21.0/busybox-1.21.0-mdev.patch       |  643 ++++++++++++++++++++
> .../busybox-1.21.0/busybox-1.21.0-platform.patch   |   24 +
> .../busybox/busybox-1.21.0/busybox-1.21.0-xz.patch |   84 +++
> .../busybox-appletlib-dependency.patch             |    0
> .../busybox-udhcpc-no_deconfig.patch               |    0
> .../{busybox-1.20.2 => busybox-1.21.0}/defconfig   |    0
> .../get_header_tar.patch                           |    0
> .../run-parts.in.usr-bin.patch                     |    6 +-
> .../stat-usr-bin.patch                             |    0
> ...estsuite-du-du-k-works-fix-false-positive.patch |    0
> .../watch.in.usr-bin.patch                         |    0
> .../{busybox_1.20.2.bb => busybox_1.21.0.bb}       |   17 +-
> 18 files changed, 762 insertions(+), 230 deletions(-)
> delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
> delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-mkfs-minix-tests_bigendian.patch
> delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/fix-for-spurious-testsuite-failure.patch
> delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/sys_resource.patch
> delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/wget_dl_dir_fix.patch
> rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/B921600.patch (100%)

I wonder how this applies without fuzz as
it was applied upstream back in 2009:
http://git.busybox.net/busybox/commit/?id=e707a3000b2f6e2f684b6e85cd60590318d157c4

> create mode 100644 meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-mdev.patch
> create mode 100644 meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch
> create mode 100644 meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-xz.patch
> rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/busybox-appletlib-dependency.patch (100%)

I think this patch is not needed.


