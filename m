Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZhjl-0003vd-S0 for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 14:10:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UC0WPL021776
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 13:00:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18246-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 13:00:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UC0MOk021770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 13:00:23 +0100
Message-ID: <1338379221.20169.131.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 13:00:21 +0100
In-Reply-To: <cover.1338280083.git.edwin.zhai@intel.com>
References: <cover.1338280083.git.edwin.zhai@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] [v2]qemu: Add an option to remove host sdl/gl checking
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
X-List-Received-Date: Wed, 30 May 2012 12:10:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-05-29 at 16:30 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> Saul,
> This is the V2 version to fix build error for qemu and qemu-nativesdk.
> 
> Add an PACKAGECONFIG in qemu to disable GL acceleration:
> * By default configure try best to enable GL acceleration and fail when missing
>   host dependency(libSDL and libGL).
> * End user can also choose to turn off GL capability, thus remove the host
>   dependence in building.
> 
> [YOCTO #2407] got fixed.
> 
> Thanks,
> Edwin
> 
> The following changes since commit 54f38111868775c85bfe921592d8443a61952c62:
> 
>   pango: Fix modules load failure in multilib environment (2012-05-14 21:50:55 +0800)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib gzhai/fix2
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix2
> 
> Zhai Edwin (1):
>   qemu: Add an option to remove host sdl/gl checking

Merged to master, thanks.

Richard



