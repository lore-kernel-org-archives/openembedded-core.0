Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CDFB171ADD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 11:46:11 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 07 Jun 2017 04:46:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,311,1493708400"; d="scan'208";a="95540662"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 07 Jun 2017 04:46:11 -0700
To: Jan Kiszka <jan.kiszka@siemens.com>,
	openembedded-core@lists.openembedded.org
References: <15e918fb-c2e6-3005-6221-08601c804271@siemens.com>
	<a60f39a6-8355-82dc-20b2-5f7b3d6397b3@linux.intel.com>
	<af72aeb2-915e-0c63-60e9-18b6c7bce5ad@siemens.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <615663ca-d13f-9bca-6e3d-e5dc22cfaebf@linux.intel.com>
Date: Wed, 7 Jun 2017 14:43:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <af72aeb2-915e-0c63-60e9-18b6c7bce5ad@siemens.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: Fun with npm shrinkwrap
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
X-List-Received-Date: Wed, 07 Jun 2017 11:46:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2017 06:14 PM, Jan Kiszka wrote:

> Yeah, good points. Probably this problem is also related to OE
> reimplementing parts of the npm logic.
>
> But I suppose those concepts won't materialize very soon, will they? I'm
> also looking for a short-term solution, at least some reasonable tactic
> to generate such recipes in the meantime. Is there something in that
> thread I should dig into?

What I am getting at is that it would be awesome if you convince your 
management that npm support in Yocto is a problem that needs a better 
solution and work on it. Yes, this means you can't work on product 
development for quite some time; this is the price for using open source 
projects without a commercial support contract :)

My apologies if this is not the answer you were seeking.

Alex

