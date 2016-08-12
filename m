Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9885976806
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 08:52:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2016 01:52:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,509,1464678000"; d="scan'208";a="1039906906"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 12 Aug 2016 01:52:52 -0700
Date: Fri, 12 Aug 2016 11:54:02 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160812085402.GA4205@mbabyjoh-desk.ger.corp.intel.com>
References: <1470923804-25804-1-git-send-email-maxin.john@intel.com>
	<1470923804-25804-3-git-send-email-maxin.john@intel.com>
	<CAJTo0LbHi3wemcUzxOjfphP63Nd3az5oqCWGK==EepMJ6Q56mA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbHi3wemcUzxOjfphP63Nd3az5oqCWGK==EepMJ6Q56mA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libpng: update 1.6.23 -> 1.6.24
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
X-List-Received-Date: Fri, 12 Aug 2016 08:52:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

>On Thu, Aug 11, 2016 at 05:20:35PM +0100, Burton, Ross wrote:
>>On 11 August 2016 at 14:56, Maxin B. John <maxin.john@intel.com> wrote:
>>
>> Updates in License files are due to changes in Copyright date
>> and Version.
>>
> Always remember to run buildhistory-diff:

Thanks, I will take care of it.

>>packages/corei7-64-poky-linux/libpng/libpng: PKG changed from libpng16-16 to libpng [default] - may indicate debian renaming failure
>> * PV changed from "1.6.23" to "1.6.24"
>The relevant line is that PN added /usr/bin/pngcp, so the package is no longer
>a library package.  This should be in PN-tools (which should use 
>FILES_PN-tools=${bindir} so this doesn't happen again).
>

Ok, will update and resend it.

> Ross

Best Regards,
Maxin

