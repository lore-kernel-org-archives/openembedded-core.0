Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1TGpKX-0002ka-V3
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 12:59:02 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69) with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TGp86-001Kje-Us>; Wed, 26 Sep 2012 12:46:10 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69) with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TGp86-002hjJ-Rh>; Wed, 26 Sep 2012 12:46:10 +0200
Received: from heinold by andorra.imp.fu-berlin.de with local (internal Exim
	4.72) id 1TGp84-0006dj-Os; Wed, 26 Sep 2012 12:46:08 +0200
Date: Wed, 26 Sep 2012 12:46:08 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120926104608.GA23994@mi.fu-berlin.de>
References: <1348652719.31293.90.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1348652719.31293.90.camel@phil-desktop>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-cross: factor out --enable-threads argument into ${GCCTHREADS}
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
X-List-Received-Date: Wed, 26 Sep 2012 10:59:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 26, 2012 at 10:45:18AM +0100, Phil Blundell wrote:
> This allows BSPs for architectures with no thread support to set (for
> example) "GCCTHREADS=no" without having to override all the other configure
> parameters.
> 
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>  meta/recipes-devtools/gcc/gcc-configure-common.inc |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> index 908ad3e..504bfaa 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -26,12 +26,13 @@ EXTRA_OECONF_INITIAL ?= ""
>  EXTRA_OECONF_INTERMEDIATE ?= ""
>  
>  GCCMULTILIB = "--disable-multilib"
> +GCCTHREADS = "posix"

Hi Phil,

should that not be GCCTHREADS ?=

otherwise I do not see how it could be overwritten from outside.

Bye Henning


