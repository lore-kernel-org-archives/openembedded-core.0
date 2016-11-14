Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E52696FFCC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 13:03:06 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 14 Nov 2016 05:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,638,1473145200"; d="scan'208";a="30991081"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 14 Nov 2016 05:03:07 -0800
To: openembedded-core@lists.openembedded.org
References: <20161110003935.1858-1-raj.khem@gmail.com>
	<d8dfb2d5-66de-8daf-99c3-13c611a7f5b2@linux.intel.com>
	<1478887474.23123.233.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <dce6aa96-0ebb-6158-e9fa-f5074ec1fadd@linux.intel.com>
Date: Mon, 14 Nov 2016 15:00:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478887474.23123.233.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/2] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Mon, 14 Nov 2016 13:03:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2016 08:04 PM, Richard Purdie wrote:

> This was something that came up at OEDEM. There are several layers with
> several attempts at getting this right, most have some issues.
>
> Whilst we've been pulling things out of core, we also need to consider
> things that perhaps should get added. Having this in core would
> certainly address a number of issues (but is also potentially a
> maintenance burden).
>
> We did agree there that we'd consider this. Obviously input from people
> not there is welcome though and this does need discussion. I'm leaning
> moderately in favour of adding it as things stand.

I guess I would be more open to this if Khem at the same time sent a 
patch that explicitly assigns maintainership of all those new recipes. 
So please don't merge until that is agreed and done.

Alex


