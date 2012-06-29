Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SkaaE-0005Xq-AZ for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 14:45:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5TCZ2eB002079
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 13:35:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02039-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 13:34:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5TCYsPg002067
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 13:34:55 +0100
Message-ID: <1340973298.23146.155.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jun 2012 13:34:58 +0100
In-Reply-To: <cover.1340919157.git.raj.khem@gmail.com>
References: <cover.1340919157.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/11] toolchain updates
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
X-List-Received-Date: Fri, 29 Jun 2012 12:45:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-06-28 at 14:36 -0700, Khem Raj wrote:
> This combines my two previous pull requests in Addition RP's
> feedback on USE_NLS definition
> 
> 
> The following changes since commit b26dda2d1e839ea461485236028e1af53b839d34:
> 
>   local.conf.sample.extended: Add accidentally missed features (2012-06-28 16:30:32 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib kraj/misc-updates
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-updates
> 
> Dennis Lan (1):
>   eglibc: support mipsel little endian, filter out -march=mips32
> 
> Khem Raj (10):
>   bitbake.conf: Add weak definition for USE_NLS
>   libgcc: Remove unpackage unwind.h
>   gcc-configure-sdk,gcc-configure-cross: Dont recompute USE_NLS
>   eglibc-2.15: Update to latest on 2.15 branch
>   kconfig-frontends: New recipe
>   uclibc: Separate the bits between uclibc and uclibc-initial
>   uclibc-git: Update for building systemd
>   uclibc-0.9.33: add posix_fallocate implementation
>   bison: link in librt on uclibc
>   glib-2.0: Add missing dependency on virtual/libiconv

I merged these to master apart from the kconfig one which I'd like Saul
to check over. I fixed up the bitbake.conf patch myself in the end since
it was easier to do that than wait for another patch.

Cheers,

Richard



