Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3C377763E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 15:32:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 30 Jul 2015 08:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="533113848"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2015 08:31:39 -0700
Message-ID: <55BA4399.2030302@linux.intel.com>
Date: Thu, 30 Jul 2015 18:32:41 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<86b43671f02c22f328e3801e0711a33731156ba8.1438262915.git.alexander.kanavin@linux.intel.com>
	<20150730143658.GK2457@jama>
In-Reply-To: <20150730143658.GK2457@jama>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 30 Jul 2015 15:32:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2015 05:36 PM, Martin Jansa wrote:
> On Thu, Jul 30, 2015 at 04:31:50PM +0300, Alexander Kanavin wrote:
>> It is unnecessary because the recipe filename already contains it.
>
> No, it contains only 219
>> -PV = "219-stable+git${SRCPV}"

The idea here is that we only need the basic version, if the revision 
being fetched matches that version, and there is no need for all that 
git revision clutter in the version string.

Alex


