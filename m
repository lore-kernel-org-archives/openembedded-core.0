Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 48A0578DC4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 12:07:43 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2018 05:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,427,1526367600"; d="scan'208";a="250457475"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga006.fm.intel.com with ESMTP; 31 Jul 2018 05:07:37 -0700
Date: Tue, 31 Jul 2018 15:08:58 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: richard.purdie@linuxfoundation.org
Message-ID: <20180731120857.GA27638@mbabyjoh-desk.ger.corp.intel.com>
References: <1533034411-26881-1-git-send-email-maxin.john@intel.com>
	<1533034411-26881-2-git-send-email-maxin.john@intel.com>
	<CAJTo0LZ7OLpo=Sm_Kobr5D730O1wTSmyQsqN=_CSrxCcqkunSQ@mail.gmail.com>
	<02c7f3287776cfa47e68579454e5abb42d8c0e9d.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <02c7f3287776cfa47e68579454e5abb42d8c0e9d.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] vulkan-demos: upgrade to latest commit
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
X-List-Received-Date: Tue, 31 Jul 2018 12:07:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi RP,

On Tue, Jul 31, 2018 at 01:01:31PM +0100, richard.purdie@linuxfoundation.org wrote:
> On Tue, 2018-07-31 at 12:17 +0100, Burton, Ross wrote:
> > On 31 July 2018 at 11:53, Maxin B. John <maxin.john@intel.com> wrote:
> > > Update subcomponents gli and glm based on the new structure of
> > > repository.
> > 
> > If they're submodules then the gitsm: fetcher should get those for
> > you.
> 
> The gitsm fetcher is broken from an archive/mirroring persective iirc
> though. Using it in OE-Core by default is therefore potentially
> problematic :(.

Thanks for looking into this. Saw similar comments for this change (old one):
https://patchwork.openembedded.org/patch/85413/

> Cheers,
> 
> Richard

Best Regards,
Maxin

