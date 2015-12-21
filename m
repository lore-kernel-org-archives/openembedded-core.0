Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A29BC601D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 11:41:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 21 Dec 2015 03:41:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,459,1444719600"; d="scan'208";a="711994143"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 21 Dec 2015 03:41:28 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1450471022.git.bruce.ashfield@windriver.com>
	<0aa694bda5500aef7d326fa880c77b726c8c2779.1450471022.git.bruce.ashfield@windriver.com>
	<CAP9ODKqJyZq29L7=mFzCVo2=oAX3O8WtyiJ498inW5d2fJrBBQ@mail.gmail.com>
	<CADkTA4OLTmiDHTwHec+Pnyhs_p-kLZp=yD2k4GOpc-LB-7sEUA@mail.gmail.com>
	<CAP9ODKoENbVi-ALn-2PWdW9pv1BfGbyejBQrf7md3bH3FnJFCQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5677E4E3.6010607@linux.intel.com>
Date: Mon, 21 Dec 2015 13:39:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoENbVi-ALn-2PWdW9pv1BfGbyejBQrf7md3bH3FnJFCQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] lttng-modules: fix build issue against kernel 4.4
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
X-List-Received-Date: Mon, 21 Dec 2015 11:41:28 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/2015 01:27 PM, Otavio Salvador wrote:

> Commit logs are suppose to have the information useful to understand
> the reason of the change. Latest hides all behind it and does not
> communicate anything. I don't think expect people to read the code to
> know you bumped (and to which) revision is right.

Having the exact upstream commit id - a bunch of random numbers and 
letters - in the commit message does not make the commit message any 
more useful, readable, or searchable. You can't even click on that id to 
open a gitweb webpage with the upstream patch (having that kind of link 
*would* be useful though).

The change to the recipe is short, and no one should be overwhelmed by 
looking at it if they need the commit id.

Alex

