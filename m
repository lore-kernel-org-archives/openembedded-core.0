Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4F5B971B2F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 09:07:46 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 01 Feb 2017 01:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,319,1477983600"; d="scan'208";a="220016758"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga004.fm.intel.com with ESMTP; 01 Feb 2017 01:07:43 -0800
Date: Wed, 1 Feb 2017 11:08:45 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170201090845.GA24621@mbabyjoh-desk.ger.corp.intel.com>
References: <1485777358-32699-1-git-send-email-maxin.john@intel.com>
	<b054aebd-10df-6cb5-841d-b06df81e9fb6@gmail.com>
	<20170131150524.GA11350@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0LYkeZOZ0A4ZfY1tNmmc+gXR7MvhpSNtXcr5fTAuFZ4_mQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYkeZOZ0A4ZfY1tNmmc+gXR7MvhpSNtXcr5fTAuFZ4_mQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 01 Feb 2017 09:07:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

>On Tue, Jan 31, 2017 at 08:02:41PM +0000, Burton, Ross wrote:
>>
>>On 31 January 2017 at 15:05, Maxin B. John <maxin.john@intel.com> wrote:
>>
>>    Somehow we have an old wint_t.m4 provided by gettext-0.18.2 in the  aclocal search path.
>>        Looking into that now.
>
> I've a branch (ross/autoargh) that changes how we autoreconf and might solve this, but
> it would depend on packages correctly versioning the macros so aclocal knows what one
> of the many copies it finds is newest.

Tested the libtasn1-4.10 musl build on "ross/autoargh" branch and it still fails to build.

>Ross

Best Regards,
Maxin

