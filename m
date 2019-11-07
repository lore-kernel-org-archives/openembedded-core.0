Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 362FE6C109
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 10:54:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Nov 2019 02:54:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; d="scan'208";a="377386373"
Received: from felsner-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.57.88])
	by orsmga005.jf.intel.com with ESMTP; 07 Nov 2019 02:54:24 -0800
To: openembedded-core@lists.openembedded.org
References: <1573114413-26532-1-git-send-email-mikko.rapeli@bmw.de>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <5b606c30-cc64-1b36-ea77-17445ec69f54@intel.com>
Date: Thu, 7 Nov 2019 10:54:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573114413-26532-1-git-send-email-mikko.rapeli@bmw.de>
Subject: Re: [PATCH][zeus][master] harfbuzz: split libharfbuzz-subset.so to its own binary package
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
X-List-Received-Date: Thu, 07 Nov 2019 10:54:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 07/11/2019 08:13, Mikko Rapeli wrote:
> harfbuzz binary package size increased from 624608 bytes in yocto 2.5 to
> 1365431 bytes in yocto 3.0. Most of the size increase is in the new
> libharfbuzz-subset.so* library, which based on the name seems to
> duplicate parts of the libharfbuzz main library, though it
> RDEPENDS on harfbuzz which is odd. Split it to its own binary
> package which will be installed if anyone needs it. Effect to harfbuzz
> binary package size is:


The subset piece is a library to subset fonts, not a subset of the 
library itself.

https://harfbuzz.github.io/utilities.html#utilities-command-line-hbsubset

Can you update the message?

Ross

