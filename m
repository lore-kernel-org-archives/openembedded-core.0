Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4086072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 20:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6SKpHXS025144; Thu, 28 Jul 2016 21:51:17 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7vyX3eMZIJtc; Thu, 28 Jul 2016 21:51:16 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6SKpCIk025141
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 28 Jul 2016 21:51:13 +0100
Message-ID: <1469739072.9142.19.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	openembedded-core@lists.openembedded.org, Patrick Ohly
	<patrick.ohly@intel.com>
Date: Thu, 28 Jul 2016 21:51:12 +0100
In-Reply-To: <0dacdf96b1ac7c9c2bcd0071a0b8d88fcc6231d5.1469623667.git.ed.bartosh@linux.intel.com>
References: <cover.1469623667.git.ed.bartosh@linux.intel.com>
	<0dacdf96b1ac7c9c2bcd0071a0b8d88fcc6231d5.1469623667.git.ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v4 1/4] image.bbclass: fix dependency calculation when using conversion chaining
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2016 20:53:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-07-27 at 15:51 +0300, Ed Bartosh wrote:
> From: Patrick Ohly <patrick.ohly@intel.com>
> 
> When using conversion chaining (for example example: .dsk.vdi.xz),
> the imagetypes_getdepends() did not properly detect all compression
> commands (thus skipping the corresponding COMPRESS_DEPENDS) and
> the base type, leading to missing dependencies of the image's
> do_rootfs
> task.
> 
> This is not a big problem in practice because in those cases where
> conversion chaining is useful (as in the example above), the missing
> dependency is qemu-native, which typically gets built anyway.
> 
> imagetypes_getdepends() had hard-coded special treatment for certain
> image types. This gets replaced with setting the normal IMAGE_DEPENDS
> variables for these types.

Also, where is this hardcoding? I can't see it in the patch.

Perhaps http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=b567235c0c
e427e2cd478a0268a295c74208e917 fixed this already?

Just makes me all the more suspicious of this patch...

Cheers,

Richard


