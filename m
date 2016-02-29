Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB396FF73
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 15:32:43 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 29 Feb 2016 07:12:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; d="scan'208";a="56848632"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.11.10])
	by fmsmga004.fm.intel.com with ESMTP; 29 Feb 2016 07:12:19 -0800
Message-ID: <1456758735.3164.16.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Robert Yang
	<liezhi.yang@windriver.com>
Date: Mon, 29 Feb 2016 15:12:15 +0000
In-Reply-To: <7548678.UPkFnu4iOC@peggleto-mobl.ger.corp.intel.com>
References: <cover.1447412835.git.hongxu.jia@windriver.com>
	<CAHiDW_HddeP2fLOCBWSG7=cfS0Zuaoh0gnW3nBpLTtjH62huRA@mail.gmail.com>
	<5645D501.6020802@windriver.com>
	<7548678.UPkFnu4iOC@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] wpa-supplicant: Fix CVE-2015-8041
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
X-List-Received-Date: Mon, 29 Feb 2016 15:32:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-02-22 at 17:15 +1300, Paul Eggleton wrote:
> Hi Robert,
> 
> I just noticed this never got merged into jethro. Could you take care
> of that? 
> The original patch is here:
> 
> http://patchwork.openembedded.org/patch/107625/
> 
> Joshua, looks like we could use this one in fido as well.

I was hoping to backport this from Jethro but I haven't seen it land
there yet, I've queued it for fido so I don't forget.

Robert, I have a branch for jethro with this patch included — should I
submit it?

Regards,

Joshua

