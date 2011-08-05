Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QpNAa-0005FJ-Kj for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 18:22:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75GIKHS013773
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:18:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13123-09 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2011 17:18:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75GIDV9013767
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:18:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
Date: Fri, 05 Aug 2011 17:17:51 +0100
Message-ID: <1312561071.14274.132.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/14]
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
X-List-Received-Date: Fri, 05 Aug 2011 16:22:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 08:27 -0700, Saul Wold wrote:
> Richard,
> 
> This Set includes changes multilib and ppc64, you may want to
> review the ppc64 changes.
> 
> Thanks
> 	Sau!
> 
> The following changes since commit 8a731122e7811275f20065ba27645b97fadf362d:
> 
>   eglibc: Fix patch merge breakage (2011-08-04 15:41:08 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Beth Flanagan (1):
>   buildstats.bbclass: Adding disk io measurement
> 
> Khem Raj (3):
>   autoconf: Remove patch=1 from SRC_URI
>   autoconf: Remove code checking for hardcoded /usr/local
>   coreutils: Fix build on uclibc
> 
> Kumar Gala (7):
>   libmusicbrainz: utilize base_libdir when configured
>   libproxy: utilize libdir when configured
>   prelink: Add lib64 dirs to prelink.conf
>   tune/arch-powerpc64: include arch-powerpc.inc to keep things in sync
>   gcc-4.6: Add support for the e5500 PowerPC core
>   image-mklibs.bbclass: Add powerpc64 arch support
>   image-mklibs.bbclass: Utilize ${base_libdir} instead of static /lib
> 
> Mark Hatle (1):
>   libzypp: Increase the size of the arch compat table
> 
> Saul Wold (2):
>   dpkg: Update to use perlnative
>   linux-yocto_3.0: Fix SRC_URI to use yoctoproject.org

Merged to master since most of these have been floating around for a
while and undergone a few rounds of review. The ppc64s look good, thanks
Kumar for working through the details!

Cheers,

Richard



