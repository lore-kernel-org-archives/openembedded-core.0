Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5CBE878963
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 14:37:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 07:37:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,330,1517904000"; d="scan'208";a="36251689"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 19 Mar 2018 07:37:26 -0700
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1521467995-3521-1-git-send-email-maxin.john@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b6026187-5b09-a4b7-a39f-4930dfbc62ef@linux.intel.com>
Date: Mon, 19 Mar 2018 16:30:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521467995-3521-1-git-send-email-maxin.john@intel.com>
Subject: Re: [PATCH] libsolv: refresh the patches
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
X-List-Received-Date: Mon, 19 Mar 2018 14:37:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/19/2018 03:59 PM, Maxin B. John wrote:
> diff --git a/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch b/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch
> index efb4e3a..93b8cc9 100644
> --- a/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch
> +++ b/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch
> @@ -1,4 +1,4 @@
> -From 99b10cdf6a0f8a24e1670c1813b1d9563ae3f5b5 Mon Sep 17 00:00:00 2001
> +From 84e12bf7ece49073c559dfd58005132a6099a964 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Neal=20Gompa=20=28=E3=83=8B=E3=83=BC=E3=83=AB=E3=83=BB?=
>    =?UTF-8?q?=E3=82=B3=E3=82=99=E3=83=B3=E3=83=8F=E3=82=9A=29?=
>    <ngompa13@gmail.com>
> @@ -11,6 +11,7 @@ the tests all pass.
>   
>   Upstream-Status: Denied [https://github.com/openSUSE/libsolv/pull/112]
>   Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>   ---
>    ext/solv_xfopen_fallback_fopencookie.c | 19 ++++++++++---------
>    ext/solv_xfopen_fallback_fopencookie.h | 10 +++++-----
> @@ -100,5 +101,5 @@ index 6a7bfee..7223e3f 100644
>    
>    #ifndef SOLV_XFOPEN_FALLBACK_FOPENCOOKIE_H
>   --
> -2.11.0
> +2.4.0

This patch doesn't need to be updated, and so you can discard it from 
the commit. Unfortunately devtool can't really be instructed to refresh 
only specific patches.

Alex

