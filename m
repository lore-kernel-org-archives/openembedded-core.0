Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1F70977BE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 10:48:12 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2017 03:48:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,435,1500966000"; d="scan'208";a="155628403"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 25 Sep 2017 03:48:13 -0700
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1506284473-40990-1-git-send-email-maxin.john@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e5549bcc-f314-9cd9-841c-24fff45d0d6b@linux.intel.com>
Date: Mon, 25 Sep 2017 13:44:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506284473-40990-1-git-send-email-maxin.john@intel.com>
Subject: Re: [PATCH] default-providers: set pkgconf as the preferred provider for pkg-config
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
X-List-Received-Date: Mon, 25 Sep 2017 10:48:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/24/2017 11:21 PM, Maxin B. John wrote:

> @@ -53,6 +53,6 @@ PREFERRED_PROVIDER_getopt ?= "util-linux-getopt"
>   PREFERRED_PROVIDER_openssl ?= "openssl"
>   PREFERRED_PROVIDER_openssl-native ?= "openssl-native"
>   PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-openssl"
> -PREFERRED_PROVIDER_pkgconfig ?= "pkgconfig"
> -PREFERRED_PROVIDER_nativesdk-pkgconfig ?= "nativesdk-pkgconfig"
> -PREFERRED_PROVIDER_pkgconfig-native ?= "pkgconfig-native"
> +PREFERRED_PROVIDER_pkgconfig ?= "pkgconf"
> +PREFERRED_PROVIDER_nativesdk-pkgconfig ?= "nativesdk-pkgconf"
> +PREFERRED_PROVIDER_pkgconfig-native ?= "pkgconf-native"

Why not simply replace one with the other outright? Is there a benefit 
in providing both, or known issues with the newer implementation?


Alex

