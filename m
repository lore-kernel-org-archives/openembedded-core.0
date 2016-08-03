Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B947273232
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 07:53:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2016 00:53:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,465,1464678000"; d="scan'208";a="1034167679"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2016 00:53:00 -0700
Date: Wed, 3 Aug 2016 10:52:46 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160803075245.GC12566@mbabyjoh-desk.ger.corp.intel.com>
References: <1468332463-4154-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LbH=c0uXTKMomU=4OE+jJKA42FbnsW9pnDsHE3afQW0Hg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbH=c0uXTKMomU=4OE+jJKA42FbnsW9pnDsHE3afQW0Hg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] replace xtscal with xinput-calibrator
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
X-List-Received-Date: Wed, 03 Aug 2016 07:53:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

>On Tue, Aug 02, 2016 at 09:10:27PM +0100, Burton, Ross wrote:
>
>On 12 July 2016 at 15:07, Maxin B. John <maxin.john@intel.com> wrote:
>
>>    Remove xtscal in preference of xinput-calibrator
>
>
> Comparing two images build before and after this:
>
> changes to images/intel_corei7_64/glibc/core-image-sato-base (installed-package-names.txt):
> pointercal was removed
> libxcalibrate0 was removed
> xtscal was removed
> xinput-calibrator was added
> bash was added
> xinput was added
> pointercal-xinput was added
>
> We can't start requiring bash, so can you figure out what is pulling in bash and rewrite it to be busybox-safe?

Sure, will do. Thanks!

>  Ross
Best Regards,
Maxin

