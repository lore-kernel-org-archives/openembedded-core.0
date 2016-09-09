Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9C4D36E5CB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 07:42:25 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 09 Sep 2016 00:42:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,304,1470726000"; d="scan'208";a="876754359"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga003.jf.intel.com with ESMTP; 09 Sep 2016 00:42:15 -0700
Date: Fri, 9 Sep 2016 10:42:14 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160909074213.GA5638@mbabyjoh-desk.ger.corp.intel.com>
References: <1473349614-5497-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LZOm52gsC7LgcJkdDA6Hsq3V3n29o4n8vqPvwW+DhjUDw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZOm52gsC7LgcJkdDA6Hsq3V3n29o4n8vqPvwW+DhjUDw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] gstreamer1.0-omx: provide RECIPE_NO_UPDATE_REASON
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
X-List-Received-Date: Fri, 09 Sep 2016 07:42:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

>On Thu, Sep 08, 2016 at 05:04:26PM +0100, Burton, Ross wrote:
>>On 8 September 2016 at 16:46, Maxin B. John <maxin.john@intel.com> wrote:
>>
>>   +RECIPE_NO_UPDATE_REASON = "Version 1.9.2 requires gstreamer-1.0 >= 1.9.2"
>
>Are they adopting the GStreamer versioning style, so we should inherit upstream-version-is-even instead?
>

The number of gstreamer-1.0-omx releases seems to be pretty small compared
to other components of the gstreamer project. Seems like they are moving to
the GStreamer versioning style recently. 

I will update this as per your suggestion.

>   Ross

Thanks,
Maxin

