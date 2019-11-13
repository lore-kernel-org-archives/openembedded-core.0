Return-Path: <ross.burton@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 087CE7F7D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 21:48:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2019 13:48:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,302,1569308400"; d="scan'208";a="202868442"
Received: from bhatavin-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.249.42.178])
	by fmsmga008.fm.intel.com with ESMTP; 13 Nov 2019 13:48:49 -0800
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20191113212400.898834-1-JPEWhacker@gmail.com>
	<699f5503-7bf3-fdf4-10ed-7c31a55897a9@intel.com>
	<ed0b6116-d50f-fd04-3285-ebd3efa51662@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <ade1c4c2-de6c-a735-2107-91b704540d95@intel.com>
Date: Wed, 13 Nov 2019 21:48:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ed0b6116-d50f-fd04-3285-ebd3efa51662@gmail.com>
Subject: Re: [PATCH] icecc-create-env: Use OE patchelf in SDK
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
X-List-Received-Date: Wed, 13 Nov 2019 21:48:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 13/11/2019 21:47, Joshua Watt wrote:
> I don't think it can be in -native due because that will create circular 
> dependencies. The script explicitly looks for the patchelf-uninative to 
> break the dependency for that case. I suppose it could also be for 
> class-target... but I not sure how you would expect this script to work 
> in that context

Yeah fair point.  :)

