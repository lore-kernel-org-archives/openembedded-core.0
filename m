Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 149C773204
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 12:52:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jan 2017 04:52:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,311,1477983600"; d="scan'208";a="37286146"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 30 Jan 2017 04:52:00 -0800
Date: Mon, 30 Jan 2017 14:52:58 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170130125258.GA2133@mbabyjoh-desk.ger.corp.intel.com>
References: <1485777358-32699-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LYc-pMThs+DwPqGFnLZdJcdTzj_do=+gBav+x_aOsrHEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYc-pMThs+DwPqGFnLZdJcdTzj_do=+gBav+x_aOsrHEw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libtasn1: Upgrade 4.9 -> 4.10
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
X-List-Received-Date: Mon, 30 Jan 2017 12:52:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

>On Mon, Jan 30, 2017 at 11:59:21AM +0000, Burton, Ross wrote:
>>On 30 January 2017 at 11:55, Maxin B. John <maxin.john@intel.com> wrote:
>>
>>+From b17dbb8d3c5605db3a1d82861fcaeef4636d1117 Mon Sep 17 00:00:00 2001
>>+From: "Maxin B. John" <maxin.john@intel.com>
>>+Date: Thu, 26 Jan 2017 18:54:48 +0200
>>+Subject: [PATCH] stdint.m4: reintroduce GNULIB_OVERRIDES_WINT_T check
>>+
>>+Partially revert the gnulib commit: 5a400b3f5a1f5483dbfd75d38bdb7080218a063b
>>+to fix the build error with musl library.
>>+
>>+Upstream-Status: Inappropriate
>
>This appears to be a genuine problem with gnulib and musl, have you spoken to upstream about this?

Yes, contacted the libtasn1 developers about this error last week and they have
asked me to report this to the gnulib developers. Based on that, I have sent a mail
to the gnulib mailing list.

>Ross

Best Regards,
Maxin

