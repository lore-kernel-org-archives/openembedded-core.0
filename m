Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 463887702A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 19:39:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Sep 2015 12:39:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,455,1437462000"; d="scan'208";a="761067580"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.40])
	([10.219.5.40])
	by orsmga001.jf.intel.com with ESMTP; 02 Sep 2015 12:39:27 -0700
Message-ID: <55E750B8.70107@linux.intel.com>
Date: Wed, 02 Sep 2015 14:40:40 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>		
	<16f26bbb5fa39e399b185cd26fe9205c2e0cc5d4.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>	
	<1440746955.3006.73.camel@intel.com>
	<55E06356.8000607@linux.intel.com>
	<1440785288.3006.93.camel@intel.com>
In-Reply-To: <1440785288.3006.93.camel@intel.com>
Cc: "Stoppa, Igor" <igor.stoppa@intel.com>, matt.fleming@intel.com,
	leonardo.sandoval.gonzalez@intel.com, ricardo.neri@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 3/3] runqemu: Define OECORE_MACHINE_SYSROOT on setup_sysroot
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
X-List-Received-Date: Wed, 02 Sep 2015 19:39:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Patrick

these set of patches should be merged into master(next). I do not see 
any heavy objection doing it. As you mentioned, there are some points to 
improve but I think the latter can be done before 2.1 release.

Let me know if you have any objections, otherwise the merge is pending.

On 08/28/2015 01:08 PM, Patrick Ohly wrote:
> On Fri, 2015-08-28 at 08:34 -0500, Leonardo Sandoval wrote:
>> Hi Patrick,
>>
>> I do not have much time for a V4 set of patches, but now with all your
>> input I can rework V3 patches on 2.1.
>
> What do you mean with "rework on on 2.1"?
>
> I have some other runqemu changes pending locally (support booting
> hddimg), so runqemu internals are still kinda fresh in my mind. If you
> don't have time, then I can rework the patch series. However, it's a
> side project for me, too.
>

