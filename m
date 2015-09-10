Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CF01076E04
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 12:06:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 10 Sep 2015 05:06:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,504,1437462000"; d="scan'208";a="642171069"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 10 Sep 2015 05:06:52 -0700
Message-ID: <55F172C9.3030601@linux.intel.com>
Date: Thu, 10 Sep 2015 15:08:41 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1441753511.git.raj.khem@gmail.com>	<0b794c84466fef2ece1269e01820503b4bce0b52.1441753511.git.raj.khem@gmail.com>	<63981.10.252.58.194.1441792979.squirrel@linux.intel.com>	<64065.10.252.58.194.1441794205.squirrel@linux.intel.com>	<32176B14-814F-40D7-A452-86D835E38FCB@gmail.com>	<55F1679C.5090508@linux.intel.com>
	<55F16E82.1070708@gmail.com>
In-Reply-To: <55F16E82.1070708@gmail.com>
Subject: Policy for 'Pending' patches (was Re: [PATCH 02/16] slang: Fix namespace conflict vis-a-vis posix_close)
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
X-List-Received-Date: Thu, 10 Sep 2015 12:06:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2015 02:50 PM, Trevor Woerner wrote:

>> Then we can formulate a policy on top of that: for example, if a patch
>> has been 'Pending' for 3 months, the person who added it gets a
>> reminder to update the status; if the patch has been 'Pending' for 6
>> months and the patch person has been unresponsive, no more patches are
>> accepted from that person until he does the upstreaming of the ones he
>> already got into oe-core. Something like that.
>
> With so many maintainers on so many different layers/etc we would need
> some sort of billboard somewhere listing the names of people currently
> on the "naughty" list ;-)

Yes, something similar to http://recipes.yoctoproject.org

And the autobuilder could automatically reject or flag a patch that adds 
custom 'Pending' patches, if the patch author is determined to be on the 
'naughty' list :-)


Alex

