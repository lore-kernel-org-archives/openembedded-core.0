Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 41B7A776FA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 06:32:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u876Wgxp024953
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Sep 2016 23:32:43 -0700 (PDT)
Received: from [128.224.162.177] (128.224.162.177) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 6 Sep 2016 23:32:42 -0700
To: Seebs <seebs@seebs.net>, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <e33a2d23-6067-cf14-57ab-d40623a3597a@windriver.com>
	<1A4DD5F0-D89E-4FC1-820A-457817B4FCD3@seebs.net>
	<b59ea47c-1b82-c480-5d9f-7dfb8051f83a@windriver.com>
	<BDCB4B3D-E034-4AFD-915C-8DDE5B66D76D@seebs.net>
From: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <c4af9282-ed95-b7fc-f263-4a66eccfa4bf@windriver.com>
Date: Wed, 7 Sep 2016 14:32:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <BDCB4B3D-E034-4AFD-915C-8DDE5B66D76D@seebs.net>
Subject: Re: pseudo 1.8.1 doesn't work with docker & dumb-init
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
X-List-Received-Date: Wed, 07 Sep 2016 06:32:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2016 10:10 AM, Seebs wrote:
> On 1 Sep 2016, at 20:33, wenzong fan wrote:
>
>> No, I didn't think it's related to any specific docker version.
>>
>> I tested it on "Docker version 1.7.1, build 786b29d" & "Docker version
>> 1.11.2, build b9f10c9".
>>
>> BTW, I also tested the docker build w/o dumb-init, and the build works
>> ...
>
> Yeah, it's definitely specific in some way to docker.
>
> However, it doesn't appear to be 100% reproducible; I just tried a build
> with your reproducer and it completed without problems. (Unless the
> problems are more subtle, and don't prevent a build.) So this one's
> gonna be really fun to track down.

Yes, I believe it's not a 100 reproducible issue. Maybe you could run it 
with other builds in parallel and try it 3 times or more.

It keeps high probability on my work host which a server that shared by 
several persons, I can always get the error from 1 ~ 3 times build.

Thanks
Wenzong

>
> -s

