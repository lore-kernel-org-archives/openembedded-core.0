Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9094E738F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 22:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3KMBL4F032614; Mon, 20 Apr 2015 23:11:21 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id T-r5zrVuQCTZ; Mon, 20 Apr 2015 23:11:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3KMB5c0032609
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 20 Apr 2015 23:11:16 +0100
Message-ID: <1429567865.26983.56.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Cristian Iorga <cristian.iorga@intel.com>, Michael Wood
	<michael.g.wood@intel.com>, "Flanagan, Elizabeth"
	<elizabeth.flanagan@intel.com>, Tracy Graydon <tracy.graydon@intel.com>
Date: Mon, 20 Apr 2015 23:11:05 +0100
In-Reply-To: <cover.1429543826.git.cristian.iorga@intel.com>
References: <cover.1429543826.git.cristian.iorga@intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 0/4] Switch to BlueZ 5.x as default Bluetooth stack
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
X-List-Received-Date: Mon, 20 Apr 2015 22:11:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-04-20 at 18:31 +0300, Cristian Iorga wrote:
> BlueZ 5.x is now the default Bluetooth stack.
> BlueZ 4.x is moved to meta-oe connectivity collection
> layer and still supported in poky/YP.
> The following changes since commit 167025e6d72c44cacfdc5d8b98e942066df09a4f:
> 
>   initscripts: Remove /etc/volatile.cache on upgrade (2015-04-20 15:03:07 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib Ciorga/YB7479_v3
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=Ciorga/YB7479_v3
> 
> Cristian Iorga (4):
>   maintainers.inc: remove info related to bluez4
>   upstream_tracking.inc: bluez4 removed from oe-core
>   bluez: remove recipe
>   bitbake.conf: backfill bluez5 feature

There appears to be a problem with these patches (at a guess):

https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/268

Michael/Beth/Tracy: Kind of sad the error report failed and there is a
build *after* the error report too?!

Cheers,

Richard




