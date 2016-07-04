Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD116011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 12:14:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 04 Jul 2016 05:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,574,1459839600"; d="scan'208";a="1000505270"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2016 05:14:00 -0700
To: Joshua G Lock <joshua.g.lock@linux.intel.com>,
	openembedded-core@lists.openembedded.org, peter.seebach@windriver.com
References: <1467401433-2237-1-git-send-email-joshua.g.lock@intel.com>
	<1467401433-2237-2-git-send-email-joshua.g.lock@intel.com>
	<d1e04a54-0d95-3add-7f29-5bacff43451f@linux.intel.com>
	<1467634234.2767.3.camel@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e654a54b-fc4b-f8d4-4bdf-d1f4fc3974fd@linux.intel.com>
Date: Mon, 4 Jul 2016 15:14:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1467634234.2767.3.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] pseudo: upgrade to 1.8.0
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
X-List-Received-Date: Mon, 04 Jul 2016 12:14:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2016 03:10 PM, Joshua G Lock wrote:

> Thanks for catching this, I failed badly at merging some local changes.
>
> I will send a v2 with the correct SRCREV. I'll also see whether I can
> convince someone to tag the repo.

Please first make a tag, and then send a recipe update. I'd like to 
minimize the amount of recipes which take things from git using an 
arbitrary commit id that is not linked to an upstream release.

Alex


