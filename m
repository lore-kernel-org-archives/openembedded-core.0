Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 32D9177B96
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 10:32:52 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 04 May 2017 03:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,287,1491289200"; d="scan'208";a="97522781"
Received: from othmanm-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.26])
	by fmsmga006.fm.intel.com with ESMTP; 04 May 2017 03:32:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Thu, 04 May 2017 22:32:48 +1200
Message-ID: <20190569.6ACTWn4GRz@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <6447df1b-8742-7451-1978-68527f141437@linux.intel.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
	<2764166.Tu3B0AapLd@peggleto-mobl.ger.corp.intel.com>
	<6447df1b-8742-7451-1978-68527f141437@linux.intel.com>
MIME-Version: 1.0
Cc: Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJsaWJlcmF0aW9uLWZvbnRzOiB1cGRhdGUgdG8gMi4uLi4iIGFuZCA0IG1vcmU=?=
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
X-List-Received-Date: Thu, 04 May 2017 10:32:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 4 May 2017 10:16:36 PM NZST Alexander Kanavin wrote:
> On 05/04/2017 01:07 PM, Paul Eggleton wrote:
> > The original idea was that the tests could also be run from your local 
machine
> > (could easily be as a git hook), and whilst it's not as easy as I might 
have
> > liked it is doable - however even if it were much easier, we have to be
> > realistic and acknowledge that most people still won't do it.
> 
> I thought default git hooks can be enforced by the remote repo when you 
> do a clone, no?

On the client side, no, you can't set up hooks as part of a clone - I assume 
this is for security reasons if nothing else. You could add a hook on the 
server side, but that carries its own penalty - it means that the hook needs 
to run synchronous with the operation (e.g. push). Whilst the patchtest tests 
aren't supposed to take too long, it's not hard to imagine they could take a 
minute or two, and that is going to be somewhat infuriating especially with 
the amount of WIP stuff that people (quite legitimately) push to the contrib 
repos which shouldn't be evaluated at all. Besides, not everyone uses the 
contrib repos.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

