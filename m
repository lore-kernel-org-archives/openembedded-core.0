Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 90B0576551
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 12:52:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 Jul 2015 05:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,584,1432623600"; d="scan'208";a="774022285"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2015 05:52:20 -0700
Message-ID: <55BB6FC3.5060605@linux.intel.com>
Date: Fri, 31 Jul 2015 15:53:23 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Pascal Bach <pascal.bach@siemens.com>, 
	"Burton, Ross" <ross.burton@intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<86b43671f02c22f328e3801e0711a33731156ba8.1438262915.git.alexander.kanavin@linux.intel.com>
	<20150730143658.GK2457@jama> <55BA4399.2030302@linux.intel.com>
	<CAJTo0LajDS9QaEdczNG9OnpkQWj_B148+TSwKwNCxXLyk9xnjA@mail.gmail.com>
	<55BA524A.1070904@linux.intel.com> <55BB6CA7.2060908@siemens.com>
In-Reply-To: <55BB6CA7.2060908@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 21/26] systemd: remove PV from the recipe
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
X-List-Received-Date: Fri, 31 Jul 2015 12:52:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2015 03:40 PM, Pascal Bach wrote:

>> I just noticed that specifically systemd-stable repository does not have release tags for new versions at all, and just adds branches for newer versions:
>>
>> http://cgit.freedesktop.org/systemd/systemd-stable/
>>
> New tags for systemd are created but not on the repository above but on their git repository:
> https://github.com/systemd/systemd
>
> I think this is the now main repository.

The idea behind systemd-stable repository is described here:
http://www.freedesktop.org/wiki/Software/systemd/Backports/

However, it hasn't received any new commits since early May, and still 
stuck at v219, so should we update to a new version from the main 
repository? What's oe-core policy here?


Alex



