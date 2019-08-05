Return-Path: <ross.burton@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 871BD7D270
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 16:37:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Aug 2019 09:37:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="198026814"
Received: from ambachan-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.33.220])
	by fmsmga004.fm.intel.com with ESMTP; 05 Aug 2019 09:37:51 -0700
To: openembedded-core@lists.openembedded.org
References: <20190805031211.11190-1-andrew@aj.id.au>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <234b1140-a0b4-1085-756c-2e4ae963870b@intel.com>
Date: Mon, 5 Aug 2019 17:37:50 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805031211.11190-1-andrew@aj.id.au>
Subject: Re: [PATCH] dtc: Provide libfdt
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
X-List-Received-Date: Mon, 05 Aug 2019 16:37:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 05/08/2019 04:12, Andrew Jeffery wrote:
> Applications are appearing that depend on parsing flattened devicetree
> in userspace on target devices, e.g. pdbg[1]. Mark dtc as providing
> libfdt so application recipes can depend on it.

Other recipes can just depend on dtc to get libftd build.

Ross

