Return-Path: <ross.burton@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 059CE7F7E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 18:20:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2019 10:20:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; d="scan'208";a="209628502"
Received: from unknown (HELO blackadder.local) ([10.252.49.82])
	by orsmga003.jf.intel.com with ESMTP; 20 Nov 2019 10:20:46 -0800
To: Mark Hatle <mark.hatle@kernel.crashing.org>,
	openembedded-core@lists.openembedded.org
References: <20191120161941.13360-1-ross.burton@intel.com>
	<5ff9a9ed-a8c2-e259-cbae-b327baf187ea@kernel.crashing.org>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <e3c92464-82d6-3724-6009-2426a2bb607a@intel.com>
Date: Wed, 20 Nov 2019 18:20:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5ff9a9ed-a8c2-e259-cbae-b327baf187ea@kernel.crashing.org>
Subject: Re: [PATCH] rpm: use libgcrypt instead of NSS for cryptography
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
X-List-Received-Date: Wed, 20 Nov 2019 18:20:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 20/11/2019 17:51, Mark Hatle wrote:
> Just as an ack.. Please get rid of NSS/NSPR ASAP, and move to libgcrypt.  Long
> term it's a much much better solution.

Absolutely.  I saw nss fly past in a build and was surprised we still 
needed it.

This is the last user in oe-core currently, but meta-oe has several. 
Including mozjs, which might end up in core...

Ross


