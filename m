Return-Path: <alexander.kanavin@linux.intel.com>
X-Greylist: delayed 474 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Dec 2017 13:16:52 UTC
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE1860069
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 13:16:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Dec 2017 05:16:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,395,1508828400"; 
   d="scan'208";a="1907886"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 12 Dec 2017 05:16:52 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1512652937-15773-1-git-send-email-maxin.john@intel.com>
	<1512838668.19417.119.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <138e4beb-949a-01f3-ed52-58b70a896ff8@linux.intel.com>
Date: Tue, 12 Dec 2017 15:17:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512838668.19417.119.camel@linuxfoundation.org>
Subject: Re: [PATCH] i2c-tools: upgrade to 4.0
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
X-List-Received-Date: Tue, 12 Dec 2017 13:16:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/09/2017 06:57 PM, Richard Purdie wrote:

> Fails on musl sadly:
> 
> https://autobuilder.yocto.io/builders/nightly-musl/builds/643/steps/BuildImages/logs/stdio

musl is a notorious source of failures discovered late (e.g. on AB) and 
resulting patch friction. I'll add a musl build test to AUH, and once 
AUH is ready for consumption we should steer people towards using it - 
particularly when they send patches that break on musl :)

Alex

