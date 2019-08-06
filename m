Return-Path: <ross.burton@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id F2C087F363
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 11:18:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2019 04:18:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="175859094"
Received: from ambachan-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.33.220])
	by fmsmga007.fm.intel.com with ESMTP; 06 Aug 2019 04:18:09 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1565075067.git.liezhi.yang@windriver.com>
	<e5519d97e195842c793f688162919b21851d1dcb.1565075067.git.liezhi.yang@windriver.com>
	<4f3b75ada0eae73855b43347a56ea89042ab6aae.camel@linuxfoundation.org>
	<18287a98-33b5-c788-946e-5b5338c1c204@windriver.com>
	<CANNYZj8nk8q7VscomyLkaLYcNy-2gH+nwgsKgAO7x59i7uDgHw@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <eba25cda-3ca0-039d-45ea-f9a86e80b4f6@intel.com>
Date: Tue, 6 Aug 2019 12:18:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8nk8q7VscomyLkaLYcNy-2gH+nwgsKgAO7x59i7uDgHw@mail.gmail.com>
Subject: Re: [PATCH 1/1] stress-ng: Add bash to DEPENDS
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
X-List-Received-Date: Tue, 06 Aug 2019 11:18:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 06/08/2019 12:14, Alexander Kanavin wrote:
> On Tue, 6 Aug 2019 at 13:01, Robert Yang <liezhi.yang@windriver.com 
> <mailto:liezhi.yang@windriver.com>> wrote:
> 
> 
>     Yes, exactly, I will send a V2 for it. What mis-leaded me was that
>     stress-ng-bash-completion RDEPENDS on bash-completion, and
>     bash-completion
>     RDEPENDS on bash, so bash is on the dependencies chain, but
>     stress-ng can't
>     find it, and there is no qa issues if we build bash firstly:
> 
>     $ bitbake bash
>     $ bitbake stress-ng
>     No qa issues.
> 
>     So the reproducer is:
>     $ bitbake stress-ng bash -ccleansstate && bitbake stress-ng
> 
>     This might be a bug?
> 
> 
> Note that bash-completion files are not executable, and we do not 
> observe this with other recipes. We might have a false positive here - 
> can you look at the actual contents of the package please and see why 
> _qa thinks it needs /bin/bash?

Also I don't see this with master.  Do you have some local patches or QA 
changes?

Ross

