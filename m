Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 1A012787D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 06:38:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jan 2018 22:38:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,433,1511856000"; d="scan'208";a="13616187"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga007.jf.intel.com with ESMTP; 29 Jan 2018 22:38:16 -0800
To: Niko Mauno <niko.mauno@vaisala.com>,
	openembedded-core@lists.openembedded.org
References: <20180129174724.26768-1-niko.mauno@vaisala.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2afb5638-31ca-39fa-bf28-d305fea507c0@linux.intel.com>
Date: Tue, 30 Jan 2018 08:38:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20180129174724.26768-1-niko.mauno@vaisala.com>
Subject: Re: [PATCH] bitbake.conf: Add comm to HOSTTOOLS
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
X-List-Received-Date: Tue, 30 Jan 2018 06:38:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/29/2018 07:47 PM, Niko Mauno wrote:
> This mitigates following issues during u-boot do_compile() step --
> otherwise, if comm is not available, they are quietly ignored:
> 
>    .../scripts/check-config.sh: line 33: comm: command not found
>    .../scripts/check-config.sh: line 39: comm: command not found
> 
> Since 'comm' is provided by coreutils package, adding it to HOSTTOOLS
> was considered a lower impact fix compared to adding coreutils-native
> buildtime dependency to u-boot recipe.

I disagree. Expanding HOSTTOOLS just to cater to the needs of a single 
recipe is not optimal, IMO.

Alex

