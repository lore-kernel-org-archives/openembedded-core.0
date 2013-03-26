Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UKd0L-0003bv-JN for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 00:10:10 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2QN2xST026017; Tue, 26 Mar 2013 23:02:59 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7Ck4fmnljgbE; Tue, 26 Mar 2013 23:02:59 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2QN2pll025991
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 26 Mar 2013 23:02:54 GMT
Message-ID: <1364338373.3097.117.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Mar 2013 22:52:53 +0000
In-Reply-To: <1364334507-16539-1-git-send-email-raj.khem@gmail.com>
References: <1364334507-16539-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] uclibc-git: Fix build on x86 and move to latest master
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
X-List-Received-Date: Tue, 26 Mar 2013 23:10:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-03-26 at 14:48 -0700, Khem Raj wrote:
> debugedit from rpm has unearthed a bug in uclibc
> where it was mixing stabs with elf/dwarf
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
>  .../0001-i386-sysdep.h-Remove-STABS_-macros.patch  |   71 ++++
>  ...-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch |    8 +-
>  .../uclibc/uclibc-git/posix_fallocate.patch        |  408 --------------------
>  .../uclibc/uclibc-git/uclibc-execvpe.patch         |  163 --------
>  5 files changed, 77 insertions(+), 578 deletions(-)
>  create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-i386-sysdep.h-Remove-STABS_-macros.patch
>  delete mode 100644 meta/recipes-core/uclibc/uclibc-git/posix_fallocate.patch
>  delete mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc-execvpe.patch

git am really doesn't like applying this, is there a tree I can pull it
from somewhere?

Cheers,

Richard



