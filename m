Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T24HY-0007Eo-6J
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 19:54:56 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2012 10:42:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="187330629"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by orsmga002.jf.intel.com with ESMTP; 16 Aug 2012 10:42:55 -0700
Message-ID: <502D311F.7010707@linux.intel.com>
Date: Thu, 16 Aug 2012 10:42:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Kenneth Solbjerg <kenneth.solbjerg@moveinnovation.dk>
References: <CADEYsmEN9mhJ_Yh5RJzRBtrMSc+w1NaUC3GxNfZmbd0O5uP1RQ@mail.gmail.com>
	<CADEYsmEwNHNPQaRRwdPP1ej0xg16hyO7=K-pxgifzcVZEeA9ig@mail.gmail.com>
In-Reply-To: <CADEYsmEwNHNPQaRRwdPP1ej0xg16hyO7=K-pxgifzcVZEeA9ig@mail.gmail.com>
Cc: yocto@yoctoproject.org, 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [PATCH 1/1] run-postinsts does not run any scripts
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
X-List-Received-Date: Thu, 16 Aug 2012 17:54:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2012 05:19 AM, Kenneth Solbjerg wrote:
> Hi
>
> Sorry for any mistakes, but this is my first patch...
>
> On my system (core-image-base, .deb package files), run-postinsts does
> not run any scripts due to a failed test in run-postinsts.awk.
> As dpkg is not actually installed on target, opkg is identified as the
> pkgdir and that is not right...
>
>
> Index: poky-denzil-7.0/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
> ===================================================================
> --- poky-denzil-7.0.orig/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
>      2012-07-05
> 13:00:23.026519188 +0200
> +++ poky-denzil-7.0/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
>   2012-07-05
> 13:00:48.054519384 +0200
> @@ -7,7 +7,7 @@
>   #
>
>   BEGIN {
> -  rc=system("test -d /usr/dpkg/info/")
> +  rc=system("test -d /var/lib/dpkg/info/")
>     if (rc==0)
>       pkgdir="/var/lib/dpkg/info"
>     else
>
>
Merged into OE-Core

Thanks
	Sau!

> --
> Med venlig hilsen / Best regards
>
> Kenneth Solbjerg
> Software Specialist
>
> Move Innovation
> Web : http://www.moveinnovation.dk
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto
>
>


