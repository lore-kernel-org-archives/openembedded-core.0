Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TF3vI-0002Ry-9d for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 16:09:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8LDuupi026009;
	Fri, 21 Sep 2012 14:56:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24821-05; Fri, 21 Sep 2012 14:56:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8LDukGj026003
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 21 Sep 2012 14:56:47 +0100
Message-ID: <1348235805.10108.76.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Sep 2012 14:56:45 +0100
In-Reply-To: <1348174475-7563-1-git-send-email-raj.khem@gmail.com>
References: <1348174475-7563-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: Use 4.7.2 release tarball
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
X-List-Received-Date: Fri, 21 Sep 2012 14:09:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-20 at 13:54 -0700, Khem Raj wrote:
> This avoids the SVN or git fetcher issues for gcc
> and the tar is mirrored around the world so it will
> not be slow
> 
> Fixes [YOCTO #2908]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.7.inc              |   15 ++---
>  .../gcc/gcc-4.7/fix-g++-sysroot.patch              |   24 +++----
>  .../gcc-4.7/gcc-poison-system-directories.patch    |   66 ++++++++++----------
>  meta/recipes-devtools/gcc/gcc-common.inc           |    9 +--
>  4 files changed, 56 insertions(+), 58 deletions(-)

Merged to master, thanks.

Richard



