Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D26AB71DD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 14:42:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2017 06:42:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,284,1477983600"; d="scan'208";a="1087166627"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2017 06:42:57 -0800
Date: Wed, 25 Jan 2017 16:43:46 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170125144345.GA2549@mbabyjoh-desk.ger.corp.intel.com>
References: <1481550484-3360-1-git-send-email-maxin.john@intel.com>
	<20170123145537.GA6330@mbabyjoh-desk.ger.corp.intel.com>
	<1485187171.30673.25.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1485187171.30673.25.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstatesig: don't squash dependencies of useradd packages
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
X-List-Received-Date: Wed, 25 Jan 2017 14:42:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi RP,

On Mon, Jan 23, 2017 at 03:59:31PM +0000, Richard Purdie wrote:
> On Mon, 2017-01-23 at 16:55 +0200, Maxin B. John wrote:
> > Ping.
> 
> This never merged as I was never 100% convinced this was the correct
> way to solve this problem. I'd be interested to understand if the
> sstatesig tests in oe-selftest worked after this.
>
> I'm hoping this issue has also now been resolved in a different way
> though the switch to recipe specific sysroots. Would you be able test
> if recipe specific sysroots have addressed this issue?

Thanks for looking into this. Tested this (bug #8078) on the latest master
with recipe specific sysroots modification and found that the error still exists.  

> Cheers,
> Richard

Best Regards,
Maxin

