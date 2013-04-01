Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1UMd0e-0000mK-Ku
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 13:34:44 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1UMck6-003nq0-Lb>; Mon, 01 Apr 2013 13:17:38 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1UMck6-001iRS-K0>; Mon, 01 Apr 2013 13:17:38 +0200
Received: from heinold by andorra.imp.fu-berlin.de with local (internal_ws
	Exim 4.72) id 1UMck5-0005N1-H2; Mon, 01 Apr 2013 13:17:37 +0200
Date: Mon, 1 Apr 2013 13:17:37 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Message-ID: <20130401111737.GA19595@mi.fu-berlin.de>
References: <1364807444-20977-1-git-send-email-hmatrjp@users.sourceforge.jp>
MIME-Version: 1.0
In-Reply-To: <1364807444-20977-1-git-send-email-hmatrjp@users.sourceforge.jp>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [PATCH] pcmciautils: fix segmentation fault of pccardctl command
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
X-List-Received-Date: Mon, 01 Apr 2013 11:34:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 01, 2013 at 06:10:44PM +0900, Takeshi Hamasaki wrote:
> 
Hi,

nitpicking about spelling.

> This changes difinition of PCMCIAUTILS_VERSION to string from a multichacter constant to avoid segmentation fault of pccardctl command. 
               ^^^ 

> Signed-off-by: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
> ---
>  meta/recipes-bsp/pcmciautils/pcmciautils.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
> index 80271d6..0651236 100644
> --- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
> +++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
> @@ -21,7 +21,7 @@ export udevrulesdir = "${nonarch_base_libdir}/udev/rules.d"
>  export UDEV = "1"
>  LD = "${CC}"
>  CFLAGS =+ "-I${S}/src"
> -CFLAGS =+ "-DPCMCIAUTILS_VERSION=\'${PV}\'"
> +CFLAGS =+ "-DPCMCIAUTILS_VERSION=\\"${PV}\\""
>  
>  PARALLEL_MAKE = ""
>  EXTRA_OEMAKE = "-e 'STRIP=echo' 'LIB_OBJS=-lc -lsysfs' 'LEX=flex'"
> -- 
> 1.7.10.4

Bye Henning


