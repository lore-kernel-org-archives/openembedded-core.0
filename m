Return-Path: <ross.burton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2CF3B7F943
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 11:06:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jan 2020 03:06:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,402,1571727600"; d="scan'208";a="271166510"
Received: from hongy-mobl1.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.50.70])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jan 2020 03:06:25 -0800
To: openembedded-core@lists.openembedded.org
References: <1578304772-424157-1-git-send-email-zhe.he@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <b729af62-20ad-0cc6-18d0-e5ba483d1ea2@intel.com>
Date: Mon, 6 Jan 2020 11:06:24 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1578304772-424157-1-git-send-email-zhe.he@windriver.com>
Subject: Re: [PATCH] nm01: Remove prefix zeros of the addresses output by nm before comparing
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
X-List-Received-Date: Mon, 06 Jan 2020 11:06:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 06/01/2020 09:59, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
> 
> The latest nm v2.33.1 outputs symbols addresses without prefix zeros
> for "nm -f posix", which causes the following error.
> nm01 5 TFAIL: Got wrong format with -f bsd
> 
> Backport a patch to fix it.
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>   ...ix-zeros-of-the-addresses-output-by-.patch | 43 +++++++++++++++++++
>   meta/recipes-extended/ltp/ltp_20190517.bb     |  1 +

The shortlog prefix should be the recipe that changed, so ltp not nm01.

Ross


