Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RtLwo-0001an-Gr for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 17:25:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q13GH8Fj022171;
	Fri, 3 Feb 2012 16:17:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21673-06; Fri,  3 Feb 2012 16:17:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q13GGxmG022165
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 3 Feb 2012 16:17:00 GMT
Message-ID: <1328285825.3895.121.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 03 Feb 2012 16:17:05 +0000
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 00/10] external-csl-toolchain fixes and improvements
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
X-List-Received-Date: Fri, 03 Feb 2012 16:25:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-27 at 11:13 -0600, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> - Fixes the external-csl-toolchain and corresponding tcmode to be compatible
>   with current metadata (e.g. uses current providers), and ensures it works again
> - Kills the arch and version specific bits, making it work fine with a number
>   of different versions of the CodeSourcery arm, mips, ppc, and ia32 toolchains
> - Makes the packaging match up with the packaging of the internal toolchain by
>   leveraging the eglibc packaging .inc and ensuring our other packages are
>   named correctly
> - Extracts versioning information for both the recipe and emitted packages
>   from the external toolchain at ConfigParsed time. This code is not pretty,
>   largely kept as is from the Mentor internal external toolchain, but it does
>   work. A future commit or commits will clean that up.
> 
> I've tested with with the fall 2010, spring 2011, and fall 2011 releases, for
> the qemux86, qemuarm, qemumips, and qemuppc machines. I used buildhistory to
> compare the packages and image content between internal and external, ensuring
> that they match up with almost no differences.
> 
> The following changes since commit fba0459da7f274ae284d36b7fdbf2f9d10a52610:
> 
>   distro_tracking_fields: fix the typos in the field of maintainer. (2012-01-27 09:52:00 +0000)
> 
> are available in the git repository at:
>   git://github.com/kergoth/oe-core external-toolchain
> 
> Christopher Larson (10):
>       libc-package: fix typo in LOCALETREESRC default value
>       eglibc-package.inc: don't include debug files in -pic
>       binutils: fixes for build with an external csl toolchain
>       external-csl-toolchain: fix critical PATH manipulation bug
>       external-csl-toolchain: fixes for metadata changes
>       external-csl-toolchain: avoid the hardcoded version/prefix
>       external-csl-toolchain: support mips/ppc/arm
>       external-csl-toolchain: support ia32
>       external-csl-toolchain: leverage eglibc's packaging for more granular output
>       external-csl-toolchain: extract version info from the toolchain

Merged to master. Thanks for these, good to see those recipes fulfilling
their full potential :)

Cheers,

Richard



