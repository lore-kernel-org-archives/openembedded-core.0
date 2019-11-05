Return-Path: <ross.burton@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id C88CB7FA15
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 15:43:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Nov 2019 07:43:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="200825156"
Received: from felsner-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.57.88])
	by fmsmga007.fm.intel.com with ESMTP; 05 Nov 2019 07:43:01 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <20191031172303.31664-1-open.source@oleksandr-kravchuk.com>
	<CAMKF1sraV5pEF9UanBy3Rj7mQKs33Ke2Sr_+28ewDrgaJZ43TQ@mail.gmail.com>
	<eeb0831a-bca5-55c8-2ee1-6586684d774b@intel.com>
	<CAMKF1sr7xPY4gctD88cP3U3-_h9RTa8eUQ6Vs2en-yeYEEc0=g@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <32625cc5-08bf-bb71-39f1-52e8021fe776@intel.com>
Date: Tue, 5 Nov 2019 15:42:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr7xPY4gctD88cP3U3-_h9RTa8eUQ6Vs2en-yeYEEc0=g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH] ell: update to 0.26
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
X-List-Received-Date: Tue, 05 Nov 2019 15:43:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 05/11/2019 15:30, Khem Raj wrote:
> 
> 
> On Tue, Nov 5, 2019 at 2:39 AM Ross Burton <ross.burton@intel.com 
> <mailto:ross.burton@intel.com>> wrote:
> 
>     On 04/11/2019 23:25, Khem Raj wrote:
>      > This has API changes that will break iwd
> 
>     What version of iwd will break?  There's a 0.23 upgrade in flight and a
>     1.0 upgrade incoming right?
> 
> 
> 1.0 is fine with this version all prior versions will break

Elephant in the room: is iwd feature complete enough to replace 
wpa_supplicant?

Ross

