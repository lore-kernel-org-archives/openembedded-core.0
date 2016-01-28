Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 72E1477026
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 13:43:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 28 Jan 2016 05:44:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,358,1449561600"; d="scan'208";a="642856816"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Jan 2016 05:44:01 -0800
To: "Maxin B. John" <maxin.john@intel.com>
References: <1453984641-1849-1-git-send-email-maxin.john@intel.com>
	<CAJTo0La7EzDZ5ocG+++=7gp0PqNNquVv6a4H66p3orL3+c+GLA@mail.gmail.com>
	<20160128131355.GB1902@mbabyjoh-mobl.fi.intel.com>
	<CAJTo0LYFHTzv3vF0fz3VQ2sLFgBVfqKw4HO15cUJanCt76REbw@mail.gmail.com>
	<56AA148C.2050104@linux.intel.com>
	<20160128133948.GA22967@mbabyjoh-mobl.fi.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56AA1A5D.8@linux.intel.com>
Date: Thu, 28 Jan 2016 15:40:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160128133948.GA22967@mbabyjoh-mobl.fi.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] libical: update to 2.0.0
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
X-List-Received-Date: Thu, 28 Jan 2016 13:44:00 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/28/2016 03:39 PM, Maxin B. John wrote:

> Good suggestion. Will do it for this update.
>
> Most of the times, it is hard to do a bitbake world for every upgrades.
> (regular build, x32, musl, uclibc and possibly one more architecture combinations)

Yes, of course. It's often a waste of time watching world builds, so 
it's a personal judgement call, but at least when there's a possibility 
of potential API breakage, that should be checked and the easiest way, 
if you have a bunch of updates and don't feel like disentangling their 
downstream dependencies, is to run 'world'.


Alex


