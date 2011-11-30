Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVtnU-0004Os-8U for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:42:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUNZwp3007863;
	Wed, 30 Nov 2011 23:35:58 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07331-07; Wed, 30 Nov 2011 23:35:54 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUNZoYI007857
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 Nov 2011 23:35:51 GMT
Message-ID: <1322696158.17484.85.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 23:35:58 +0000
In-Reply-To: <262b7b5f2bc5cf31b54a7f5d3ff27306a6a45de8.1322697616.git.julian.pidancet@gmail.com>
References: <4ED69E46.3030808@linux.intel.com>
	<262b7b5f2bc5cf31b54a7f5d3ff27306a6a45de8.1322697616.git.julian.pidancet@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: Re: [PATCH] Fix multiarch DISTRO_FEATURE
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
X-List-Received-Date: Wed, 30 Nov 2011 23:42:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 00:01 +0000, Julian Pidancet wrote:
> Make get_gcc_multiarch_setting more elegant. Use a dictionnary
> to store the config options and replace bb.data.getVar with d.getVar.
> Remove i686 from the architecture list because it doesn't seem
> to be a valid TARGET_ARCH any more in OE.
> Configure gdb (gdb and gdb-cross) with --enable-64-bit-bfd if
> multiarch DISTRO_FEATURE is present
> 
> Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-common.inc |   17 ++++++++++-------
>  meta/recipes-devtools/gdb/gdb-common.inc |    1 +
>  2 files changed, 11 insertions(+), 7 deletions(-)

Applied to master, thanks and sorry about the mixup with the patches.

Cheers,

Richard



