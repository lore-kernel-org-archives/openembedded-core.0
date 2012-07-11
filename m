Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sox9F-0001A2-2G for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 15:40:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BDSvmI007592
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 14:28:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02807-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 14:28:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BDSmNV007586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 14:28:50 +0100
Message-ID: <1342013330.7934.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 14:28:50 +0100
In-Reply-To: <1342008111-24810-1-git-send-email-b19537@freescale.com>
References: <1342008111-24810-1-git-send-email-b19537@freescale.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] task-core-sdk.bb: add libgomp and libgomp-dev
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
X-List-Received-Date: Wed, 11 Jul 2012 13:40:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-11 at 20:01 +0800, b19537@freescale.com wrote:
> From: Zhenhua Luo <b19537@freescale.com>
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>  meta/recipes-core/tasks/task-core-sdk.bb |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-core/tasks/task-core-sdk.bb b/meta/recipes-core/tasks/task-core-sdk.bb
> index ec6cdcc..3ee29ce 100644
> --- a/meta/recipes-core/tasks/task-core-sdk.bb
> +++ b/meta/recipes-core/tasks/task-core-sdk.bb
> @@ -7,7 +7,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
>                      file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>  DEPENDS = "task-core-console"
> -PR = "r7"
> +PR = "r8"
>  
>  ALLOW_EMPTY = "1"
>  #PACKAGEFUNCS =+ 'generate_sdk_pkgs'
> @@ -34,6 +34,8 @@ RDEPENDS_task-core-sdk = "\
>      gettext \
>      make \
>      intltool \
> +    libgomp \
> +    libgomp-dev \
>      libstdc++ \
>      libstdc++-dev \
>      libtool \

This will break for architectures which don't build libgomp (anything
not powerpc).

You could add a RRECOMMENDS?

Cheers,

Richard



