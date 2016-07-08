Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA9460119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 14:19:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 08 Jul 2016 07:19:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,330,1464678000"; d="scan'208";a="1018048299"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jul 2016 07:19:01 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1467914773.git.raj.khem@gmail.com>
	<cee6d405-3fdf-157b-967b-91022d5e9b9c@linux.intel.com>
	<CAMKF1sp+XRQ5bUd-8387q5PcWuQRspRj+UJS9LkuGGhr1WPw6w@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <aa5165d3-c97f-3a37-73b3-31cd5cc704e9@linux.intel.com>
Date: Fri, 8 Jul 2016 17:19:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp+XRQ5bUd-8387q5PcWuQRspRj+UJS9LkuGGhr1WPw6w@mail.gmail.com>
Cc: adraszik@tycoint.com
Subject: Re: [PATCH 0/4] musl/glibc/binutils updates
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
X-List-Received-Date: Fri, 08 Jul 2016 14:19:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/08/2016 05:07 PM, Khem Raj wrote:
>>> Fix gcc5 hang in SDK with -mmusl
>>> Update musl to 1.1.15 release
>>> Update binutils to 2.26.1
>>> Update glibc to latest on 2.24 freeze tree
>>
>>
>> What about uclibc? It should be updated as well.
>
> I do not test it regularly. If there are users who want it we can continue

Maybe we should reassign the recipes to André Draszik then?

Alex

