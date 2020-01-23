Return-Path: <ross.burton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 97C347F7C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 22:17:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2020 14:17:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,355,1574150400"; d="scan'208";a="220818262"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
	by orsmga008.jf.intel.com with ESMTP; 23 Jan 2020 14:17:42 -0800
Received: from irsmsx602.ger.corp.intel.com (163.33.146.8) by
	IRSMSX153.ger.corp.intel.com (163.33.192.75) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Thu, 23 Jan 2020 22:17:41 +0000
Received: from rochenix-mobl.ger.corp.intel.com (163.33.253.164) by
	irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Thu, 23 Jan 2020 22:17:40 +0000
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Denys Dmytriyenko
	<denis@denix.org>, Jon Mason <jdmason@gmail.com>
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <6f6a74c1-948e-e6f2-303b-639a08111d64@intel.com>
Date: Thu, 23 Jan 2020 22:17:36 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
X-Originating-IP: [163.33.253.164]
X-ClientProxiedBy: irsmsx603.ger.corp.intel.com (163.33.146.9) To
	irsmsx602.ger.corp.intel.com (163.33.146.8)
Cc: Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Thu, 23 Jan 2020 22:17:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 23/01/2020 21:43, Bruce Ashfield wrote:
> On Thu, Jan 23, 2020 at 4:00 PM Denys Dmytriyenko <denis@denix.org> wrote:
>>
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> Many BSPs require ARM Trusted Firmware (also known as Trusted Firmware-A).
>> To avoid duplicating efforts of adding very similar recipes to BSP layers,
>> add an upstream reference implementation to openembedded-core, which can be
>> customized by BSPs, if needed.
> 
> Isn't this one of the things that Jon Mason is trying to
> standardize/support in meta-arm ?
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a
> 
> What's the delta between the two ?

That was precisely my thought too.  meta-arm isn't exactly well known 
right now, but ideally it should be a central place for common pieces 
that are specific to ARM hardware (unlike anything that is needed for 
qemuarm itself).

Ross

