Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AED546DDFD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 12:24:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 03 Dec 2013 04:24:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,817,1378882800"; d="scan'208";a="437703200"
Received: from timevans-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.200])
	by fmsmga001.fm.intel.com with ESMTP; 03 Dec 2013 04:24:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: ulf@emagii.com
Date: Tue, 03 Dec 2013 12:24:08 +0000
Message-ID: <1546307.bObJ7pByZf@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1386009374-29047-1-git-send-email-ulf@emagii.com>
References: <1386009374-29047-1-git-send-email-ulf@emagii.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] curlpp: add curl c++ bindings
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
X-List-Received-Date: Tue, 03 Dec 2013 12:24:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ulf,

On Monday 02 December 2013 19:36:14 ulf@emagii.com wrote:
> From: Ulf Samuelsson <ulf@emagii.com>
> 
> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
> ---
>  .../curlpp/curlpp/pkgconfig_fix.patch              |   38 +++++++++
>  meta/recipes-support/curlpp/curlpp_0.7.3.bb        |   89
> ++++++++++++++++++++ 2 files changed, 127 insertions(+)
>  create mode 100644 meta/recipes-support/curlpp/curlpp/pkgconfig_fix.patch
>  create mode 100644 meta/recipes-support/curlpp/curlpp_0.7.3.bb

You sent v1 of this to openembedded-devel so I had assumed it was for meta-oe. 
To be honest I don't think this belongs in OE-Core, unless we actually need it 
for something else that is in OE-Core (or something that needs to be added to 
OE-Core).

Also, you didn't fix DESCRIPTION -> SUMMARY or drop PR in this version.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

