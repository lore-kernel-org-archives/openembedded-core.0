Return-Path: <ross.burton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 196D67F362
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 11:03:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Aug 2019 04:03:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="349077349"
Received: from mekarim-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.49.129])
	by orsmga005.jf.intel.com with ESMTP; 05 Aug 2019 04:03:15 -0700
To: openembedded-core@lists.openembedded.org
References: <20190802203719.20437-1-ross.burton@intel.com>
	<20190802203719.20437-5-ross.burton@intel.com>
	<CAMKF1soKtwNUY6SchZLPH8oHbbUiLabEir+JJD1_FdhHqGfhEw@mail.gmail.com>
	<919ee9f0-c746-018e-3b88-c3c8ea1fd8dd@intel.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <a2ae7b01-3719-cae5-fc4b-956dbbaf9c0b@intel.com>
Date: Mon, 5 Aug 2019 12:03:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <919ee9f0-c746-018e-3b88-c3c8ea1fd8dd@intel.com>
Subject: Re: [PATCH 5/9] libxx86dga: remove obsolete client libary
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
X-List-Received-Date: Mon, 05 Aug 2019 11:03:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 05/08/2019 10:19, Ross Burton wrote:
> On 04/08/2019 01:49, Khem Raj wrote:
>> Ross
>>
>> I am seeing
>>
>> https://errors.yoctoproject.org/Errors/Details/257733/
>> https://errors.yoctoproject.org/Errors/Details/257734/
>>
>> I wonder if they are related to this series
> 
> I thought I solved this, maybe a patch I meant to drop had sneaked back 
> in.  I'll look and fix.

I'm guessing your distro is overriding xserver-xorg PACKAGECONFIG? 
Ensure 'dga' is enabled.

Ross

