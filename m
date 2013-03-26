Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UKWJs-0004Wc-Ne for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 17:02:12 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2QFsY9O018880; Tue, 26 Mar 2013 15:54:34 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5p65dbDVPtTD; Tue, 26 Mar 2013 15:54:34 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2QFsQUW018854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 26 Mar 2013 15:54:29 GMT
Message-ID: <1364312670.3097.79.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luo Zhenhua-B19537 <B19537@freescale.com>
Date: Tue, 26 Mar 2013 15:44:30 +0000
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A01488D34@039-SN2MPN1-022.039d.mgd.msft.net>
References: <CA452391058F6D4E9715FB2C29D9312A01488D34@039-SN2MPN1-022.039d.mgd.msft.net>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build issue of nativesdk toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 16:02:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-03-26 at 14:29 +0000, Luo Zhenhua-B19537 wrote:
> When I build nativesdk toolchain with recent poky + meta-fsl-ppc + FSL SDK specific layers, build issue similar to error-1 happens. This issue might appear for different gcc related package during different trial, e.g. libgcc, gcc, gcc-cross-initial, gcc-crosssdk, etc. 
> 
> When I revert http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=9bfd92243eced921f166d84b5a72d6f774e13413, error-1 build issue goes away, error-2 appears, error-2 also can't be reproduced every time. Does anyone ever meet the similar build issue and any comment on the build error?

It sounds like you've changes in gcc between some of the different
variants, e.g. different patch sets or SRC_URI.

gcc uses a shared source directory so the same patchset must be used for
all variants. It has nothing to do with the above commit.

Cheers,

Richard



