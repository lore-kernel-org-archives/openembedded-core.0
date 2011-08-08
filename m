Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QqPg3-0006an-Rz for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 15:15:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78DB0gh002885;
	Mon, 8 Aug 2011 14:11:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02217-07; Mon,  8 Aug 2011 14:10:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78DAtPX002879
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 8 Aug 2011 14:10:55 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
In-Reply-To: <cover.1312604261.git.bruce.ashfield@windriver.com>
References: <cover.1312604261.git.bruce.ashfield@windriver.com>
Date: Mon, 08 Aug 2011 14:10:25 +0100
Message-ID: <1312809025.14274.196.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: Re: [PATCH 0/4] Richard/Saul,
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
X-List-Received-Date: Mon, 08 Aug 2011 13:15:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-08-06 at 00:19 -0400, Bruce Ashfield wrote:
> Here's a collection of fixes that have been cooking here for the week.
> Build, boot and regression testing has been completed. With these the
> 3.0 kernel tree is bumped to 3.0.1, and some use cases have been updated
> to support building arbitrary repos (for x32 dev testing) and for 
> building multiple machines (and kernel types) out of a single branch
> (-rt n450 support).
> 
> The patches themselves contain the details.
> 
> build and boot testing was done on the qemu* targets. With these changes
> it should be possible to start switching the prefernce to the 3.0.x
> kernel, and we can begin doing that next week.
> 
> The following changes since commit 29208d2e353ba2f0b1c9b5d59014a2ea71dde078:
> 
>   local.conf.sample: Comment out BBMASK by default (2011-08-05 17:19:51 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (4):
>   linux-yocto: pass KMACHINE to updateme, not MACHINE
>   linux-yocto: allow configuration of arbitrary branches
>   linux-yocto: update atom-pc preempt-rt definition
>   linux-yocto: merge v3.0.1

Merged to master, thanks.

Richard



