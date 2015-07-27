Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4275073237
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 11:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6RBXNXI016689; Mon, 27 Jul 2015 12:33:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JVXZWtD1Y0QU; Mon, 27 Jul 2015 12:33:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6RBXBia016684
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Jul 2015 12:33:22 +0100
Message-ID: <1437996791.821.231.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Mon, 27 Jul 2015 12:33:11 +0100
In-Reply-To: <1437994552-29471-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1437994552-29471-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] toaster.bbclass: Fix ValueError
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
X-List-Received-Date: Mon, 27 Jul 2015 11:33:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-07-27 at 13:55 +0300, Ed Bartosh wrote:
> The reason for this exception was usage of ':' as a field
> delimiter in toasterstatlist file. As target can optionally
> contain ':<task>' suffix it caused split(':') to throw exception:
> 
> File "toaster_collect_task_stats(e)", line 71, in
> toaster_collect_task_stats(e=<bb.event.BuildCompleted object at
> 0x7f8434deed50>)
> ValueError: too many values to unpack
> 
> Fixed by changing delimiter ':' -> '::'
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

Since this is causing other blockages and is simple I've merged it,
thanks!

One thing I did tweak was mentioning in the commit message that "bitbake
xxx:do_yyy" triggers this.

Cheers,

Richard


