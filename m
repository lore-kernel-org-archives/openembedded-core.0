Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 769BE7544E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 15:13:45 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2018 08:13:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,415,1517904000"; d="scan'208";a="218171658"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga006.fm.intel.com with ESMTP; 06 Apr 2018 08:13:44 -0700
Date: Fri, 6 Apr 2018 18:14:09 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20180406151409.GA4329@mbabyjoh-desk.ger.corp.intel.com>
References: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
	<1522855946-8702-4-git-send-email-maxin.john@intel.com>
	<1523027136.2942.9.camel@rpsys.net>
MIME-Version: 1.0
In-Reply-To: <1523027136.2942.9.camel@rpsys.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/10] at-spi2-atk: upgrade to version 2.26.2
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
X-List-Received-Date: Fri, 06 Apr 2018 15:13:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi RP,

On Fri, Apr 06, 2018 at 04:05:36PM +0100, Richard Purdie wrote:
> On Wed, 2018-04-04 at 18:32 +0300, Maxin B. John wrote:
> > 1. convert to meson build
> > 2. inherit gnomebase and associated cleanup
> > 3. add libxml2 to DEPENDS list
> > 
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> 
> This and atk seem to fail in gir on x32:
> 
> https://autobuilder.yocto.io/builders/nightly-x32/builds/916/steps/BuildImages/logs/stdio
>
Will fix it and send the v2.

> Cheers,
> 
> Richard

Cheers,
Maxin

