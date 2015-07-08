Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 69E3475D8A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 17:08:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2015 10:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,432,1432623600"; d="scan'208";a="725179582"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.4.159])
	([10.219.4.159])
	by orsmga001.jf.intel.com with ESMTP; 08 Jul 2015 10:08:39 -0700
Message-ID: <559D593C.4010600@linux.intel.com>
Date: Wed, 08 Jul 2015 12:09:16 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: "Neri, Ricardo" <ricardo.neri@intel.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
References: <cover.1436343270.git.leonardo.sandoval.gonzalez@linux.intel.com>	
	<f81ba427469fb04550efe6431284a0c0b2c1a546.1436343270.git.leonardo.sandoval.gonzalez@linux.intel.com>	
	<1436373297.9778.9.camel@linuxfoundation.org>
	<1436373958.2639.44.camel@ranerica-desk01>
In-Reply-To: <1436373958.2639.44.camel@ranerica-desk01>
Cc: "Fleming, Matt" <matt.fleming@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/2] ovmf: Recipe taken from luv-yocto repository
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
X-List-Received-Date: Wed, 08 Jul 2015 17:08:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The new set of patches are failing so I will send a V3! The reason is 
that the ovmf source code has ^M line endings and the .patch I send does 
not, so when bitbake is trying to patch, there are patch errors.

On 07/08/2015 11:46 AM, Neri, Ricardo wrote:
> On Wed, 2015-07-08 at 17:34 +0100, Richard Purdie wrote:
>> Sorry, I didn't spot this before.
>>
>> Does OE-Core have iasl?
>>
>> Does this recipe not need iasl-native in the target case too?
>
> We also have those recipes in our meta-luv layer.
>

What does this mean? Do we need to add it also? It is not under OE-Core 
but I did not face any error when compiling the ovmf recipe under poky.

> Thanks and BR,
> Ricardo
>

