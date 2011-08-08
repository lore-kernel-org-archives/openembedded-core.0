Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QqTLW-00025P-SY for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 19:10:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78H63n5004659
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 18:06:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04327-03 for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2011 18:06:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78H5sx8004653
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 18:05:57 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1312565996.git.nitin.a.kamble@intel.com>
References: <cover.1312565996.git.nitin.a.kamble@intel.com>
Date: Mon, 08 Aug 2011 18:05:23 +0100
Message-ID: <1312823123.14274.228.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] new x86 ABI x32 V2 patch series
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
X-List-Received-Date: Mon, 08 Aug 2011 17:10:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 10:42 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> These are the commits for the new x86_64 ABI named x32. These are changed 
> as per the feedback received on the mailing list.
> 
> The kernel related commits are dropped from this series as Bruce is pushing
> them directly.
> 
> The following changes since commit da321ee54b26b11e2bd36c889c5568ae62b17ffd:
> 
>   linux-yocto: pass KMACHINE to updateme, not MACHINE (2011-08-05 10:00:33 -0700)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib nitin/x32.rebased
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/x32.rebased
> 
> Nitin A Kamble (3):
>   siteinfo.bbclass: add entries for new x86_64 ABI x32 target
>   insane.bbclass: add entries for linux-gnux32
>   x86 tune inc files: add x32 abi tune parameters

Merged to master, thanks.

Richard



