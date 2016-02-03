Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6A277328
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 10:22:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 03 Feb 2016 02:22:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,389,1449561600"; d="scan'208";a="904589641"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 03 Feb 2016 02:22:53 -0800
Date: Wed, 3 Feb 2016 12:25:26 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160203102525.GA18072@mbabyjoh-mobl.fi.intel.com>
References: <1454411051-15095-1-git-send-email-maxin.john@intel.com>
	<1454411051-15095-3-git-send-email-maxin.john@intel.com>
	<20160202115926.GA2607@jama>
	<CAJTo0LZ9-EmDCP1Mx9i-BmanmPVAkFCM-v4KenCiDQUp8YVfLQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ9-EmDCP1Mx9i-BmanmPVAkFCM-v4KenCiDQUp8YVfLQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] formfactor: add machconfig for qemumips64 and beaglebone
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
X-List-Received-Date: Wed, 03 Feb 2016 10:22:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

>On Tue, Feb 02, 2016 at 12:07:06PM +0000, Burton, Ross wrote:
>>On 2 February 2016 at 11:59, Martin Jansa <martin.jansa@gmail.com> wrote:

On Tue, Feb 02, 2016 at 01:04:11PM +0200, Maxin B. John wrote:
>>> We need machconfig file to automatically choose between physical and virtual
>>> keyboards.
>
>> beaglebone has its own BSP layer, why it should be added in oe-core?
>
> This would be for the purely open beaglebone BSP in meta-yocto-bsp. 
> We've always had some sort of real ARM BSP in meta-yocto-bsp for QA purposes.
> I'm not sure whether we want to say the beaglebone has a keyboard and mouse by default or not though.
>

After discussing about this, it is "safe" to assume that generally we attach a USB 
keyboard and mouse to the beaglebone board. Also it is not ok to set the resolution
related values for Beaglebone.

I will send a v2.

>Ross

Best Regards,
Maxin

