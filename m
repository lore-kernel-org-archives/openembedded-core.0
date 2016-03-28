Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D5D8D601F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 22:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2SMOGVa022215; Mon, 28 Mar 2016 23:24:22 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fmXSnZminr72; Mon, 28 Mar 2016 23:24:22 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2SMOIeI022223
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 28 Mar 2016 23:24:20 +0100
Message-ID: <1459203858.21672.11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 28 Mar 2016 23:24:18 +0100
In-Reply-To: <1458724158-10490-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1458594701.20442.20.camel@linuxfoundation.org>
	<1458724158-10490-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] image.bbclass: run wicenv task only for wic images
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
X-List-Received-Date: Mon, 28 Mar 2016 22:24:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-03-23 at 11:09 +0200, Ed Bartosh wrote:
> Currently do_wicenv task is run for all images. However, its
> result is used only to produce wic image. It's better to
> run this task only for wic images. If another rootfs is
> required to produce wic image, dependency to its do_wicenv
> must be added to the wic image recipy.
> 
> Stopped running do_wicenv for all images. Added explicit
> dependency to this task in wic-image-minimal recipe.
> 
> [YOCTO #9095]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta-selftest/recipes-test/images/wic-image-minimal.bb | 2 +-
>  meta/classes/image.bbclass                             | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This broke one of the selftests, I fixed it with this:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=92b2bc5d2755160e007b651d984038693fe43bbb

Cheers,

Richard



