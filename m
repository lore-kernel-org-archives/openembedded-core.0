Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SogGO-0007dz-5S for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 21:38:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6AJRAdr020435;
	Tue, 10 Jul 2012 20:27:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19085-07; Tue, 10 Jul 2012 20:27:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6AJR0BY020429
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 10 Jul 2012 20:27:01 +0100
Message-ID: <1341948422.1294.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 10 Jul 2012 20:27:02 +0100
In-Reply-To: <cover.1341933187.git.bruce.ashfield@windriver.com>
References: <cover.1341933187.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/2] linux-yocto: perf, unionfs, yaffs2 fixes
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
X-List-Received-Date: Tue, 10 Jul 2012 19:38:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-10 at 13:11 -0400, Bruce Ashfield wrote:
> Saul,
> 
> Here are the SRCREV updates to activate Tom's mips perf fix (3.2
> and 3.4). 
> 
> For 3.4, we also have a yaffs2 and unionfs fix.
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit 029e3cea52f86438a1d6868020b8888b5c93d623:
> 
>   bitbake: fetch2/wget: Use FETCHCMD_wget to provide the commandline and options (2012-07-10 14:25:38 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (2):
>   linux-yocto/3.2: perf: fix mips build
>   linux-yocto/3.4: perf, unionfs and yaffs2 fixes

Merged to master, thanks.

Richard



