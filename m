Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UO3cW-0007WT-So for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 12:11:47 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r35A5Du4030944; Fri, 5 Apr 2013 11:05:13 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DLnfxwkZxkSJ; Fri,  5 Apr 2013 11:05:13 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r35A57mQ030931
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 5 Apr 2013 11:05:10 +0100
Message-ID: <1365155658.6526.136.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Fri, 05 Apr 2013 10:54:18 +0100
In-Reply-To: <515E976C.8060302@linaro.org>
References: <515E976C.8060302@linaro.org>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Does support for external toolchains working in current OE?
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
X-List-Received-Date: Fri, 05 Apr 2013 10:11:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-04-05 at 11:20 +0200, Marcin Juszkiewicz wrote:
> For last few months I am working on fixing Linaro binary cross
> toolchains and their support in OpenEmbedded. Got to point when they 
> work (both AArch64 and ARMv7a ones) for single packages but problem 
> starts when I want to create image...
> 
> 11:14 hrw@puchatek:build$ bitbake core-image-minimal -g
> Parsing of 1302 .bb files complete (1294 cached, 8 parsed). 1670 targets, 45 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> NOTE: multiple providers are available for virtual/gettext (proxy-libintl, gettext)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match virtual/gettext
> NOTE: Preparing runqueue
> ERROR: Multiple .bb files are due to be built which each provide virtual/libc (/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-linaro/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/external-linaro-toolchain.bb).
>  This usually means one provides something the other doesn't and should.
> ERROR: Multiple .bb files are due to be built which each provide virtual/arm-linux-gnueabihf-libc-for-gcc (/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-linaro/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/external-linaro-toolchain.bb).
>  This usually means one provides something the other doesn't and should.
> ERROR: Multiple .bb files are due to be built which each provide virtual/libiconv (/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-linaro/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/external-linaro-toolchain.bb).
>  This usually means one provides something the other doesn't and should.
> NOTE: PN build list saved to 'pn-buildlist'
> NOTE: PN dependencies saved to 'pn-depends.dot'
> NOTE: Package dependencies saved to 'package-depends.dot'
> NOTE: Task dependencies saved to 'task-depends.dot'
> 
> Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
> 
> All three virtual/ are provided by external-linaro-toolchain recipe... 
> 
> Is there any external toolchain which allows to create image with current
> OpenEmbedded layers? 
> 
> TCMODE="external-sourcery" gives exactly same problem.

This means that virtual/libc is providing something which the external
toolchain recipes are not. Can you share the "bitbake -DDDv" output for
the above command somewhere (I know there will be a lot of it). Buried
somewhere in there will be the answer as it does tell you what is going
on if you search for the right things.

Cheers,

Richard



