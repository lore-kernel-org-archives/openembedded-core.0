Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBNsE-0000Vm-3Y for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 11:34:46 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p959ZdXK011800 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 10:35:39 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UIe-TtqN9Xml
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 10:35:39 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p959ZX6Q011796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 10:35:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 05 Oct 2011 10:29:02 +0100
In-Reply-To: <1317481534.2323.14.camel@elmorro>
References: <1317481534.2323.14.camel@elmorro>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317806952.14671.124.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] kexec-tools: fix architecture mismatch QA error
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
X-List-Received-Date: Wed, 05 Oct 2011 09:34:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-10-01 at 10:05 -0500, Tom Zanussi wrote:
> Building sato-sdk for an x86_64 target throws this QA error:
> 
> | ERROR: QA Issue: Architecture did not match (62 to 3) on /work/x86_64-poky-li\
> nux/kexec-tools-2.0.2-r1/packages-split/kexec-tools/usr/lib/kexec-tools/kexec_t\
> est
> 
> kexec_test uses 32-bit code for testing - add an INSANE_SKIP exception for it.
> 
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
>  meta/recipes-kernel/kexec/kexec-tools.inc |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-kernel/kexec/kexec-tools.inc b/meta/recipes-kernel/kexec/kexec-tools.inc
> index bbfb20f..278ce34 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools.inc
> +++ b/meta/recipes-kernel/kexec/kexec-tools.inc
> @@ -13,3 +13,5 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
>  inherit autotools
>  
>  COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-(linux|freebsd.*)'
> +
> +INSANE_SKIP_${PN} = "arch"

Merged to master, thanks.

Richard




