Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 73C2571A92
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 12:54:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Oct 2017 05:54:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,366,1503385200"; d="scan'208";a="1181256140"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 12 Oct 2017 05:54:30 -0700
To: Khem Raj <raj.khem@gmail.com>, Denys Dmytriyenko <denis@denix.org>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
	<cf33ac88e28b8e91f25d750de9a1385808d5e1f7.1507735448.git.alexander.kanavin@linux.intel.com>
	<20171012010909.GH9221@denix.org>
	<CAMKF1sod4hD68FsK8VqGRk7LGhzb55EEbRjijcePvaP2oXkxVg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <230d0b85-2cbc-fbb1-c4af-ae8b5f378365@linux.intel.com>
Date: Thu, 12 Oct 2017 15:50:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sod4hD68FsK8VqGRk7LGhzb55EEbRjijcePvaP2oXkxVg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/50] oprofile: remove the recipe
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
X-List-Received-Date: Thu, 12 Oct 2017 12:54:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/12/2017 04:20 AM, Khem Raj wrote:
> On Wed, Oct 11, 2017 at 6:09 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> On Wed, Oct 11, 2017 at 06:33:53PM +0300, Alexander Kanavin wrote:
>>> Perf is the preferred solution, and oprofile is difficult to
>>> maintain against musl.
>>
>> Can we consider moving it to meta-openembedded and maybe relaxing
>> requirements, such as musl compatibility?
> 
> I think, if someone maintains it there, it should be fine. Since perf
> offers same
> functionality and supports more machines and maintained better. We
> probably can maintain it in OE-Core.

Yep. Denys, can you prepare a patch and send it to oe-devel list then 
please?


Alex

