Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 222FA71A06
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 12:11:38 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 05:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21197410"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 05:11:39 -0700
To: openembedded-core@lists.openembedded.org
References: <20161018215513.2873-1-marex@denx.de>
	<20161018215513.2873-4-marex@denx.de>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <78ae8d38-99d6-56d0-5e28-786bf2c13d43@linux.intel.com>
Date: Wed, 19 Oct 2016 15:09:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161018215513.2873-4-marex@denx.de>
Subject: Re: [PATCH 4/5] u-boot: Drop PV altogether
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
X-List-Received-Date: Wed, 19 Oct 2016 12:11:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/2016 12:55 AM, Marek Vasut wrote:
> Drop the explicit setting of PV altogether. This changes the U-Boot
> version string from "v20yy.mm" to "20yy.mm" , so layer setting the
> PREFERRED_VERSION_u-boot must be updated by removing the leading 'v'.

Don't drop the 'v'. Package versions need to monotonically increase, and 
also package version needs to match git tags so that upstream version 
check can work.

Basically, rename the recipe filenames so that 'v' is in their versions, 
and then you can drop the PV from the recipes. All in a single patch.

Alex


