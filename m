Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 621D36C1D5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 03:13:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x983DOaf007791
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Oct 2019 20:13:24 -0700
Received: from [128.224.158.233] (128.224.158.233) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 7 Oct 2019 20:13:17 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1569728615.git.liezhi.yang@windriver.com>
	<53a2dd95f2fbdb4106916bf5556c5a26172a6e57.1569728615.git.liezhi.yang@windriver.com>
	<6446e616-bd19-483f-bdea-9cf7f84ee326@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <d21d85b1-67b6-aea0-96f7-a897dd5e5bd9@windriver.com>
Date: Tue, 8 Oct 2019 11:12:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6446e616-bd19-483f-bdea-9cf7f84ee326@intel.com>
Subject: Re: [PATCH 1/1] bluez5: Fix for --enable-btpclient
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
X-List-Received-Date: Tue, 08 Oct 2019 03:13:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Hi Ross,

On 9/30/19 7:06 PM, Ross Burton wrote:
> On 29/09/2019 04:44, Robert Yang wrote:
>> +Upstream-Status: Inappropriate [Upstream already fixed]
> 
> So this is a backport then?

I just come back from the holiday, sorry for the late reply. Upstream
fixed it in a different way, I didn't backport it since the fix looks
risky for bluez5 5.50. Should we use Backport for such a case, please?

// Robert

> 
> Ross
> 

