Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 823F971A32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 09:41:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9U9f0IA027235
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 30 Oct 2017 02:41:00 -0700
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 30 Oct 2017 02:40:59 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, OE-core
	<openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <63a935be-505f-c2e9-8ccf-ea5079123098@windriver.com>
	<73eff1cd-110d-78bb-f1da-3c670c4082b7@linux.intel.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <605ca23e-8fc8-1b36-1e52-d3489d07d1a1@windriver.com>
Date: Mon, 30 Oct 2017 17:39:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <73eff1cd-110d-78bb-f1da-3c670c4082b7@linux.intel.com>
X-Originating-IP: [128.224.162.155]
Subject: Re: avahi 0.7 : should we need to package /run directory or delete it?
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
X-List-Received-Date: Mon, 30 Oct 2017 09:41:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Alex

Sorry, nothing placed in /run in 0.7 version now, but it replace the 
directory /var/run,

there are some difference between /run and /var/run, we can reference:

https://lists.archlinux.org/pipermail/arch-projects/2011-March/000517.html

I just doubt can we remove /run directly like we remove /var/run in 
0.6.32 version

bbfile.

In 0.6.32 Makefile of avahi:

     avahi_runtime_dir = /var/run

     avahi_socket = /var/run/avahi-daemon/socket

In 0.7 Makefile of avahi:

     avahi_runtime_dir = /run

     avahi_socket = /run/avahi-daemon/socket


On 2017年10月30日 17:02, Alexander Kanavin wrote:
> On 10/30/2017 09:21 AM, Dengke Du wrote:
>
>> The new version of avahi 0.7 use /run directory to place some 
>> run-time variable data,
>>
>> not /var/run, should we need to package it or delete it?
>
> Can you provide details please? What is being placed there and at 
> which point?
>
> Alex
>


