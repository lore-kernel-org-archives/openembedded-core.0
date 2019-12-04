Return-Path: <ross.burton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7A67F7F7D6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 21:16:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 13:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="411402140"
Received: from aaronsan-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.32.186])
	by fmsmga005.fm.intel.com with ESMTP; 04 Dec 2019 13:16:18 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	Anibal Limon <anibal.limon@linaro.org>
References: <20191203220624.26500-1-anibal.limon@linaro.org>
	<CAMKF1spabEvBMwjvefWN7ULZ8ZpGfNDgJ1gf75u1B7h3oD4nJg@mail.gmail.com>
	<CA+_AqisSN24sPo5vOzeGY4Kdb_mmQxGArCu0Kw6yeSBv-a+QHw@mail.gmail.com>
	<CANNYZj90w9QghK8eTdvc-iE7tjONky=bDA=98Mr5ccH0sjgF4g@mail.gmail.com>
	<CA+_AqisJ1+g7Btaq-T-SmSVXLsM0iePfxbq2mgbz+1VSSvDYZw@mail.gmail.com>
	<CANNYZj_PLwj3LUGUq6BvZycwoZJOnANVk8bbwLPPxptBWE+n8Q@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <814a4b72-0c15-f420-f579-46c92f8b93e9@intel.com>
Date: Wed, 4 Dec 2019 21:16:18 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj_PLwj3LUGUq6BvZycwoZJOnANVk8bbwLPPxptBWE+n8Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/classes/meson.bbclass: Add inherit setuptools3
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
X-List-Received-Date: Wed, 04 Dec 2019 21:16:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 04/12/2019 18:42, Alexander Kanavin wrote:
> On Wed, 4 Dec 2019 at 19:35, Anibal Limon <anibal.limon@linaro.org 
> <mailto:anibal.limon@linaro.org>> wrote:
> 
> 
> 
>     On Wed, 4 Dec 2019 at 04:20, Alexander Kanavin
>     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
> 
>         I tend to agree with Khem; this change will pull in target
>         python as build and runtime dependency to all meson-using
>         recipes, even those that have nothing to do with python.
> 
> 
>     Ok, it depends on python3-setuptools-native I will add this inherit
>     on waffle recipe.
> 
> 
> Do test this change; I believe you actually need a dependency on target 
> python3.

I'd say that if the true dependency is just python3-setuptools-native, 
we can just add that to meson.bbclass as it's not really invasive.  If 
it was a target dependency that is different of course.

Ross


