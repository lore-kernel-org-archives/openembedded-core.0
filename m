Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 1069C7FD8C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 11:42:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jan 2020 03:42:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,357,1574150400"; d="scan'208";a="220998175"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga008.jf.intel.com with ESMTP; 24 Jan 2020 03:42:16 -0800
Received: from irsmsx602.ger.corp.intel.com (163.33.146.8) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Fri, 24 Jan 2020 11:42:15 +0000
Received: from rochenix-mobl.ger.corp.intel.com (163.33.253.164) by
	irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Fri, 24 Jan 2020 11:42:14 +0000
To: Denys Dmytriyenko <denis@denix.org>, Andre McCurdy <armccurdy@gmail.com>
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<6f6a74c1-948e-e6f2-303b-639a08111d64@intel.com>
	<CAJ86T=VYsiBgrxPL-N4yy0S2FNUixxn6sfWjaaWQioFHqD=2-g@mail.gmail.com>
	<20200123224340.GG4735@denix.org>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <0620f17c-53ca-7e95-1607-621507baedd8@intel.com>
Date: Fri, 24 Jan 2020 11:42:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200123224340.GG4735@denix.org>
X-Originating-IP: [163.33.253.164]
X-ClientProxiedBy: irsmsx606.ger.corp.intel.com (163.33.146.139) To
	irsmsx602.ger.corp.intel.com (163.33.146.8)
Cc: Jon Mason <jdmason@gmail.com>, Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arm-trusted-firmware: add upstream version 2.2
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
X-List-Received-Date: Fri, 24 Jan 2020 11:42:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 23/01/2020 22:43, Denys Dmytriyenko wrote:
>> Such as all the various cortex etc CPU tuning files?
> 
> LOL! :) Of course, since ARM is such an inferior arch to x86. Otherwise we
> should move everything that is not needed by qemux86 to meta-intel... JK :)

I almost pre-empted this comment in my reply because I knew it was 
coming. :)

Personally, not a terrible idea.  The slight difference is that 
meta-intel is *Intel's* BSP and we don't share stuff like 
firmware/drivers with AMD.

Ross

