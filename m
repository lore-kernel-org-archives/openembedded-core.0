Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id BC7787F849
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 23:29:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2019 15:29:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,282,1571727600"; d="scan'208";a="219300402"
Received: from aaronsan-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.32.186])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2019 15:29:55 -0800
To: openembedded-core@lists.openembedded.org
References: <20191205201305.12854-1-luca.boccassi@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <c817d0b2-755b-919e-1313-e62360a895a7@intel.com>
Date: Thu, 5 Dec 2019 23:29:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191205201305.12854-1-luca.boccassi@gmail.com>
Subject: Re: [PATCH] util-linux: split uuid in separate recipe to allow bootstrapping
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
X-List-Received-Date: Thu, 05 Dec 2019 23:29:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 05/12/2019 20:13, luca.boccassi@gmail.com wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> In the next release util-linux will gain an (optional) build
> dependency on libcryptsetup. But libcryptsetup build-depends on
> util-linux for blkid (optional, can be disabled) and uuid (mandatory).
> Split out util-linux-uuid in a different recipe to break the cycle.

<sigh>

At least please simply make util-linux-uuid just require util-linux and 
make the configuration changes required (presumably, disabling all tools 
but uuid).

Ross

