Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 62B927422C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 11:19:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 10 Sep 2015 04:19:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,504,1437462000"; d="scan'208";a="558969964"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Sep 2015 04:19:10 -0700
Message-ID: <55F1679C.5090508@linux.intel.com>
Date: Thu, 10 Sep 2015 14:21:00 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<0b794c84466fef2ece1269e01820503b4bce0b52.1441753511.git.raj.khem@gmail.com>
	<63981.10.252.58.194.1441792979.squirrel@linux.intel.com>
	<64065.10.252.58.194.1441794205.squirrel@linux.intel.com>
	<32176B14-814F-40D7-A452-86D835E38FCB@gmail.com>
In-Reply-To: <32176B14-814F-40D7-A452-86D835E38FCB@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/16] slang: Fix namespace conflict vis-a-vis posix_close
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
X-List-Received-Date: Thu, 10 Sep 2015 11:19:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2015 07:02 PM, Khem Raj wrote:

> So I encourage you to formulate a policy and make a proposal to community and get everyone on board in changing
> the policy OE wide.


Actually, first we need some kind of tool that keeps track of custom 
patches and their upstream-statuses and minimizes the amount of manual 
work.

Then we can formulate a policy on top of that: for example, if a patch 
has been 'Pending' for 3 months, the person who added it gets a reminder 
to update the status; if the patch has been 'Pending' for 6 months and 
the patch person has been unresponsive, no more patches are accepted 
from that person until he does the upstreaming of the ones he already 
got into oe-core. Something like that.

Regards,
Alex


