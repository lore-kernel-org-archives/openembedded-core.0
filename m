Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E8D6371DB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 12:18:48 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Apr 2017 05:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,244,1488873600"; d="scan'208";a="252750901"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 Apr 2017 05:18:48 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
	<b38c61a5ad7e8ae2687fcd1807655ef7f47a3ae5.1492777818.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LaD3k-bt9xLu8JXc3XiL6fvnEbG+9WEeX5u+E+jNG3QGQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e0c76dd3-9376-3229-bc4a-b3f0794b5f16@linux.intel.com>
Date: Mon, 24 Apr 2017 15:18:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaD3k-bt9xLu8JXc3XiL6fvnEbG+9WEeX5u+E+jNG3QGQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] libiconv: remove recipe
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
X-List-Received-Date: Mon, 24 Apr 2017 12:18:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/22/2017 01:06 AM, Burton, Ross wrote:

>     It was in use only when uclibc was used, and so serves no purpose
>     anymore.
>     Both glibc and musl provide their own implementation.
>
>
> As
> per https://autobuilder.yocto.io/builders/nightly-qa-extras/builds/238
> this is still needed by mingw builds, so maybe the recipe should be
> moved into meta-mingw?

Yes, I suppose - I just sent a patch to yocto ML.

Alex


