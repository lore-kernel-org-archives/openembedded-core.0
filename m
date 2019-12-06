Return-Path: <ross.burton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D1C796D561
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 12:00:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Dec 2019 04:00:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,284,1571727600"; d="scan'208";a="214493367"
Received: from aaronsan-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.32.186])
	by orsmga003.jf.intel.com with ESMTP; 06 Dec 2019 04:00:55 -0800
To: Stefan Agner <stefan@agner.ch>, openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
References: <20191120124146.21245-1-stefan@agner.ch>
	<20191120124146.21245-2-stefan@agner.ch>
	<7eb71f58ebc85c734109a6635b620b66@agner.ch>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <8ba354cf-b531-a386-32bf-fef3a33d0ef7@intel.com>
Date: Fri, 6 Dec 2019 12:00:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7eb71f58ebc85c734109a6635b620b66@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH v5 2/2] image_types: add Zstandard conversion support
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
X-List-Received-Date: Fri, 06 Dec 2019 12:00:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 06/12/2019 08:26, Stefan Agner wrote:
> I am a bit confused on which direction we are going here. It seems that
> this second patch now got merged, but not the first one (instead
> disabling testing tar.zstd). I am fine with that, but in this case we
> need to readd zstd to meta-oe (since there it already had been removed,
> probably accidentally).

I queued in my staging branch the image type definition (which is 
agnostic of where zstd is) and the selftest tweak to skip it from the 
tests because they're the uncontentious part of the series.  We can add 
the image type without the recipe itself moving.

Personally I'm leaning towards keeping zstd out of core *for now* but I 
struggle to have a strong opinion either way.

If zstd has already been removed from meta-oe then yes, it should be 
reverted.  Lesson is to never send a removal until the recipe has 
actually moved! :)

Ross

