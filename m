Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C17B0601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 12:38:45 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP; 26 Sep 2016 05:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,399,1470726000"; d="scan'208";a="13262714"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by fmsmga006.fm.intel.com with ESMTP; 26 Sep 2016 05:38:45 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1474619763.git.patrick.ohly@intel.com>
	<d96c9d2d55f4f6dcc78a51fadfb847711e89a09a.1474619763.git.patrick.ohly@intel.com>
	<67fabe6e-fb01-7462-2e5e-8424d5d24571@linux.intel.com>
	<86436db9-fb61-2d83-19a3-6396ee8a8de4@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2d0c4e98-4179-a1e5-9fa4-8b09fab04d92@linux.intel.com>
Date: Mon, 26 Sep 2016 15:36:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <86436db9-fb61-2d83-19a3-6396ee8a8de4@gmail.com>
Subject: Re: [PATCH 1/1] openssl: update to 1.0.2i (CVE-2016-6304 and more)
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
X-List-Received-Date: Mon, 26 Sep 2016 12:38:47 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/23/2016 07:25 PM, akuster808 wrote:

> No this demonstrates that folks do want to help out. They to the best
> they can with their abilities and situation. The community has made a
> lot of noise about how important it is to address security issues.
> Except a few of us who do send patches, the community as a whole does
> not stepped up to the table to help out.
>
> Opensource is not an all or nothing proposition. I for one appreciate
> contributions folks make in this area.

If folks want to help out, they'd better spend their time building 
automated CI infrastructure that allows us to upgrade openssl to 1.0.2j 
in stable releases without the paralyzing fear of breaking things. I 
appreciate the intent to help, but I don't see the actual contribution 
(of randomly backporting CVEs) as particularly useful in the long run.


Alex

