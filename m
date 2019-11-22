Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 12B8D7FC88
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 00:53:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2019 16:53:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,227,1571727600"; d="scan'208";a="407412735"
Received: from unknown (HELO blackadder.local) ([10.252.49.82])
	by fmsmga005.fm.intel.com with ESMTP; 21 Nov 2019 16:53:04 -0800
To: openembedded-core@lists.openembedded.org
References: <1574326536-1600-1-git-send-email-wangmy@cn.fujitsu.com>
	<1574326536-1600-2-git-send-email-wangmy@cn.fujitsu.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <d9583f60-be08-3d49-8429-e99a5ea53bff@intel.com>
Date: Fri, 22 Nov 2019 00:53:03 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1574326536-1600-2-git-send-email-wangmy@cn.fujitsu.com>
Subject: Re: [PATCH] cmake-native:upgrade 3.15.3 -> 3.15.5
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
X-List-Received-Date: Fri, 22 Nov 2019 00:53:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 21/11/2019 08:55, Wang Mingyu wrote:
> ---
>   .../cmake/{cmake-native_3.15.3.bb => cmake-native_3.15.5.bb}          | 0
>   meta/recipes-devtools/cmake/cmake.inc                                 | 4 ++--
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-devtools/cmake/{cmake-native_3.15.3.bb => cmake-native_3.15.5.bb} (100%)

This breaks target cmake.

Please do test your patches in a standard OE environment.

Ross

