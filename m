Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 82EF7719D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 16:35:41 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2016 09:35:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,580,1473145200"; d="scan'208";a="26224764"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 01 Nov 2016 09:35:42 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20161029194615.19954-1-raj.khem@gmail.com>
	<CAMKF1sriW41+1MTxTuBHQAbeR+b0LM65fkuUDRL-HapKSLze0A@mail.gmail.com>
	<1552039.tK8Y5jYAKD@peggleto-mobl.ger.corp.intel.com>
	<2141657.IdrglOmXLR@peggleto-mobl.ger.corp.intel.com>
	<6a58f235-b235-f25c-b068-fe0c84cf4915@linux.intel.com>
	<C35FC1E0-3663-4060-9E1C-A286B7A92512@gmail.com>
	<4187af59-ca62-773d-d814-44dd31cbde88@linux.intel.com>
	<5A2C0C3E-AA22-4E5B-91B8-3CA9A5282093@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cfa1b8cc-7134-fccf-2033-08f4e6c40104@linux.intel.com>
Date: Tue, 1 Nov 2016 18:33:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <5A2C0C3E-AA22-4E5B-91B8-3CA9A5282093@gmail.com>
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
X-List-Received-Date: Tue, 01 Nov 2016 16:35:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2016 06:06 PM, Khem Raj wrote:

>>> we should specify boost/boost/1.62.0/boost_1_62_0.tar.bz2 instead of boost/boost/boost_1_62_0.tar.bz2
>>
>> Incorrect. That will still download a master snapshot tarball. Only if the 'project/' is prefixed, SF will give you the release tarball.
>
> if we need projects/ then it should be encoded into SOURCEFORGE_MIRROR variable in bitbake.conf. Since that required for
> every sf.net project.

Would you then also fix the remaining recipe-specific part of the URI in 
all those recipes? I don't have the bandwidth for that right now, and 
it's a problem that is unlikely to happen in other recipes.

Alex


