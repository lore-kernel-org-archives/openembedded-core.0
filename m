Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 138CF77DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 22:06:35 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2017 15:06:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,379,1498546800"; d="scan'208";a="140060103"
Received: from jalamego-mobl3.zpn.intel.com (HELO [10.219.128.130])
	([10.219.128.130])
	by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2017 15:06:36 -0700
To: Christopher Larson <kergoth@gmail.com>
References: <1502831134-27642-1-git-send-email-jose.a.lamego@linux.intel.com>
	<CABcZAN=12C5xBzCo7oRm504nFoLZRVz5DZYbemaBBkRE3XZSpQ@mail.gmail.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <084da570-df2b-fb3e-0f76-359a521339d3@linux.intel.com>
Date: Tue, 15 Aug 2017 17:06:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CABcZAN=12C5xBzCo7oRm504nFoLZRVz5DZYbemaBBkRE3XZSpQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-python3: add packagegroup
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
X-List-Received-Date: Tue, 15 Aug 2017 22:06:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 08/15/2017 04:56 PM, Christopher Larson wrote:
> On Tue, Aug 15, 2017 at 2:05 PM, Jose Lamego <jose.a.lamego@linux.intel.com>
> wrote:
>
>> Many of the most usual python3 modules are missing when
>> trying to import them to python3 in images built with
>> python3-core installed.
>>
>> This change creates the python3 packagegroup, containing
>> the most usual python3 packages to be installed for images
>> featuring complete python functionality by using the
>> FEATURES_PACKAGES variable to define python3 as a new feature
>> and then adding it to the image to build.
>>
>> [YOCTO #10667]
>>
>> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
>
> Out of curiosity, why not just install ‘python3-modules’?
I had the same thought when reviewing the request for this change (at
[1]); adding python3 to EXTRA_IMAGE_INSTALL do also provide most of the
usual python modules. However, I created the packagegroup as a way to
have a more or less complete python installation available as an image
feature, and I expect to gather enough feedback from the community
before rejecting/accepting it (so, comments are welcomed :) )

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=10667

-- 
Jose Lamego | OTC Embedded Platform & Tools | GDC


