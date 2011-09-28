Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R90ox-0005WQ-2P for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 22:33:35 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SKYUfX023029 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 21:34:30 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id V0Ci1DYheCZs
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 21:34:30 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SKYQcA023025
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 21:34:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 21:28:01 +0100
In-Reply-To: <dfbb24b81f85b55710410ed93f26aa1e0fc38ecb.1317242070.git.jessica.zhang@intel.com>
References: <cover.1317242070.git.jessica.zhang@intel.com>
	<dfbb24b81f85b55710410ed93f26aa1e0fc38ecb.1317242070.git.jessica.zhang@intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317241688.12332.66.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] Fixed a typo for setting up OECORE_ACLOCAL_OPTS for adt-installer case
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
X-List-Received-Date: Wed, 28 Sep 2011 20:33:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-28 at 13:38 -0700, Jessica Zhang wrote:
> Signed-off-by: Jessica Zhang <jessica.zhang@intel.com>
> ---
>  meta/classes/toolchain-scripts.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index 4a28e5f..875efed 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -96,7 +96,7 @@ toolchain_create_sdk_env_script_for_installer () {
>  	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
>  	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
>  	echo 'export OECORE_TARGET_SYSROOT="##SDKTARGETSYSROOT##"' >> $script
> -        echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/acloal"' >> $script
> +        echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
>  	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
>  	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
>  }

Merged to master, thanks.

Richard




