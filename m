Return-Path: <Jibin.Xu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96CE671C69
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 03:27:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w033RfIF009201
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jan 2018 19:27:41 -0800 (PST)
Received: from [128.224.163.138] (128.224.163.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 2 Jan 2018 19:27:40 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20171228022126.219745-1-jibin.xu@windriver.com>
	<b3ad73b2-4406-aa24-9bd1-073674627670@linux.intel.com>
From: Jibin Xu <jibin.xu@windriver.com>
Message-ID: <52ee158d-537a-a42e-0d42-43a197885971@windriver.com>
Date: Wed, 3 Jan 2018 11:27:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <b3ad73b2-4406-aa24-9bd1-073674627670@linux.intel.com>
X-Originating-IP: [128.224.163.138]
Subject: Re: [PATCH] fontcache : fix build warning when using quemu usermode
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
X-List-Received-Date: Wed, 03 Jan 2018 03:27:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2018年01月02日 20:00, Alexander Kanavin wrote:
> On 12/28/2017 04:21 AM, Jibin Xu wrote:
>> fontcache uses quemu usermode by default, but some architecture
>> such as Intel skylake does not support qemu usermode, this can
>> lead to a build warning as below:
>> "WARNING: The postinstall intercept hook 'update_font_cache' failed".
>>
>> Add a judgement of qemu usermode to fix the build warning.
>
> You also need to fix this in pixbufcache.bbclass. Squash all changes 
> into a single patch.
Do you mean that change gio-module-cache.bbclass pixbufcache.bbclass and 
fontcache.bbclass,
then Squash all changes into a single patch? or change 
pixbufcache.bbclass and do a path
for pixbufcache.bbclass only?

thanks,
Jibin
>
> Alex


