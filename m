Return-Path: <ross.burton@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6BF427E269
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:48:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2019 02:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,547,1559545200"; d="scan'208";a="179766888"
Received: from creinhar-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.39.119])
	by orsmga007.jf.intel.com with ESMTP; 25 Sep 2019 02:48:30 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1569403775.git.liezhi.yang@windriver.com>
	<94619a2a1eee28dc3b19b4b1d2c8e1a9f7adc61d.1569403775.git.liezhi.yang@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <d6bbaa58-de6b-3263-7bf5-f0f048b87d00@intel.com>
Date: Wed, 25 Sep 2019 10:48:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <94619a2a1eee28dc3b19b4b1d2c8e1a9f7adc61d.1569403775.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 3/3] apr: Fix configure error for nativesdk
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
X-List-Received-Date: Wed, 25 Sep 2019 09:48:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 25/09/2019 10:30, Robert Yang wrote:
> Fixed:
> $ bitbake nativesdk-expect

You meant nativesdk-apr

>   DEPENDS = "util-linux"
>   
> +DEPENDS_class-nativesdk = "nativesdk-libtool"

As we're explicitly calling libtool, why not just DEPEND on libtool always?

Ross

