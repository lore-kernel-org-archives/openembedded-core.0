Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D37277FD59
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 22:13:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2020 14:13:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,355,1574150400"; d="scan'208";a="220817050"
Received: from irsmsx110.ger.corp.intel.com ([163.33.3.25])
	by orsmga008.jf.intel.com with ESMTP; 23 Jan 2020 14:13:16 -0800
Received: from irsmsx602.ger.corp.intel.com (163.33.146.8) by
	irsmsx110.ger.corp.intel.com (163.33.3.25) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Thu, 23 Jan 2020 22:13:15 +0000
Received: from rochenix-mobl.ger.corp.intel.com (163.33.253.164) by
	irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Thu, 23 Jan 2020 22:13:15 +0000
To: Andre McCurdy <armccurdy@gmail.com>
References: <20200122144548.5723-1-ross.burton@intel.com>
	<CAJ86T=UOiaA6=grPykqPKj-NMaXKNFXo_TBczV5i1m5TmN_UEw@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <e604e3df-dc89-20af-7c55-0accc3d91155@intel.com>
Date: Thu, 23 Jan 2020 22:13:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UOiaA6=grPykqPKj-NMaXKNFXo_TBczV5i1m5TmN_UEw@mail.gmail.com>
X-Originating-IP: [163.33.253.164]
X-ClientProxiedBy: irsmsx602.ger.corp.intel.com (163.33.146.8) To
	irsmsx602.ger.corp.intel.com (163.33.146.8)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] packagegroup-base: only pull in dosfstools if licensing allows
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
X-List-Received-Date: Thu, 23 Jan 2020 22:13:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 23/01/2020 19:49, Andre McCurdy wrote:
> Should this be using incompatible_license_contains() instead of
> bb.utils.contains()?

Yes, it should.  Thanks for reminding me of that function.

Ross

