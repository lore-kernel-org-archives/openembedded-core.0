Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sm7Qg-0003DY-DO
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 20:02:26 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jul 2012 10:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173042808"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2012 10:51:23 -0700
Message-ID: <4FF3311B.7040207@linux.intel.com>
Date: Tue, 03 Jul 2012 10:51:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1206291400090.6157@oneiric>
In-Reply-To: <alpine.DEB.2.02.1206291400090.6157@oneiric>
Subject: Re: kernel-arch: Remove test for long-dead arm26 architecture.
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
X-List-Received-Date: Tue, 03 Jul 2012 18:02:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/29/2012 11:02 AM, Robert P. J. Day wrote:
>
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

Merged into OE-Core

Thanks for these clean-ups

	Sau!


