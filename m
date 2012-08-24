Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4z1J-0003CC-C0
	for openembedded-core@openembedded.org; Fri, 24 Aug 2012 20:54:13 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2012 11:40:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="213580737"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2012 11:40:42 -0700
Message-ID: <5037CAAA.70603@linux.intel.com>
Date: Fri, 24 Aug 2012 11:40:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Andy Ross <andy.ross@windriver.com>
References: <1345743151-2065-1-git-send-email-andy.ross@windriver.com>
In-Reply-To: <1345743151-2065-1-git-send-email-andy.ross@windriver.com>
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 0/2] RPATH fixes: libtool & binutils
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
X-List-Received-Date: Fri, 24 Aug 2012 18:54:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/23/2012 10:32 AM, Andy Ross wrote:
> Current RPATH work:
>
> Patch 1 just updates the libtool work to use the built-in
> normalization function instead of sed, as requested.
>
> Patch 2 is to binutils ld, to fix the underlying host pollution issue:
> the -rpath argument was not sysroot aware, so setting
> "/usr/lib/../lib" as an RPATH would add the host /usr/lib to the link
> time search path instead of the sysroot directory.
>
> Note that the previous warning fix to insane.bbclass is still
> producing unmasked warnings in a few cases (the rpm utilities are one
> that I know), mostly in programs instead of libraries.  These will
> need to be audited independently.  It's possible that they are liking
> with -rpath directly and not using libtool, or that a needed
> normalization in libtool is still missing.  But with the current
> patches these warnings are benign now, they can't break the build.
>
> Andy
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged this patch set into OE-Core

Thanks
	Sau!



