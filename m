Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 90B9C7841B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 11:47:21 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jul 2017 04:47:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,389,1496127600"; d="scan'208";a="110440285"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 21 Jul 2017 04:47:21 -0700
To: Kang Kai <Kai.Kang@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1499822461.git.kai.kang@windriver.com>
	<10b67207-e767-0458-c642-20ee38621bd3@windriver.com>
	<e25b7dde-3a9f-5964-8d63-c3cd60785072@linux.intel.com>
	<f136d49e-6409-fb63-0c07-a371392761f2@windriver.com>
	<33942952-1dcf-d334-5953-63020d14ef83@linux.intel.com>
	<CAMKF1spKp6=VpO=mtGSLph2UF84mnQMra=Roup6cHwZxr+Ct8w@mail.gmail.com>
	<1fdc5857-8f62-7ae7-52c1-bce71a23d37a@linux.intel.com>
	<b68e4ea9-6d93-f9c5-7e2a-ca0664894c6e@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0a89d9fe-3156-9643-fa11-d5df868da586@linux.intel.com>
Date: Fri, 21 Jul 2017 14:45:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <b68e4ea9-6d93-f9c5-7e2a-ca0664894c6e@windriver.com>
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
X-List-Received-Date: Fri, 21 Jul 2017 11:47:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/21/2017 09:37 AM, Kang Kai wrote:

> It doesn't  mention that api changes in 9.11 from release notes pages of 
> 9.11.0rc1 and 9.11.0.
> 
> https://kb.isc.org/article/AA-01409
> https://kb.isc.org/article/AA-01432/81/BIND-9.11.0-Release-Notes.html
> 
> 
> But it suggests not to use 9.11 until the second maintenance 
> release(9.11.2 if I understand correctly) for production systems:
> 
> | We recommend that administrators run one of our older, stable 
> branches, such as a 9.9 or 9.10-based release on larger-scale critical 
> production systems, while testing the new 9.11 branch until the second 
> maintenance release.
> 
> https://www.isc.org/downloads/bind/bind-9-11-new-features/

Fair enough, let's stick with 9.10 for now then.

Alex

