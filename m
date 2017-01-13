Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5D3CB71D9A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:18:26 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jan 2017 06:18:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,221,1477983600"; d="scan'208";a="48486653"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 13 Jan 2017 06:18:26 -0800
To: "Lock, Joshua G" <joshua.g.lock@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170105163423.8776-1-joshua.g.lock@intel.com>
	<35878aed-24bd-6129-54bb-f1dd68bf09a8@linux.intel.com>
	<1b59a012-5943-d763-975f-764a6247121b@linux.intel.com>
	<1484315514.3828.2.camel@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <7e7e15bd-9481-efa8-80af-60300016575e@linux.intel.com>
Date: Fri, 13 Jan 2017 16:18:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1484315514.3828.2.camel@intel.com>
Subject: Re: [PATCH] zlib: update SRC_URI to fix fetching
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
X-List-Received-Date: Fri, 13 Jan 2017 14:18:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/13/2017 03:51 PM, Lock, Joshua G wrote:

> Noted, thanks. Do we maintain a list of things we'd like people to
> check, and how to do it, when making updates to recipes?

I don't think there's such a list, perhaps we should make one and place 
it in patch guidelines wiki.

> checkpkg isn't available by default (had to add distrodata to INHERITS)
> and it took me a while to realise the results are written to a file I
> have to check. If we expect people to run these checks before
> submitting updates we'd best make it as easy as possible to know what
> the checks are and how to run them.

I think this particular check should be automated and run in package_qa, 
if it's okay to access the network in that step. Is it?

Alternatively, if checkuri is regularly run somewhere, then checkpkg 
should be as well.


Alex


