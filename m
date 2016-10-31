Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8CD6B71A8D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 12:56:13 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 31 Oct 2016 05:56:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,575,1473145200"; d="scan'208";a="25722340"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 31 Oct 2016 05:56:14 -0700
To: openembedded-core@lists.openembedded.org
References: <20161029194615.19954-1-raj.khem@gmail.com>
	<CAMKF1sriW41+1MTxTuBHQAbeR+b0LM65fkuUDRL-HapKSLze0A@mail.gmail.com>
	<1552039.tK8Y5jYAKD@peggleto-mobl.ger.corp.intel.com>
	<2141657.IdrglOmXLR@peggleto-mobl.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6a58f235-b235-f25c-b068-fe0c84cf4915@linux.intel.com>
Date: Mon, 31 Oct 2016 14:53:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <2141657.IdrglOmXLR@peggleto-mobl.ger.corp.intel.com>
Subject: Re: [PATCH] boost: Fix SRC_URI checksums
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
X-List-Received-Date: Mon, 31 Oct 2016 12:56:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2016 05:45 AM, Paul Eggleton wrote:
>> Alex, any idea what's happened here? Do you have the originals from when you
>> did the upgrade?
>
> Hmm, it seems we aren't the only ones to have hit this:
>
>   http://osdir.com/ml/blfs-dev/2016-10/msg00013.html
>
> That said, I still don't think we should blindly trust the latest archives
> until we're sure of what the differences are.

Sourceforge is doing too-clever redirecting that fails miserably here:

Proxy request sent, awaiting response... 301 Moved Permanently
Location: 
http://downloads.sourceforge.net/project/boost/boost/snapshots/master/boost_1_62_0.tar.bz2 
[following]

So we've been fetching a moving master snapshot all along. Patch is 
coming shortly.

Alex


