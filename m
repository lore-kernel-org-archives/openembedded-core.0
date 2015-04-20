Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 182B46AC24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 08:20:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 20 Apr 2015 01:20:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,608,1422950400"; d="scan'208";a="697840149"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.5.75])
	by fmsmga001.fm.intel.com with ESMTP; 20 Apr 2015 01:20:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Date: Mon, 20 Apr 2015 09:20:13 +0100
Message-ID: <4914681.yToB8SoFRP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AAF0D2A540@ALA-MBA.corp.ad.wrs.com>
References: <cover.1428891074.git.jackie.huang@windriver.com>
	<3157820.pKsNW7iWxA@peggleto-mobl.ger.corp.intel.com>
	<1B858668EC6A94408DCA5225FDFA85AAF0D2A540@ALA-MBA.corp.ad.wrs.com>
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] linux-firmware: fix the mess of licenses
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
X-List-Received-Date: Mon, 20 Apr 2015 08:20:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 April 2015 07:33:34 Huang, Jie wrote:
> > -----Original Message-----
> > From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> > Sent: Friday, April 17, 2015 7:02 PM
> > To: Huang, Jie (Jackie)
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 0/2] linux-firmware: fix the mess of
> > licenses
> > 
> > Hi Jackie,
> > 
> > On Monday 13 April 2015 10:17:19 jackie.huang@windriver.com wrote:
> > > From: Jackie Huang <jackie.huang@windriver.com>
> > > 
> > > linux-firmware includes many firmwares and each firmware has their own
> > > license, previously the LICENSE is set to "Proprietary" and some
> > > firmware is split out to separate package such as
> > > linux-firmware-radeon and LICENSE_linux-firmware-radeon is set to
> > > "Firmware-radeon", but there is no license file in the common-licenses,
> > > so we got a lot warnings> 
> > like:
> > > WARNING: The license listed Firmware-radeon was not in the licenses
> > > collected for linux-firmware
> > > 
> > > These include adding the missing license files and re-orgnize the
> > > codes to fix the warnings and avoid the mess.
> > 
> > So doing this cleanup is good, thanks; but I was wondering if we needed an
> > alternative approach for linux-firmware. Most of the licenses in it
> > aren't in any way common, and new ones will be added from time to time,
> > requiring us to not only update the recipe (probably unavoidable) but
> > also add the licenses to the common license directory. Is there any way
> > we could make it so we at least only have to update the recipe and
> > dispense with the need to add a bunch of common license files that are
> > only applicable to linux-firmware?
> 
> Maybe we can keep those linux-firmware licenses in the recipe directory
> instead of COMMON_LICENSE_DIR and add LICENSE_PATH += "${COREBASE}/meta/
> recipes-kernel/linux-firmware/files"?

Could we go one step further and copy the license files from the fetched source 
rather than having to add them to the recipe?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

