Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 872DA72F59
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 09:18:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2017 02:18:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,287,1491289200"; d="scan'208";a="82383079"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 04 May 2017 02:18:47 -0700
To: "Burton, Ross" <ross.burton@intel.com>,
	Max Krummenacher <max.oss.09@gmail.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
	<20170503131153.1780-3-alexander.kanavin@linux.intel.com>
	<1493836892.2405.4.camel@gmail.com>
	<CAJTo0LZ3O5au502TRqVUZY_gCT4r_9X-2Jtk+_-3o=u5j2UASg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cf767fe3-3c98-f32b-d27c-3f63b924ab7f@linux.intel.com>
Date: Thu, 4 May 2017 12:18:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ3O5au502TRqVUZY_gCT4r_9X-2Jtk+_-3o=u5j2UASg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] libpng12: remove the recipe
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
X-List-Received-Date: Thu, 04 May 2017 09:18:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2017 09:58 PM, Burton, Ross wrote:
>
>     > It was only in oe-core because of LSB; let's remove it. Current libpng is 1.6.x.
>
>     This will break at least meta-openembedded glmark2 and glcompbench.
>
>
> Then meta-oe can continue to host libpng12.

I actually think allowing those recipes to fail and blacklisting them is 
better. Moving libpng12 to meta-oe is the lazy way out; the proper way 
to deal with such regressions is to look at the actual recipes, what 
they do, why they need such an old version of libpng, and whether they 
should be updated or removed from meta-oe altogether. The only way to 
get people to do this real maintenance work is to break the build for 
them, sadly. I cannot take on maintaining things in meta-oe in this way, 
I have to draw the line somewhere, and this is it.

Alex


