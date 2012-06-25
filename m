Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjCTR-0008II-Mz
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 18:49:13 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Jun 2012 09:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="162361866"
Received: from unknown (HELO [10.255.12.180]) ([10.255.12.180])
	by orsmga002.jf.intel.com with ESMTP; 25 Jun 2012 09:38:21 -0700
Message-ID: <4FE893FD.6040503@linux.intel.com>
Date: Mon, 25 Jun 2012 09:38:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1206231445460.17040@oneiric>
In-Reply-To: <alpine.DEB.2.02.1206231445460.17040@oneiric>
Subject: Re: [PATCH] Remove reference to long-dead arm26 architecture.
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
X-List-Received-Date: Mon, 25 Jun 2012 16:49:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/23/2012 11:46 AM, Robert P. J. Day wrote:
>

Robert,

Could you please resend this with the correct commit message format.

The subject should list the filename/module first as follows:

kernel-arch: Remove reference to long-dead arm26 architecture.

See the OE Wiki for details.

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks
	Sau!
> Signed-off-by: Robert P. J. Day<rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
> index e186422..4a30192 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -8,7 +8,7 @@ valid_archs = "alpha cris ia64 \
>                  i386 x86 \
>                  m68knommu m68k ppc powerpc powerpc64 ppc64  \
>   	       sparc sparc64 \
> -               arm  arm26 \
> +               arm \
>                  m32r mips \
>   	       sh sh64 um h8300   \
>   	       parisc s390  v850 \
> @@ -21,7 +21,6 @@ def map_kernel_arch(a, d):
>   	valid_archs = d.getVar('valid_archs', True).split()
>
>   	if   re.match('(i.86|athlon|x86.64)$', a):	return 'x86'
> -	elif re.match('arm26$', a):		        return 'arm26'
>   	elif re.match('armeb$', a):		        return 'arm'
>   	elif re.match('mips(el|64|64el)$', a):	        return 'mips'
>   	elif re.match('p(pc|owerpc)(|64)', a):		return 'powerpc'
>


