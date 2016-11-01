Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C106D71BBC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 12:43:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 01 Nov 2016 05:43:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,579,1473145200"; d="scan'208";a="1078953612"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 01 Nov 2016 05:43:12 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20161029194615.19954-1-raj.khem@gmail.com>
	<CAMKF1sriW41+1MTxTuBHQAbeR+b0LM65fkuUDRL-HapKSLze0A@mail.gmail.com>
	<1552039.tK8Y5jYAKD@peggleto-mobl.ger.corp.intel.com>
	<2141657.IdrglOmXLR@peggleto-mobl.ger.corp.intel.com>
	<6a58f235-b235-f25c-b068-fe0c84cf4915@linux.intel.com>
	<C35FC1E0-3663-4060-9E1C-A286B7A92512@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4187af59-ca62-773d-d814-44dd31cbde88@linux.intel.com>
Date: Tue, 1 Nov 2016 14:40:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <C35FC1E0-3663-4060-9E1C-A286B7A92512@gmail.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 01 Nov 2016 12:43:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2016 06:22 PM, Khem Raj wrote:

>> Sourceforge is doing too-clever redirecting that fails miserably here:
>>
>> Proxy request sent, awaiting response... 301 Moved Permanently
>> Location: http://downloads.sourceforge.net/project/boost/boost/snapshots/master/boost_1_62_0.tar.bz2 [following]
>>
>> So we've been fetching a moving master snapshot all along. Patch is coming shortly.
>
> we should specify boost/boost/1.62.0/boost_1_62_0.tar.bz2 instead of boost/boost/boost_1_62_0.tar.bz2

Incorrect. That will still download a master snapshot tarball. Only if 
the 'project/' is prefixed, SF will give you the release tarball.


Alex


