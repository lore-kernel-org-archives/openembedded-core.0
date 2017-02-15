Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 684707724C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:18:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 01:18:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="1107656034"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2017 01:18:59 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
	<e1b1c67d691fd317bf6c11d570ef5d261029f38b.1486997986.git.alexander.kanavin@linux.intel.com>
	<20170215081731.lf5vtdcbong4xsyq@ad.chargestorm.se>
	<fd9dca04-e3ef-077f-e67d-3b3bedbe7dc4@linux.intel.com>
	<20170215091025.4s2wzpagchlssqgh@ad.chargestorm.se>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b821a606-dfe2-903d-d603-378d68727a14@linux.intel.com>
Date: Wed, 15 Feb 2017 11:19:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170215091025.4s2wzpagchlssqgh@ad.chargestorm.se>
Subject: Re: [PATCH 22/36] package.bbclass: add support for pkg_postinst_ontarget()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Feb 2017 09:19:00 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/15/2017 11:10 AM, Anders Darander wrote:
> Well, if the qemu emulation isn't working for a particular target, but
> might work for another target, the post_install script can't be moved to
> pkg_postinst_ontarget_${PN} anyway, it'll break ro-rootfs for the 2nd
> machine as well..

You still seem to misunderstand the purpose of _ontarget. It's meant 
only for situations where the script *has* to run on target, and not 
anything else. In particular, if qemu can be used, it should be; if it 
fails, the script is deferred to first boot.

>> because the post_install has to interact with target hardware.
>
> Sure, but this is really the minority of cases. In this case
> pkg_postinst_ontarget_${PN} might be OK, but I'm worried the it'll be
> used a lot more often, because it's simpler to deal with...

This will be discouraged (same way as 'exit 1 trick' is discouraged now 
if there's no clear reason for it); we do have patch reviews :)

Alex

