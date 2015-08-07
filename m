Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6E17176775
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 10:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t77AoeDp019466; Fri, 7 Aug 2015 11:50:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rUmaJ2FUGxcE; Fri,  7 Aug 2015 11:50:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t77AodHj019457
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 7 Aug 2015 11:50:52 +0100
Message-ID: <1438944639.30467.27.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zhe.he@windriver.com
Date: Fri, 07 Aug 2015 05:50:39 -0500
In-Reply-To: <64a413dc9fa38ee9d50b0837071775a3fe2fd48e.1438679154.git.zhe.he@windriver.com>
References: <cover.1438679154.git.zhe.he@windriver.com>
	<64a413dc9fa38ee9d50b0837071775a3fe2fd48e.1438679154.git.zhe.he@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: bruce.ashfield@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 1/1] kernel: Add KERNEL_IMAGETYPES to build multi types of kernel at one time
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
X-List-Received-Date: Fri, 07 Aug 2015 10:50:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-08-04 at 17:17 +0800, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
> 
> Add KERNEL_IMAGETYPES to support building packaging and installing
> multi types of kernel images, such as zImage uImage, at one time.
> KERNEL_IMAGETYPE works as it did.
> 
> Fixes [YOCTO #6945].
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/classes/kernel-fitimage.bbclass    |  21 +++---
>  meta/classes/kernel-grub.bbclass        |  46 ++++++++----
>  meta/classes/kernel-uimage.bbclass      |  22 +++---
>  meta/classes/kernel.bbclass             | 128 +++++++++++++++++++++++---------
>  meta/conf/documentation.conf            |   1 +
>  meta/recipes-kernel/linux/linux-dtb.inc |  15 ++--
>  6 files changed, 159 insertions(+), 74 deletions(-)

I put this into master-next just to see what happened. I haven't
reviewed the code in more detail as yet. We saw:

https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/418/steps/BuildImages_1/logs/stdio

as one of the results and I suspect the linux-yocto packaging issue
comes from this. This suggests ipk packaging was not tested :(.

Cheers,

Richard


