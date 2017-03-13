Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B78837770F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 15:08:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 13 Mar 2017 08:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,159,1486454400"; d="scan'208";a="1141558171"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2017 08:08:37 -0700
To: openembedded-core@lists.openembedded.org,
	"Lehtonen, Markus" <markus.lehtonen@intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<1f37f25a651a235703fc7b51d799ee2d329ac94b.1489144807.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LYj=MbWW-VdQk5y7PmOy4wuwYspfLvXZai=-t3nAzc5vQ@mail.gmail.com>
	<f71769b7-4dc4-bb4f-80a0-5c367e1d6153@linux.intel.com>
	<687b8d27-e0ee-46da-889c-cc5728296418@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8d62f90e-16ed-bb4c-a79b-28f06a097629@linux.intel.com>
Date: Mon, 13 Mar 2017 17:07:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <687b8d27-e0ee-46da-889c-cc5728296418@linux.intel.com>
Subject: Re: [PATCH 21/44] rootfs_rpm.bbclass: migrate image creation to dnf
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
X-List-Received-Date: Mon, 13 Mar 2017 15:08:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2017 05:04 PM, Alexander Kanavin wrote:
>
> Forgot to add - I'll try to fix both of these this week, with
> corresponding tests of course.

Oh, and: Markus Lehtonen is looking into package feed signing, which is 
a separate thing from rpm signing. Also Fedora does not sign their 
feeds, and so the feature has apparently bitrotted somewhat and will be 
more difficult to get working.

Alex


