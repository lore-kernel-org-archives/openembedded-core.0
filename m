Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27D8B77041
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 05:18:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u825IWHe004243
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Sep 2016 22:18:32 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 1 Sep 2016 22:18:32 -0700
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>
References: <20160826103152.6211-1-git@andred.net>
	<95e22ec6-7453-6a40-8359-37cdde69dd20@windriver.com>
	<1472745847.27417.49.camel@andred.net>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <2d19df33-e988-522c-b96c-8b83c4356acf@windriver.com>
Date: Fri, 2 Sep 2016 13:18:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472745847.27417.49.camel@andred.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] libnl: fix packaging mistakes
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
X-List-Received-Date: Fri, 02 Sep 2016 05:18:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi André,

The autobuilder still gets errors on this, I will send a patch for it now.

// Robert

On 09/02/2016 12:04 AM, André Draszik wrote:
> On Do, 2016-09-01 at 16:19 +0800, Robert Yang wrote:
>> It seems that this series cause errors when multilib:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds
>> /930/steps/BuildImages_2/logs/stdio
>>
>> // Robert
>
> Thanks Robert. I didn't get a chance to look at this today. But tomorrow!
>
> Andre'
>
>

