Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 07ACC62134
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 15:57:09 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 29 Dec 2015 07:57:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,496,1444719600"; d="scan'208";a="20754798"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 29 Dec 2015 07:57:09 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
	<e51f04160f355bc12130d556a49f6f525ac12913.1450364672.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LaCS-MeOUOUiBPNbhuBry3b5fo-5eR-JtREigUyav_39g@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5682ACB5.4060005@linux.intel.com>
Date: Tue, 29 Dec 2015 17:54:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaCS-MeOUOUiBPNbhuBry3b5fo-5eR-JtREigUyav_39g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/17] nss: update to 3.21
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
X-List-Received-Date: Tue, 29 Dec 2015 15:57:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/2015 03:11 PM, Burton, Ross wrote:
>
> On 17 December 2015 at 15:08, Alexander Kanavin
> <alexander.kanavin@linux.intel.com
> <mailto:alexander.kanavin@linux.intel.com>> wrote:
>
>       meta/recipes-support/nss/{nss_3.19.2.bb <http://nss_3.19.2.bb> =>
>     nss_3.21.bb <http://nss_3.21.bb>} | 6 +++---
>
>
> Failed on the autobuilder in a number of interesting ways:

The first two failures are because unit tests are now enabled by default 
in the new release, upstream is using C++11 for them and didn't test 
well that they actually build in various environments:

https://bugzilla.mozilla.org/show_bug.cgi?id=1225377

The tests can be skipped by setting 'export NSS_DISABLE_GTESTS=1' in the 
recipe (both compile and install steps).

The third failure is probably a gcc 4.8 issue on opensuse 13.1. I can't 
reproduce it here. Would you be able to develop a fix? Or we can try 
again when upstream makes a new release.


Alex


