Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0jKL-0000MZ-3T for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 01:48:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1O0dduZ031508
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:39:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31209-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:39:35 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1O0dVRU031502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:39:32 GMT
Message-ID: <1330043972.25226.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2012 00:39:32 +0000
In-Reply-To: <cover.1330003047.git.dongxiao.xu@intel.com>
References: <cover.1330003047.git.dongxiao.xu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3][PULL] Hob2: OE-Core related changes
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
X-List-Received-Date: Fri, 24 Feb 2012 00:48:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-23 at 21:48 +0800, Dongxiao Xu wrote:
> Hi Richard,
> 
> This is the hob2 related OE-Core changes. Please help to review and pull.
> 
> Compared with previous version:
>  - packageinfo.bbclass: Fix the way to construct ipk/deb package names.
>  - meta-hob: rename dummy-image and dummy-toolchain to hob-image and hob-toolchain
> 
> Note that this pull request depends on the following pull requests:
>  - hob2-bitbake-changes
> 
> Thanks,
> Dongxiao
> 
> The following changes since commit 55f72b98f606c1554eb6edd151292ffdfddf1384:
> 
>   texi2html: Fix for multilib (2012-02-22 23:01:45 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dxu4/hob2-oecore-changes
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/hob2-oecore-changes
> 
> Dongxiao Xu (2):
>   packageinfo.bbclass: add a new bbclass to pass package information
>   meta-hob: Add a new meta-hob layer
> 
> Shane Wang (1):
>   package.bbclass: set package size into pkgdata for hob2's use

Merged to master, thanks.

Cheers,

Richard



