Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D76637659C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 13:02:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 31 Jul 2015 06:02:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,584,1432623600"; d="scan'208";a="774027335"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2015 06:02:50 -0700
Message-ID: <55BB723A.8060100@linux.intel.com>
Date: Fri, 31 Jul 2015 16:03:54 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>	<86b43671f02c22f328e3801e0711a33731156ba8.1438262915.git.alexander.kanavin@linux.intel.com>	<20150730143658.GK2457@jama>
	<55BA4399.2030302@linux.intel.com>	<CAJTo0LajDS9QaEdczNG9OnpkQWj_B148+TSwKwNCxXLyk9xnjA@mail.gmail.com>	<55BA524A.1070904@linux.intel.com>
	<55BB6CA7.2060908@siemens.com> <55BB6FC3.5060605@linux.intel.com>
In-Reply-To: <55BB6FC3.5060605@linux.intel.com>
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
X-List-Received-Date: Fri, 31 Jul 2015 13:03:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2015 03:53 PM, Alexander Kanavin wrote:

> The idea behind systemd-stable repository is described here:
> http://www.freedesktop.org/wiki/Software/systemd/Backports/
>
> However, it hasn't received any new commits since early May, and still
> stuck at v219, so should we update to a new version from the main
> repository? What's oe-core policy here?

Ah, the systemd-stable repo has also moved to 
https://github.com/systemd/systemd-stable

It has new commits, but still no tags and no versions newer than v219.

Alex


