Return-Path: <ross.burton@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 75E207CDE4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 11:25:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jan 2020 03:25:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,402,1571727600"; d="scan'208";a="210759956"
Received: from hongy-mobl1.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.50.70])
	by orsmga007.jf.intel.com with ESMTP; 06 Jan 2020 03:25:23 -0800
To: openembedded-core@lists.openembedded.org
References: <20191229184415.19514-1-raj.khem@gmail.com>
	<20191229184415.19514-2-raj.khem@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <5d240df6-2d13-ed5e-ae9b-fbf2c45d5e66@intel.com>
Date: Mon, 6 Jan 2020 11:25:22 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191229184415.19514-2-raj.khem@gmail.com>
Subject: Re: [PATCH 02/19] systemd: Fix time_t size assumptions
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
X-List-Received-Date: Mon, 06 Jan 2020 11:25:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 29/12/2019 18:43, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   ...ead-of-TIME_T_MAX-for-timerfd_settim.patch | 31 +++++++++++++++++++
>   meta/recipes-core/systemd/systemd_243.2.bb    |  1 +
>   2 files changed, 32 insertions(+)
>   create mode 100644 meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
> 
> diff --git a/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch b/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
> new file mode 100644
> index 0000000000..76a1c7364d
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
> @@ -0,0 +1,31 @@
> +From 6bcf562bd1e541c7aa46923d9a14201c7f785261 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 16 Dec 2019 12:49:07 -0800
> +Subject: [PATCH] Use INT_MAX instead of TIME_T_MAX for timerfd_settime timeout
> +
> +kernel prior to 64bit time_t support might not entertain such large
> +timeout therefore reduce it to INT_MAX which would set timer expiration
> +event after 68 years of uptime, should be good for all practical
> +purposes
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>

Missing Upstream-Status.  Have you send or discussed this upstream?

Ross

