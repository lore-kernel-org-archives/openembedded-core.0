Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D54ED77D53
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 11:51:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 16 May 2017 04:51:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="87415137"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2017 04:51:23 -0700
To: openembedded-core@lists.openembedded.org,
	"Ohly, Patrick" <patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
	<79e18217-d4ed-8356-9532-7da63a420d6f@topic.nl>
	<1494922912.1179.306.camel@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <aaeaad51-6bd1-10c4-ce22-4381c07bd9a8@linux.intel.com>
Date: Tue, 16 May 2017 14:49:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494922912.1179.306.camel@intel.com>
Subject: Re: [RFC][PATCH 0/6] development vs. production builds
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
X-List-Received-Date: Tue, 16 May 2017 11:51:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2017 11:21 AM, Patrick Ohly wrote:

>> While the "development/production" switch may be great for some projects,
>> it'll make things only more complicated for others while gaining nothing above
>> what we have now.
>
> What about the approach I outlined in my reponse to Richard, where we
> just introduce the IMAGE_MODE mechanism in OE-core without defining
> specific modes? Would you find that useful?

Please no. Global variables are a headache, and the less we have of them 
the better.

Here in particularly, what is wrong with defining:

patricks-awesome-image-developers.bb
(containing IMAGE_FEATURE = "no-password-for-anything")

patricks-awesome-image-production.bb
(containing IMAGE_FEATURE = "serious-security")

and the common bits can go to patricks-awesome-image.inc.

It's simple, direct and self-explanatory. At the end of the day, you 
*always* need to drill down to the code that does the work, and learn 
the details, to truly understand what is happening behind a 
configuration setting, and adding abstraction layers and scattering 
functionality over many different files does not help - quite the opposite.

Alex


