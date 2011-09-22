Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6u38-0003gc-DE for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 02:55:30 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8N0uPGg005305 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 01:56:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uNJ6Q18RWe3T
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 01:56:25 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8N0uHE5005277
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 01:56:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110922120430.GE3477@jama.jama.net>
References: <20110922120430.GE3477@jama.jama.net>
Date: Fri, 23 Sep 2011 00:35:00 +0100
Message-ID: <1316734500.28323.17.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 3.1.91- 
Subject: Re: [PATCH 11/17] eglibc: fix packaging of some of nativesdk	packages
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
X-List-Received-Date: Fri, 23 Sep 2011 00:55:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 14:04 +0200, Martin Jansa wrote:
> Hi,
> 
> after this patch PKGSUFFIX is probably evaluated too late and this:
> 
> # PREFERRED_PROVIDER_glibc-thread-db=eglibc-thread-db
> PREFERRED_PROVIDER_glibc-thread-db="eglibc-thread-db"
> # RPROVIDES_eglibc-thread-db${PKGSUFFIX}=glibc-thread-db${PKGSUFFIX}
> RPROVIDES_eglibc-thread-db="glibc-thread-db"
> 
> doesn't seem to work as expected and gdb pulls whole
> external-csl-toolchain as glibc-thread-db provider for
> 
> RRECOMMENDS_gdb_append_linux-gnueabi = " glibc-thread-db "
> 
> and btw:
> ERROR: external-poky-toolchain: Recipe file does not have license file information (LIC_FILES_CHKSUM)
> ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please fix
> 
> and sign of this behavior is also qemu-native pulled to build and
> warnings like this also for virtual/libc virtual/linux-libc-headers
> 
> ERROR: Multiple .bb files are due to be built which each provide virtual/libiconv
> (/OE/shr-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.13.bb
>  /OE/shr-core/openembedded-core/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb).

Agreed, there are problems here. I'm short on time and wanted to unbreak
master so I reverted the patch.

Cheers,

Richard



