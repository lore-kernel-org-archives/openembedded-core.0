Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 98DB3731C8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 07:49:54 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 03 Aug 2016 00:49:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,465,1464678000"; d="scan'208";a="743511077"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2016 00:49:54 -0700
Date: Wed, 3 Aug 2016 10:49:39 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160803074939.GB12566@mbabyjoh-desk.ger.corp.intel.com>
References: <1468332463-4154-1-git-send-email-maxin.john@intel.com>
	<1468332463-4154-6-git-send-email-maxin.john@intel.com>
	<CAJTo0LZfeU9zAdk2tEF9yxPY-4OZ_3LCH_U7e4ggHh1Q53G+jg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZfeU9zAdk2tEF9yxPY-4OZ_3LCH_U7e4ggHh1Q53G+jg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] tslib: replace pointercal with pointercal-xinput
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
X-List-Received-Date: Wed, 03 Aug 2016 07:49:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Tue, Aug 02, 2016 at 08:32:35PM +0100, Burton, Ross wrote:

>>On 12 July 2016 at 15:07, Maxin B. John <maxin.john@intel.com> wrote:
>>
>>   -RRECOMMENDS_${PN} = "pointercal"
>>        +RRECOMMENDS_${PN} = "pointercal-xinput"
>
>        Does this actually work though?

Haven't tested this because of the specific hardware requirement (touchscreen). Since we 
remove the pointercal recipe, I thought it is appropriate to replace it.

>        Ross
Best Regards,
Maxin

