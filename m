Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 536EF76802
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 15:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7IFF5c0011139; Thu, 18 Aug 2016 16:15:05 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id N8vs0cuRu9N9; Thu, 18 Aug 2016 16:15:05 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7IFF1gj011133
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 18 Aug 2016 16:15:02 +0100
Message-ID: <1471533301.16712.11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Thu, 18 Aug 2016 16:15:01 +0100
In-Reply-To: <a68dd58391c30a64e3b0830152b0ffbce04f90cb.1471281772.git.bruce@zedd.org>
References: <cover.1471281772.git.bruce@zedd.org>
	<a68dd58391c30a64e3b0830152b0ffbce04f90cb.1471281772.git.bruce@zedd.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/6] linux-yocto/4.1: bump to v4.1.29
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
X-List-Received-Date: Thu, 18 Aug 2016 15:15:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-08-15 at 14:26 -0400, Bruce Ashfield wrote:
> Integrating the korg 4.1.29 -stable release
> 
> Signed-off-by: Bruce Ashfield <bruce@zedd.org>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++---
> -------
>  3 files changed, 16 insertions(+), 16 deletions(-)

FWIW since the update before this one, we've seen a lot of instability
in ppc:

https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/builds/881/steps/Running%20Sanity%20Tests/logs/stdio

basically the network seems very flaky. Doesn't happen every time but
we are seeing a rising number of these kinds of 'random' failures. Are
there any ppc changes or fixes which look like they're responsible, I'm
pretty sure its something 4.1 kernel related...

The update also triggered a new 'error' for amd_nb in the error log
parsing which I just whitelisted, probably from some change in the
configuration options enabled.

Cheers,

Richard

