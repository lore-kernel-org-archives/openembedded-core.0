Return-Path: <ross.burton@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 515877F6E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 13:56:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Sep 2019 06:56:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,516,1559545200"; d="scan'208";a="188930994"
Received: from abloeckn-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.38.226])
	by orsmga003.jf.intel.com with ESMTP; 17 Sep 2019 06:56:07 -0700
To: openembedded-core@lists.openembedded.org
References: <20190916070515.31531-1-bunk@stusta.de>
	<CAO5Uq5QjR4eF-UfjWTJ_UQF6t-zvBUxLvrBdmj5ap9RziD27DA@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <6bc77b39-4dac-8301-5902-f383abc6de9f@intel.com>
Date: Tue, 17 Sep 2019 14:56:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5QjR4eF-UfjWTJ_UQF6t-zvBUxLvrBdmj5ap9RziD27DA@mail.gmail.com>
Subject: Re: [PATCH] openssl: Upgrade 1.1.1c -> 1.1.1d
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
X-List-Received-Date: Tue, 17 Sep 2019 13:56:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 17/09/2019 08:30, Alex Kiernan wrote:
> Seems like this has broken FIT image signing:
> 
> | Could not obtain signature: error:2406C06E:random number
> generator:RAND_DRBG_instantiate:error retrieving entropy
> | uboot-mkimage Can't add hashes to FIT blob: -1
> | Failed to sign 'signature@1' signature node in
> 'conf@A335XHUB-0001.dtb' conf node
> 
> Not dug into it yet, but reverting this fixes it.

ovmf fails for IA targets too:

| Generating a RSA private key
| Error Generating Key
| 140416287909248:error:2406C06E:random number 
generator:RAND_DRBG_instantiate:error retrieving 
entropy:../openssl-1.1.1d/crypto/rand/drbg_lib.c:342:
| 140416287909248:error:2406C06E:random number 
generator:RAND_DRBG_instantiate:error retrieving 
entropy:../openssl-1.1.1d/crypto/rand/drbg_lib.c:342:
| 140416287909248:error:2406B072:random number 
generator:RAND_DRBG_generate:in error 
state:../openssl-1.1.1d/crypto/rand/drbg_lib.c:589:
| 140416287909248:error:2406C06E:random number 
generator:RAND_DRBG_instantiate:error retrieving 
entropy:../openssl-1.1.1d/crypto/rand/drbg_lib.c:342:
| 140416287909248:error:2406C06E:random number 
generator:RAND_DRBG_instantiate:error retrieving 
entropy:../openssl-1.1.1d/crypto/rand/drbg_lib.c:342:
| 140416287909248:error:2406B072:random number 
generator:RAND_DRBG_generate:in error 
state:../openssl-1.1.1d/crypto/rand/drbg_lib.c:589:
| 140416287909248:error:2406C06E:random number 
generator:RAND_DRBG_instantiate:error retrieving 
entropy:../openssl-1.1.1d/crypto/rand/drbg_lib.c:342:
| 140416287909248:error:2406B072:random number 
generator:RAND_DRBG_generate:in error 
state:../openssl-1.1.1d/crypto/rand/drbg_lib.c:589:
| 140416287909248:error:04081003:rsa routines:rsa_builtin_keygen:BN 
lib:../openssl-1.1.1d/crypto/rsa/rsa_gen.c:387:

Ross

