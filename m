Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9115-0005k8-T1 for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 22:46:08 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SKl0d9023386 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 21:47:00 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xPcbCTAvRdfl
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 21:47:00 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SKkrtW023382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 21:46:55 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 21:40:28 +0100
In-Reply-To: <4E830E1E.3030404@mentor.com>
References: <4E830E1E.3030404@mentor.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317242435.12332.70.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] apmd: use ${HOST_SYS}-libtool
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
X-List-Received-Date: Wed, 28 Sep 2011 20:46:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-28 at 16:07 +0400, Andrew Gabbasov wrote:
> libtool-cross uses ${HOST_SYS}- prefix while building and installing.
> In some cases that may be different from ${TARGET_PREFIX}, that is currently
> used in apmd recipe. It's better to have them consistent.
> 
> Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> ---
>  meta/recipes-bsp/apmd/apmd_3.2.2-14.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb b/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
> index e80e108..bf53cc6 100644
> --- a/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
> +++ b/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
> @@ -34,7 +34,7 @@ INITSCRIPT_PARAMS = "defaults"
>  
>  do_compile() {
>  	# apmd doesn't use whole autotools. Just libtool for installation
> -	oe_runmake "LIBTOOL=${STAGING_BINDIR_CROSS}/${TARGET_PREFIX}libtool" apm apmd
> +	oe_runmake "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool" apm apmd
>  }
>  
>  do_install() {

I merged this and your three other patches to master, thanks.

Richard



