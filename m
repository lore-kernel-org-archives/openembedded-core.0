Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4B16FEF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 09:32:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 17 Aug 2016 02:32:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,529,1464678000"; d="scan'208";a="1037020589"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2016 02:32:26 -0700
Date: Wed, 17 Aug 2016 12:33:47 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160817093346.GA2701@mbabyjoh-desk.ger.corp.intel.com>
References: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
	<1470821429-6094-8-git-send-email-maxin.john@intel.com>
	<CAJTo0LbM=t159Ak4tmoKcXN22WeQCXCdRgjaR9y4qfd9bDFSRQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbM=t159Ak4tmoKcXN22WeQCXCdRgjaR9y4qfd9bDFSRQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/10] tslib: remove recipe
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
X-List-Received-Date: Wed, 17 Aug 2016 09:32:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Tue, Aug 16, 2016 at 10:39:55PM +0100, Burton, Ross wrote:
>Hi Maxin,
>
>This breaks meta-qt4 which currently just depends on oe-core.
>
Haven't noticed this before. Thanks for sharing this info. 

>Can you see if we can make qt4-embedded have a configurable dependency
>on tslib which is disabled by default?

Sure, will fix it.

>Ross
>>
>>
>> On 10 August 2016 at 10:30, Maxin B. John <maxin.john@intel.com> wrote:
>> Modern systems generally use the kernel driver or libinput instead
>> of tslib. Move tslib from oe-core along with xtscal.

Best Regards,
Maxin

