Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id EAF336AE37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 17:07:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 25 Jun 2013 10:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,938,1363158000"; d="scan'208";a="355578907"
Received: from unknown (HELO [10.255.13.89]) ([10.255.13.89])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jun 2013 10:07:59 -0700
Message-ID: <51C9CE42.8020207@linux.intel.com>
Date: Tue, 25 Jun 2013 10:07:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>,
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>, 
	Riku Voipio <riku.voipio@linaro.org>, 
	Schmitt Richard-B43082 <B43082@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>, 
	Zhenhua Luo <zhenhua.luo@freescale.com>, richard.schmitt@freescale.com
Subject: GCC 4.8 Issues with fsl-ppc and fsl-arm (e5000)
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
X-List-Received-Date: Tue, 25 Jun 2013 17:07:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Guys,

There is a continuing failure on the auto-builder with the 4.8 version 
of GCC for the fsl-ppc and fsl-arm BSPs.  This is currently holding 
oe-core back from updating GCC to 4.8, which we want to do soon so that 
we have get any other issues worked out that might come up.

These seem to be ICE issues can get bee seen in the following log files:

http://autobuilder.yoctoproject.org:8011/builders/nightly-fsl-arm/builds/148/steps/Building%20Images/logs/stdio

http://autobuilder.yoctoproject.org:8011/builders/nightly-fsl-ppc/builds/149/steps/Building%20Images/logs/stdio

Has anyone investigated these?

One possibility discussed during the tech call was to set the tune for 
these BSPs to use GCC 4.7, but this is not preferred as it just defers 
and hides the issue.

Thanks

-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System


