Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECCC8772FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 07:31:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1N7VLYT026751
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 22 Feb 2016 23:31:22 -0800
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Feb 2016 23:31:21 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>
References: <cover.1456195451.git.kai.kang@windriver.com>
	<72d89d471771ecffc8eecc923581d3dcdcfdfa5e.1456195451.git.kai.kang@windriver.com>
	<CAMKF1spcmUmc-FA1e9wdwki4=Dm14xY5Dw=+thvZAAkZe10fsA@mail.gmail.com>
	<56CBD36E.8020908@windriver.com>
	<1456212333.28376.206.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <56CC0AC7.1050303@windriver.com>
Date: Tue, 23 Feb 2016 15:31:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456212333.28376.206.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] useradd_base.bbclass: fix simultaneous with flock
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
X-List-Received-Date: Tue, 23 Feb 2016 07:31:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年02月23日 15:25, Richard Purdie wrote:
> On Tue, 2016-02-23 at 11:35 +0800, Kang Kai wrote:
>> On 2016年02月23日 11:05, Khem Raj wrote:
>>> Patch subject is unclear. Patch itself looks ok
>> How about use the  title of Yocto #9022:
>>
>> useradd_base.bbclass: replace retry logic with flock
> Sounds good to me, thanks!

Updated the git repo:

git://git.pokylinux.org/poky-contrib kangkai/flockv3


Thanks.

--Kai
>
> Richard
>


-- 
Regards,
Neil | Kai Kang


