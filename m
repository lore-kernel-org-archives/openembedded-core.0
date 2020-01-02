Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 58AFE7FBA6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2020 18:22:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2020 10:22:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,387,1571727600"; d="scan'208";a="216059310"
Received: from hongy-mobl1.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.50.70])
	by fmsmga007.fm.intel.com with ESMTP; 02 Jan 2020 10:22:54 -0800
To: openembedded-core@lists.openembedded.org
References: <20200102175206.657-1-sbabic@denx.de>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <116f3696-c57c-9e21-ef5f-5fb2e004a873@intel.com>
Date: Thu, 2 Jan 2020 18:22:53 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200102175206.657-1-sbabic@denx.de>
Subject: Re: [PATCH V2] u-boot-fw-utils: Add support for libubootenv
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
X-List-Received-Date: Thu, 02 Jan 2020 18:22:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 02/01/2020 17:52, Stefano Babic wrote:
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> @@ -0,0 +1,2 @@
> +require libubootenv.inc
> +SRCREV = "bf6ff631c0e38cede67268ceb8bf1383b5f8848e"

I *really* dislike bb/inc splits where there's nothing gained apart from 
more work when editing recipes.  Can you just merge these?

Ross

