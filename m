Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RJKX5-00008n-96 for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 09:37:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9R7Vmfs028801
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 08:31:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28768-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 08:31:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9R7VcpF028795
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 08:31:39 +0100
Message-ID: <1319700697.15601.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 27 Oct 2011 08:31:37 +0100
In-Reply-To: <cover.1319576293.git.scott.a.garman@intel.com>
References: <cover.1319576293.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] Recipe upgrades
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
X-List-Received-Date: Thu, 27 Oct 2011 07:37:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-25 at 14:32 -0700, Scott Garman wrote:
> Hello,
> 
> Here is a set of some straightfoward recipe upgrades: sudo, grep,
> mtools, and openssh.
> 
> Build testing: These have been successfully built for all 5 qemu
> architectures.
> 
> Runtime testing: I have performed basic runtime testing for all of
> these recipe upgrades as well within a qemux86 session.
> 
> The following changes since commit f586aaa8d00361a9597a546d665077c75cf4d520:
> 
>   libxml-parser-perl, libxml-simple-perl, expat, sgmlspl-native, git: bump PR to rebuild after perl upgrade (2011-10-25 08:36:01 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib sgarman/recipe-upgrades-final
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/recipe-upgrades-final
> 
> Scott Garman (5):
>   sudo: upgrade to 1.8.3
>   grep: upgrade to 2.9
>   mtools: upgrade to 4.0.17
>   openssh: upgrade to 5.9p1

I've merged the above, the distro tracking had feedback from Saul.

Cheers,

Richard



