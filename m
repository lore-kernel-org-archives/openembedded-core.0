Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8FAD97198D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 22:03:37 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 16 Nov 2016 14:03:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,650,1473145200"; d="scan'208";a="32137874"
Received: from llgoh-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.159.102])
	by orsmga005.jf.intel.com with ESMTP; 16 Nov 2016 14:03:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2016 11:03:21 +1300
Message-ID: <5248602.HLsnDvu2hn@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.10-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <20161116215522.7692.73016@do.openembedded.org>
References: <1479331336-14097-1-git-send-email-jose.a.lamego@linux.intel.com>
	<20161116215522.7692.73016@do.openembedded.org>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHB5dGhvbi1naXQgYW5kIDMgbW9yZSB1cGdyYWRlcw==?=
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
X-List-Received-Date: Wed, 16 Nov 2016 22:03:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 16 Nov 2016 21:55:22 Patchwork wrote:
> == Series Details ==
> 
> Series: python-git and 3 more upgrades
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/3947/
> State : failure
> 
> == Summary ==
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series (series 3947, revision 1) by patchtest resulting in
> the following failures:
> 
> 
> * Patch            [1/4] python*-git: upgrade to 2.1.0
>   Issue            Shortlog does not follow expected format
> [test_shortlog_format] Suggested fix    Commit shortlog (first line of
> commit message) should follow the format "<target>: <summary>"

I guess our regex is being a bit strict here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

