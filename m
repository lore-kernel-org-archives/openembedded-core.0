Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Srnzv-0001DT-Du for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 12:30:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JAIqkF001275;
	Thu, 19 Jul 2012 11:18:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32466-05; Thu, 19 Jul 2012 11:18:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JAIgO8001269
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 19 Jul 2012 11:18:43 +0100
Message-ID: <1342693126.7940.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jul 2012 11:18:46 +0100
In-Reply-To: <1342692051-5963-1-git-send-email-mertsas@cisco.com>
References: <1342692051-5963-1-git-send-email-mertsas@cisco.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Martin Ertsaas <mertsas@cisco.com>
Subject: Re: [PATCH] Remove the - between ${TARGET_PREFIX} and ar/nm for the env script, as this will make autotools look for arm-none-linux-gnueabi--ar instead of arm-none-linux-gnueabi-ar.
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
X-List-Received-Date: Thu, 19 Jul 2012 10:30:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-19 at 12:00 +0200, Martin Ertsaas wrote:
> Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
> ---
>  meta/classes/toolchain-scripts.bbclass |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index bf37ec9..8f7c644 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -68,8 +68,8 @@ toolchain_create_tree_env_script () {
>  	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
>  	echo 'export OBJCOPY=${TARGET_PREFIX}objcopy' >> $script
>  	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
> -	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
> -	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
> +	echo 'export AR=${TARGET_PREFIX}ar' >> $script
> +	echo 'export NM=${TARGET_PREFIX}nm' >> $script
>  	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
>  	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${BUILD_SYS} --with-libtool-sysroot=${STAGING_DIR_TARGET}"' >> $script
>  	if [ "${TARGET_OS}" = "darwin8" ]; then

Merged to master, thanks.

Richard



