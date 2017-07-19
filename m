Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 502AB78297
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 13:07:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 19 Jul 2017 06:07:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,381,1496127600"; d="scan'208";a="1197214395"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2017 06:07:32 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1499822461.git.kai.kang@windriver.com>
	<10b67207-e767-0458-c642-20ee38621bd3@windriver.com>
	<e25b7dde-3a9f-5964-8d63-c3cd60785072@linux.intel.com>
	<f136d49e-6409-fb63-0c07-a371392761f2@windriver.com>
	<33942952-1dcf-d334-5953-63020d14ef83@linux.intel.com>
	<CAMKF1spKp6=VpO=mtGSLph2UF84mnQMra=Roup6cHwZxr+Ct8w@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <1fdc5857-8f62-7ae7-52c1-bce71a23d37a@linux.intel.com>
Date: Wed, 19 Jul 2017 16:05:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spKp6=VpO=mtGSLph2UF84mnQMra=Roup6cHwZxr+Ct8w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] bind: 9.10..3-P3 -> 9.10.5-P3
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
X-List-Received-Date: Wed, 19 Jul 2017 13:07:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/19/2017 12:08 AM, Khem Raj wrote:
>> The policy in oe-core master is to update to latest stable upstream
>> releases, so please provide an update to 9.11.x. If you want to keep 9.10.x,
>> you can do that, but please provide a more specific reason.
> 
> if there are ABI incompatible changes then we have to scope the impact
> and plan the upgrade accordingly, if its backward compatible then yes its
> the norm.

What I'm saying is that it should not be a "9.10 now, 9.11 maybe later" 
when working with a master branch. The proper way is to "investigate and 
plan the upgrade to 9.11, update to 9.10 only if necessary, based on 
that investigation".


Alex

