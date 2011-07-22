Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QkGah-0001Yj-QB
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 16:20:36 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QkGWi-0002de-5x from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 07:16:28 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 22 Jul 2011 07:14:05 -0700
Received: from [172.30.80.68] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 22 Jul 2011 07:16:27 -0700
Message-ID: <4E298634.1020704@mentor.com>
Date: Fri, 22 Jul 2011 07:16:20 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1311326696-11745-1-git-send-email-galak@kernel.crashing.org>	<1311326696-11745-2-git-send-email-galak@kernel.crashing.org>	<1311326696-11745-3-git-send-email-galak@kernel.crashing.org>
	<1311326696-11745-4-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1311326696-11745-4-git-send-email-galak@kernel.crashing.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 22 Jul 2011 14:14:05.0030 (UTC)
	FILETIME=[9D114860:01CC4879]
Subject: Re: [PATCH 3/5] kernel-arch: Add handling of powerpc64
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
X-List-Received-Date: Fri, 22 Jul 2011 14:20:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/22/2011 02:24 AM, Kumar Gala wrote:
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>  meta/classes/kernel-arch.bbclass |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
> index 86c15d3..225d599 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -6,7 +6,7 @@
>  
>  valid_archs = "alpha cris ia64 \
>                 i386 x86 \
> -               m68knommu m68k ppc powerpc ppc64  \
> +               m68knommu m68k ppc powerpc powerpc64 ppc64  \
>  	       sparc sparc64 \
>                 arm  arm26 \
>                 m32r mips \
> @@ -24,6 +24,7 @@ def map_kernel_arch(a, d):
>  	elif re.match('arm26$', a):		        return 'arm26'
>  	elif re.match('armeb$', a):		        return 'arm'
>  	elif re.match('mipsel$', a):		        return 'mips'
> +	elif re.match('p(pc|owerpc)(|64)', a):		return 'powerpc'
>  	elif re.match('sh(3|4)$', a):		        return 'sh'
>  	elif re.match('bfin', a):                       return 'blackfin'
>  	elif re.match('microblazeel', a):               return 'microblaze'
> @@ -36,7 +37,7 @@ export ARCH = "${@map_kernel_arch(bb.data.getVar('TARGET_ARCH', d, 1), d)}"
>  def map_uboot_arch(a, d):
>  	import re
>  
> -	if   re.match('powerpc$', a): return 'ppc'
> +	if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
>  	elif re.match('i.86$', a): return 'x86'
>  	return a
>  


-- 
Tom Rini
Mentor Graphics Corporation


