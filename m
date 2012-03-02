Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3TBi-0004Zr-Uh for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 15:10:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22E1rAO001053;
	Fri, 2 Mar 2012 14:01:53 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31841-09; Fri,  2 Mar 2012 14:01:49 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22E1i2j001046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 2 Mar 2012 14:01:45 GMT
Message-ID: <1330696908.309.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Fri, 02 Mar 2012 14:01:48 +0000
In-Reply-To: <cover.1330463101.git.bruce.ashfield@windriver.com>
References: <cover.1330463101.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/3] linux-yocto: revision bump + pvr + checkout fix
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
X-List-Received-Date: Fri, 02 Mar 2012 14:10:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-28 at 16:09 -0500, Bruce Ashfield wrote:
> Richard/Saul,
> 
> Naturally right after I sent my previous version bump to 3.2.7,
> 3.2.8 came out with an x86 floating point fix that was worth
> picking up. Hence my quick bump to 3.2.8.
> 
> The other update to the 3.0/3.2 trees stages content for PVR
> functionality in some future BSP work.
> 
> And finally, I added some extra checks and safety to the kernel
> checkout code, since Saul was reporting issues that I couldn't
> reproduce, I can't be sure if they fix his problem. But they do
> fix issues with aborted builds and the korg recipe. I've built
> many kernels and as many recipes as possible with these in place.
> 
> cc: Kishore Bodke <kishore.k.bodke@intel.com>
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit d86e3082e695cde555df276a2436873fa5381130:
>   Otavio Salvador (1):
>         licenses.conf: fix quotting of SRC_DISTRIBUTE_LICENSES
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (3):
>   linux-yocto: make kernel_checkout reentrant
>   linux-yocto/meta: add pvr feature description
>   linux-yocto: update to v3.2.8

Merged to master, thanks.

Richard



