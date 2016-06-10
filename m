Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EA1E160107
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 08:52:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Jun 2016 01:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,449,1459839600"; d="scan'208";a="994900690"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 10 Jun 2016 01:52:09 -0700
Date: Fri, 10 Jun 2016 06:59:16 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Andrew Bradford <andrew@bradfordembedded.com>
Message-ID: <20160610035916.GC26373@mbabyjoh-desk.ger.corp.intel.com>
References: <1465390138-26600-1-git-send-email-maxin.john@intel.com>
	<20160609142235.GA31457@kaim-eeyore.kodakalaris.net>
MIME-Version: 1.0
In-Reply-To: <20160609142235.GA31457@kaim-eeyore.kodakalaris.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libjpeg-turbo: update to 1.5.0
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
X-List-Received-Date: Fri, 10 Jun 2016 08:52:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Jun 09, 2016 at 10:22:35AM -0400, Andrew Bradford wrote:
> On 06/08 15:48, Maxin B. John wrote:
> > 1. LIC_FILES_CHKSUM updates only involves changes in Copyright holders.
> >    LICENSE remains the same.
> > 
> > 2. libjpeg-turbo don't have non-floating point ABI support in MIPS.
> >    Provide a work around for that.
> > 
> > [YOCTO #9606]
> > 
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> 
> Tested-by: Andrew Bradford <andrew.bradford@kodakalaris.com>
> 
> Tested on ARM Cortex-A8 (so not the MIPS changes).
> Thanks!

Thanks for verifying it on ARM.

Best Regards,
Maxin

