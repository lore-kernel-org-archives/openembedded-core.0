Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SBJ63-0005yw-0r
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 06:00:59 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Mar 2012 21:51:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144530559"
Received: from dongxiao-osel.sh.intel.com (HELO [10.239.36.11])
	([10.239.36.11])
	by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2012 21:51:58 -0700
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1332557774.1849.34.camel@dongxiao-osel>
References: <1332557774.1849.34.camel@dongxiao-osel>
Date: Sat, 24 Mar 2012 12:49:48 +0800
Message-ID: <1332564588.1849.35.camel@dongxiao-osel>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: TMPDIR while building OE-Core
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
X-List-Received-Date: Sat, 24 Mar 2012 05:00:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Sorry for the annoying, I found it is a Hob specific issue.

Thanks,
Dongxiao

On Sat, 2012-03-24 at 10:56 +0800, Xu, Dongxiao wrote:
> Hi List,
> 
> While building the pure OE-Core, I found there are two TMPDIRs, one is
> tmp-eglibc, another is tmp-eglibc-eglibc, any reason that make this
> result? My local.conf is like:
> 
> BB_NUMBER_THREADS = "8"
> PARALLEL_MAKE = "-j 8"
> MACHINE ??= "qemuarm"
> PACKAGE_CLASSES ?= "package_rpm"
> EXTRA_IMAGE_FEATURES = "debug-tweaks"
> USER_CLASSES ?= "buildstats image-mklibs image-prelink"
> PATCHRESOLVE = "noop"
> CONF_VERSION = "1"
> 
> Thanks,
> Dongxiao
> 
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




